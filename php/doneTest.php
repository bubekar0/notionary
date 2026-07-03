<?php
$_CONFIG = require __DIR__ . '/../config.php';
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set($_CONFIG['TIMEZONE']);
require_once "cssphp.php";
require_once "utiles.php";
require_once "dbutil.php";
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
function par2s($probAR,$nname,$slang){ // Convert a Problems Array into a String
   $_ACHT = pglot(["_ACHT"])[0];
   $probStr = "\r\n";
   $felde  = " answer ";
   if( sizeof($probAR) )
      foreach($probAR as $praw){ // We are dealing with internationalized data
         $q=dbq("select $felde from `$nname` where question=?", array($praw));
         $r=db_fetch_assoc($q);
         if( !$r ) continue;
         $anser = getGoodChoice($r['answer']);
         $qoris = "<span class='nroso'>" . $praw . "</span>";  // Normal Notion
         $probStr .= "<div class='notionary-problem-row'>" .  $qoris . " : " .  $anser .  "</div>\r\n";
      }
   if ( !empty($probStr) ) $probStr = $_ACHT . $probStr;
   return($probStr);
}
function updateServer($uidno,$nidno,$ptype,$score,$dauer,$probs){
   // Save the Performance data into the Database for tests 1, 2, 3
   sql("insert into aaperfid (userID,notionID,ptype,dtime,score,elapsed)
        values('$uidno','$nidno','$ptype',CURRENT_TIMESTAMP,'$score','$dauer')");

   $r = db_fetch_assoc(
           sql( "select max(perfID) as id from aaperfid" ) );

   $prfid = $r['id'];

   foreach( $probs as $p ) { // Save each problem into the Database ( internationalized data )
      $aposOK = db_escape($p );
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
function getPriorResults($uidno,$nidno,$nname,$slang){
   global $XLATE_LEVEL;
   list($_BEFO, $_MINI, $_MAXI, $_AVER) = pglot(["_BEFO", "_MINI", "_MAXI", "_AVER"]);
   $results123 = "";
   // Now here we could potentially show a prior Summary Graph but for now just a list
   $q=sql("select * from aaperfid where userID='$uidno' and notionID='$nidno' order by dtime desc");
   if(db_num_rows($q)>0) // This user has tested this Notion before
      while($r=db_fetch_assoc($q)){
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
ercau(); ercas();  // This seems not to work in production -- redundant for now with notionary-perf.js
$jason = json_decode($_REQUEST['pdata'],true);
$nidno = $jason['nidno']; $ttype = $jason['ttype']; $right = $jason['right'];
$score = $jason['score']; $dauer = $jason['dauer']; $probs = $jason['probs'];
$elaps = sec2t( $dauer );
$XLATE_ALTXT = xlate("altxt",$slang); $XLATE_LEVEL = xlate("level",$slang);
$XLATE_PERFO = xlate("perfo",$slang); $_PERF = "[ notionary ] $XLATE_PERFO";
$PARAM_MYURL = param("myurl");
$exart = xlate($ttype,$slang); if( empty($exart) ) $exart = "Mixed";
$query = db_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
$nname = $query['notion']; $ndesc = $query['description']; $catno = $query['category'];
$nslan = $query['slang'];
$nsafe = rawurlencode($nname);
$nhtml = $PARAM_MYURL . "?tun=trial&amp;was=" . $nsafe;
list($_ETAL, $_DONE) = pglot(["_ETAL","_DONE"]);
$mixed = false; $brstr=$marks=$myall=$prior="";
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
$prstr = par2s($probs,$nname,$slang);  // Any exam problems nicely marked up as string
if ( isset($_SESSION['uname']) ) $uidno = uidno();
if ( $lobta && isset($uidno) ){ // Loben / Tadeln für Insiders Tests 1, 2, and 3
   $marks = lobenTadeln($uidno,$nidno,$ptype,$score,$dauer,$nrall);
   $prfid = updateServer($uidno,$nidno,$ptype,$score,$dauer,$probs);
   $myall = getPerformance($uidno,$nidno);    // Dispersion and Central Tendency
   $prior = getPriorResults($uidno,$nidno,$nname,$slang); // The long list
}
// Email is 100% INSIDER but Browser markups has some INSIDER dependent content guts
$brstr = $mostr = "<div id='perfArea' class='papier'>\r\n" . $_DONE .
                     markupBlogHeader($nname,$ndesc,$nhtml,$mixed,$noten,$marks) .
                     $prstr;
if( isset($uidno) ){
   if( is_array($prior) )
      $brstr.= "<div class='notionary-completed'>\r\n" .
               "<span id='ones' count1='" . $prior['count1'] . "'>[[" . implode(",",$prior['ones']) . "]]</span>\r\n" .
               "<span id='twos' count2='" . $prior['count2'] . "'>[[" . implode(",",$prior['twos']) . "]]</span>\r\n" .
               "<span id='tris' count3='" . $prior['count3'] . "'>[[" . implode(",",$prior['tris']) . "]]</span>\r\n" .
               $myall . $prior['allData'] .
            "</div>\r\n";
   else
      $brstr.= "<div class='notionary-completed'><span class='ngrun'>" . $XLATE_PERFO . "</span><br/><span class='notionary-perftrial'>✔" . $score . "%(" . $elaps . ")</span></div>\r\n";
}
$brstr .= "</div>\r\n" .  // Close the main perfArea DIV
          "<div id='perfPanela2'></div>\r\n";
$mostr .= "</div>" .
          "<div id='perfPanela2'></div>";
if( isMobile() ) echo $mostr; else echo $brstr;
?>
