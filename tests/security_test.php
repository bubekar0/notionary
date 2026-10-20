<?php
/*
 * Security regression test (plain PHP, runs on 7.3 and 8.x):   php tests/security_test.php
 *
 * Dumps the aa* schema from db/notionary.db (opened read-only) and replays it into a
 * :memory: database for every request. Each request runs in its own PHP process against
 * a throwaway copy of the app (notionary.php, usrindex.php, php/, language texts) that
 * has its own test config.php, so neither the real config nor the bundled DB is touched.
 * Legitimate calls must keep working; injection, traversal and XSS payloads must not land.
 * Note: sql()/dbq() call fetchArray() on write statements, which makes SQLite3 run every
 * INSERT twice (pre-existing); the checks below therefore look at distinct rows.
 */
if ( PHP_SAPI !== 'cli' ) { http_response_code(404); exit; }  // never runs over HTTP
error_reporting(E_ALL);
$ROOT = dirname(__DIR__);
$FAIL = 0; $PASS = 0;

function ok($cond, $label) {
   global $FAIL, $PASS;
   if ( $cond ) { $PASS++; echo "  ok   $label\n"; }
   else         { $FAIL++; echo "  FAIL $label\n"; }
}
function rmtree($d) {
   if ( !is_dir($d) || is_link($d) ) { @unlink($d); return; }
   foreach ( scandir($d) as $f ) if ( $f != '.' && $f != '..' ) rmtree("$d/$f");
   @rmdir($d);
}

/* ---- sandbox: app copy + test config + schema dump ---- */
$BOX = sys_get_temp_dir() . '/notionary-sectest-' . getmypid();
rmtree($BOX);
mkdir("$BOX/php", 0700, true); mkdir("$BOX/sess", 0700);
foreach ( array('notionary.php', 'usrindex.php') as $f ) copy("$ROOT/$f", "$BOX/$f");
foreach ( glob("$ROOT/php/*.php") as $f ) copy($f, "$BOX/php/" . basename($f));
foreach ( array('en','de','es','fr','it','pt','ru','hu') as $l ) {
   mkdir("$BOX/$l");
   foreach ( glob("$ROOT/$l/*.txt") as $f ) copy($f, "$BOX/$l/" . basename($f));
}
file_put_contents("$BOX/config.php", "<?php\nreturn array('APP_ENV' => 'prod', 'TIMEZONE' => 'UTC', 'DB_FILE' => ':memory:',\n"
   . "   'APP_URL' => '', 'APP_ROOT' => '" . addslashes($BOX) . "', 'DB_NAME' => 'test');\n");
file_put_contents("$BOX/secret.txt", "TOP-SECRET-FILE");

$src = new SQLite3("$ROOT/db/notionary.db", SQLITE3_OPEN_READONLY);
$res = $src->query("select sql from sqlite_master where type='table' and name like 'aa%' order by name");
$schema = ""; $ntables = 0;
while ( $r = $res->fetchArray(SQLITE3_ASSOC) ) { $schema .= $r['sql'] . ";\n"; $ntables++; }
$src->close();
file_put_contents("$BOX/schema.sql", $schema);

$NT = "(question TEXT NOT NULL PRIMARY KEY, answer TEXT NOT NULL)";
$glob = "";
foreach ( array('inuse' => 'IN-USE', 'descr' => 'Learn anything', 'kwrds' => 'quiz', 'altxt' => 'notionary',
                'er404' => 'oops', 'trial' => 'Trial', 'level' => 'Level ', 'perfo' => 'Performance', 'crite' => 'c') as $k => $v )
   $glob .= "insert into aaglobe values ('$k','$v','$v','$v','$v','$v','$v','$v','$v');\n";
