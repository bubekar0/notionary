<?php
$GLOBALS['MY_CFG'] = require __DIR__ . '/../config.php';
$GLOBALS['MY_SITE'] = 'notionary';
$MY_HTTP = $GLOBALS['MY_CFG']['APP_URL'];
$MY_HOME = $GLOBALS['MY_CFG']['APP_ROOT'];
$MY_SITE = $GLOBALS['MY_SITE'];
$MY_DBASE = $GLOBALS['MY_CFG']['DB_NAME'];

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
   $q = sql("select * from `aaparam` where kodex='image'
             or kodex='igram' or kodex='ychan' or kodex='myurl' or kodex='mynom' or kodex='blogr'");
   $params = []; while( $r = mysqli_fetch_assoc($q)) $params[strtoupper($r['kodex'])] = $r['value'];
   $NOTIM = $params['IMAGE'];
   $PVACY   = "{$params['MYURL']}?sntqo=".obfus()."&n=prvcy&cated=".obfus();
   $TERMS   = "{$params['MYURL']}?sntqo=".obfus()."&n=condi&cated=".obfus();
   $XLATE_PRVCY = xlate("prvcy",$_SESSION['slang']);
   $XLATE_TERMS = xlate("terms",$_SESSION['slang']);
   $XLATE_CRITE = xlate("crite",$_SESSION['slang']);
   $PRVCY_ANCHOR = "<a class='nroso' href='$PVACY'>$XLATE_PRVCY</a> &nbsp;&nbsp;&nbsp;";
   $TERMS_ANCHOR = "<a class='nroso' href='$TERMS'>$XLATE_TERMS</a>\r\n";
   $MYURL_ANCHOR = "<a style='text-decoration:none;' href='{$params['MYURL']}'/><img src='{$NOTIM}235'/> </a>\r\n";
   $YCHAN_ANCHOR = "<a style='text-decoration:none;' href='{$params['YCHAN']}'/><img src='{$NOTIM}123'/> </a>\r\n";
   $BLOGR_ANCHOR = "<a style='text-decoration:none;' href='{$params['BLOGR']}'/><img src='{$NOTIM}124'/> </a>\r\n";
   $IGRAM_ANCHOR = "<a style='text-decoration:none;' href='{$params['IGRAM']}'/><img src='{$NOTIM}126'/> </a>\r\n";
   $CRITE_ANCHOR = "<div class='copyrighter'> $XLATE_CRITE </div>\r\n";
$retString =<<<END_OF_MAILFOOTER
   <div id='bottomFooter'>
      <span id='footerLinks'> $PRVCY_ANCHOR $TERMS_ANCHOR </span>
      <span style='position:relative;top:5px;font-size:8px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         $MYURL_ANCHOR $YCHAN_ANCHOR $BLOGR_ANCHOR
         $IGRAM_ANCHOR &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $CRITE_ANCHOR
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
   $q = sql("select * from `aaparam` where kodex='image' or kodex='myurl' or kodex='mynom'");
   $params = []; while( $r = mysqli_fetch_assoc($q)) $params[strtoupper($r['kodex'])] = $r['value'];
   $MYDOM = $params['MYNOM'].".com";
   $LOGO_DIV = "<div id='topRedLiner'><span id='mailerLogo'>notionary</span></div>";
   $VERSION = date('YmdHis');
   $MAILCSS = "{$params['MYURL']}css/{$params['MYNOM']}-mail.php?version=$VERSION";
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
$discl = str_replace("MYSITENAME",ucfirst( $params['MYNOM'] ),$XLATE_DISCL);
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
   $params = []; while( $r = mysqli_fetch_assoc($q)) $params[strtoupper($r['kodex'])] = $r['value'];
   if ( isset ( $_REQUEST['was'] ) && $_REQUEST['tun'] != "suche" ) {
      // All ssmkp routines have notion name as "was" except 'suche'
      $nname = $_REQUEST['was'];
      $nncol = mysqli_real_escape_string(lsql(),$nname);
      $r = mysqli_fetch_assoc( sql("select notionID, notion from `aanotion` where notion='$nncol'"));
      if ( !$r ) { header('HTTP/1.1 500 Query String Error'); exit(); }
      $nidno = $r['notionID']; $ntabl=$r['notion']; $nname=$r['notion'];
      $query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
      $x_url = "{$params['MYURL']}?tun=trial&was=$nname";
      $x_des = $query['description'];
      $x_img = "{$params['MYURL']}?tun=ibyid&amp;was={$query['imageID']}&amp;version=$CBUST";
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
   $params = []; while( $r = mysqli_fetch_assoc($q)) $params[strtoupper($r['kodex'])] = $r['value'];
   $q = sql("select kodex, $langx from `aaglobe` where kodex='descr' or kodex='kwrds' or kodex='altxt'");
   while( $r = mysqli_fetch_assoc($q)) $params[strtoupper($r['kodex'])] = $r[$langx];
   if ( $GLOBALS['MY_SITE'] != "notionary" ) $params['ALTXT'] = "DEVELOPMENT";
   $IMAMP = "{$params['MYURL']}?tun=ibyid&amp;was=";
   $CBUST = date('dHi');
   $imgAR = array( "fbimg" => "140", "twimg" => "140", "gpimg" => "140", "logoi" => "140",
                   "mstit" => "224", "ms_70" => "250", "ms150" => "251", "ms310" => "253", "ma310" => "252",
                   "fluid" => "100", "at_57" => "226", "at_60" => "227", "at_72" => "222", "at_76" => "228",
                   "at114" => "229", "at120" => "230", "at144" => "224", "at152" => "231", "at180" => "232",
                   "touch" => "100", "start" => "140", "ic192" => "225", "ic_32" => "236", "ic_96" => "237", "ic_16" => "235");
   if( !empty( $seturl ) ) $params['MYURL'] = str_replace(' ', '%20', $seturl);
   if( !empty( $setttl ) ) $params['ALTXT'] = $setttl;
   if( !empty( $setdes ) ) $params['DESCR'] = $setdes;
   if(  empty( $setimg ) ) $setimg = "{$IMAMP}{$imgAR['fbimg']}&amp;version=$CBUST";
$METAS=<<<END_OF_METAS
<!DOCTYPE html>
<html lang='$langx' dir='ltr' xmlns='http://www.w3.org/1999/xhtml' itemscope itemtype='http://schema.org/Organization'>
<head>
   <title> {$params['ALTXT']} </title>
   <meta http-equiv="content-type"                    content="text/html; charset=UTF-8"/>
   <meta name="description"                           content="{$params['DESCR']}"/>
   <meta name="keywords"                              content="{$params['KWRDS']}"/>
   <meta property="og:title"                          content="{$params['ALTXT']}"/>
   <meta property="og:type"                           content="article"/>
   <meta property="og:image"                          content="$setimg"/>
   <meta property="og:url"                            content="{$params['MYURL']}"/>
   <meta property="og:description"                    content="{$params['DESCR']}"/>
   <meta property="og:site_name"                      content="{$params['MYNOM']}"/>
   <meta itemprop="name"                              content="{$params['ALTXT']}"/>
   <meta itemprop="description"                       content="{$params['DESCR']}"/>
   <meta itemprop="image"                             content="$setimg"/>
   <meta itemprop="sameAs"                            content="{$params['MYURL']}"/>
   <meta itemprop="logo"                              content="{$params['IMAGE']}{$imgAR['logoi']}"/>
   <meta name="application-name"                      content="{$params['MYNOM']}"/>
   <meta name="msapplication-tooltip"                 content="{$params['ALTXT']}"/>
   <meta name="msapplication-starturl"                content="{$params['MYURL']}"/>
   <meta name="msapplication-TileColor"               content="#4D90FE">
   <meta name="msapplication-TileImage"               content="{$params['IMAGE']}{$imgAR['mstit']}">
   <meta name="msapplication-task"                    content="name={$params['MYNOM']};action-uri={$params['MYURL']};icon-uri={$params['MYURL']}favicon.ico"/>
   <meta name="msapplication-square70x70logo"         content="{$params['IMAGE']}{$imgAR['ms_70']}"/>
   <meta name="msapplication-square150x150logo"       content="{$params['IMAGE']}{$imgAR['ms150']}"/>
   <meta name="msapplication-square310x310logo"       content="{$params['IMAGE']}{$imgAR['ms310']}"/>
   <meta name="msapplication-wide310x150logo"         content="{$params['IMAGE']}{$imgAR['ma310']}"/>
   <meta name="apple-mobile-web-app-capable"          content="yes"/>
   <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
   <meta name="format-detection"                      content="telephone=no"/>
   <meta name="viewport"                              content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, minimal-ui"/>
   <meta name="HandheldFriendly"                      content="true"/>
   <meta name="MobileOptimized"                       content="$NAV_WIDTH"/>
   <meta http-equiv="cleartype"                       content="on" />
   <link rel="canonical"                              href="{$params['MYURL']}"/>
   <link rel="fluid-icon"                             href="{$params['IMAGE']}{$imgAR['fluid']}"/>
   <link rel="apple-touch-icon"      sizes="57x57"    href="{$params['IMAGE']}{$imgAR['at_57']}"/>
   <link rel="apple-touch-icon"      sizes="60x60"    href="{$params['IMAGE']}{$imgAR['at_60']}"/>
   <link rel="apple-touch-icon"      sizes="72x72"    href="{$params['IMAGE']}{$imgAR['at_72']}"/>
   <link rel="apple-touch-icon"      sizes="76x76"    href="{$params['IMAGE']}{$imgAR['at_76']}"/>
   <link rel="apple-touch-icon"      sizes="114x114"  href="{$params['IMAGE']}{$imgAR['at114']}"/>
   <link rel="apple-touch-icon"      sizes="120x120"  href="{$params['IMAGE']}{$imgAR['at120']}"/>
   <link rel="apple-touch-icon"      sizes="144x144"  href="{$params['IMAGE']}{$imgAR['at144']}"/>
   <link rel="apple-touch-icon"      sizes="152x152"  href="{$params['IMAGE']}{$imgAR['at152']}"/>
   <link rel="apple-touch-icon"      sizes="180x180"  href="{$params['IMAGE']}{$imgAR['at180']}"/>
   <link rel="apple-touch-icon"                       href="{$params['IMAGE']}{$imgAR['touch']}"/>
   <link rel="apple-touch-startup-image"              href="{$params['IMAGE']}{$imgAR['start']}"/>
   <link rel="icon" type="image/png" sizes="192x192"  href="{$params['IMAGE']}{$imgAR['ic192']}"/>
   <link rel="icon" type="image/png" sizes="32x32"    href="{$params['IMAGE']}{$imgAR['ic_32']}"/>
   <link rel="icon" type="image/png" sizes="96x96"    href="{$params['IMAGE']}{$imgAR['ic_96']}"/>
   <link rel="icon" type="image/png" sizes="16x16"    href="{$params['IMAGE']}{$imgAR['ic_16']}"/>
END_OF_METAS;
   //<meta name="viewport"                              content="width=device-width, user-scalable=no, initial-scale=1.0"/>
   return($METAS);
}
function stags($inline){ // Critical Path Speed:(1)HTML Splash, (2)CSS: CCOR, (3) JS
   $nname=""; $level=""; $uname="";
   $MYURL= param("myurl");
   $SOUND= param("sound");
   $SNAP = "{$MYURL}js/snap.svg-min.js";
   $VERS = date('YmdHis');
   $JCOR = "{$MYURL}js/notionary-deve.js?version=$VERS";
   $CCOR = "{$MYURL}css/notionary-deve.php?version=$VERS";
   $FAVI = "data:image/vnd.microsoft.icon;base64,AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABkZ2X/UKO7/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKLa7v+Dxt3/AAAAOQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABpssn/odru/wlxtP8+fqb/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/wlxtP8Do/7/CXG0/z5+pv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJcbT/CXG0/wOj/v8JcbT/Pn6m/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlxtP8JcbT/A6P+/wlxtP8+fqb/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/wlxtP8Do/7/CXG0/z5+pv8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAJcbT/CXG0/wOj/v8idqv/Pn6m/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAlxtP8JcbT/A6P+/xHs7v+OdMr/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACXG0/xLv6/+pivH/qYrx/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACpivH/qYrx/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA//8AAP//AAD//wAA5/8AAPP/AADw/wAA8H8AAPg/AAD8HwAA/g8AAP8HAAD/gwAA/8MAAP/nAAD//wAA//8AAA==";
   if(isset($_REQUEST['n'])) $nname=$_REQUEST['n'];
   if(isset($_REQUEST['l'])) $level=$_REQUEST['l'];

if ( $inline == "rentr" )
$OBFU =<<<END_OF_RENTR
var r,y,t,o = document.getElementsByTagName("head")[0]; nname = "$nname"; level = "$level"; uname = "";
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
var r,y,t,o = document.getElementsByTagName("head")[0]; nname = "$nname"; level = "$level"; uname = "";
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
END_OF_ONLOAD;
   return($ONLOAD);
}

?>
