<?php
function creds() {
   $server = "localhost";
   $user   = "notio_nary";
   $pword  = "hjeuoi7ou";
   $dbase  = "notionary_db";
   return( array( $server, $user, $pword, $dbase ) );
}
function lsql(){
   list( $server, $user, $pword, $dbase ) = creds();
   $link = mysqli_connect( "p:".$server, $user, $pword, $dbase);
   return( $link );
}
function sql( $query ) {
   list( $server, $user, $pword, $dbase ) = creds();
   $link = mysqli_connect( "p:".$server, $user, $pword, $dbase );
   mysqli_set_charset( $link, 'utf8' );

   if ( $rets = mysqli_query( $link, $query ) ) { mysqli_close( $link ); return( $rets ); }
   //else throw new Exception( mysqli_error( $link )."[ $sql]" );
}
function konto( $was, $von, $das, $val ) { return( mysqli_num_rows( sql( "select $was from `$von` where $das='$val'" ) ) ); }
function holen( $was, $von, $das, $val ) {
   $rets = mysqli_fetch_assoc( sql( "select $was from `$von` where $das='$val'" ) );
   //return( $rets[$was] );
   if ( isset( $rets[$was] ) ) return( $rets[$was] );
}
function geter( $getar ) {
   $jason = json_decode( stripslashes( $getar ), true );
   $secol = $jason['secol']; $wocol=$jason['wocol'];    // these two are ASCII
   $vonta = $jason['vonta']; // may have apoqu + nonASCII but ok as tableName
   $valis = mysqli_real_escape_string(lsql(),$jason['valis']);  // may have apoquo + nonASCII
   // enforce ownership and avoid passing uname from browser
   if($valis=="UIDNO") $valis=holen("userID","aauser","user",$_SESSION['uname']);
   echo holen("$secol","$vonta","$wocol","$valis");
}
function getme($getar){
   $jason=json_decode(stripslashes($getar),true);
   $secol=$jason['secol']; $wocol=$jason['wocol']; $vonta=$jason['vonta'];
   $valis=mysqli_real_escape_string(lsql(),$jason['valis']);  // may have apoquo + nonASCII
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
   if ( $tafel == "aaglobe") ercal($chcol);  // erase cache file of language in edition
   if ( empty($wocol)){ // enforce permissions by not passing user arg for userID tables
      $wocol = "userID"; $olval=holen("userID","aauser","user",$_SESSION['uname']);
      ercau();
   }
   // erase Notion cfile if notionID tables updated, also SINFO as it may also be popular
   if ( $wocol == "notionID") { ercan($olval); ercas(); }
   if ( $wocol == "question" || $wocol=="answer") ercan(holen("notionID","aanotion","notion","$tafel"));

   if ( $chcol == "password") $nuval = password_hash($nuval,PASSWORD_DEFAULT);  // encrypt passwords
   if ( $nuval == "DELETE"){ sql("delete from `$tafel` where $wocol='$olval'"); return; } // handle deletes
   if ( konto("$chcol","$tafel","$wocol","$olval")) {
      if ( $nuval == "NULL" ) sql("update `$tafel` set $chcol=NULL where $wocol='$olval'");
      else sql("update `$tafel` set $chcol='$nuval' where $wocol='$olval'");
   } else sql("insert into `$tafel` ($wocol, $chcol) values('$olval','$nuval')");
}
function param($foo){ return(holen("value","aaparam","kodex","$foo")); }
function xlate($codex,$lange){ return(holen("$lange","aaglobe","kodex","$codex")); }
function speak($parol,$style,$trail,$lenth){ // reads aaglobal XLATE params
   $texto = holen("$_SESSION[slang]","aaglobe","kodex","$parol");
   if ( $lenth != "") $texto = stpad($texto,$lenth);
   if ( !empty($style))
      return("<span style='font:normal 500 1.1em/1.2 monospace;" .$style.";'>"
                 .$texto ."</span>".$trail);
   else return($texto.$trail);
}
function idata($getar){
   $jason = json_decode(stripslashes($getar),true);
   $fromi = mysqli_real_escape_string(lsql(),$jason['fromi']);
   $xmany = mysqli_real_escape_string(lsql(),$jason['xmany']);
   unset($retAR);
   $q = sql("select imageID, name from aaimage where imageID > $fromi limit $xmany");
   while ( $r = mysqli_fetch_assoc($q)) $retAR[] = array( "idx" => $r['imageID'], "nom" => $r['name']);
   echo json_encode($retAR);
}
function sdata($getar){
   $jason = json_decode(stripslashes($getar),true);
   $fromi = mysqli_real_escape_string(lsql(),$jason['fromi']);
   $xmany = mysqli_real_escape_string(lsql(),$jason['xmany']);
   unset($retAR);
   $q = sql("select soundID, name from aasound where soundID > $fromi limit $xmany");
   while ( $r = mysqli_fetch_assoc($q)) $retAR[] = array( "idx" => $r['soundID'], "nom" => $r['name']);
   echo json_encode($retAR);
}
function blobbInsert($quelle,$media,$medix,$name){ // SERVER: insert aa{image|sound|pdf} blob
   $table = "aa".$media; $index = $media."ID"; $dbnom = $name;
   $bdata = addslashes( file_get_contents( $quelle ) );
   if ( $media == "image" ) {
      $sizes = getimagesize($quelle);
      $bsize = $sizes[3];
      $bmime = mime_content_type( $quelle ); //$bmime=$sizes['mime'];
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
function blobbUpdate($quelle,$media,$medix,$name){ // SERVER: update aa{image|sound|pdf} blob
   $table = "aa".$media; $index = $media."ID"; $dbnom = $name;
   $bdata=addslashes(file_get_contents($quelle));
   if ( $media == "image" ) {
      $sizes = getimagesize( $quelle );
      $bsize = $sizes[3];
      $bmime = mime_content_type( $quelle ); //$bmime = $sizes['mime'];
   } else {
      $bsize = filesize( $quelle );
      $bmime = finfo_file(finfo_open(FILEINFO_MIME_TYPE),$quelle);
   }
   $sqlStatus = sql("update $table set type='{$bmime}', size='{$bsize}',
                $media='{$bdata}', name='{$dbnom}' where $index='$medix'");
   if ( $sqlStatus ) $_SESSION['uload']['status'] = 0;
   else $_SESSION['uload']['status'] = 4;
}
function ibyid($imgno){ // GET: directly from <img src=..
   $NOIMGID = 101;
   if ( !isset( $imgno ) || !is_numeric( $imgid = mysqli_real_escape_string( lsql(  ),$imgno ) ) )
      $imgid = $NOIMGID;
   $q = sql("select image,type from aaimage where imageID='$imgid'");
   if ( mysqli_num_rows( $q ) == 0 )
      $q = sql("select image,type from aaimage where imageID='$NOIMGID'");
   $r = mysqli_fetch_assoc( $q );
   ccach( $r['type'],$r['image'] );
}
function sbyid($sndno){ // GET: directly from <embed src=..
   $NOSNDID = 1; // XXXXXXXXXXXMAKE STANDARD ACROSS no sound available to play
   if(!is_numeric($sndid=mysqli_real_escape_string(lsql(),$sndno))) $sndid=$NOSNDID;
   $q=sql("select sound,type from aasound where soundID='$sndid'");
   if(mysqli_num_rows($q)==0)
      $q=sql("select sound,type from aasound where soundID='$NOSNDID'");
   $r=mysqli_fetch_assoc($q);
   ccach($r['type'],$r['sound']);
}
function pbyid($pdfno){ // GET: directly from <iframe src=..
   if(!is_numeric($pdfid=mysqli_real_escape_string(lsql(),$pdfno))) rjekt();
   if($r=mysqli_fetch_assoc(sql("select pdf,type from aapdf where pdfID='$pdfid'"))) {
      header("X-Frame-Options: GOFORIT");
      ccach($r['type'],$r['pdf']);
   }
}
// SUSPICIOUSLY USELESS
function holif($was,$von,$das,$val){ // selection if col extant, else FALSE
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