file_put_contents("$BOX/fixture.sql", "
insert into aauser values (1,'owner@notionary','2020-01-01','\$2y\$10\$SECRETHASHowner','en');
insert into aauser values (2,'other@notionary','2020-01-01','\$2y\$10\$SECRETHASHother','de');
insert into aaparam values ('myurl','http://localhost:8080/'), ('mynom','notionary');
insert into aanotion (notionID,userID,notion,slang,tlang,category,description) values
   (1,1,'Fixture One','en','de',1,'First fixture'),
   (2,2,'Fixture Two','en','de',1,'Owned by someone else'),
   (3,1,'Capitali dell''Oceania','en','it',1,'<img src=x onerror=alert(1)>');
create table `Fixture One` $NT;  insert into `Fixture One` values ('one-q1','one-a1'), ('one-q2','one-a2');
create table `Fixture Two` $NT;  insert into `Fixture Two` values ('two-q1','two-a1');
create table `Capitali dell'Oceania` $NT;  insert into `Capitali dell'Oceania` values ('Fiji','Suva');
$glob");

/* ---- child: seed :memory: DB + session, run one entry file, report state at shutdown ---- */
file_put_contents("$BOX/child.php", <<<'CHILD'
<?php
$spec = unserialize(file_get_contents($argv[1]));
chdir(__DIR__);
require __DIR__ . '/php/dbutil.php';
lsql()->exec(file_get_contents(__DIR__ . '/schema.sql'));
lsql()->exec(file_get_contents(__DIR__ . '/fixture.sql'));
if ( !empty($spec['setup']) ) lsql()->exec($spec['setup']);
$_GET = $_POST = array(); $_REQUEST = $spec['request'];
foreach ( $spec['server'] as $k => $v ) $_SERVER[$k] = $v;
session_id('t' . getmypid()); session_start();
foreach ( $spec['session'] as $k => $v ) $_SESSION[$k] = $v;
session_write_close();
register_shutdown_function(function() use ($spec) {
   $out = ''; while ( ob_get_level() ) { $out = ob_get_contents() . $out; ob_end_clean(); }
   $code = http_response_code();  // false under CLI when nothing set a status: that is a 200
   $res = array('code' => $code === false ? 200 : $code, 'out' => $out, 'display_errors' => ini_get('display_errors'),
                'debug_fn' => function_exists('debug'), 'checks' => array());
   foreach ( $spec['checks'] as $name => $q ) {
      $r = @lsql()->query($q); $rows = array();
      if ( $r ) while ( $x = $r->fetchArray(SQLITE3_NUM) ) $rows[] = $x[0]; else $rows = 'SQL-ERROR';
      $res['checks'][$name] = $rows;
   }
   file_put_contents($spec['result'], serialize($res));
});
include __DIR__ . '/' . $spec['entry'];
CHILD
);

$OWNER = array('uname' => 'owner@notionary', 'slang' => 'en', 'blang' => 'en');
function run($entry, $request, $opt = array()) {
   global $BOX, $OWNER;
   static $n = 0; $n++;
   $spec = array('entry' => $entry, 'request' => $request, 'result' => "$BOX/res$n.ser",
                 'setup'   => isset($opt['setup'])   ? $opt['setup']   : '',
                 'server'  => (isset($opt['server']) ? $opt['server'] : array()) + array('REMOTE_ADDR' => '127.0.0.1', 'HTTP_HOST' => 'localhost:8080'),
                 'session' => isset($opt['session']) ? $opt['session'] : $OWNER,
                 'checks'  => isset($opt['checks'])  ? $opt['checks']  : array());
   file_put_contents("$BOX/spec$n.ser", serialize($spec));  // serialize keeps non-UTF-8 bytes intact
   $cmd = escapeshellarg(PHP_BINARY) . ' -d session.save_path=' . escapeshellarg("$BOX/sess")
        . ' -d session.use_cookies=0 -d log_errors=0 -d error_log=' . escapeshellarg("$BOX/error.log")
        . ' ' . escapeshellarg("$BOX/child.php") . ' ' . escapeshellarg("$BOX/spec$n.ser") . ' 2>>' . escapeshellarg("$BOX/stderr.log");
   $stdout = shell_exec($cmd);
   $res = is_file($spec['result']) ? unserialize(file_get_contents($spec['result'])) : null;
   if ( !$res ) return array('code' => 0, 'out' => (string)$stdout, 'checks' => array(), 'display_errors' => null, 'debug_fn' => null);
   $res['out'] = (string)$stdout . $res['out'];
   return $res;
}
function J($a) { return json_encode($a, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); } // like JSON.stringify
function U($a) { return array('tun' => $a[0], 'was' => J($a[1])); }
function first($res, $check) { return isset($res['checks'][$check][0]) ? $res['checks'][$check][0] : null; }
$USERS  = "select group_concat(password) from aauser";
$HASHES = '$2y$10$SECRETHASHowner,$2y$10$SECRETHASHother';
$TABLES = "select count(*) from sqlite_master where type='table'";

echo "Schema: $ntables aa* tables dumped from db/notionary.db (read-only)\n";
ok($ntables >= 15, "schema dump has the aa* tables");

echo "\n[usrindex.php] seter / geter / getme / prefs\n";
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart', 'chcol' => 'part', 'nuval' => '3', 'wocol' => 'notionID', 'olval' => '1'))),
         array('checks' => array('part' => "select part from aapart where notionID=1")));
