<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set('Europe/Berlin');
require_once "cssphp.php";
require_once "utiles.php";
require_once "dbutil.php";
require_once "oauth2.php";
require_once "global.php";
require_once "tools.php";
if( !isset($_SESSION['blang']) || !isset($_SESSION['slang']) ) { // Set 'blang' by browser Locale, default 'en'
   if( array_key_exists('HTTP_ACCEPT_LANGUAGE', $_SERVER) )
      $alhed=explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']); // now set the Browser lang
   if(isset($alhed)) $_SESSION["blang"]=substr($alhed[0],0,2); else $_SESSION["blang"]="en";
   switch($_SESSION["blang"]){ // Set 'slang' by 'blang', unless user logging.
      case 'en':case 'de':case 'fr':case 'es':case 'it':case 'pt':case 'ru':case 'hu':
         if(!isset($_SESSION["slang"])) $_SESSION["slang"]=$_SESSION["blang"]; break;
      default: if(!isset($_SESSION["slang"])) $_SESSION["slang"]="en"; break;
   }
}
$slang = $_SESSION["slang"];
function par2s($probAR,$nname,$pikja,$slang){ // Convert a Problems Array into a String
   global $PARAM_IMAGE;
   $_ACHT = pglot(["_ACHT"])[0];
   $PROBLEM_IMG_WIDTH  = 80;
   $PROBLEM_IMG_HEIGHT = 50;
   $MYURL = param("myurl");
   $probStr = "\r\n";
   $qi = sql("show columns from `$nname` like 'imageID'");
   $visual = mysqli_num_rows($qi)?TRUE:FALSE;
   $qs = sql("show columns from `$nname` like 'soundID'");
   $sonora = mysqli_num_rows($qs)?TRUE:FALSE;
   $felde  = " answer ";
   if( $visual ) $felde.=", imageID ";
   if( $sonora ) $felde.=", soundID ";
   if( sizeof($probAR) )
      foreach($probAR as $praw){ // We are dealing with internationalized data
         $p=scapo($praw);
         $q=sql("select $felde from `$nname` where question='$p'");
         $r=mysqli_fetch_assoc($q);
         $anser = getGoodChoice($r['answer']);
         if( $visual ) $imgid = $r['imageID'];
         if( $sonora ) $sndid = $r['soundID'];
         if ( $pikja ){
            if( $visual && $r['imageID'] ){
               $qoris = "<img class='notionary-problem-image' ".
                              " src='".$PARAM_IMAGE.$imgid."' ".
                           " height='".$PROBLEM_IMG_HEIGHT."' ".
                            " width='".$PROBLEM_IMG_WIDTH."' ".
                        ">\r\n";
            } else $qoris = ""; // Strange, a Piction without a picture!!
         } else $qoris = "<span class='nroso'>" . $praw . "</span>";  // Normal Notion
         if( $sonora && $r['soundID'] ) // Wrap the question into a clickable hoverable link to sound
            $qoris = "<a class='playme' sndid='" . $sndid . "' href='$MYURL?tun=sbyid&was=" . $sndid . "'> $qoris </a>";
         $probStr .= "<div class='notionary-problem-row'>" .  $qoris . " : " .  $anser .  "</div>\r\n";
      }
   if ( !empty($probStr) ) $probStr = $_ACHT . $probStr;
   return($probStr);
}
function checkEmail($uidno){ // See if user has a proper Email and wants to receive
   $send2 = false;
   if( isset($_SESSION['uname']) ){
      $email = $_SESSION['uname']; // Assume the user isn't neted but check subsequently
      switch ( substr($_SESSION['uname'],0,3) ){  // Check if neted
         case 'FB-': case 'TW-': case 'GP-': $neted = true; break;
         default: $neted = false; break;
      }
      if ( $neted ) { // There is a chance a neted entered an EMail
         if ( konto("email","aaemail","userID","$uidno") )
            $send2 = holen("email","aaemail","userID",$uidno);
         else $send2 = false;
      } else $send2 = $_SESSION['uname'];
      if ( !konto("userID","aajamsg","userID","$uidno") ) $send2 = false;
   }
   return($send2);
}
function updateServer($uidno,$nidno,$ptype,$score,$dauer,$probs){
   // Save the Performance data into the Database for tests 1, 2, 3
   sql("insert into aaperfid (userID,notionID,ptype,dtime,score,elapsed)
        values('$uidno','$nidno','$ptype',NOW(),'$score','$dauer')");

   $r = mysqli_fetch_assoc(
           sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='aaperfid'" ) );

   $prfid = $r['AUTO_INCREMENT'] - 1;  // We need this for the mail2 Button

   foreach( $probs as $p ) { // Save each problem into the Database ( internationalized data )
      $aposOK = mysqli_real_escape_string(lsql(), $p );
      sql("insert into aaprobs (perfID,probs) values ('$prfid','$aposOK')"); }
   return($prfid);
}
function getPerformance($uidno,$nidno){
   global $XLATE_PERFO;
   $myone = $mytwo = $mytre = $perfo ="";
   $nmall = nmall($uidno,$nidno); // Now with new data, display a Summary of Test Scores + Record Holder
   if( $nmall["mysc1"] ) $myone = "<br/><span class='notionary-perftrial'>[➊]✔" . $nmall["mysc1"] .
                                            "%(" . sec2t($nmall["mybt1"]) . ")</span>\r\n";
   if( $nmall["mysc2"] ) $mytwo =      "<span class='notionary-perfwrite'>[➋]✍" . $nmall["mysc2"] .
                                            "%(" . sec2t($nmall["mybt2"]) . ")</span>\r\n";
   if( $nmall["mysc3"] ) $mytre =      "<span class='notionary-perfadept'>[❸]☜" . $nmall["mysc3"] .
                                            "%(" . sec2t($nmall["mybt3"]) . ")</span>\r\n";
   if( strlen($myone.$mytwo.$mytre) ) // Don't render scores unless thre is at least one
      $perfo = "<span class='ngrun'>$XLATE_PERFO</span>\r\n $myone $mytwo $mytre";
   return($perfo);
}
function getPriorResults($uidno,$nidno,$nname,$pikja,$slang){
   global $XLATE_LEVEL;
   list($_BEFO, $_MINI, $_MAXI, $_AVER) = pglot(["_BEFO", "_MINI", "_MAXI", "_AVER"]);
   $results123 = "";
   // Now here we could potentially show a prior Summary Graph but for now just a list
   $q=sql("select * from aaperfid where userID='$uidno' and notionID='$nidno' order by dtime desc");
   if(mysqli_num_rows($q)>0) // This user has tested this Notion before
      while($r=mysqli_fetch_assoc($q)){
         $per[]=array( "pid" => $r['perfID'], "typ" => $r['ptype'],
                       "tim" => str_replace("-","/",substr($r['dtime'],0,10)),
                       "sco" => $r['score'], "ela" => $r['elapsed']); //, "prb" => $prb);
      } // Now we have an array per[] with the test data and possibly problems array per test
   $count1=0;   $min1=100.0; $max1=0.0;  $average1=0.0; // for each exam type generate
   $count2=0;   $min2=100.0; $max2=0.0;  $average2=0.0; // basic stats of distribution
   $count3=0;   $min3=100.0; $max3=0.0;  $average3=0.0; // and central tendency
   if( isset($per) ){
      for( $i=0; $i<sizeof($per); $i++){ // one line per exam taken
         $dataScore  = $per[$i]["sco"];
         $dateString = $per[$i]["tim"]; // date string
         switch($per[$i]["typ"]){
            case "1": $testType=$XLATE_LEVEL."➊";
                      if( $dataScore < $min1 ) $min1=$dataScore;
                      if( $dataScore > $max1 ) $max1=$dataScore;
                      $average1=($average1*$count1+$dataScore)/($count1+1);
                      $ones[] = "[" . $count1 . "," . $dataScore . "]";
                      $count1++; $clase = "notionary-perftrial";
                      break;
            case "2": $testType=$XLATE_LEVEL."➋";
                      if( $dataScore < $min2 ) $min2=$dataScore;
                      if( $dataScore > $max2 ) $max2=$dataScore;
                      $average2=($average2*$count2+$dataScore)/($count2+1);
                      $twos[] = "[" . $count2 . "," . $dataScore . "]";
                      $count2++; $clase = "notionary-perfwrite";
                      break;
            case "3": $testType=$XLATE_LEVEL."❸";
                      if( $dataScore < $min3 ) $min3=$dataScore;
                      if( $dataScore > $max3 ) $max3=$dataScore;
                      $average3=($average3*$count3+$dataScore)/($count3+1);
                      $tris[] = "[" . $count3 . "," . $dataScore . "]";
                      $count3++; $clase = "notionary-perfadept";
                      break;
         }
         str_pad(number_format((float)$per[$i]["sco"],2,'.',''),6," ",STR_PAD_LEFT) .
         "% (" . sec2t($per[$i]["ela"]) . ")" .
         "</span>";
      }
      if( $count1 || $count2 || $count3 ){
         $results123 .= "$_BEFO";
         if($count1)
            $results123 .= "<div id='priorEinsen'>".
               "<div>". $XLATE_LEVEL."➊[".str_pad($count1,2," ",STR_PAD_LEFT)."]</div>".
               "<div>" .$_MINI . str_pad($min1,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_MAXI . str_pad($max1,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_AVER . number_format((float)$average1,2,'.','').
               "%</div>\r\n</div>\r\n";
         if($count2)
            $results123 .= "<div id='priorZweien'>".
               "<div>". $XLATE_LEVEL."➋[".str_pad($count2,2," ",STR_PAD_LEFT)."]</div>".
               "<div>" .$_MINI . str_pad($min2,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_MAXI . str_pad($max2,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_AVER . number_format((float)$average2,2,'.','').
               "%</div>\r\n</div>\r\n";
         if($count3)
            $results123 .= "<div id='priorDreien'>".
               "<div>". $XLATE_LEVEL."❸[".str_pad($count3,2," ",STR_PAD_LEFT)."]</div>".
               "<div>" .$_MINI . str_pad($min3,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_MAXI . str_pad($max3,5," ",STR_PAD_LEFT)."%</div>".
               "<div>" .$_AVER . number_format((float)$average3,2,'.','').
               "%</div>\r\n</div>\r\n<br/>\r\n";
      }
   }
   if( !isset($ones) ) $ones=array(""); if( !isset($twos) ) $twos=array(""); if( !isset($tris) ) $tris=array("");
   return(array("one23" => $results123,
                "allData" => "<div id='perfPriorResults'>$results123 <div id='flotgraph'></div></div>",
                "count1" => $count1, "count2" => $count2, "count3" => $count3,
                "ones" => $ones, "twos" => $twos, "tris" => $tris));
}
function getEmailSubject($exart,$nname,$mixed,$score,$elaps){
   global $_PERF; // NOT A GLOBAL STRING!!!!!!!!!!!
   // Use MultyByte safe substr to not fuck up the UTF-8 encoding
   $emsub = " ✩  ".mb_substr($exart,0,strpos($exart,":"),'UTF-8')."[".$nname;
   if( $mixed ) $emsub .= " + ... ] ✩ "; else $emsub .= "] ✩ ";
   $emsub=$_PERF.$emsub.$score."%($elaps)";
   return($emsub);
}
ercau(); ercas();  // This seems not to work in production -- redundant for now with notionary-perf.js
$jason = json_decode($_REQUEST['pdata'],true);
$nidno = $jason['nidno']; $ttype = $jason['ttype']; $right = $jason['right'];
$score = $jason['score']; $dauer = $jason['dauer']; $probs = $jason['probs'];
$elaps = sec2t( $dauer );
$XLATE_ALTXT = xlate("altxt",$slang); $XLATE_LEVEL = xlate("level",$slang);
$XLATE_PERFO = xlate("perfo",$slang); $_PERF = "[ notionary.test ] $XLATE_PERFO";
$PARAM_IMAGE = param("image"); $PARAM_MYURL = param("myurl"); $PARAM_TPAGE = param("tpage");
$TW_TIMELINE_ID = "343329091325415425"; $KURZ_MAXLEN = 25;  // Shorten long Notion names for the Button
$exart = xlate($ttype,$slang);
$query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
$nname = $query['notion']; $ndesc = $query['description']; $catno = $query['category'];
$nimag = $query['imageID']; $nslan = $query['slang'];
$nsafe = rawurlencode($nname);
$nhtml = $PARAM_MYURL . "?tun=trial&amp;was=" . $nsafe;
$nnurl = $PARAM_MYURL . "?tun=trial&amp;was=" . $nname;
list($_ETAL, $_LERN, $_SHAM, $_DONE, $_SENT, $_FOWD, $_GOOD, $_FEED, $_RECO) = pglot(
    ["_ETAL","_LERN","_SHAM","_DONE","_SENT","_FOWD","_GOOD","_FEED","_RECO"]);
if( strlen($nname) > $KURZ_MAXLEN ) $nkurz = substr($nname,0,$KURZ_MAXLEN)." . . .";
else $nkurz = $nname;
konto("notionID","aapiction","notionID","$nidno") ? $pikja=true : $pikja=false;
$mixed = false; $emstr=$brstr=$buble=$mail2=$marks=$myall=$prior=$esent=$fward="";
switch($ttype){ // Eggon/Nexto + Loben/Tadeln logic
   case 'zerob': $ptype=0; $lobta=false;  break;
   case 'trial': $ptype=1; $lobta=true;   break;
   case 'write': $ptype=2; $lobta=true;   break;
   case 'adept': $ptype=3; $lobta=true;   break;
   case 'mix1b': $ptype=4; $lobta=false; $mixed=$_ETAL; break;
   case 'mix2b': $ptype=5; $lobta=false; $mixed=$_ETAL; break;
}
$nrall = nrall($nidno); // Notion Record Scores
$noten = getNoten($nname,date('Y/m/d - g:i A'),$exart,$score,$elaps);      // The type, score and elapsed
$prstr = par2s($probs,$nname,$pikja,$slang);  // Any exam problems nicely marked up as string
$fbook = fbfrm("frecom",flang($slang),urlencode($PARAM_MYURL . "?tun=trial&was=" . $nname),"recommend");
$tweet = twfrm("trecom",$slang,"",rawurlencode($_LERN.$score."%(".$elaps.") ☛  "));
//$gplus = gpfrm("grecom","g-plus",glang($slang),$nnurl,"share");
if ( isset($_SESSION['uname']) ) $uidno = uidno();
if ( $lobta && isset($uidno) ){ // Loben / Tadeln für Insiders Tests 1, 2, and 3
   $marks = lobenTadeln($uidno,$nidno,$ptype,$score,$dauer,$nrall);
   $prfid = updateServer($uidno,$nidno,$ptype,$score,$dauer,$probs);
   if( isset($prfid) ){ // Let the reviews be also available IFF conditions for mail2 are met
      $buble = "<div id='reviewStandaloneButton' class='fa fa-comment'></div>\r\n";
      $mail2 = "<div id='mail2' class='fa fa-envelope' title='".$_SHAM."' prfid='".$prfid."'>\r\n</div>\r\n";
   }
   $myall = getPerformance($uidno,$nidno);    // Dispersion and Central Tendency
   $prior = getPriorResults($uidno,$nidno,$nname,$pikja,$slang); // The long list
}
// Email is 100% INSIDER but Browser markups has some INSIDER dependent content guts
$brstr = $mostr = "<div id='perfArea' class='papier'>\r\n" . $_DONE .
                     markupBlogHeader($nname,$ndesc,$nimag,$nhtml,$mixed,$noten,$marks) .
                     $prstr;
if( isset($uidno) ){
   $emgut = checkEmail($uidno); // Whether Email can/may be sent
   $sujet = getEmailSubject($exart,$nname,$mixed,$score,$elaps);
   $emstr = "<div class='exares'>\r\n" .
               markupBlogHeader($nname,$ndesc,$nimag,$nhtml,$mixed,$noten,$marks) .
               $prstr ."<br/>\r\n". $myall ."<br/>\r\n". $prior['one23'] .
            "</div>\r\n";
   $brstr.= "<div class='notionary-completed'>\r\n" .
               "<span id='ones' count1='" . $prior['count1'] . "'>[[" . implode(",",$prior['ones']) . "]]</span>\r\n" .
               "<span id='twos' count2='" . $prior['count2'] . "'>[[" . implode(",",$prior['twos']) . "]]</span>\r\n" .
               "<span id='tris' count3='" . $prior['count3'] . "'>[[" . implode(",",$prior['tris']) . "]]</span>\r\n" .
               $myall . $prior['allData'] .
            "</div>\r\n";
   if( $emgut ){ mailx($sujet,$emstr,$emgut); $esent=$_SENT . " $emgut <br/>"; }
   // Email Forwarding as well as Ratings / Reviews / Recommends should not be
   // made available on Mixes to avoid ambiguity
   if ( $ptype < 4 ){
      if ( $emgut ) $fward = $_FOWD ." $mail2 <br/>";
      $brstr .= "<div id='perfNotionSharing'>$esent $fward</div>\r\n<br/>\r\n" . // Close the perfNotionSharing DIV
                "<div id='perfTemporaHolder'></div>\r\n<br/>\r\n" .
                "<div id='perfNotionRating'>" . $_GOOD . " &nbsp;&nbsp;\r\n" .
                   "<span id='perfRatingsBar'>\r\n" .
                      "<span class='fa fa-star notionary-ratings' title='1'></span>\r\n" .
                      "<span class='fa fa-star notionary-ratings' title='2'></span>\r\n" .
                      "<span class='fa fa-star notionary-ratings' title='3'></span>\r\n" .
                      "<span class='fa fa-star notionary-ratings' title='4'></span>\r\n" .
                      "<span class='fa fa-star notionary-ratings' title='5'></span>\r\n" .
                   "</span><br/>\r\n" .
                "</div>\r\n" .
                "<div id='perfNotionReview'>" . $_FEED . $buble .
                "<div id='perfCommentBox'></div>" .
                "</div>\r\n" ;
   }
}
$brstr .=    "<div id='perfNotionSocial'>\r\n" .
                $_RECO . "<br/> $fbook $tweet " .
             "</div>\r\n" .
          "</div>\r\n" .  // Close the main brstr DIV open atop
          "<div id='perfPanela2'></div>\r\n";
$mostr .=    "<div id='perfNotionSocial'>" .
                $_RECO . "<br/> $fbook $tweet " .
             "</div>" .
          "</div>" .
          "<div id='perfPanela2'></div>";
if( isMobile() ) echo $mostr; else echo $brstr;
?>
