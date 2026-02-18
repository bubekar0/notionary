<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();   // if browser doesn't gzip, normal
date_default_timezone_set('Europe/Berlin');
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/oauth2.php";
require_once "php/tools.php";
function btest(){
   /* How to find a word in entire notionary DB
   $word = "food";
   $q1 = sql( "show tables" );
   $tabar = array();
   while( $t = mysqli_fetch_assoc( $q1 ) ) $tabar[] = $t[ 'Tables_in_notionary_db' ];
   foreach( $tabar as $table ) {
      $qq = sql( "show columns from `$table` like 'question'" );
      $rq = mysqli_num_rows( $qq ) ? TRUE : FALSE;
      $qa = sql( "show columns from `$table` like 'answer'" );
      $ra = mysqli_num_rows( $qa ) ? TRUE : FALSE;
      if( $rq && $ra ) { // These are Notion or Piction tables
         $q2 = sql( "select question, answer from `$table` where question like '%$word%' or answer like '%$word%'" );
         while( $r2 = mysqli_fetch_assoc( $q2 ) )
            $retAR[] = array("table"    => $table,
                             "Question" => $r2['question'],
                             "Answer"   => $r2['answer'] );
      }
   }
   */


   $q = sql( "select notionID from aanotion" );
   while ( $r = mysqli_fetch_assoc( $q ) ){             // get an item per notion
      $nidno = $r['notionID'];
      konto( "notionID", "aapiction", "notionID", "$nidno" ) ? $picto = true : $picto = false;
      if ( !$picto ) { // This is a non-Piction Notion: clean it!!
         $nname = holen( "notion", "aanotion", "notionID", $r['notionID'] );
         $qi = sql( "show columns from `$nname` like 'imageID'" );
         $ri = mysqli_num_rows( $qi ) ? TRUE : FALSE;
         if ( $ri ) { // This Notion has imageID column, need cleaning
            $q2 = sql( "select distinct imageID from `$nname`" );
            while ( $r2 = mysqli_fetch_assoc( $q2 ) )
               sql( "delete from aaimage where imageID='$r2[imageID]'" );
            sql( "alter table `$nname` drop column imageID" );
         }
         echo "$nidno ";
      }
   }
}
/* AIM to implement Notion Management Tool */
function pimag(){ // return all imageID data for purging
   $q = sql( "select imageID from aaimage" );           // item with all imgIDs
        while( $r = mysqli_fetch_assoc( $q ) ) $imids[] = $r['imageID'];
   $q = sql( "select distinct imageID from aanotion" ); // item for aanotion table
        while( $r = mysqli_fetch_assoc( $q ) ) $ntnis[] = $r['imageID'];
   $q = sql( "select distinct imageID from aaavatar" ); // item for Avatars
        while( $r = mysqli_fetch_assoc( $q ) ) $avais[] = $r['imageID'];

   // [0] retAR -- first dimension is a triple
   $retAR[] = array("imids" => $imids, "ntnis" => $ntnis, "avais" => $avais);

   // [1]-[n] dimensions one per notion
   $q = sql( "select notionID from aanotion" );
   while ( $r = mysqli_fetch_assoc( $q ) ){             // get an item per notion
      unset( $nimis );
      $nname = holen( "notion", "aanotion", "notionID", $r['notionID'] );
      $qi = sql( "show columns from `$nname` like 'imageID'" );
      $ri = mysqli_num_rows( $qi ) ? TRUE : FALSE;
      if ( $ri ) {
         $q2 = sql( "select distinct imageID from `$nname`" );
         while ( $r2 = mysqli_fetch_assoc( $q2 ) ) $nimis[] = $r2['imageID'];
         $retAR[] = array( $r['notionID'] => $nimis );
      }
   }
   echo json_encode( $retAR );
}
function klone($getar){ // AJAX: clone an extant notion Q&A, pictures and sounds
   $jason = json_decode($getar,true);
   openlog("klone",LOG_NDELAY,LOG_LOCAL2);
   $nncurTable = rawurldecode(utf8_decode($jason['nncur'])); // NO  \
   $nncurColumn = mysqli_real_escape_string(lsql(),$nncurTable);     // YES \
   $nccur = utf8_decode($jason['nccur']);
   $ndcur = mysqli_real_escape_string(lsql(),rawurldecode(utf8_decode($jason['ndcur'])));
   $slang = $jason['slang']; $tlang = $jason['tlang']; $picto = $jason['picto'];
   $nidno = $jason['nidno']; $newAR = $jason['newAR'];
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] Cloning Notion $nncurTable");
   if( konto("notionID","aanotion","notion","$nncurColumn") ){
      echo speak("inuse","","","");
      return(false);
   }
   $query = mysqli_fetch_assoc(sql("select notion, imageID from aanotion where notionID=$nidno"));
   $nnold = $query['notion']; $nimag = $query['imageID'];
   $uidno=uidno();
   // enter into aanotion table

   sql("insert into aanotion (userID,imageID,notion,slang,tlang,category,description)
        values ('$uidno','$nimag','$nncurColumn','$slang','$tlang','$nccur','$ndcur')");
   $r = mysqli_fetch_assoc(
           sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='aanotion'" ) );
   $new_nidno = $r['AUTO_INCREMENT'] - 1;

   // enter into aapiction
   if( $picto ) sql("insert into aapiction (notionID) values('$new_nidno')");
   // create the new notion table with imageID and soundID IFF at origin
   $extraCols = "";
   $qi = sql("show columns from `$nnold` like 'imageID'");
   $ri = mysqli_num_rows($qi)?TRUE:FALSE;
   if ( $ri ) $extraCols .=", imageID int(24)";
   $qs = sql("show columns from `$nnold` like 'soundID'");
   $rs = mysqli_num_rows($qs)?TRUE:FALSE;
   if ( $rs ) $extraCols .=", soundID int(24)";
   sql("create table `$nncurTable` (question char(100) NOT NULL,
        answer char(100) NOT NULL $extraCols)
        engine=MyISAM default charset=utf8 collate utf8_bin");
   $ncount = count($newAR);
   for ( $i = 0; $i < count($newAR); $i++ ){ // TEST KLONING FOREIGN CHIKEN FEET
      $bq = mysqli_real_escape_string(lsql(),$newAR[$i]['q']);
      $ba = mysqli_real_escape_string(lsql(),$newAR[$i]['a']);
      $bi = $newAR[$i]['i']; $bs=$newAR[$i]['s'];
      // we always have Q&A but may be missing either of imageID or soundID
      if ( !empty($bi)&&!empty($bs) )  // here we have everything
         sql("insert into `$nncurTable` (question,answer,imageID,soundID)
              values('$bq','$ba','$bi','$bs')");
      if ( !empty($bi)&& empty($bs) )  // here we have no sound
         sql("insert into `$nncurTable` (question,answer,imageID)
              values('$bq','$ba','$bi')");
      if ( empty($bi)&&!empty($bs) )  // here we have no image
         sql("insert into `$nncurTable` (question,answer,soundID)
              values('$bq','$ba','$bs')");
      if ( empty($bi)&& empty($bs) )  // here we have only Q&A
         sql("insert into `$nncurTable` (question,answer) values('$bq','$ba')");
   }
   nhtml($new_nidno);
   ercau(); ercas();
   closelog();
}
function abfal($nidno){ // AJAX: discard a notion and purge related table entries
   // XXXXXX CSV entry in aasuper can potentially leave such zombies 
   $query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
   $nname = $query['notion']; $ncate = $query['category'];
   $slang = $query['slang'];  $owner = $query['userID'];
   $uidno = uidno();
   $pdfID = holen("pdfID","aapdfid","notionID","$nidno");
   if ( $owner == $uidno ) { ercau(); ercas();
      if ( $pdfID ) sql("delete from aapdf where pdfID='$pdfID'");
      sql("delete from aanotion where notionID='$nidno'");
      $q = sql("select perfID from aaperfid where notionID='$nidno'");
           while ( $r = mysqli_fetch_assoc($q) ) sql("delete from aaprobs where perfID='$r[perfID]'");
      sql("delete from aaperfid where notionID='$nidno'");
      sql("delete from aasperq where notionID='$nidno'");
      sql("delete from aapart where notionID='$nidno'");
      sql("delete from aapdfid where notionID='$nidno'");
      sql("delete from aavideo where notionID='$nidno'");
      sql("delete from aarating where notionID='$nidno'");
      sql("delete from aareview where notionID='$nidno'");
      sql("delete from aapiction where notionID='$nidno'");
      sql("delete from aaformula where notionID='$nidno'");
      sql("drop table `$nname`");
   } else { echo "ERR_NOOWN"; return(false); }
}
function udata(){ //  Admin Utility for User management
   $q = sql("select distinct userID from aauser");
   while ( $u = mysqli_fetch_assoc( $q ) ) {
      $un = holen("user","aauser","userID","$u[userID]");
      $fn = holen("fname","aafname","userID","$u[userID]");
      $kn = holen("kname","aakname","userID","$u[userID]");
      $em = holen("email","aaemail","userID","$u[userID]");
      $la = holen("last","aalast","userID","$u[userID]");
      $av = holen("imageID","aaavatar","userID","$u[userID]");
      $ns = holen("userID","aanosnd","userID","$u[userID]");
      $tt = mysqli_num_rows(sql("select * from aaperfid where userID='$u[userID]'"));
      $na = mysqli_num_rows(sql("select * from aanotion where userID='$u[userID]'"));
      $rg = mysqli_num_rows(sql("select * from aarating where userID='$u[userID]'"));
      $rw = mysqli_num_rows(sql("select * from aareview where userID='$u[userID]'"));
      $sl = mysqli_num_rows(sql("select * from aalogin where userID='$u[userID]'"));
      $retAR[]=array( "id" => $u['userID'],
         "un" => $un,   "fn" => $fn,   "kn" => $kn,
         "em" => $em,   "la" => $la,   "av" => $av,   "ns" => $ns,
         "tt" => $tt,   "na" => $na,   "rg" => $rg,   "rw" => $rw,   "sl" => $sl
         );
   }
   echo json_encode($retAR);
}
function newid($getar){ // Admin Utility to give a user a new userID
   $jason=json_decode($getar,true);
   $oldid=$jason['oldid'];
   $newid=$jason['newid'];
   $oldUser=holen("user","aauser","userID","$oldid");
   $query = mysqli_fetch_assoc(sql("select * from aauser where userID=$oldid"));
   $oldDate = $query['createDate']; $oldPwrd = $query['password']; $oldLang = $query['ulang'];
   if(konto("userID","aauser","userID","$newid")) {
      echo $newid." is taken!";
      exit;
   }
   sql("insert into `aauser` (userID, user, createDate, password, ulang)
        values('$newid','$oldUser','$oldDate','$oldPwrd','$oldLang')");
   $mesas=array("aafname",//"aamname","aalname",
                "aakname","aaemail","aaavatar",
                "aalast","aalogin","aanosnd",
                "aaperfid","aanotion","aarating","aareview");
   foreach($mesas as $mesa) sql("update `$mesa` set userID='$newid' where userID='$oldid'");
   sql("delete from `aauser` where userID='$oldid'");
}
function urele($getar){ //  Admin Utility to relegate a user's data to another
   $jason=json_decode($getar,true);
   $donor=$jason['donor'];
   $towho=$jason['towho'];
   if(!konto("userID","aauser","userID","$towho")) { // Ensure we have a receipient
      echo $towho." Doesn't exist!";
      exit;
   }
   $mesas=array("aalogin","aaperfid","aanotion","aarating","aareview");
   foreach($mesas as $mesa) sql("update `$mesa` set userID='$towho' where userID='$donor'");
}
function udele($uidno){ //  Admin Utility to delete a user
   ercau();
   $mesas = array("aaadmin","aaavatar","aaemail","aafname","aajamsg","aakname","aalast","aalogin",
                  "aanosnd","aaperfid","aanotion","aarating","aareview","aauser");
   foreach ( $mesas as $mesa ) sql("delete from `$mesa` where userID='$uidno'");
   echo "true";
}
function weran(){ //  report users currently active
   $IDLE = 3600;
   $anons = 0;
   $q = sql("select last from aalast"); // wer is eingeloggt
   while ( $r = mysqli_fetch_assoc( $q ) )
      if ( abs(strtotime($r['last']) - strtotime(date('Y-m-d H:i:s',time()))) < $IDLE ) $anons++;
   if ( $anons > 0 ) echo $anons;
}
function allss(){ // return all soundID data for purging
   $q=sql("select soundID, name from aasound order by soundID"); // item with all soundIDs
   while($r=mysqli_fetch_assoc($q))
      $sones[]=array("sndid" => $r['soundID'], "sndna" => $r['name']);
   // [0] retAR -- first dimension is a singleton
   $retAR[]=array("sones" => $sones);

   // [1]-[n] dimensions one per notion
   $q=sql("select notionID from aanotion");
   while($r=mysqli_fetch_assoc($q)){             // get an item per notion
      unset($nsnds);
      $nname=holen("notion","aanotion","notionID",$r['notionID']);
      $qs=sql("show columns from `$nname` like 'soundID'");
      $rs=mysqli_num_rows($qs)?TRUE:FALSE;
      if($rs) {
         $q2=sql("select distinct soundID from `$nname`");
         while($r2=mysqli_fetch_assoc($q2)) $nsnds[]=$r2['soundID']; 
         $retAR[]=array($r['notionID'] => $nsnds);
      }
   }
   echo json_encode($retAR);
}
function lader($lan2L){ //  add an entirely new language to the system
   ercas(); // clean SINFO
   if(mysqli_num_rows(sql("show columns from aaglobe like '$lan2L'"))) return;
   else {
      sql("alter table aaglobe add $lan2L varchar(1000) NOT NULL");
      sql("update aaglobe set $lan2L=en");
   }
   xcach(); // clean SINFO, all LINFO's, and Super user's UINFO
}
function klmed($getar){ // AJAX: clone media across notions
   $jason=json_decode($getar,true);
   $sonid=$jason['sonid']; $tanid=$jason['tanid'];
   $socol=$jason['socol']; $tacol=$jason['tacol']; $media=$jason['media'];
   $sontn=holen("notion","aanotion","notionID",$sonid);
   $tantn=holen("notion","aanotion","notionID",$tanid);
   ercan($sonid); // erase source notion cache files
   ercan($tanid); // erase target notion cache files

   if($media=="imageID"){ // copy the imageIDs from source to target
      $qi=sql("show columns from `$tantn` like 'imageID'");
      $ri=mysqli_num_rows($qi)?TRUE:FALSE;
      if(!$ri) sql("alter table `$tantn` add imageID int(24)");
      $q=sql("select $socol from `$sontn`");
      while($r=mysqli_fetch_assoc($q)){
         $soval=mysqli_real_escape_string(lsql(),$r[$socol]);
         $k=holen("imageID","$sontn","$socol","$soval");
         if(!empty($k))
            sql("update `$tantn` set imageID='$k' where $tacol='$soval'");
      }
   }

   if($media=="soundID"){ // copy the soundIDs from source to target
      $qs=sql("show columns from `$tantn` like 'soundID'");
      $rs=mysqli_num_rows($qs)?TRUE:FALSE;
      if(!$rs) sql("alter table `$tantn` add soundID int(24)");
      $q=sql("select $socol from `$sontn`");
      while($r=mysqli_fetch_assoc($q)){
         $soval=mysqli_real_escape_string(lsql(),$r[$socol]);
         $k=holen("soundID","$sontn","$socol","$soval");
         if(!empty($k)) sql("update `$tantn` set soundID='$k' where $tacol='$soval'");
      }
   }
}
if(isset($_REQUEST['tun'])) $tun=$_REQUEST['tun']; else $tun="";
switch($tun){ 
   case 'debug':case 'weran':case 'btest':
   case 'klone':case 'abfal':
   case 'udata':case 'newid':case 'urele':case 'udele':
   case 'lader':case 'klmed':
   case 'allss':
   case 'pimag':case 'idata':case 'sdata':case 'xcach':
   admin(); // THE ABOVE RESERVED FOR ADMIN
      if(!isset($_REQUEST['was'])) eval($tun."();");
      else eval($tun."(\$_REQUEST['was']);"); break;
}
?>
