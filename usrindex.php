<?php
$_CONFIG = require __DIR__ . '/config.php';
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set($_CONFIG['TIMEZONE']);
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/oauth2.php";
require_once "php/global.php";
require_once "php/tools.php";


function prefs($getar){ // AJAX: update user preferences -> emails, pics, sounds
   $jason = json_decode(stripslashes($getar),true);
   $tafel = $jason['tafel']; $enabl = $jason['value'];
   $uidno = uidno(); ercau(); // erase the user's cache files
   $schon = konto("userID","$tafel","userID","$uidno"); // already unsuscribed messages
   if (  $enabl && !$schon ) sql("insert into $tafel (userID) values('$uidno')");
   if ( !$enabl &&  $schon ) sql("delete from $tafel where userID='$uidno'");
}
function nodel( $nidno ) {
   // Ensure the User owns the Notion before deleting!
   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files
   $query = mysqli_fetch_assoc( sql( "select userID, notion from aanotion where notionID='$nidno'" ) );
   if ( $query['userID'] == $uidno ) {
      $ntabl = $query['notion'];
      sql("delete from aanotion where notionID='$nidno'");
      sql("delete from aaformula where notionID='$nidno'");
      sql("delete from aapart where notionID='$nidno'");
      sql("delete from aapdfid where notionID='$nidno'");
      sql("delete from aaperfid where notionID='$nidno'");
      sql("delete from aapiction where notionID='$nidno'");
      sql("delete from aarating where notionID='$nidno'");
      sql("delete from aareview where notionID='$nidno'");
      sql("delete from aasperq where notionID='$nidno'");
      sql("delete from aavideo where notionID='$nidno'");
      sql("drop table `$ntabl`");
   }
}
function schaf( $getar ) { // AJAX: create a notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nncurTable  = rawurldecode(utf8_decode($jason['nncur'])); // NO  \
   $nncurColumn = mysqli_real_escape_string(lsql(),$nncurTable);     // YES \
   $nccur = utf8_decode( $jason['nccur'] );
   $ndcur = mysqli_real_escape_string(lsql(),rawurldecode( utf8_decode($jason['ndcur'])));
   $slang = $jason['slang'];   $tlang = $jason['tlang'];
   $picto = $jason['picto'];   $spcur = $jason['spcur'];
   $newAR = $jason['newAR'];

   if ( konto("notionID","aanotion","notion","$nncurColumn") ) { echo speak("inuse","","",""); return( false ); }

   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files

   // Enter into aanotion
   sql( "insert into aanotion ( userID, notion, slang, tlang, category, description)
         values ('$uidno','$nncurColumn','$slang','$tlang','$nccur',  '$ndcur')" );
   $r = mysqli_fetch_assoc(
      sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='aanotion'" ) );
   $nidno = $r['AUTO_INCREMENT'] - 1;

   if ( $picto ) sql( "insert into aapiction (notionID) values('$nidno')" ); // Enter into aapiction

   if ( $spcur != "30" ) sql( "insert into aasperq (notionID, sperq) values('$nidno','$spcur')" ); // Enter into aasperq

   // Create Notion table. XXXXXXXX Get rid of Image from now on
   sql( "create table `$nncurTable` (
        question char(100) NOT NULL PRIMARY KEY,
        answer   char(100) NOT NULL,
        imageID int(24)
       ) engine = MyISAM default charset = utf8 collate utf8_bin" );

   foreach( $newAR as $b ) { // populate notion with array of concepts.
      $bq = trim( mysqli_real_escape_string(lsql(),$b['q']) );  // allow apostrophes
      $ba = trim( mysqli_real_escape_string(lsql(),$b['a']) );  // allow apostrophes
      if ( !empty( $bq ) && !empty( $ba ) )
         sql( "insert into `$nncurTable` (question,answer) values('$bq','$ba')" );
   }
}
function ander( $getar ){ // AJAX: change an extant notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nname = $jason['nncur'];       $ndcur = $jason['ndcur'];
   $nccur = $jason['nccur'];       $spcur = $jason['spcur'];
   $slang = $jason['slang'];       $tlang = $jason['tlang'];       $picto = $jason['picto'];
   $nidno = $jason['nidno'];       $newAR = $jason['newAR'];       $oldAR = $jason['oldAR'];

   $query = mysqli_fetch_assoc( sql( "select * from aanotion where notionID = $nidno" ) );
   $nnold = $query['notion'];      $ndold = $query['description']; $ncold = $query['category'];
   $oldsl = $query['slang'];       $oldtl = $query['tlang'];

   $spold = sql( "select sperq from aasperq where notionID = '$nidno'" );

   // Purge NHTML + cfiles + SINFO ( metainfo:'aanotion' may have changed ) + UINFO (My Notions)
   $nnurl = "/home/notionary/".$oldsl."/".$ncold."/".$nnold.".html";
   if ( file_exists( $nnurl ) ) unlink($nnurl);
   ercan($nidno); ercas(); ercau();

   // check if any meta info changed: {nname|ndesc|ncat|slang|tlang|picto}
   if ( $nnold != $nname ){
      if ( konto("notionID","aanotion","notion","$nname") &&
          strtolower( $nnold ) != strtolower( $nname ) ){ // prevent collision + allow recapitalizing
         echo speak("inuse","","","");
         return(false);
      }
      sql("rename table `$nnold` to `$nname` ");
      sql("update aanotion set notion='$nname' where notionID='$nidno'");
   }
   if ( $ndold != $ndcur ) sql( "update aanotion set description='$ndcur' where notionID='$nidno'" );
   if ( $ncold != $nccur ) sql( "update aanotion set category='$nccur' where notionID='$nidno'" );
   if ( $oldsl != $slang ) sql( "update aanotion set slang='$slang' where notionID='$nidno'" );
   if ( $oldtl != $tlang ) sql( "update aanotion set tlang='$tlang' where notionID='$nidno'" );

   if ( $spold != $spcur ) sql( "update aasperq set sperq='$spcur' where notionID='$nidno'" );

   konto("notionID","aapiction","notionID","$nidno") ? $ispik = true : $ispik = false;
   if (  $picto && !$ispik ) sql( "insert into aapiction (notionID) values('$nidno')" );
   if ( !$picto &&  $ispik ) sql( "delete from aapiction where notionID='$nidno'" );

   $felde = " question, answer ";           // minimum set of fields to select
   $qi = sql( "show columns from `$nname` like 'imageID'" );
   $ri = mysqli_num_rows( $qi ) ? TRUE : FALSE;
   if ( $ri ) $felde .= ", imageID ";

   $qs = sql("show columns from `$nname` like 'soundID'");
   $rs = mysqli_num_rows( $qs ) ? TRUE : FALSE;
   if ( $rs ) $felde .= ", soundID ";

   // Walk through the old table saving any Media
   $q = sql("select $felde from `$nname`");
   while ( $r = mysqli_fetch_assoc( $q ) ){
      if ( $ri ) $imgid = $r['imageID']; else $imgid = NULL;
      if ( $rs ) $sndid = $r['soundID']; else $sndid = NULL;
      if ( $ri || $rs )
         $media[] = array(
                       "q" => $r['question'],
                       "i" => $imgid,
                       "s" => $sndid
                    );
   }

   // Truncate and repopulate entire table rather than 1-by-1
   sql( "truncate table `$nname`" );
   foreach( $newAR as $b ){ // Start collecting the Questions and Answers from newAR[] received
      $bq = trim( mysqli_real_escape_string( lsql(),$b['q']) );  // Question allow apostrophes
      $ba = trim( mysqli_real_escape_string( lsql(),$b['a']) );  // Answer   allow apostrophes
      unset( $bi ); unset( $bs );  // Clear running Image and Sound for this table entry
      if ( !empty( $media ) )
         foreach( $media as $m )   // Conserve media if Question is a match (including apostrophes)
            if ( trim( mysqli_real_escape_string( lsql(),$m['q']) ) == $bq ) {
               $bi = $m['i'];
               $bs = $m['s'];
            }

      // Now repopulate the table with new entries and saved media (if any)
      if ( empty( $bq ) || empty( $ba ) ) continue; // Either Q or A missing -->> Drop entry even if media lost
      if ( isset( $bi ) && isset( $bs ))            // Have both Image as well as Sound
         sql( "insert into `$nname` (question,answer,imageID,soundID) values('$bq','$ba','$bi','$bs')" );
      else if ( isset( $bi ) && !isset( $bs ) )     // Have Q&A and image but no sound
         sql( "insert into `$nname` (question,answer,imageID) values('$bq','$ba','$bi')" );
      else if ( isset( $bs ) && !isset( $bi ) )     // Have Q&A and sound but no image
         sql( "insert into `$nname` (question,answer,soundID) values('$bq','$ba','$bs')" );
      else sql( "insert into `$nname` (question,answer) values('$bq','$ba')" ); // Just have Q&A
   }
}
function prdel($getar){ // AJAX: delete overcome problems
   $jason = json_decode($getar,true);
   $prfid = $jason['prfid']; $pblem = scapo($jason['pblem']);
   sql("delete from aaprobs where perfID='$prfid' and probs='$pblem'");
   ercau();
}

if ( isset( $_REQUEST['tun'] ) ) $tun = $_REQUEST['tun']; else $tun = "";
switch ( $tun ) {
   case 'ercau':ercau(); break; // In case nimag changed or such
   case 'ercan':ercan($_REQUEST['was']); break; // In case nimag changed or such
   // REQUIRE LOGIN BUT NOT SITE-DRIVEN
   case 'schaf':case 'ander':case 'nodel':case 'prdel': // NOTIONS
   case 'slang':case 'prefs': // USERS
   case 'geter':case 'getme':case 'seter':
         legal();
         if ( !isset( $_REQUEST['was'] ) ) eval($tun."();");
         else eval($tun."(\$_REQUEST['was']);"); break;
}
?>
