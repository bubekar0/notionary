<?php ob_start ("ob_gzhandler");
   $lastModified=filemtime(__FILE__);
   $etagFile = md5_file(__FILE__);
   $ifModifiedSince=(
      isset($_SERVER['HTTP_IF_MODIFIED_SINCE']) ? $_SERVER['HTTP_IF_MODIFIED_SINCE'] : false);
   $etagHeader=(isset($_SERVER['HTTP_IF_NONE_MATCH']) ? trim($_SERVER['HTTP_IF_NONE_MATCH']) : false);
   header("Content-type: text/css; charset=UTF-8");
   header("Last-Modified: ".gmdate("D, d M Y H:i:s", $lastModified)." GMT");
   header("Etag: $etagFile");
   header('Cache-Control: public');
   if ( @strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE'])==$lastModified ||
       $etagHeader == $etagFile) {
          header("HTTP/1.1 304 Not Modified");
          exit(); /*!hack*/
   }
   require_once "../php/cssphp.php";

   echo "/* <![CDATA[
   *! NOTIONARY vMY_VERSION_STRING_HERE
   * https://notionary.com
   * Under Contracted Private License With Restricted Use!
   * Copyright 2021 notionary.com, Cali - COLOMBIA */";
?>
.alert { <?php echo $radRojo; ?>; }
fieldset { display:inline-block; border:0px; padding:30px; }
figure { margin:0px; text-align:center; word-wrap:break-word; }
select { border:1px solid <?php echo $softGrau;?>; margin:3px; <?php myrad("10px"); ?>; outline:none !important; <?php echo $radWeis;?>; }
h1 { <?php fontana("normal","900","1.8","200%") ?>; }
h2 { clear:left; text-align:center; <?php fontana("normal","700","2","1.2") ?>; }
h3 { text-align:center; <?php fontana("normal","900","1.3","1") ?>; }
h4 { margin:15px; text-align:center; color:<?php echo $hardTang;?>; <?php fontana("normal","700","1.2","1.2") ?>; }
h7 { display:block;margin-top:450px; <?php fontana("normal","500","1.5","1.2") ?>; }
h7 ul { list-style-type:none; line-height:<?php echo $MID_ICONS; ?>px; }
h7 a { float:left; }
::selection { color:<?php echo $normRojo;?> !important; }
