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
body{ margin:0px; padding:0px; overflow-x:hidden; overflow-y:visible; background:black;
      font-family:Futura, Calibri, sans-serif,monospace; }
a { text-decoration:none; } a:focus { outline:none; }
<?php echo farben(); ?>
<?php echo knopfe(); ?>
.copyrighter  { position:fixed; bottom:5px; right:10px; color:<?php echo $hardGrau; ?>; font-size:10px; }
#topRedLiner { position:absolute; top:0px; width:100%; height:59px;
    border-bottom:3px solid <?php echo $hardRojo; ?>; background:#fff; }
#websiteLogo { display:block; width:300px; height:60px; <?php fontana("normal","900","1.6","150%"); ?>; text-align:center; }
#msgdiv { margin-top:82px; min-height:500px; overflow:visible; }
#disclaimer { position:relative; left:0px; margin:50px 0px; font-family:Futura, Calibri, sans-serif,monospace; background:#eee;
   z-index:222; border-top:1px solid #000; color:#f00; font-size:9px;line-height:11px; }
#bottomFooter{ position:fixed; bottom:-1px; width:100%; z-index:9999; background:#f4f9fd;
   border-top:1px solid <?php echo $hardBlau; ?>; white-space:nowrap; <?php fontana("normal","500","1.2","180%"); ?>; }
#bottomFooter a { cursor:pointer; color:black; }
#footerLinks{ font-size:10px; }

/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              #websiteLogo { width:100%; }
}
/* PORTPAD */ @media( min-width:<?php echo $MOB_WIDTH;?>px ) and ( max-width:<?php echo $PAD_WIDTH;?>px ) {
              dummy {}
}
/* LANDPAD */ @media( max-height:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
              dummy {}
}
/* HOVERED */ @media ( hover:hover ) {
              dummy {}
}
