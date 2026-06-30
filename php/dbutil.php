<?php
function creds() {
   static $cfg = null;
   if ($cfg === null) {
      $cfg = require __DIR__ . '/../config.php';
   }
   return [ $cfg['DB_HOST'], $cfg['DB_USER'], $cfg['DB_PASSWORD'], $cfg['DB_NAME'] ];
}
function lsql(){
   static $link = null;
   if ( $link === null ) {
      list( $server, $user, $pword, $dbase ) = creds();
      $link = mysqli_connect( $server, $user, $pword, $dbase );
      mysqli_set_charset( $link, 'utf8' );
   }
   return( $link );
}
function sql( $query ) { // reuse one connection per request -- no reconnect/close per query
   $link = lsql();
   if ( $rets = mysqli_query( $link, $query ) ) return( $rets );
   //else throw new Exception( mysqli_error( $link )."[ $query]" );
}
function konto( $was, $von, $das, $val ) { return( mysqli_num_rows( sql( "select $was from `$von` where $das='$val'" ) ) ); }
function holen( $was, $von, $das, $val ) {
   $rets = mysqli_fetch_assoc( sql( "select $was from `$von` where $das='$val'" ) );
   if ( isset( $rets[$was] ) ) return( $rets[$was] );
}
function geter( $getar ) {
   $jason = json_decode( stripslashes( $getar ), true );
   $secol = $jason['secol']; $wocol=$jason['wocol'];
   $vonta = $jason['vonta'];
   $valis = mysqli_real_escape_string(lsql(),$jason['valis']);
   if($valis=="UIDNO") $valis=holen("userID","aauser","user",$_SESSION['uname']);
   echo holen("$secol","$vonta","$wocol","$valis");
}
function getme($getar){
   $jason=json_decode(stripslashes($getar),true);
   $secol=$jason['secol']; $wocol=$jason['wocol']; $vonta=$jason['vonta'];
   $valis=mysqli_real_escape_string(lsql(),$jason['valis']);
   $r =mysqli_fetch_assoc(
       sql("select $secol from `$vonta` where $wocol='$valis' and userID='" . uidno() . "'"));
   echo $r[$secol];
}
function seter($getar){
   $jason=json_decode(stripslashes($getar),true);
   $tafel=$jason['tafel']; $chcol=$jason['chcol'];
   $nuval=mysqli_real_escape_string(lsql(),$jason['nuval']);
   $wocol=$jason['wocol'];
   $olval=mysqli_real_escape_string(lsql(),$jason['olval']);
   if ( $tafel == "aaglobe") ercal($chcol);
   if ( empty($wocol)){
      $wocol = "userID"; $olval=holen("userID","aauser","user",$_SESSION['uname']);
      ercau();
   }
   if ( $wocol == "notionID") { ercan($olval); ercas(); }
   if ( $wocol == "question" || $wocol=="answer") ercan(holen("notionID","aanotion","notion","$tafel"));

   if ( $chcol == "password") $nuval = password_hash($nuval,PASSWORD_DEFAULT);
   if ( $nuval == "DELETE"){ sql("delete from `$tafel` where $wocol='$olval'"); return; }
   if ( konto("$chcol","$tafel","$wocol","$olval")) {
      if ( $nuval == "NULL" ) sql("update `$tafel` set $chcol=NULL where $wocol='$olval'");
      else sql("update `$tafel` set $chcol='$nuval' where $wocol='$olval'");
   } else sql("insert into `$tafel` ($wocol, $chcol) values('$olval','$nuval')");
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
      case 'sound': return app_base_url() . '?tun=sbyid&was=';
      case 'myenv': return isset($GLOBALS['MY_CFG']['APP_ENV']) ? $GLOBALS['MY_CFG']['APP_ENV'] : 'prod';
   }
   return holen("value","aaparam","kodex","$foo");
}
function xlate($codex,$lange){ return(holen("$lange","aaglobe","kodex","$codex")); }
function speak($parol,$style,$trail,$lenth){
   $texto = holen("$_SESSION[slang]","aaglobe","kodex","$parol");
   if ( $lenth != "") $texto = stpad($texto,$lenth);
   if ( !empty($style))
      return("<span style='font:normal 500 1.1em/1.2 monospace;" .$style.";'>"
                 .$texto ."</span>".$trail);
   else return($texto.$trail);
}
function blobbInsert($quelle,$media,$medix,$name){
   $table = "aa".$media; $index = $media."ID"; $dbnom = $name;
   $bdata = addslashes( file_get_contents( $quelle ) );
   if ( $media == "image" ) {
      $sizes = getimagesize($quelle);
      $bsize = $sizes[3];
      $bmime = mime_content_type( $quelle );
   } else {
      $bsize = filesize( $quelle );
      $bmime = finfo_file(finfo_open(FILEINFO_MIME_TYPE),$quelle);
   }
   sql("insert into $table ($index,type,$media,size,name) values('$medix','{$bmime}','{$bdata}','{$bsize}','{$dbnom}')");
   $u = mysqli_fetch_assoc(
           sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='$table'" ) );
   $dlink = $u['AUTO_INCREMENT'] - 1;
   if ( !$dlink ) $_SESSION['uload']['status'] = 4;
   return( $dlink );
}
function blobbUpdate($quelle,$media,$medix,$name){
   $table = "aa".$media; $index = $media."ID"; $dbnom = $name;
   $bdata=addslashes(file_get_contents($quelle));
   if ( $media == "image" ) {
      $sizes = getimagesize( $quelle );
      $bsize = $sizes[3];
      $bmime = mime_content_type( $quelle );
   } else {
      $bsize = filesize( $quelle );
      $bmime = finfo_file(finfo_open(FILEINFO_MIME_TYPE),$quelle);
   }
   $sqlStatus = sql("update $table set type='{$bmime}', size='{$bsize}',
                $media='{$bdata}', name='{$dbnom}' where $index='$medix'");
   if ( $sqlStatus ) $_SESSION['uload']['status'] = 0;
   else $_SESSION['uload']['status'] = 4;
}
function holif($was,$von,$das,$val){
   $columnQuery  = sql("show columns from `$von` like '$was'");
   $columnExtant = mysqli_num_rows($columnQuery)?TRUE:FALSE;
   if($columnExtant){
      $selection = mysqli_fetch_assoc(sql("select $was from `$von` where $das='$val' COLLATE utf8_bin"));
      return($selection[$was]);
   } else return(false);
}
function uidno(){
   if ( isset( $_SESSION['uname'] ) ){
      $datum = mysqli_fetch_array( sql("select userID from aauser where user='$_SESSION[uname]'"));
      return($datum['userID']);
   }
}
function ctoid($cname){
   $datum = mysqli_fetch_array( sql("select contactID from aacontact where nomen='$cname'") );
   return( $datum['contactID'] );
}
?>
