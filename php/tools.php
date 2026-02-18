<?php
require_once "global.php";
function getNoten($nname,$dtime,$exart,$score,$elaps){
   list($_DTIM, $_XART) = pglot( ["_DTIM","_XART"]);
   return("\r\n $_DTIM<span class='nnero'>$dtime</span>\r\n<br/>$_XART<span class='nnero'>$exart</span>\r\n<br/>");
}
function lobenTadeln($uidno,$nidno,$ptype,$score,$dauer,$nrall){ // Entweder Loben oder Tadeln
   list($_LOBE, $_ALFA, $_TADL, $_SCOR) = pglot(["_LOBE", "_ALFA", "_TADL", "_SCOR"]);
   $marks = ""; $nmall = nmall($uidno,$nidno);
   if( empty($nmall["mysc".$ptype]) || ( $score==$nmall["mysc".$ptype] && $dauer==$nmall["mybt".$ptype] ) ) // 1st or unch
      $marks = "<span class='notionary-goodgrade'>" . $_SCOR . $score . "%(" . sec2t($dauer) . ")" . "</span><br/><br/>\r\n";
   else if( $score >$nmall["mysc".$ptype]||($score==$nmall["mysc".$ptype] && $dauer<$nmall["mybt".$ptype])){ // Improv
      $marks = "<span class='notionary-goodgrade'>" . $_LOBE . $_SCOR . $score . "%(" . sec2t($dauer) . ")" . "</span><br/><br/>\r\n";
   } else // Deterioration
      $marks = "<span class='notionary-badgrade'>" . $_TADL . $_SCOR . $score . "%(" . sec2t($dauer) . ")" . "</span><br/><br/>\r\n";
   if($score >$nrall["scor".$ptype]||($score==$nrall["scor".$ptype] && $dauer<$nrall["time".$ptype])){ // Alpha
      $marks .= "<span class='notionary-goodgrade'>" . $_ALFA . "</span><br/>"; ercan($nidno); } // Handle ALPHA, cleaning cache as well
   return($marks);
}
function markupBlogHeader($nname,$ndesc,$nimag,$nhtml,$mixed,$noten,$marks){
   global $BLG_IMG_H, $BLG_IMG_W;
   $MYURL = param("myurl");
   $eggon = "";
   if( isset( $_SESSION['uname'] ) )
      $eggon = "<a id='eggon' href='$MYURL?n=" . $nname . "&l=1&u=" . $_SESSION['uname'] . "'>" .
                  "<img src='$MYURL?tun=ibyid&was=162' width=150 height=35 />" .
               "</a>\r\n";
   $IMAGE = param("image");
   $ndsty = "margin:10px 0px 15px 0px; font: normal normal 400 1em/1 Futura, Calibri, sans-serif,monospace !important;".
            "color:#000; max-width:480px !important;";
   $BLOG_TEXT   = "display:inline-block;margin:40px 0px 30px 10px;".
                  "font: normal normal 400 1em/1 Futura, Calibri, sans-serif,monospace;".
                  "vertical-align:top;max-width:400px!important;";
$BLOG=<<<END_OF_BLOG
<div style='display:inline-block'>
  <div style="display:inline-block; margin-top:35px;">
     <img style='border:1px solid black;' height="$BLG_IMG_H" width="$BLG_IMG_W" src="${IMAGE}${nimag}"/>
  </div>
  <div style="$BLOG_TEXT">
      <a class="bhony" href="$nhtml"> $nname </a> $mixed <br/>
      <div style="$ndsty"> $ndesc </div>
      $noten
      $marks
  </div>
</div>
<span id='perfPercentHolder'></span>
$eggon
END_OF_BLOG;
   return($BLOG);
}
function iazik(){
   if ( isset( $_SESSION['uname'] ) ) {
      $sprache = mysqli_fetch_array( sql("select ulang from aauser where user='$_SESSION[uname]'"));
      $_SESSION["slang"] =  $sprache['ulang']; $_SESSION["blang"] =  $sprache['ulang'];
      return;
   }
   $_SESSION["blang"]="en";
   if ( array_key_exists('HTTP_ACCEPT_LANGUAGE', $_SERVER) ) $alhed=explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
   if ( isset($alhed) ) $_SESSION["blang"]=substr($alhed[0],0,2);
   switch ( $_SESSION["blang"] ){
      case 'en':case 'de':case 'fr':case 'es':case 'it':case 'pt':case 'ru':case 'hu': $_SESSION["slang"]=$_SESSION["blang"]; break;
      default: $_SESSION["blang"]="en"; $_SESSION["slang"]="en"; break;
   }
}
function ercan($nidno){ foreach(glob("cache/_notionary_NINFO_" . $nidno . "_*_cache.php") as $fname) unlink($fname); }
function getGoodChoice($choicesString){ // Internal tool to pass back the useful choice
   $XOICES_SEPARATOR ="￭";
   if(strpos($choicesString,$XOICES_SEPARATOR)===false)
      return($choicesString); // Nothing to do
   // Here we have some work to do with the sent string
   $theGoodChoice=explode($XOICES_SEPARATOR,$choicesString);
   return($theGoodChoice[0]);
}
function nrall($nidno){ // asone() notion records 1-3 test types
   $q=sql("select * from
            (select p.ptype, p.userID, p.score, min(p.elapsed) as mine, p.dtime from
               (select ptype, userID, max( score ) as maxs from aaperfid
                       where notionID='$nidno'
                       group by userID, ptype
               ) as x
               inner join aaperfid as p on p.userID=x.userID
               and p.ptype=x.ptype
               and p.score=x.maxs
               where notionID='$nidno'
               group by  x.ptype, x.userID, x.maxs
               order by p.ptype, p.score desc, mine
            ) as y
            group by y.ptype"
      );
   while($r=mysqli_fetch_assoc($q)){ // you will get all type three results
      $champ=anone("$r[userID]");
      switch($r['ptype']){
         case '1': $scor1=$r['score']; $time1=$r['mine']; $epoc1=$r['dtime'];
                   $ch1id=$r['userID'];$chmp1=$champ; break;
         case '2': $scor2=$r['score']; $time2=$r['mine']; $epoc2=$r['dtime'];
                   $ch2id=$r['userID'];$chmp2=$champ; break;
         case '3': $scor3=$r['score']; $time3=$r['mine']; $epoc3=$r['dtime'];
                   $ch3id=$r['userID'];$chmp3=$champ; break;
         default: break;
      }
   }
                     // Quietly ignore undefined record numbers
   if(!isset($scor1)){ $scor1=''; $time1=''; $ch1id=''; $chmp1=''; $epoc1=''; }
   if(!isset($scor2)){ $scor2=''; $time2=''; $ch2id=''; $chmp2=''; $epoc2=''; }
   if(!isset($scor3)){ $scor3=''; $time3=''; $ch3id=''; $chmp3=''; $epoc3=''; }
   return( array(
      'scor1'=>$scor1,'time1'=>$time1,'ch1id'=>$ch1id,'chmp1'=>$chmp1,'epoc1'=>$epoc1,
      'scor2'=>$scor2,'time2'=>$time2,'ch2id'=>$ch2id,'chmp2'=>$chmp2,'epoc2'=>$epoc2,
      'scor3'=>$scor3,'time3'=>$time3,'ch3id'=>$ch3id,'chmp3'=>$chmp3,'epoc3'=>$epoc3
   ));
}
function nmall($uidno,$nidno){ // asone() personal records 1-3 test types
   $q=sql("select p.ptype, p.score, min(p.elapsed) as mine from
            (select ptype, max( score ) as maxs from aaperfid
                    where notionID='$nidno' and userID='$uidno'
                    group by userID, ptype
            ) as x
            inner join aaperfid as p on p.ptype=x.ptype
            and p.score=x.maxs
            where notionID='$nidno'
            and userID='$uidno'
            group by x.ptype, x.maxs
            order by p.ptype, p.score desc, mine"
      );
   while($r=mysqli_fetch_assoc($q))
      switch($r['ptype']){
         case '1': $mysc1=$r['score']; $mybt1=$r['mine']; break;
         case '2': $mysc2=$r['score']; $mybt2=$r['mine']; break;
         case '3': $mysc3=$r['score']; $mybt3=$r['mine']; break;
      }
                      // Quietly ignore undefined record numbers
   if(!isset($mysc1)){$mysc1=''; $mybt1='';}
   if(!isset($mysc2)){$mysc2=''; $mybt2='';}
   if(!isset($mysc3)){$mysc3=''; $mybt3='';}
   return( array(
      'mysc1'=>$mysc1,'mybt1'=>$mybt1,
      'mysc2'=>$mysc2,'mybt2'=>$mybt2,
      'mysc3'=>$mysc3,'mybt3'=>$mybt3
   ));
}
?>