ok($r['code'] == 200 && first($r, 'part') == 3, "legit seter aapart.part inserts the row");
ok($r['display_errors'] === '0', "bootstrap: display_errors is 0");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart', 'chcol' => '', 'nuval' => 'DELETE', 'wocol' => 'notionID', 'olval' => '1'))),
         array('setup' => "insert into aapart values (1,2,5)", 'checks' => array('n' => "select count(*) from aapart where notionID=1")));
ok($r['code'] == 200 && first($r, 'n') == 0, "legit seter DELETE removes the aapart row");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aauser', 'chcol' => 'password', 'nuval' => 'pwned', 'wocol' => 'userID', 'olval' => '1'))),
         array('checks' => array('pw' => $USERS)));
ok($r['code'] == 400 && first($r, 'pw') === $HASHES, "seter on aauser.password is rejected (400)");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart', 'chcol' => 'part=99, cardinality', 'nuval' => '1', 'wocol' => 'notionID', 'olval' => '1'))),
         array('checks' => array('n' => "select count(*) from aapart")));
ok($r['code'] == 400 && first($r, 'n') == 0, "seter column injection in chcol is rejected");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart', 'chcol' => 'part', 'nuval' => '7', 'wocol' => 'notionID=notionID or 1=1 or notionID', 'olval' => '1'))),
         array('setup' => "insert into aapart values (1,1,2), (2,1,2)", 'checks' => array('p' => "select sum(part) from aapart")));
ok($r['code'] == 400 && first($r, 'p') == 2, "seter where-column injection in wocol is rejected");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart" where 1=1; drop table aauser; --', 'chcol' => 'part', 'nuval' => '1', 'wocol' => 'notionID', 'olval' => '1'))),
         array('checks' => array('u' => "select count(*) from aauser")));
ok($r['code'] == 400 && first($r, 'u') == 2, "seter table-name breakout is rejected");
$r = run('usrindex.php', U(array('seter', array('tafel' => 'aapart', 'chcol' => 'part', 'nuval' => '1', 'wocol' => '', 'olval' => ''))));
ok($r['code'] == 400, "seter with defaulted userID column on aapart is rejected");
$r = run('usrindex.php', U(array('geter', array('secol' => 'password', 'vonta' => 'aauser', 'wocol' => 'userID', 'valis' => '1'))));
ok($r['code'] == 400 && strpos($r['out'], 'SECRETHASH') === false, "geter cannot read aauser.password");
$r = run('usrindex.php', U(array('geter', array('secol' => 'cardinality', 'vonta' => 'aapart', 'wocol' => 'notionID', 'valis' => '1'))),
         array('setup' => "insert into aapart values (1,2,5)"));
ok($r['code'] == 200 && trim($r['out']) === '5', "legit geter on aapart still answers");
$r = run('usrindex.php', U(array('getme', array('secol' => 'password', 'vonta' => 'aauser', 'wocol' => 'user', 'valis' => 'owner@notionary'))));
ok($r['code'] == 400 && strpos($r['out'], 'SECRETHASH') === false, "getme cannot read aauser.password");
$r = run('usrindex.php', U(array('prefs', array('tafel' => 'aaadmin', 'value' => 1))), array('checks' => array('a' => "select count(*) from aaadmin")));
ok($r['code'] == 400 && first($r, 'a') == 0, "prefs cannot write arbitrary tables (aaadmin)");

