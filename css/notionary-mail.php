<?php
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
?>
body{ margin:0px; padding:0px; overflow-x:hidden; color:black; font-family:Futura, Calibri, sans-serif,monospace; font-size:22px;}
a { text-decoration:none; cursor:pointer; }
a:focus { outline:none; }
<?php echo farben(); ?>
<?php echo knopfe(); ?>
.notionary-goodgrade,.notionary-badgrade { position:absolute; left:300px; z-index:222; <?php fontana("italic","900","1","1"); ?>;
    <?php mozart("transform","rotate(350deg)translate(10px,70px)"); ?>; }
.notionary-goodgrade{ color:<?php echo $normGrun; ?> !important;}
.notionary-badgrade{ color:<?php echo $hardRojo; ?> !important;}

.copyrighter  { position:fixed; bottom:5px; right:10px; color:<?php echo $hardGrau; ?>; font-size:10px; }
#mailerLogo  { display:block; width:300px; height:80px; <?php fontana("normal","900","3","150%"); ?>; text-align:left; }
#msgdiv { margin-top:82px; min-height:<?php echo $PAD_WIDTH; ?>px; overflow:visible; }
#disclaimer { position:relative; left:0px; margin:50px 0px; font-family:Futura, Calibri, sans-serif,monospace; background:#eee;
   z-index:222; border-top:1px solid #000; color:#f00; font-size:9px;line-height:11px; }
#bottomFooter{ position:fixed; bottom:-1px; width:100%; z-index:9999; background:#f4f9fd;
   border-top:1px solid <?php echo $hardBlau; ?>; white-space:nowrap; <?php fontana("normal","500","1.2","180%"); ?>; }
#bottomFooter a { cursor:pointer; color:black; }
#footerLinks{ font-size:10px; }
