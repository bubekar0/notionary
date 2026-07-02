<?php
function creds() {
   static $cfg = null;
   if ($cfg === null) {
      $cfg = require __DIR__ . '/../config.php';
   }
   // SQLite: a single database file. Honour DB_FILE if set, else db/notionary.db
   return !empty($cfg['DB_FILE']) ? $cfg['DB_FILE'] : __DIR__ . '/../db/notionary.db';
}
function lsql(){
   static $link = null;
   if ( $link === null ) {
      $link = new SQLite3( creds() );          // one handle per request
      $link->busyTimeout( 5000 );
      $link->exec( 'PRAGMA foreign_keys = ON' );
   }
   return( $link );
}

/* ---- result shim: materialise rows so num-rows + forward iteration both work ---- */
class DBResult {
   private $rows; private $i = 0;
   public function __construct($rows){ $this->rows = $rows; }
   public function num(){ return count($this->rows); }
   public function next_assoc(){ return $this->i < count($this->rows) ? $this->rows[$this->i++] : null; }
}
function db_num_rows($r){ return $r ? $r->num() : 0; }
function db_fetch_assoc($r){ return $r ? $r->next_assoc() : null; }
function db_fetch_array($r){                     // mysqli_fetch_array default = both keys
   if ( !$r ) return null;
   $row = $r->next_assoc();
   if ( $row === null ) return null;
   $both = $row; $n = 0; foreach ( $row as $v ) $both[$n++] = $v;
   return $both;
}
function db_escape($s){ return SQLite3::escapeString( (string)$s ); }

function sql( $query ) {                          // raw query (reads + identifier-only writes)
   $res = lsql()->query( $query );
   $rows = array();
   if ( $res ) { while ( $r = $res->fetchArray( SQLITE3_ASSOC ) ) $rows[] = $r; $res->finalize(); }
   return( new DBResult( $rows ) );
}
function dbq( $query, $params = array() ) {       // prepared query with bound values
   $st = lsql()->prepare( $query );
   $n = 1; foreach ( $params as $p ) $st->bindValue( $n++, $p );
   $res = $st->execute();
   $rows = array();
   if ( $res ) { while ( $r = $res->fetchArray( SQLITE3_ASSOC ) ) $rows[] = $r; }
   return( new DBResult( $rows ) );
}

function konto( $was, $von, $das, $val ) {
   return( db_num_rows( dbq( "select $was from \"$von\" where $das=?", array($val) ) ) );
}
function holen( $was, $von, $das, $val ) {
   $rets = db_fetch_assoc( dbq( "select $was from \"$von\" where $das=?", array($val) ) );
   if ( isset( $rets[$was] ) ) return( $rets[$was] );
}
function geter( $getar ) {
   $jason = json_decode( stripslashes( $getar ), true );
   $secol = $jason['secol']; $wocol = $jason['wocol'];
   $vonta = $jason['vonta']; $valis = $jason['valis'];
   if ( $valis == "UIDNO" ) $valis = holen("userID","aauser","user",$_SESSION['uname']);
   echo holen( $secol, $vonta, $wocol, $valis );
}
function getme( $getar ){
   $jason = json_decode( stripslashes( $getar ), true );
   $secol = $jason['secol']; $wocol = $jason['wocol']; $vonta = $jason['vonta'];
   $valis = $jason['valis'];
   $r = db_fetch_assoc(
        dbq( "select $secol from \"$vonta\" where $wocol=? and userID=?", array($valis, uidno()) ) );
   echo $r[$secol];
}
function seter( $getar ){
   $jason = json_decode( stripslashes( $getar ), true );
   $tafel = $jason['tafel']; $chcol = $jason['chcol'];
   $nuval = $jason['nuval']; $wocol = $jason['wocol']; $olval = $jason['olval'];
   if ( $tafel == "aaglobe") ercal($chcol);
   if ( empty($wocol) ){
      $wocol = "userID"; $olval = holen("userID","aauser","user",$_SESSION['uname']);
      ercau();
   }
   if ( $wocol == "notionID" ) { ercan($olval); ercas(); }
   if ( $wocol == "question" || $wocol == "answer" ) ercan( holen("notionID","aanotion","notion","$tafel") );
   if ( $chcol == "password" ) $nuval = password_hash( $nuval, PASSWORD_DEFAULT );
   if ( $nuval == "DELETE" ) { dbq( "delete from \"$tafel\" where $wocol=?", array($olval) ); return; }
   if ( konto( $chcol, $tafel, $wocol, $olval ) ) {
      if ( $nuval == "NULL" ) dbq( "update \"$tafel\" set $chcol=NULL where $wocol=?", array($olval) );
      else                    dbq( "update \"$tafel\" set $chcol=? where $wocol=?", array($nuval,$olval) );
   } else                     dbq( "insert into \"$tafel\" ($wocol, $chcol) values(?,?)", array($olval,$nuval) );
}
function app_base_url(){
   $cfg = isset($GLOBALS['MY_CFG']) ? $GLOBALS['MY_CFG'] : array();
   if ( !empty($cfg['APP_URL']) ) return $cfg['APP_URL'];
   $proto = !empty($_SERVER['HTTP_X_FORWARDED_PROTO']) ? $_SERVER['HTTP_X_FORWARDED_PROTO']
          : ( (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http' );
   $host  = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'localhost';
   return $proto . '://' . $host . '/';
}
function param($foo){
   switch ($foo) {
      case 'myurl': return app_base_url();
      case 'image': return app_base_url() . '?tun=ibyid&was=';
      case 'myenv': return isset($GLOBALS['MY_CFG']['APP_ENV']) ? $GLOBALS['MY_CFG']['APP_ENV'] : 'prod';
   }
   return holen("value","aaparam","kodex","$foo");
}
function xlate($codex,$lange){ return( holen("$lange","aaglobe","kodex","$codex") ); }
function speak($parol,$style,$trail,$lenth){
   $texto = holen("$_SESSION[slang]","aaglobe","kodex","$parol");
   if ( $lenth != "") $texto = stpad($texto,$lenth);
   if ( !empty($style))
      return("<span style='font:normal 500 1.1em/1.2 monospace;" .$style.";'>"
                 .$texto ."</span>".$trail);
   else return($texto.$trail);
}
function uidno(){
   if ( isset( $_SESSION['uname'] ) ){
      $datum = db_fetch_array( dbq( "select userID from aauser where user=?", array($_SESSION['uname']) ) );
      return( $datum['userID'] );
   }
}
?>