echo "\n[usrindex.php] nodel\n";
$r = run('usrindex.php', array('tun' => 'nodel', 'was' => '999 or 1=1'), array('checks' => array('n' => "select count(*) from aanotion", 't' => $TABLES)));
ok(first($r, 'n') == 3, "nodel '999 or 1=1' deletes nothing");
$r = run('usrindex.php', array('tun' => 'nodel', 'was' => '2'), array('checks' => array('n' => "select count(*) from aanotion where notionID=2")));
ok(first($r, 'n') == 1, "nodel keeps a notion the user does not own");
$r = run('usrindex.php', array('tun' => 'nodel', 'was' => '1'), array('checks' => array(
         'n' => "select count(*) from aanotion where notionID=1", 't' => "select count(*) from sqlite_master where name='Fixture One'",
         'rest' => "select count(*) from aanotion")));
ok(first($r, 'n') == 0 && first($r, 't') == 0 && first($r, 'rest') == 2, "legit nodel removes the notion and its table");

echo "\n[usrindex.php] schaf\n";
$new = array('nidno' => '', 'nncur' => 'Neue Wörter', 'spcur' => '60', 'nccur' => '2', 'ndcur' => 'Fresh words',
             'newAR' => array(array('q' => "it's", 'a' => 'es ist'), array('q' => '', 'a' => 'x'), array('q' => 'b', 'a' => 'c')),
             'oldAR' => null, 'slang' => 'de', 'tlang' => 'en');
$tab = @utf8_decode('Neue Wörter');  // schaf has always stored names through utf8_decode()
$r = run('usrindex.php', U(array('schaf', $new)), array('checks' => array(
         'row' => "select count(*) > 0 from aanotion where description='Fresh words' and slang='de' and tlang='en' and category=2 and userID=1",
         'sp'  => "select sperq from aasperq where notionID in (select notionID from aanotion where description='Fresh words')",
         'tab' => "select name from sqlite_master where name like 'Neue W%'",
         'qa'  => "select group_concat(q, '|') from (select question as q from `$tab` order by rowid)")));
ok($r['code'] == 200 && first($r, 'row') == 1 && first($r, 'sp') == 60, "legit schaf creates the notion and its sperq");
ok(first($r, 'tab') === $tab, "schaf keeps the legacy utf8_decode() table name");
ok(first($r, 'qa') === "it's|b", "schaf stores Q&A with apostrophes, skips empty pairs");
foreach ( array("x` (a,b); drop table aauser; --", "x'; drop table aauser; --", 'x"y', '') as $bad ) {
   $r = run('usrindex.php', U(array('schaf', array('nncur' => $bad) + $new)), array('checks' => array('u' => "select count(*) from aauser", 'n' => "select count(*) from aanotion")));
   ok($r['code'] == 400 && first($r, 'u') == 2 && first($r, 'n') == 3, "schaf rejects table name " . J($bad));
}
foreach ( array('aauser', 'AANOTION', 'Fixture One') as $taken ) {
   $r = run('usrindex.php', U(array('schaf', array('nncur' => $taken) + $new)), array('checks' => array('u' => "select count(*) from aauser", 'n' => "select count(*) from aanotion")));
   ok(strpos($r['out'], 'IN-USE') !== false && first($r, 'u') == 2 && first($r, 'n') == 3, "schaf refuses existing table name '$taken'");
}
$r = run('usrindex.php', U(array('schaf', array('slang' => "en' --") + $new)));
ok($r['code'] == 400, "schaf rejects a bad language code");
$r = run('usrindex.php', U(array('schaf', array('nncur' => 'Desc Probe', 'ndcur' => "x'); drop table aauser; --") + $new)),
         array('checks' => array('d' => "select description from aanotion where notion='Desc Probe'", 'u' => "select count(*) from aauser")));
ok(first($r, 'd') === "x'); drop table aauser; --" && first($r, 'u') == 2, "schaf stores a hostile description literally");

