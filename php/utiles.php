<?php
$GLOBALS['MY_SITE'] = 'notionary';
$MY_HTTP = 'http://notionary.test/'; $MY_HOME = '/httpdocs/';
//if ( $GLOBALS['MY_SITE'] != "notionary" ) { $MY_HTTP = 'https://uozon.com/notionary/'; $MY_HOME = '/home/uozon/notionary/'; }
if ( $GLOBALS['MY_SITE'] != "notionary" ) { $MY_HTTP = 'http://notionary.test/'; $MY_HOME = '/Users/hec/Documents/Code/Sites/notionary/'; }

$MY_SITE = $GLOBALS['MY_SITE'];
$MY_DBASE = 'notionary_db';

require_once "cssphp.php";
require_once "dbutil.php";

function rjekt(){ header("Location: php/error_404.php"); exit; }
function obfus(){ return(md5(uniqid(rand())).md5(uniqid(rand()))."-notionary.com-checksum=" .md5(uniqid(rand())) .md5(uniqid(rand()))); }
function slang($uidno){ $_SESSION['slang']=holen("ulang","aauser","userID","$uidno"); }
function debug(){
   $MY_ARRAYS  = array('_SERVER','_SESSION','_REQUEST','_POST','_GET','GLOBALS');
   foreach($MY_ARRAYS as $g){
      echo '<br/><br/>$'.$g."<br/>";
      eval("foreach($".$g.' as $x=>$y)
      echo $x.":[".$y."]<br/> ";');
   }
   ob_start(); phpinfo(); $pinfo = ob_get_contents(); ob_end_clean();
   $pinfo = preg_replace( '%^.*<body>(.*)</body>.*$%ms','$1',$pinfo);
   echo $pinfo;
}
function mfoot(){
   $NOTIM   = "http://notionary.test/?tun=ibyid&was=";
   $q = sql("select * from `aaparam` where kodex='image'
             or kodex='fpage' or kodex='tpage' or kodex='gpage' or kodex='igram'
             or kodex='ychan' or kodex='myurl' or kodex='mynom' or kodex='blogr'");
   while( $r = mysqli_fetch_assoc($q)) ${strtoupper($r['kodex'])} = $r['value'];
   $SKYPE   = "skype:${MYNOM}?call";
   $PVACY   = "$MYURL?sntqo=".obfus()."&n=prvcy&cated=".obfus();
   $TERMS   = "$MYURL?sntqo=".obfus()."&n=condi&cated=".obfus();
   $XLATE_PRVCY = xlate("prvcy",$_SESSION['slang']);
   $XLATE_TERMS = xlate("terms",$_SESSION['slang']);
   $XLATE_CRITE = xlate("crite",$_SESSION['slang']);
   $PRVCY_ANCHOR = "<a class='nroso' href='$PVACY'>$XLATE_PRVCY</a> &nbsp;&nbsp;&nbsp;";
   $TERMS_ANCHOR = "<a class='nroso' href='$TERMS'>$XLATE_TERMS</a>\r\n";
   $MYURL_ANCHOR = "<a style='text-decoration:none;' href='$MYURL'/><img src='${NOTIM}235'/> </a>\r\n";
   $FPAGE_ANCHOR = "<a style='text-decoration:none;' href='$FPAGE'/><img src='${NOTIM}120'/> </a>\r\n";
   $TPAGE_ANCHOR = "<a style='text-decoration:none;' href='$TPAGE'/><img src='${NOTIM}121'/> </a>\r\n";
   $GPAGE_ANCHOR = "<a style='text-decoration:none;' href='$GPAGE'/><img src='${NOTIM}122'/> </a>\r\n";
   $YCHAN_ANCHOR = "<a style='text-decoration:none;' href='$YCHAN'/><img src='${NOTIM}123'/> </a>\r\n";
   $BLOGR_ANCHOR = "<a style='text-decoration:none;' href='$BLOGR'/><img src='${NOTIM}124'/> </a>\r\n";
   $IGRAM_ANCHOR = "<a style='text-decoration:none;' href='$IGRAM'/><img src='${NOTIM}126'/> </a>\r\n";
   $SKYPE_ANCHOR = "<a style='text-decoration:none;' href='$SKYPE'/><img src='${NOTIM}127'/> </a>\r\n";
   $CRITE_ANCHOR = "<div class='copyrighter'> $XLATE_CRITE </div>\r\n";
$retString =<<<END_OF_MAILFOOTER
   <div id='bottomFooter'>
      <span id='footerLinks'> $PRVCY_ANCHOR $TERMS_ANCHOR </span>
      <span style='position:relative;top:5px;font-size:8px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         $MYURL_ANCHOR $FPAGE_ANCHOR $TPAGE_ANCHOR $GPAGE_ANCHOR $YCHAN_ANCHOR $BLOGR_ANCHOR
         $IGRAM_ANCHOR $SKYPE_ANCHOR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $CRITE_ANCHOR
      </span>
   </div>
END_OF_MAILFOOTER;
   return( $retString );
}
function mailx($smsub,$smmsg,$whoto){ global $hardRojo, $softBlau, $softGrau;
   global $MY_HOME;
   $XLATE_ALTXT = xlate("altxt",$_SESSION['slang']);
   $XLATE_DISCL = xlate("discl",$_SESSION['slang']);
   if ( $GLOBALS['MY_SITE'] != "notionary" ) $XLATE_ALTXT = "DEVELOPMENT";
   $MYURL = param("myurl"); $MYNOM = param("mynom"); $IMAGE = param("image");
   $q = sql("select * from `aaparam` where kodex='image' or kodex='myurl' or kodex='mynom'");
   while( $r = mysqli_fetch_assoc($q)) ${strtoupper($r['kodex'])} = $r['value'];
   $MYDOM = ${'MYNOM'}.".com";
   $LOGO_DIV = "<div id='topRedLiner'><span id='mailerLogo'>notionary</span></div>";
   $VERSION = substr(file_get_contents("${MY_HOME}tracker"),0,18);  // Set via min - sync cache bust
   $MAILCSS = "${MYURL}css/${MYNOM}-mail.php?version=$VERSION";
   $MYSTYLE = file_get_contents($MAILCSS);
   ob_start(); echo $MYSTYLE; $MYSTYLE = ob_get_contents(); ob_end_clean();
   $BUCKET  = "donotreply@$MYDOM";
$footer = mfoot();
$messg=<<<END_OF_EMAIL_MARKUP
<head> <style> $MYSTYLE </style> </head>
<body>
   $LOGO_DIV
   $footer
END_OF_EMAIL_MARKUP;
$discl = str_replace("MYSITENAME",ucfirst( $MYNOM ),$XLATE_DISCL);
$messg.="\r\n<div id='msgdiv'>" . $smmsg . "</div>" . $discl . "\r\n</body>";
   $headr ="MIME-Version: 1.0\r\n" .
           "Content-type: text/html; charset=utf-8\r\n" .
           "From: $MYDOM <$BUCKET> \r\n" .
           "Bcc: ".param("admin")." \r\n" .
           "Reply-to: $BUCKET \r\n";
   mail($whoto,$smsub,$messg,$headr);
}
function isMobile(){
   if(isset($_SERVER["HTTP_X_WAP_PROFILE"]))  return true;
   if(isset($_SERVER["HTTP_USER_AGENT"])){
      $user_agents = array("midp","j2me","avantg","docomo","novarra","palmos",
         "palmsource","240x320","opwv","chtml","pda","windows\ ce","mmp\/",
         "blackberry","mib\/","symbian","wireless","nokia","hand","mobi","phone",
         "cdm","up\.b","audio","SIE\-","SEC\-","samsung","HTC","mot\-","mitsu",
         "sagem","sony","alcatel","lg","erics","vx","NEC","philips","mmm",
         "xx","panasonic","sharp","wap","sch","rover","pocket","benq","java",
         "pt","pg","vox","amoi","bird","compal","kg","voda","sany","kdd","dbt",
         "sendo","sgh","gradi","jb","\d\d\di","moto","iphone","Adroid","webOS",
         "iPhone","iPod","BlackBerry","IEMobile","Opera Mini");
      foreach($user_agents as $user_string)
         if(preg_match("/".$user_string."/i",$_SERVER["HTTP_USER_AGENT"])) return true;
   }
   return false;
}
function mudoc(){ ccach("text/html", file_get_contents($_SESSION['slang']."/".$_REQUEST['was'].".txt") ); }
function apoqu($badst){ // UTF8 Preprocessor to prevent utf8-decode() hiccups ?
   // 0xe28099 Right Single Quotation mark
   $bad_stuff=array("e28099","c591","c590","c5b1","c5b0");
   $good_stuff=array("27","26233333373B","26233333363B","26233336393B","26233336383B");
   return(hex2bin(str_replace($bad_stuff,$good_stuff,bin2hex($badst))));
}
function scapo($badst){ // escape &apos + &quot but not doubling \\ so MySQL can query
   $badst=bin2hex($badst); $gutst="";  // bad and good strings
   $itwas=""; $nowis="";               // trackers: last + current hex pairs
   for($i=0;$i<strlen($badst)-1;$i=$i+2){ // avoid x2 7x catches by seeing pairs of digits
      $nowis=substr($badst,$i,2);
      // replace hex pattern 27(single quote) or 1f(apostrophe) with 5c27(\')
      if( $nowis=="27" || $nowis=="1f" ) {

         // avoid \\ if preprocessed by mysql_real_escape..
         if( $itwas=="5c" ) $gutst.=hex2bin("27"); else $gutst.=hex2bin("5c27");

      } else $gutst.=hex2bin($nowis);
      $itwas=$nowis; // keep track of the last processed hex pair
   }
   return($gutst);
}
function stpad($strng,$lenth){ // padd a string (right blanks) to a specific length
   $lenth=intval($lenth);
   if(strlen($strng)>=$lenth) return substr($strng,0,$lenth);
   $ssize=strlen($strng); // here we start with a string of shorter length than desired
   $blnks=$lenth-$ssize;  // number of blanks we have to append
   for($i=0;$i<$blnks;$i++) $strng.='&nbsp;';
   return $strng;
}
function nunft($x){ // clean string from potentially dangerous meta-characters
   $BADCHARS = array(chr(0x00),'“','”','"','\'','+','*','/','\\','=',
               '<','>','(',')','[',']','{','}','%','#','$','^','&','?','!');
   return trim(str_replace($BADCHARS,'',$x));
}
function sec2t($secst){ // convert a number of seconds into a readable amount of time
   $tmstr=""; $mints=intval($secst/60); $secns=$secst-$mints*60;
   if($mints) $tmstr=$mints."m";
   if($secns) $tmstr.=$secns."s";
   return($tmstr);
}
function setFont($cuerda){
   $count  = count(preg_split('/\s+/',$cuerda));
   $words  = explode(' ', $cuerda);
   $theLength = 0; $longestOne = '';
   foreach ($words as $word) {
      if (mb_strlen($word,"UTF-8") > $theLength) {
         $theLength = mb_strlen($word,"UTF-8");
         $longestOne = $word;
      }
   }
   // One word strings
   $corto1 =  11 - $theLength;
   $medio1 =   5 - 0.40 * ( $theLength -  6 );
   $largo1 =   3 - 0.20 * ( $theLength - 10 );
   // Two word strings
   $corto2 =   9 - $theLength;
   $medio2 =   4 - 0.25 * ( $theLength -  6 );
   $largo2 =   3 - 0.25 * ( $theLength - 10 );
   // Three word strings
   $corto3 = 8.5 - $theLength;
   $medio3 = 3.5 - 0.25 * ( $theLength -  6 );
   $largo3 =   3 - 0.25 * ( $theLength - 10 );
   $theSize = max(2,(4-0.08*mb_strlen($cuerda,"UTF-8")));
   switch( $count ){
      // One Word
      case 1: if(  $theLength < 6 )  $theSize = $corto1;
         else if ( $theLength < 11 ) $theSize = $medio1;
         else if ( $theLength < 21 ) $theSize = $largo1;
         else $theSize = $largo1; break;
      // Two Words
      case 2: if(  $theLength < 6 )  $theSize = $corto2;
         else if ( $theLength < 11 ) $theSize = $medio2;
         else if ( $theLength < 21 ) $theSize = $largo2;
         else $theSize = $largo2; break;
      // Three Words
      case 3: if(  $theLength < 6 )  $theSize = $corto3;
         else if ( $theLength < 11 ) $theSize = $medio3;
         else if ( $theLength < 21 ) $theSize = $largo3;
         else $theSize = $largo3; break;
   }
   $theFont = " theLength='".$theLength."' style='font:normal normal normal " . $theSize . "em/100% Futura, Calibri, sans-serif,monospace;'";
   return $theFont;
}
function tcach($type,$data){ // LEGACY: Time cache -> static resources
   $IFMOD_CACHE = "public, max-age=315360000, pre-check=315360000";
   // was used for sounds + images as MySQL index consumption guaranteed freshness.
   // Now updates are real: all GIS, FBrowsers, and Recording facility
   // On browser refresh (Agent sets Cache-Control: max-age=0)
   //  we do get HTTP Reqs (with response 304)
   // All other times the agents are going to get a 200 repsonse from their cache.
   // The Request has HTTP_IF_MODIFIED_SINCE with "Last-Modified" value header
   // of last server response
   // We declare our image+sound resources to be recent($ctime)
   // and forever fresh(max-age,IE pre-check,Expires)
   $ctime=gmdate("M d Y H:i:s", time());
   header("Last-Modified: ".$ctime." GMT"); // declare as recent and forever fresh
   header("Cache-Control: ".$IFMOD_CACHE,true);
   header("Expires: " . date(DATE_RFC822,strtotime("10 year")));
   header("Pragma: public");
   header("Content-type: $type");
   if(isset($_SERVER['HTTP_IF_MODIFIED_SINCE'])){ // browser has cached, send 304
     header('Last-Modified: '.$_SERVER['HTTP_IF_MODIFIED_SINCE'],true,304);
     exit;
   }
   echo $data;
}
function ccach($ctype,$cdata){
   /* Content cache - Two Approaches to caching :
   1) NEVER CACHE HTML AND CACHE ALL ELSE FOREVER
      If ever in trouble, bust cache via an HTML version string!!
   2) Use Browser Cache Instructors: Cache-Control + Expires for dynamic content.
      Cache all else indefinitely. Whenever a browser asks for content, the
      server MUST prepare it but not necessarily serve it.
      Cache Validators: Last-Modified + ETag are checked by the server vs the
      request headers (HTTP_IF_MODIFIED_SINCE and HTTP_IF_NONE_MATCH) respectively
      and depending on the comparison the server my serve(200) or not serve(304)
      This allows time+content caching but notice the server may still need to run
      loads of content preparation! Hence it would be smart to check the ETag first
      against a new ETag that is not so much content dependent, but rather depends
      on the parameters needed to prepare the content. This is faster to check
   */
   $maxAge = "max-age=630720000 "; // How about 20 years
   $public = "public ";
   $FOREVER = "Sun, 17-Jan-2038 19:14:07 GMT";
   $ANDEVER = $maxAge.", ".$public;
   $ctime=gmdate("M d Y H:i:s", time());
   header("Last-Modified: ".$ctime." GMT");
   header("ETag: '".md5($cdata)."'"); // declare x-info as immediately stale
   header("Expires: ".$FOREVER);
   header("Cache-Control: ".$ANDEVER);
   header("Content-Type: $ctype");
   header("Pragma: private");

   ob_start();
   if(isset($_SERVER['HTTP_IF_NONE_MATCH'])){
      if(str_replace("'","",
            stripslashes($_SERVER['HTTP_IF_NONE_MATCH'])) == md5($cdata)) {
         header('HTTP/1.1 304 Not Modified');
         exit();
      }
   }
   echo $cdata;
   ob_end_flush();
}
function xcach(){ foreach( glob("cache/_notionary_*INFO_*_cache.php" ) as $fname ) unlink( $fname ); }
function ercas(){ foreach( glob("cache/_notionary_SINFO_*_cache.php" ) as $fname ) unlink( $fname ); }
function ercal($lan2L){
   if ( file_exists( "cache/_notionary_LINFO_" . $lan2L . "_cache.php" ) )
      unlink( "cache/_notionary_LINFO_" . $lan2L . "_cache.php" );
}
function ercau(){
   if ( file_exists( "cache/_notionary_UINFO_" . uidno() . "_cache.php" ) )
      unlink( "cache/_notionary_UINFO_" . uidno() . "_cache.php" );
}
function ssmkp(){
   $x_url = $x_des = $x_img = ""; $CBUST = date('dHi');
   $q = sql("select * from `aaparam`");
   while( $r = mysqli_fetch_assoc($q)) ${strtoupper($r['kodex'])} = $r['value'];
   if ( isset ( $_REQUEST['was'] ) && $_REQUEST['tun'] != "suche" ) {
      // All ssmkp routines have notion name as "was" except 'suche'
      $nname = $_REQUEST['was'];
      $nncol = mysqli_real_escape_string(lsql(),$nname);
      $r = mysqli_fetch_assoc( sql("select notionID, notion from `aanotion` where notion='$nncol'"));
      if ( !$r ) { header('HTTP/1.1 500 Query String Error'); exit(); }
      $nidno = $r['notionID']; $ntabl=$r['notion']; $nname=$r['notion'];
      $query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
      $x_url = "${MYURL}?tun=trial&was=$nname";
      $x_des = $query['description'];
      $x_img = "${MYURL}?tun=ibyid&amp;was=$query[imageID]&amp;version=$CBUST";
   }
   $html =  mtags($_SESSION['slang'],$x_url,"",$x_des,$x_img)
          . "\r\n</head>\r\n<body></body>\r\n"
          . stags("rentr") . "\r\n </html>";
   echo $html;
}
function porta(){
   $html =  mtags($_SESSION['slang'],"","","","","","")
          . "\r\n</head>\r\n<body></body>\r\n"
          . stags(false) . "\r\n </html>";
   echo $html;
}
function mtags($langx,$seturl,$setttl,$setdes,$setimg){
   global $NAV_WIDTH;
   $q = sql("select * from `aaparam`");
   while( $r = mysqli_fetch_assoc($q)) ${strtoupper($r['kodex'])} = $r['value'];
   $q = sql("select kodex, $langx from `aaglobe` where kodex='descr' or kodex='kwrds' or kodex='altxt'");
   while( $r = mysqli_fetch_assoc($q)) ${strtoupper($r['kodex'])} = $r[$langx];
   if ( $GLOBALS['MY_SITE'] != "notionary" ) $ALTXT = "DEVELOPMENT";
   $IMAMP = "${MYURL}?tun=ibyid&amp;was=";
   $CBUST = date('dHi');
   $imgAR = array( "fbimg" => "140", "twimg" => "140", "gpimg" => "140", "logoi" => "140",
                   "mstit" => "224", "ms_70" => "250", "ms150" => "251", "ms310" => "253", "ma310" => "252",
                   "fluid" => "100", "at_57" => "226", "at_60" => "227", "at_72" => "222", "at_76" => "228",
                   "at114" => "229", "at120" => "230", "at144" => "224", "at152" => "231", "at180" => "232",
                   "touch" => "100", "start" => "140", "ic192" => "225", "ic_32" => "236", "ic_96" => "237", "ic_16" => "235");
   if( !empty( $seturl ) ) $MYURL = str_replace(' ', '%20', $seturl);
   if( !empty( $setttl ) ) $ALTXT = $setttl;
   if( !empty( $setdes ) ) $DESCR = $setdes;
   if(  empty( $setimg ) ) $setimg = "${IMAMP}$imgAR[fbimg]&amp;version=$CBUST";
$METAS=<<<END_OF_METAS
<!DOCTYPE html>
<html lang='$langx' dir='ltr' xmlns='http://www.w3.org/1999/xhtml' itemscope itemtype='http://schema.org/Organization'>
<head>
   <title> $ALTXT </title>
   <meta http-equiv="content-type"                    content="text/html; charset=UTF-8"/>
   <meta name="description"                           content="$DESCR"/>
   <meta name="keywords"                              content="$KWRDS"/>
   <meta property="og:title"                          content="$ALTXT"/>
   <meta property="og:type"                           content="article"/>
   <meta property="og:image"                          content="$setimg"/>
   <meta property="og:url"                            content="$MYURL"/>
   <meta property="og:description"                    content="$DESCR"/>
   <meta property="og:site_name"                      content="$MYNOM"/>
   <meta property="fb:app_id"                         content="130238993833214"/>
   <meta property="fb:admins"                         content="$FUSER"/>
   <meta name="twitter:card"                          content="summary"/>
   <meta name="twitter:url"                           content="$MYURL"/>
   <meta name="twitter:title"                         content="$ALTXT"/>
   <meta name="twitter:description"                   content="$DESCR"/>
   <meta name="twitter:image"                         content="$setimg"/>
   <meta name="twitter:site"                          content="@$MYNOM"/>
   <meta name="twitter:creator"                       content="@$MYNOM"/>
   <meta name="twitter:domain"                        content="$MYURL">
   <meta name="google-site-verification"              content="$GSITE"/>
   <meta itemprop="name"                              content="$ALTXT"/>
   <meta itemprop="description"                       content="$DESCR"/>
   <meta itemprop="image"                             content="$setimg"/>
   <meta itemprop="sameAs"                            content="$MYURL"/>
   <meta itemprop="logo"                              content="${IMAGE}$imgAR[logoi]"/>
   <meta name="msvalidate.01"                         content="$MSITE"/>
   <meta name="application-name"                      content="$MYNOM"/>
   <meta name="msapplication-tooltip"                 content="$ALTXT"/>
   <meta name="msapplication-starturl"                content="$MYURL"/>
   <meta name="msapplication-TileColor"               content="#4D90FE">
   <meta name="msapplication-TileImage"               content="${IMAGE}$imgAR[mstit]">
   <meta name="msapplication-task"                    content="name=$MYNOM;action-uri=$MYURL;icon-uri=${MYURL}favicon.ico"/>
   <meta name="msapplication-task"                    content="name=$MYNOM - Twitter;action-uri=$TPAGE;icon-uri=http://www.twitter.com/favicon.ico"/>
   <meta name="msapplication-task"                    content="name=$MYNOM - Facebook;action-uri=$FPAGE;icon-uri=http://www.facebook.com/favicon.ico"/>
   <meta name="msapplication-task"                    content="name=$MYNOM - Google Plus;action-uri=$GPAGE;icon-uri=http://google.com/favicon.ico"/>
   <meta name="msapplication-square70x70logo"         content="${IMAGE}$imgAR[ms_70]"/>
   <meta name="msapplication-square150x150logo"       content="${IMAGE}$imgAR[ms150]"/>
   <meta name="msapplication-square310x310logo"       content="${IMAGE}$imgAR[ms310]"/>
   <meta name="msapplication-wide310x150logo"         content="${IMAGE}$imgAR[ma310]"/>
   <meta name="apple-mobile-web-app-capable"          content="yes"/>
   <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
   <meta name="format-detection"                      content="telephone=no"/>
   <meta name="viewport"                              content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui"/>
   <meta name="HandheldFriendly"                      content="true"/>
   <meta name="MobileOptimized"                       content="$NAV_WIDTH"/>
   <meta http-equiv="cleartype"                       content="on" />
   <link rel="canonical"                              href="$MYURL"/>
   <link rel="fluid-icon"                             href="${IMAGE}$imgAR[fluid]"/>
   <link rel="apple-touch-icon"      sizes="57x57"    href="${IMAGE}$imgAR[at_57]"/>
   <link rel="apple-touch-icon"      sizes="60x60"    href="${IMAGE}$imgAR[at_60]"/>
   <link rel="apple-touch-icon"      sizes="72x72"    href="${IMAGE}$imgAR[at_72]"/>
   <link rel="apple-touch-icon"      sizes="76x76"    href="${IMAGE}$imgAR[at_76]"/>
   <link rel="apple-touch-icon"      sizes="114x114"  href="${IMAGE}$imgAR[at114]"/>
   <link rel="apple-touch-icon"      sizes="120x120"  href="${IMAGE}$imgAR[at120]"/>
   <link rel="apple-touch-icon"      sizes="144x144"  href="${IMAGE}$imgAR[at144]"/>
   <link rel="apple-touch-icon"      sizes="152x152"  href="${IMAGE}$imgAR[at152]"/>
   <link rel="apple-touch-icon"      sizes="180x180"  href="${IMAGE}$imgAR[at180]"/>
   <link rel="apple-touch-icon"                       href="${IMAGE}$imgAR[touch]"/>
   <link rel="apple-touch-startup-image"              href="${IMAGE}$imgAR[start]"/>
   <link rel="icon" type="image/png" sizes="192x192"  href="${IMAGE}$imgAR[ic192]"/>
   <link rel="icon" type="image/png" sizes="32x32"    href="${IMAGE}$imgAR[ic_32]"/>
   <link rel="icon" type="image/png" sizes="96x96"    href="${IMAGE}$imgAR[ic_96]"/>
   <link rel="icon" type="image/png" sizes="16x16"    href="${IMAGE}$imgAR[ic_16]"/>
END_OF_METAS;
   //<meta name="viewport"                              content="width=device-width, user-scalable=no, initial-scale=1.0"/>
   return($METAS);
}
function stags($inline){ // Critical Path Speed:(1)HTML Splash, (2)CSS: CCOR, (3) JS
   $nname=""; $level=""; $uname="";
   $MYURL= param("myurl");
   $FAPID= param("fapid");
   $GANAL= param("ganal");
   $SOUND= param("sound");
   $SNAP = "${MYURL}js/snap.svg-min.js";
   $PINT = "<script type='text/javascript' async defer data-pin-color='red' data-pin-hover='true' src='//assets.pinterest.com/js/pinit.js'></script>";
   $VERS = substr(file_get_contents("tracker"),0,18); // Set via min - sync cache bust
   $JCOR = "${MYURL}js/notionary-core-min.js?version=$VERS";
   $CCOR = "${MYURL}css/notionary-core-min.php?version=$VERS";
   if (  $MYURL == "http://notionary.test/" &&                // If we are in the development environment
   //if (  $MYURL == "https://uozon.com/notionary/" &&                // If we are in the development environment
         !empty( $_SESSION['uname'] ) &&                           // and logged in
         $_SESSION['uname'] == "hec@uozon.com" ) {       // as developer then we should see clear code
      $JCOR = str_replace("core-min","deve", $JCOR);
      $CCOR = str_replace("core-min","deve", $CCOR);
   }
   $GAPI = "<script type='text/javascript' async defer src='https://www.google.com/jsapi'></script>";
   $FAVI = "data:image/vnd.microsoft.icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABkZ2X/UKO7/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKLa7v+Dxt3/AAAAOQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABpssn/odru/wlxtP8+fqb/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/wlxtP8Do/7/CXG0/z5+pv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJcbT/CXG0/wOj/v8JcbT/Pn6m/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlxtP8JcbT/A6P+/wlxtP8+fqb/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/wlxtP8Do/7/CXG0/z5+pv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJcbT/CXG0/wOj/v8idqv/Pn6m/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlxtP8JcbT/A6P+/xHs7v+OdMr/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/xLv6/+pivH/qYrx/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACpivH/qYrx/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAP//AAD//wAA5/8AAPP/AADw/wAA8H8AAPg/AAD8HwAA/g8AAP8HAAD/gwAA/8MAAP/nAAD//wAA//8AAA==";
   if(isset($_REQUEST['t'])) $nname="terms";        if(isset($_REQUEST['n'])) $nname=$_REQUEST['n'];
   if(isset($_REQUEST['l'])) $level=$_REQUEST['l']; if(isset($_REQUEST['u'])) $uname=$_REQUEST['u'];

                                     /* Google Analytics */
$GOOGLE_ANALYTICS=<<<END_OF_GOOGLE_ANALYTICS
<script>
   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
   })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
   ga('create', '$GANAL', 'auto'); ga('send', 'pageview');
</script>
END_OF_GOOGLE_ANALYTICS;
                                     /* Facebook SDK */
$FACEBOOK_SDK=<<<END_OF_FACEBOOK_SDK
<script>
  window.fbAsyncInit=function(){FB.init({appId:$FAPID,xfbml:true,version:'v2.12'}); };
  (function(d,s,id){ var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;} js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js"; fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
END_OF_FACEBOOK_SDK;
                                     /* Twitter SDK */
$TWITTER_SDK=<<<END_OF_TWITTER_SDK
<script>!function(d,s,id){
     var js,fjs=d.getElementsByTagName(s)[0],
         p=/^http:/.test(d.location)?'http':'https';
     if(!d.getElementById(id)){
        js=d.createElement(s);
        js.id=id;
        js.src=p+'://platform.twitter.com/widgets.js';
        fjs.parentNode.insertBefore(js,fjs);
     }
  } (document,'script','twitter-wjs');
</script>
END_OF_TWITTER_SDK;

if ( $inline == "rentr" )
$OBFU =<<<END_OF_RENTR
var r,y,t,o = document.getElementsByTagName("head")[0]; nname = "$nname"; level = "$level"; uname = "$uname";
r = document.createElement('style'); r.textContent = '@import "' + '$CCOR' +'"';
y = document.createElement("link");  y.rel="shortcut icon"; y.href="$FAVI";
t = setInterval(function() { try { r.sheet.cssRules; clearInterval(t);
       if ( window.addEventListener ) window.addEventListener("load", getJS(), false);
       else if ( window.attachEvent ) window.attachEvent("onload", getJS());
       else window.onload = getJS();
       o.appendChild(y);
    } catch (e){} }, 10);
o.appendChild(r);
function w84js( cbk ){ if( window.nentr ) cbk(); else setTimeout(function() { w84js(cbk) }, 10); }
function getJS() {
   var main = document.createElement("script"); main.src = "$JCOR"; document.body.appendChild(main);
   w84js(function(){ var snap = document.createElement("script"); snap.src = "$SNAP";
      rentr();  document.body.appendChild(snap);
   });
}
END_OF_RENTR;

else $OBFU =<<<END_OF_OBFU
var r,y,t,o = document.getElementsByTagName("head")[0]; nname = "$nname"; level = "$level"; uname = "$uname";
r = document.createElement('style'); r.textContent = '@import "' + '$CCOR' +'"';
y = document.createElement("link");  y.rel="shortcut icon"; y.href="$FAVI";
t = setInterval(function() { try { r.sheet.cssRules; clearInterval(t);
       if ( window.addEventListener ) window.addEventListener("load", getJS(), false);
       else if ( window.attachEvent ) window.attachEvent("onload", getJS());
       else window.onload = getJS();
       o.appendChild(y);
    } catch (e){} }, 10);
o.appendChild(r);
function w84js( cbk ){ if( window.nentr ) cbk(); else setTimeout(function() { w84js(cbk) }, 10); }
function getJS() {
   var main = document.createElement("script"); main.src = "$JCOR"; document.body.appendChild(main);
   w84js(function(){ var snap = document.createElement("script"); snap.src = "$SNAP";
      nentr(); document.body.appendChild(snap);
   });
}
END_OF_OBFU;

$ONLOAD=<<<END_OF_ONLOAD
<script type="text/javascript"> $OBFU </script>
$GAPI
$GOOGLE_ANALYTICS
$FACEBOOK_SDK
$TWITTER_SDK
END_OF_ONLOAD;
   return($ONLOAD);
}

function flang($lange){ // return the facebook locale language code
   switch($lange){
      case 'de': $flang="de_DE"; break;
      case 'es': $flang="es_ES"; break;
      case 'fr': $flang="fr_FR"; break;
      case 'it': $flang="it_IT"; break;
      case 'pt': $flang="pt_PT"; break;
      case 'ru': $flang="ru_RU"; break;
      case 'hu': $flang="hu_HU"; break;
      case 'tr': $flang="tr_TR"; break;
      default:   $flang="en_US"; break;
   }
   return($flang);
}
function glang($lange){ // return the gplus locale language code
   switch($lange){
      case 'de': $glang="de"; break;
      case 'es': $glang="es"; break;
      case 'fr': $glang="fr"; break;
      case 'it': $glang="it"; break;
      case 'pt': $glang="pt"; break;
      case 'ru': $glang="ru"; break;
      case 'hu': $glang="hu"; break;
      case 'tr': $glang="tr"; break;
      default:   $glang="en-US"; break;
   }
   return($glang);
}
function fbfrm($clase,$local,$href,$action){
   // Fbook 'like' Standalone Notion after test via doneTest.php
$FBOOK_IFRAME=<<<END_OF_FBOOK_FRAME
   <iframe class='$clase'
           scrolling='no'
           frameborder='0'
           allowTransparency='true'
           style='border:none;width:120px;height:21px'
      src='https://www.facebook.com/widgets/like.php?locale=$local&href=$href&layout=button_count&share=true&width=120&height=21&action=$action&font=tahoma&colorscheme=light'>
      </iframe>
END_OF_FBOOK_FRAME;
   return($FBOOK_IFRAME);
}
function twfrm($clase,$local,$href,$texto){
   // Tweeter simple tweet for Standalone Notion HTML files and their footer for main page
   $encodedHref = urlencode($href);
$TWEET_IFRAME=<<<END_OF_TWEET_FRAME
   <iframe class='$clase'
           scrolling='no'
           frameborder='0'
           allowtransparency='true'
           style='width:115px;height:21px;'
      src='//platform.twitter.com/widgets/tweet_button.html?url=$href&text=$texto $encodedHref&lang=$local'>
   </iframe>
END_OF_TWEET_FRAME;
   return($TWEET_IFRAME);
}
function gpscr($local){ // generalized GPlus inline script for Social Button iframes
   return("<script type='text/javascript'>".
            "window.___gcfg={lang:'$local',};".
               "(function() {".
                  "var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;".
                  "po.src = 'https://apis.google.com/js/platform.js';".
                  "var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);".
            "})();".
          "</script>");
}
function gpfrm($clase,$gklas,$local,$href,$action){
   $gpscr=gpscr($local);
$GPLUS_IFRAME=<<<END_OF_GPLUS_FRAME
   <div class='$clase'>
      <div class='$gklas'
           data-size='medium'
           data-annotation='bubble'
           data-action='$action'
           data-href='$href'>
      </div> $gpscr
   </div>
END_OF_GPLUS_FRAME;
   return($GPLUS_IFRAME);
}

?>
