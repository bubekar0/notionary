<?php
require_once "utiles.php";
require_once "dbutil.php";
require_once "oauth2.php";

function uload(){ // Client upload check after an Upload has been posted
   if(isset($_SESSION['uload'])){
      echo json_encode($_SESSION['uload']);
      unset($_SESSION['uload']);
   } else echo json_encode(array("status"=>-1,"db_id"=>null,"name"=>null));
}
function fupld(){ // POST: versatile file upload processor
   openlog("fupld",LOG_NDELAY,LOG_LOCAL2);
   $TEMPORA  = "/tmp/";
   unset($_SESSION['csvJSON']);
   unset($_SESSION['uload']);   // array("status","db_id","name");
   $inits = $_REQUEST['inits'];
   $nname = $_REQUEST['notion'];               // use as Table name without  \'
   $safen = nunft($_FILES['foo']['name']);
   $uidno = uidno();
   $targt = "${TEMPORA}u${uidno}_${inits}_".date("DdMY_",time()).basename($safen);
   syslog(LOG_NOTICE,"-- USER($uidno) TARGET($targt) NNAME($nname) -- ");
   switch($inits){
      case 'cs': $types=array( "text/csv", "text/plain","text/rtf",
           "application/pdf", "application/msword",
           "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
         $dorun=function($u,$t,$nn){ $myext=pathinfo($t,PATHINFO_EXTENSION);
            switch($myext){
               case 'txt': case 'csv': $_SESSION['csvJSON'] = parsePlain($t); break;
               case 'rtf':             $_SESSION['csvJSON'] = parseRTF($t);   break;
               case 'pdf':             $_SESSION['csvJSON'] = parsePDF($t);   break;
               case 'doc':             $_SESSION['csvJSON'] = parseWord($t);  break;
               case 'docx':            $_SESSION['csvJSON'] = parseZip($t);   break;
               default:                $_SESSION['csvJSON'] = parseNone();    break;
            }
         }; break;
      case 'av': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){
            if($imgid=holif("imageID","aaavatar","userID","$u"))
               blobbUpdate($t,"image",$imgid,basename($t));
            else { $imgid=blobbInsert($t,"image","",basename($t)); ercau();
               sql("insert into aaavatar (userID,imageID) values('$u','$imgid')");
            }
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] AV with imgid($imgid)");
         }; break;
      case 'ei': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){
            $imgid=blobbInsert($t,"image","",basename($t));
               sql("insert into aaalbum (EAN,imageID) values('$nn','$imgid')");
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
         }; break;
      case 'ab': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){
            $who = $nn; $whocol = "eanno";
            $imgid=blobbInsert($t,"image","",basename($t));
            sql("insert into aaalbum ($whocol,imageID) values('$who','$imgid')");
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] AB with imgid($imgid)");
         }; break;
      case 'ni': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){ $saveAs="N_".$nn." ".basename($t);
            $nid=holen("notionID","aanotion","notion",mysqli_real_escape_string(lsql(),$nn));
            if($imgid=holif("imageID","aanotion","notionID","$nid")){
               syslog(LOG_NOTICE,"ni then leg");
               blobbUpdate($t,"image",$imgid,mysqli_real_escape_string(lsql(),$saveAs));
            } else { ercan($nid);
               syslog(LOG_NOTICE,"ni else leg");
               $imgid=blobbInsert($t,"image","",mysqli_real_escape_string(lsql(),$saveAs));
               sql("update aanotion set imageID='$imgid' where notionID='$nid'");
            }
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] NI with imgid($imgid) basename($t)");
         }; break;
      case 'qi': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){
            $q=mysqli_real_escape_string(lsql(),$_REQUEST['question']);
            $saveAs="N_${nn} Q_".urlencode($q)." ".basename($t);
            $nnesc=mysqli_real_escape_string(lsql(),$nn); // need a non table name version here
            if($imgid=holif("imageID","$nn","question","$q"))
               blobbUpdate($t,"image",$imgid,mysqli_real_escape_string(lsql(),$saveAs));
            else { $imgid=blobbInsert($t,"image","",mysqli_real_escape_string(lsql(),$saveAs));
               ercan(holen("notionID","aanotion","notion",$nnesc));
               $qi=sql("show columns from `$nn` like 'imageID'");
               $ri=mysqli_num_rows($qi)?TRUE:FALSE;
               if(!$ri) sql("alter table `$nn` add imageID int(24)");
               sql("update `$nn` set imageID='$imgid' where question='$q'");
            }
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] QI with imgid($imgid)");
         }; break;
      case 'qs': $types=array("audio/mp3","audio/MP3","audio/mpeg","audio/MPEG",
                              "audio/wav","audio/vnd.wav","audio/x-wav");
         $dorun=function($u,$t,$nn){
            $q=mysqli_real_escape_string(lsql(),$_REQUEST['question']);
            $saveAs="N_${nn} Q_".urlencode($q)." ".basename($t);
            $nnesc=mysqli_real_escape_string(lsql(),$nn); // need a non table name version here
            if($sndid=holif("soundID","$nn","question","$q"))
               blobbUpdate($t,"sound",$sndid,$saveAs);
            else { $sndid=blobbInsert($t,"sound","",$saveAs);
               ercan(holen("notionID","aanotion","notion",$nnesc));
               $qs=sql("show columns from `$nn` like 'soundID'");
               $rs=mysqli_num_rows($qs)?TRUE:FALSE;
               if(!$rs) sql("alter table `$nn` add soundID int(24)");
               sql("update `$nn` set soundID='$sndid' where question='$q'");
            }
            $_SESSION['uload']['db_id']=$sndid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] QS with sndid($sndid)");
         }; break;
      case 'ie': $types=array("image/jpg","image/jpeg","image/gif","image/png","image/svg+xml");
         $dorun=function($u,$t,$nn){ $imgid=$_REQUEST['question'];
            if(konto("size","aaimage","imageID",$imgid)) blobbUpdate($t,"image",$imgid,basename($t));
            else blobbInsert($t,"image",$imgid,basename($t)); // real blobbInsert with idx 
            $_SESSION['uload']['db_id']=$imgid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] IE with imgid($imgid)");
         };
         break;
      case 'se': $types=array("audio/mp3","audio/MP3","audio/mpeg","audio/MPEG",
                              "audio/wav","audio/vnd.wav","audio/x-wav");
         $dorun=function($u,$t,$nn){ $sndid=$_REQUEST['question'];
            if(konto("size","aasound","soundID",$sndid)) blobbUpdate($t,"sound",$sndid,basename($t));
            else blobbInsert($t,"sound",$sndid,basename($t)); // real blobbInsert with idx 
            $_SESSION['uload']['db_id']=$sndid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] SE with sndid($sndid)");
         }; break;
      case 'pd': $types=array("application/pdf","document/pdf");
         $dorun=function($u,$t,$nn){
            $nid=holen("notionID","aanotion","notion",mysqli_real_escape_string(lsql(),$nn));
            $saveAs="N_${nn} ".basename($t);
            if($pdfid=holif("pdfID","aapdfid","notionID","$nid"))
               blobbUpdate($t,"pdf",$pdfid,$saveAs);
            else { $pdfid=blobbInsert($t,"pdf","",$saveAs);
               sql("insert into aapdfid(notionID,pdfID) values('$nid','$pdfid')");
            }
            ercan($nid); ercas();
            $_SESSION['uload']['db_id']=$pdfid;
            $_SESSION['uload']['name']=basename($t);
            syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] PD with pdfid($pdfid)");
         }; break;
   }
   if(!empty($safen)){                                               // user has indeed picked a file
      $_SESSION['uload']['status']=$_FILES['foo']['error'];          // examine file for errors
      if($_SESSION['uload']['status']!=0) exit;                      // problem found -- exit
      $ftype=$_FILES['foo']['type'];                                 // determine type
      if(in_array($ftype,$types)){                                   // file type is valid
         if(move_uploaded_file($_FILES['foo']['tmp_name'],$targt)){  // try to upload it
            $_SESSION['uload']['status'] = 0;                        // sucess!!
            $dorun($uidno,$targt,$nname);                            // run callback
         } else { $_SESSION['uload']['status']=4; exit; }            // problem loading
      } else { $_SESSION['uload']['status']=5; exit; }               // invalid type
   } else { $_SESSION['uload']['status']=8; exit; }                  // empty
   syslog(LOG_NOTICE," ------------------------------------------------------------------------------------------- ");
   closelog();
}
function qiupd($getar){ // AJAX: GIS update a DB image for QA pair
   openlog("qiupd",LOG_NDELAY,LOG_LOCAL2);
   $jason=json_decode(stripslashes($getar),true);
   $nntab=$jason['nname'];
   //$nntab=mysqli_real_escape_string(lsql(),$jason['nname']);
   $nncol=mysqli_real_escape_string(lsql(),$jason['nname']);
   $image=$jason['image'];
   $frage=mysqli_real_escape_string(lsql(),rawurldecode($jason['frage']));
   $uidno=uidno();
   $nidno=holen("notionID","aanotion","notion",$nncol);
   if(substr($image,0,27)=="https://maps.googleapis.com") $trail="STATIC GOOGLE MAP";
   else $trail=$image; // This would otherwise be too long to save
   $saveAs="u${uidno}_n${nidno}_gis_$_SERVER[REMOTE_ADDR]_"
           .date("DdMY_",time())."Q:".urlencode($frage)." [$trail]";
   if($imgid=holif("imageID","$nntab","question","$frage"))
      blobbUpdate($image,"image",$imgid,$saveAs);
   else { $imgid=blobbInsert($image,"image","",$saveAs);
      $qi=sql("show columns from `$nntab` like 'imageID'");
      $ri=mysqli_num_rows($qi)?TRUE:FALSE;
      if(!$ri) sql("alter table `$nntab` add imageID int(24)");
      sql("update `$nntab` set imageID='$imgid' where question='$frage'");
      ercan($nidno); echo $imgid;
   }
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] GIS QI with imgid($imgid)");
   closelog();
}
function niupd($getar){ // AJAX: GIS update a DB image for a notion
   openlog("niupd",LOG_NDELAY,LOG_LOCAL2);
   $jason=json_decode(stripslashes($getar),true);
   $nname=mysqli_real_escape_string(lsql(),$jason['nname']);
   $image=$jason['image'];
   $uidno=uidno();
   $nidno=holen("notionID","aanotion","notion",$nname);
   $saveAs="u${uidno}_N:${nidno}_gis_$_SERVER[REMOTE_ADDR]_".date("DdMY ",time()).$image;
   if($imgid=holif("imageID","aanotion","notionID",$nidno))
      blobbUpdate($image,"image",$imgid,$saveAs);
   else { $imgid=blobbInsert($image,"image","",$saveAs);
      sql("update aanotion set imageID='$imgid' where notion='$nname'");
      ercan($nidno); ercas(); echo $imgid;
   }
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] GIS NI with imgid($imgid)");
   closelog();
}
function ieupd($getar){ // AJAX: GIS update a DB image from admin Image editor
   openlog("ieupd",LOG_NDELAY,LOG_LOCAL2);
   $jason=json_decode(stripslashes($getar),true);
   $nname=$jason['nname']; $frage=$jason['frage']; $image=$jason['image'];
   $uidno=uidno();
   $saveAs="u${uidno}_gis_".date("DdMY ",time()).$image;
   if(konto("size","aaimage","imageID",$frage)) blobbUpdate($image,"image",$frage,$saveAs);
   else $imgid=blobbInsert($image,"image",$frage,$saveAs);
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] GIS IE with imgid($imgid)");
   closelog();
}
function qsupdNew($getar){ // AJAX: Dump audio directly from browser
   $CODESTR = param("grava"); 
   //openlog("qsupd",LOG_NDELAY,LOG_LOCAL2);
   $jason =json_decode(stripslashes($getar),true);
   $nntab = $jason['nname'];
   $nncol = mysqli_real_escape_string(lsql(),$jason['nname']);
   $frage = mysqli_real_escape_string(lsql(),rawurldecode($jason['frage']));
   if ( !preg_match('/data:([^;]*);base64,(.*)/',$jason['data'],$matches) ) die("error");
   $stype = $matches[1];

  $encodedData = str_replace(' ','+',$matches[2]);
  $sound = base64_decode($encodedData);

   //$sound = base64_decode($matches[2]);
   $ssize = strlen($sound);
   $uidno = uidno();
   $dbfnm = "u".$uidno."_qsupd_$_SERVER[REMOTE_ADDR]_".date("DdMY_").$frage;
   $sdata = addslashes($sound);
   file_put_contents("/tmp/HT_jasondata.wav",$jason['data']);
}
function qsupd($getar){ // AJAX: Dump audio directly from browser
   $CODESTR = param("grava"); 
   openlog("qsupd",LOG_NDELAY,LOG_LOCAL2);
   $jason =json_decode(stripslashes($getar),true);
   $nntab = $jason['nname'];
   $nncol = mysqli_real_escape_string(lsql(),$jason['nname']);
   $frage = mysqli_real_escape_string(lsql(),rawurldecode($jason['frage']));
   if ( !preg_match('/data:([^;]*);base64,(.*)/',$jason['data'],$matches) ) die("error");
   $stype = $matches[1];
   $sound = base64_decode( str_replace(' ','+',$matches[2]) ); // native httpost JS leaves blanks
   $ssize = strlen($sound);
   $uidno = uidno();
   $dbfnm = "u".$uidno."_qsupd_$_SERVER[REMOTE_ADDR]_".date("DdMY_").$frage;
   $sdata = addslashes($sound);

   if ( $nntab == $CODESTR ) { // admin sound editor nname="codestr", frage=sndid
      // Just cause you can, doesnt mean you should INSERT Gaps into an indexed Table
      if(konto("size","aasound","soundID",$frage))
         sql("update aasound set type='{$stype}', size='{$ssize}', name='{$dbfnm}',
              sound='{$sdata}' where soundID='$frage'");
      else 
         sql("insert into aasound (soundID,type,sound,size,name)
              values ('$frage','{$stype}','{$sdata}','{$ssize}','{$dbfnm}')");
      echo json_encode(array("sndid"=>$frage,"size"=>$ssize,"name"=>$dbfnm));
      syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] QS Recorder with sndid($frage)");
   } else { // naryEdit or naryExam(Pause|Contrib)
      $nidno=holen("notionID","aanotion","notion",$nncol);
      if( $sndid=holif("soundID","$nntab","question",$frage) ){
         sql("update aasound set type='{$stype}', size='{$ssize}', name='{$dbfnm}',
              sound='{$sdata}' where soundID='$sndid'");
         syslog(LOG_NOTICE,"Found sndid($sndid)");
      } else {
         sql("insert into aasound (soundID,type,sound,size,name) values (LAST_INSERT_ID(),'{$stype}','{$sdata}','{$ssize}','{$dbfnm}')");
         $r = mysqli_fetch_assoc(
                 sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='aasound'" ) );
         $sndid = $r['AUTO_INCREMENT'] - 1;

         syslog(LOG_NOTICE,"Created sndid($sndid)");
         $qs=sql("show columns from `$nntab` like 'soundID'");
         $rs=mysqli_num_rows($qs)?TRUE:FALSE;
         if(!$rs) sql("alter table `$nntab` add soundID int(24)");
         sql("update `$nntab` set soundID='$sndid' where question='$frage'");
      }
      ercan($nidno);
      echo json_encode(array("sndid"=>$sndid,"size"=>$ssize,"name"=>$dbfnm));
      syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] QS Recorder with sndid($sndid)");
   }
   closelog();
}
?>