echo "\n[usrindex.php] ander\n";
$edit = array('nidno' => '1', 'nncur' => 'Fixture One', 'spcur' => '30', 'nccur' => '1', 'ndcur' => 'Changed desc',
              'newAR' => array(array('q' => "l'eau", 'a' => 'water'), array('q' => 'q2', 'a' => 'a2')), 'oldAR' => array(), 'slang' => 'en', 'tlang' => 'de');
$r = run('usrindex.php', U(array('ander', $edit)), array('checks' => array(
         'd' => "select description from aanotion where notionID=1", 'qa' => "select group_concat(q, '|') from (select question as q from `Fixture One` order by rowid)")));
ok($r['code'] == 200 && first($r, 'd') === 'Changed desc' && first($r, 'qa') === "l'eau|q2", "legit ander updates description and Q&A");
$r = run('usrindex.php', U(array('ander', array('nncur' => 'Fixture Uno') + $edit)), array('checks' => array(
         'n' => "select notion from aanotion where notionID=1", 't' => "select count(*) from `Fixture Uno`")));
ok(first($r, 'n') === 'Fixture Uno' && first($r, 't') == 2, "legit ander rename moves the table");
$r = run('usrindex.php', U(array('ander', array('nncur' => 'aanotion') + $edit)), array('checks' => array('n' => "select count(*) from aanotion")));
ok(strpos($r['out'], 'IN-USE') !== false && first($r, 'n') == 3, "ander refuses renaming onto aanotion (would have wiped it)");
$r = run('usrindex.php', U(array('ander', array('nncur' => "x`; drop table aauser; --") + $edit)), array('checks' => array('u' => "select count(*) from aauser")));
ok($r['code'] == 400 && first($r, 'u') == 2, "ander rejects a hostile new table name");
$r = run('usrindex.php', U(array('ander', array('nidno' => 'abc', 'nncur' => 'Fixture Two') + $edit)), array('checks' => array('t' => "select count(*) from `Fixture Two`")));
ok($r['code'] == 400 && first($r, 't') == 1, "ander with an unknown nidno does not truncate another notion");
$r = run('usrindex.php', U(array('ander', array('tlang' => 'xx') + $edit)));
ok($r['code'] == 400, "ander rejects an unknown language code");

// unlink() guard: only /home/notionary/<lang>/<category>/<name>.html may be removed
$HOME = '/home/notionary';
if ( !file_exists($HOME) && @mkdir("$HOME/en/1", 0700, true) ) {
   file_put_contents("$BOX/victim.html", "victim");
   file_put_contents("$HOME/en/1/Legit Html.html", "cached");
   $up = str_repeat('../', 4) . ltrim($BOX, '/') . '/victim';
   $setup = "insert into aanotion (notionID,userID,notion,slang,tlang,category,description) values (4,1,'" . SQLite3::escapeString($up) . "','en','de',1,'d'), (5,1,'Legit Html','en','de',1,'d');
             create table `" . str_replace('`', '``', $up) . "` $NT; create table `Legit Html` $NT;";
   run('usrindex.php', U(array('ander', array('nidno' => '4', 'nncur' => $up) + $edit)), array('setup' => $setup));
   ok(is_file("$BOX/victim.html"), "ander does not unlink outside /home/notionary (path traversal in stored name)");
   run('usrindex.php', U(array('ander', array('nidno' => '5', 'nncur' => 'Legit Html') + $edit)), array('setup' => $setup));
   ok(!is_file("$HOME/en/1/Legit Html.html"), "ander still purges the notion's own cached HTML");
   rmtree($HOME);
} else echo "  skip ander unlink guard: $HOME exists or cannot be created\n";

