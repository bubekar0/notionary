<?php
require_once __DIR__ . '/php/bootstrap.php';
$_CONFIG = require __DIR__ . '/config.php';
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set($_CONFIG['TIMEZONE']);
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/global.php";
require_once "php/tools.php";


function prefs($getar){ // AJAX: update user preferences -> emails, pics, sounds
   // Opt-out tables from the MySQL era; none is in the SQLite schema, so list one here if it returns.
   static $OPTOUT = array();
   $jason = json_decode(stripslashes($getar),true);
   $tafel = $jason['tafel']; $enabl = $jason['value'];
   if ( !in_array( $tafel, $OPTOUT, true ) ) nogut();
   $uidno = (int)uidno(); ercau(); // erase the user's cache files
   $schon = konto("userID",$tafel,"userID",$uidno); // already unsuscribed messages
   if (  $enabl && !$schon ) dbq("insert into \"$tafel\" (userID) values(?)", array($uidno));
   if ( !$enabl &&  $schon ) dbq("delete from \"$tafel\" where userID=?", array($uidno));
}
function nodel( $nidno ) {
   // Ensure the User owns the Notion before deleting!
   $nidno = (int)$nidno;
   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files
   $query = db_fetch_assoc( dbq( "select userID, notion from aanotion where notionID=?", array($nidno) ) );
   if ( $query && $query['userID'] == $uidno ) {
      $ntabl = $query['notion'];
      dbq("delete from aanotion where notionID=?", array($nidno));
      dbq("delete from aaformula where notionID=?", array($nidno));
      dbq("delete from aapart where notionID=?", array($nidno));
      dbq("delete from aaperfid where notionID=?", array($nidno));
      dbq("delete from aasperq where notionID=?", array($nidno));
      sql("drop table " . ntick($ntabl));
   }
}
function schaf( $getar ) { // AJAX: create a notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nncurTable  = rawurldecode(utf8_decode($jason['nncur']));
   $nccur = utf8_decode( $jason['nccur'] );
   $ndcur = rawurldecode( utf8_decode($jason['ndcur']));
   $slang = $jason['slang'];   $tlang = $jason['tlang'];
   $spcur = (int)$jason['spcur'];
   $newAR = $jason['newAR'];
   if ( !nname_ok($nncurTable) || !lingo($slang) || !lingo($tlang) || !is_array($newAR) ) nogut();

   // A notion of that name, or any other table (aauser, aanotion, ...) of that name, is a collision
   if ( konto("notionID","aanotion","notion",$nncurTable) || tabelle($nncurTable) ) { echo speak("inuse","","",""); return( false ); }

   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files

   // Enter into aanotion
   dbq( "insert into aanotion ( userID, notion, slang, tlang, category, description)
         values (?,?,?,?,?,?)", array($uidno, $nncurTable, $slang, $tlang, $nccur, $ndcur) );
   $r = db_fetch_assoc(
      sql( "select max(notionID) as id from aanotion" ) );
   $nidno = (int)$r['id'];

   if ( $spcur != "30" ) dbq( "insert into aasperq (notionID, sperq) values(?,?)", array($nidno, $spcur) ); // Enter into aasperq

   // Create Notion table (text-only Q&A).
   $ntabl = ntick($nncurTable);
   sql( "create table $ntabl (
        question TEXT NOT NULL PRIMARY KEY,
        answer   TEXT NOT NULL
       )" );

   foreach( $newAR as $b ) { // populate notion with array of concepts.
      if ( !is_array($b) ) continue;
      $bq = trim( (string)$b['q'] );
      $ba = trim( (string)$b['a'] );
      if ( !empty( $bq ) && !empty( $ba ) )
         dbq( "insert into $ntabl (question,answer) values(?,?)", array($bq, $ba) );
   }
}
function ander( $getar ){ // AJAX: change an extant notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nname = $jason['nncur'];       $ndcur = $jason['ndcur'];
   $nccur = $jason['nccur'];       $spcur = $jason['spcur'];
   $slang = $jason['slang'];       $tlang = $jason['tlang'];
   $nidno = (int)$jason['nidno'];  $newAR = $jason['newAR'];       $oldAR = $jason['oldAR'];
   if ( !lingo($slang) || !lingo($tlang) || !is_array($newAR) ) nogut();

   $query = db_fetch_assoc( dbq( "select * from aanotion where notionID=?", array($nidno) ) );
   if ( !$query ) nogut();
   $nnold = $query['notion'];      $ndold = $query['description']; $ncold = $query['category'];
   $oldsl = $query['slang'];       $oldtl = $query['tlang'];

   $spold = holen( "sperq", "aasperq", "notionID", $nidno );

   // Purge NHTML + cfiles + SINFO ( metainfo:'aanotion' may have changed ) + UINFO (My Notions)
   // Only unlink a file that really sits in /home/notionary/<lang>/<category>/
   $nnurl = "/home/notionary/".$oldsl."/".$ncold."/".$nnold.".html";
   $nnbas = realpath( "/home/notionary" );  $nnech = realpath( $nnurl );
   if ( $nnbas && $nnech && lingo( $oldsl ) && ctype_digit( (string)$ncold ) &&
        dirname( $nnech ) === $nnbas."/".$oldsl."/".$ncold && is_file( $nnech ) ) unlink( $nnech );
   ercan($nidno); ercas(); ercau();

   // check if any meta info changed: {nname|ndesc|ncat|slang|tlang|picto}
   if ( $nnold != $nname ){
      if ( !nname_ok( $nname ) ) nogut();
      if ( ( konto("notionID","aanotion","notion","$nname") || tabelle($nname) ) &&
          strtolower( $nnold ) != strtolower( $nname ) ){ // prevent collision + allow recapitalizing
         echo speak("inuse","","","");
         return(false);
      }
      sql("alter table " . ntick($nnold) . " rename to " . ntick($nname));
      dbq("update aanotion set notion=? where notionID=?", array($nname, $nidno));
   } else $nname = $nnold;  // unchanged: keep working on the stored table name
   if ( $ndold != $ndcur ) dbq( "update aanotion set description=? where notionID=?", array($ndcur, $nidno) );
   if ( $ncold != $nccur ) dbq( "update aanotion set category=? where notionID=?", array($nccur, $nidno) );
   if ( $oldsl != $slang ) dbq( "update aanotion set slang=? where notionID=?", array($slang, $nidno) );
   if ( $oldtl != $tlang ) dbq( "update aanotion set tlang=? where notionID=?", array($tlang, $nidno) );

   if ( $spold != $spcur ) dbq( "update aasperq set sperq=? where notionID=?", array((int)$spcur, $nidno) );

   // Truncate and repopulate the table with the new Q&A set
   $ntabl = ntick($nname);
   sql( "delete from $ntabl" );
   foreach( $newAR as $b ){
      if ( !is_array($b) ) continue;
      $bq = trim( (string)$b['q'] );  // Question
      $ba = trim( (string)$b['a'] );  // Answer
      if ( empty( $bq ) || empty( $ba ) ) continue;              // Either Q or A missing -->> drop entry
      dbq( "insert into $ntabl (question,answer) values(?,?)", array($bq, $ba) );
   }
}
function prdel($getar){ // AJAX: delete overcome problems
   $jason = json_decode($getar,true);
   $prfid = $jason['prfid']; $pblem = $jason['pblem'];
   dbq("delete from aaprobs where perfID=? and probs=?", array($prfid, $pblem));
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
         if ( !isset( $_REQUEST['was'] ) ) eval($tun."();");
         else eval($tun."(\$_REQUEST['was']);"); break;
}
?>