echo "\n[notionary.php] sinfo / linfo / ninfo / mixqa / busca / mudoc\n";
$r = run('notionary.php', array('tun' => 'sinfo', 'was' => "e'"), array('server' => array('REQUEST_URI' => "/notionary.php?tun=sinfo&was=e'")));
ok($r['code'] == 302 && strpos($r['out'], '"langs"') === false, "sinfo rejects a non-language code");
$r = run('notionary.php', array('tun' => 'sinfo', 'was' => 'en'), array('server' => array('REQUEST_URI' => '/notionary.php?tun=sinfo&was=en')));
$j = json_decode($r['out'], true);
ok(is_array($j) && in_array('en', $j[0]['langs']) && strpos($r['out'], 'Fixture One') !== false, "legit sinfo returns the catalog");
ok($r['debug_fn'] === false, "debug() (eval + phpinfo) is gone");
$r = run('notionary.php', array('tun' => 'linfo', 'was' => 'password from aauser --'), array('server' => array('REQUEST_URI' => '/notionary.php?tun=linfo&was=en')));
ok(strpos($r['out'], 'SECRETHASH') === false, "linfo column injection leaks nothing");
$r = run('notionary.php', array('tun' => 'linfo', 'was' => 'en'), array('server' => array('REQUEST_URI' => '/notionary.php?tun=linfo&was=en')));
ok(strpos($r['out'], 'IN-USE') !== false, "legit linfo returns translations");
$r = run('notionary.php', array('tun' => 'ninfo', 'was' => "Capitali dell'Oceania"), array('server' => array('REQUEST_URI' => "/notionary.php?tun=ninfo&was=Capitali%20dell'Oceania")));
ok(strpos($r['out'], 'Suva') !== false, "legit ninfo works for a stored name with an apostrophe");
$r = run('notionary.php', array('tun' => 'ninfo', 'was' => "x' or '1'='1"), array('server' => array('REQUEST_URI' => "/notionary.php?tun=ninfo&was=x'%20or%20'1'='1")));
ok($r['code'] == 500 && strpos($r['out'], 'one-q1') === false, "ninfo injection finds nothing");
$r = run('notionary.php', U(array('mixqa', array('nlist' => array('Fixture One', 'aauser', 'x` union select user,password from aauser --')))));
ok(strpos($r['out'], 'one-q1') !== false && strpos($r['out'], 'SECRETHASH') === false && strpos($r['out'], 'owner@') === false, "mixqa only reads notion tables");
$r = run('notionary.php', U(array('mixqa', array('nlist' => array("Capitali dell'Oceania", 'Fixture Two')))));
ok(strpos($r['out'], 'Suva') !== false && strpos($r['out'], 'two-q1') !== false, "legit mixqa mixes two notions");
$r = run('notionary.php', array('tun' => 'busca', 'was' => "zzzz%' or notion like '%"));
$j = json_decode($r['out'], true);
ok(is_array($j) && empty($j['notns']), "busca injection returns no notions");
$r = run('notionary.php', array('tun' => 'busca', 'was' => 'Fixture'));
$j = json_decode($r['out'], true);
ok(is_array($j) && is_array($j['notns']) && count($j['notns']) == 2, "legit busca finds both fixtures");
$r = run('notionary.php', array('tun' => 'busca', 'was' => "Capitali dell'Oceania"));
$j = json_decode($r['out'], true);
ok(is_array($j) && count($j['notns']) == 1, "busca exact match with an apostrophe");
foreach ( array('../config', '../secret', '../../../../etc/passwd', 'faq/../fuss') as $bad ) {
   $r = run('notionary.php', array('tun' => 'mudoc', 'was' => $bad));
   ok($r['code'] == 400 && strpos($r['out'], 'TOP-SECRET') === false && strpos($r['out'], 'DB_FILE') === false && strpos($r['out'], 'root:') === false, "mudoc rejects " . J($bad));
}
$r = run('notionary.php', array('tun' => 'mudoc', 'was' => 'faq'));
ok($r['out'] === file_get_contents("$ROOT/en/faq.txt"), "legit mudoc serves en/faq.txt");
$r = run('notionary.php', array('tun' => 'mudoc', 'was' => 'faq'), array('setup' => "update aauser set ulang='../..' where userID=1", 'server' => array('HTTP_ACCEPT_LANGUAGE' => 'de-DE,de;q=0.9')));
ok($r['out'] === file_get_contents("$ROOT/de/faq.txt"), "a tampered ulang falls back to the browser language");

echo "\n[notionary.php] stags / mtags XSS\n";
$n = '";alert(1);//</script><script>alert(2)</script>';
$r = run('notionary.php', array('n' => $n, 'l' => "x'\"<"));
ok(strpos($r['out'], '<script>alert(2)') === false, "stags: ?n= cannot close the inline script");
ok(preg_match('/nname = (.*?); level = (.*?); uname/', $r['out'], $m) && json_decode($m[1]) === $n && json_decode($m[2]) === "x'\"<", "stags: n/l reach JS as the exact strings");
ok(strpos($r['out'], 'main.src = "http://localhost:8080/js/notionary-deve.js?version=') !== false, "stags: legit bundle URL unchanged");
$r = run('notionary.php', array(), array('server' => array('HTTP_HOST' => 'evil.example"></script><script>alert(5)</script>')));
ok(strpos($r['out'], '<script>alert(5)') === false, "stags: Host header cannot inject markup");
$evil = 'Evil"><script>alert(3)</script>';
$r = run('notionary.php', array('tun' => 'trial', 'was' => $evil), array('setup' =>
         "insert into aanotion (notionID,userID,notion,slang,tlang,category,description) values (6,1,'$evil','en','de',1,'\"><svg onload=alert(4)>');
          create table `$evil` $NT;"));
ok(strpos($r['out'], '<script>alert(3)') === false && strpos($r['out'], '<svg onload') === false && strpos($r['out'], '&lt;svg onload') !== false, "mtags: stored name/description are escaped in meta tags");
$r = run('notionary.php', array('tun' => 'trial', 'was' => 'Fixture One'));
ok(strpos($r['out'], 'content="http://localhost:8080/?tun=trial&amp;was=Fixture%20One"') !== false && strpos($r['out'], 'content="First fixture"') !== false, "mtags: legit trial page meta tags");

echo "\n[php/doneTest.php]\n";
$r = run('php/doneTest.php', array('pdata' => J(array('nidno' => '1 or 1=1', 'ttype' => 'trial', 'right' => 1, 'score' => "1'); drop table aauser;--",
         'dauer' => '5; drop table aanotion', 'probs' => array('one-q1', "x'); delete from aanotion;--")))), array('checks' => array(
         'u' => "select count(*) from aauser", 'n' => "select count(*) from aanotion",
         'p' => "select distinct notionID || '/' || score || '/' || elapsed from aaperfid",
         'pr' => "select group_concat(p, '|') from (select distinct probs as p from aaprobs)")));
ok(first($r, 'u') == 2 && first($r, 'n') == 3, "doneTest payloads drop nothing");
ok(first($r, 'p') === '1/0.0/5' && first($r, 'pr') === "one-q1|x'); delete from aanotion;--", "doneTest stores cast numbers and literal problems");
$r = run('php/doneTest.php', array('pdata' => J(array('nidno' => 1, 'ttype' => 'trial', 'right' => 4, 'score' => 80, 'dauer' => 42, 'probs' => array('one-q2')))),
         array('checks' => array('p' => "select distinct ptype || '/' || score || '/' || elapsed from aaperfid")));
ok(first($r, 'p') === '1/80.0/42' && strpos($r['out'], '80%') !== false && strpos($r['out'], 'one-a2') !== false, "legit doneTest records and renders the result");
ok($r['display_errors'] === '0', "bootstrap: display_errors is 0 in doneTest");
$r = run('php/doneTest.php', array('pdata' => J(array('nidno' => 3, 'ttype' => 'trial', 'right' => 1, 'score' => 50, 'dauer' => 3, 'probs' => array()))));
ok(strpos($r['out'], '<img src=x') === false && strpos($r['out'], '&lt;img src=x onerror=alert(1)&gt;') !== false
   && strpos($r['out'], "Capitali dell&#039;Oceania") !== false, "markupBlogHeader escapes stored name and description");

foreach ( array('stderr.log', 'error.log') as $f ) if ( is_file("$BOX/$f") && trim(file_get_contents("$BOX/$f")) !== '' ) {
   $lines = explode("\n", trim(file_get_contents("$BOX/$f")));
   echo "\n(child $f, informational: " . count($lines) . " lines, first 15)\n" . implode("\n", array_slice($lines, 0, 15)) . "\n";
}
rmtree($BOX);
echo "\n$PASS passed, $FAIL failed (PHP " . PHP_VERSION . ")\n";
exit($FAIL ? 1 : 0);
