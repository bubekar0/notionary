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
<?php
   $animatecss = file_get_contents('../css/animate.min.css'); echo $animatecss;
   $fontawesom = file_get_contents('../css/font-awesome.min.css'); echo $fontawesom;
?>
                                      /* UOZON Fades pictures along a promotion */
@keyframes xfade{ 0%{ opacity:1; } 10%{ opacity:1; } 15%{ opacity:0; } 95%{ opacity:0; } 100%{ opacity:1; } }
                                      /* PROMOTION SLIDER -- 10 Images on a fade in/out Loop */
.cssSlideshow { position:relative; top:30px; min-height:400px; margin-bottom:20px; clear:both; }
.cssSlideshow figure{ position:absolute; width:100%; margin:0px; }
.cssSlideshow figure img { width:100%; height:400px; }
figure:nth-child(10) { animation: xfade 100s  1s infinite; } figure:nth-child( 9) { animation: xfade 100s 10s infinite; }
figure:nth-child( 8) { animation: xfade 100s 20s infinite; } figure:nth-child( 7) { animation: xfade 100s 30s infinite; }
figure:nth-child( 6) { animation: xfade 100s 40s infinite; } figure:nth-child( 5) { animation: xfade 100s 50s infinite; }
figure:nth-child( 4) { animation: xfade 100s 60s infinite; } figure:nth-child( 3) { animation: xfade 100s 70s infinite; }
figure:nth-child( 2) { animation: xfade 100s 80s infinite; } figure:nth-child( 1) { animation: xfade 100s 90s infinite; }

.uozon-modular-dialog { <?php echo $radWeis; ?>; }
.uozon-smalltext { display:inline-block; }
.uozon-smalltext img { width:90%; margin:0 auto; height:200px; }
.uozon-najax { position:absolute; top:30%; left:45%; <?php makeimg("1",$MIN_WIDTH,$MIN_WIDTH,"none"); ?>; <?php myrad("50%"); ?>; }

#modalCanvas { position:absolute; }
#yesOrNoDialog { <?php echo $radWeis; ?>; }

#textContainer { position:relative; top:100px; width:80%; max-width:950px; margin:0 auto;
    color:white; <?php fontana("normal","500","1.2","100%"); ?>; }
#uozonLogo { position:absolute; top:5px; left:5px; border-radius:50%; width:45px; height:45px; z-index:222; }
#signInModularDialog { background:black !important; text-shadow:none!important; }
#autoLogText { color:white !important; }
#signInModularDialog #uozonSignup { display:none; }
#signInModularDialog #fbookOauth2 { display:none; }
#signInModularDialog #gplusOauth2 { display:none; }
#signInModularDialog #tweetOauth2 { display:none; }


/* HORIZONTAL NAVIGATION BAR */
#menuBar { list-style:none; z-index:99; }
.uozon-menu-header { float:left; min-width:160px; z-index:111; cursor:pointer;
   <?php mozart("box-shadow","1px 2px 3px $hardWeis,0px 1px 2px $hardWeis");?>; }
.uozon-menu-header a { padding:4px; }
.uozon-menu-header .fa.fa-bars { color:white; margin:4px 0px 0px 20px; }
.uozon-menu-header a:hover { <?php echo $radTang; ?>; }
             /*=== Contetns ===*/
.uozon-menu-contents { position:absolute; min-width:300px; z-index:999; margin-left:0px;
   background:black; list-style: none; padding: 0px; }
.uozon-menu-contents a { display:block; height:18px; line-height:1; padding:7px 3px; text-decoration:none; }
.uozon-menu-contents li a:hover { <?php echo $radTang; ?>; }

#mainArea { background:black; padding:50px; }

.fa-facebook { color:#3b5998; } .fa-twitter { color:#1da1f2; } .fa-google, .fa-google-plus { color:#dc4e41; } 
.fa-youtube { color:#e62117; } .fa-skype { color:#00aff0; } .fa-linkedin { color:#0177b5; } 
.fa-instagram { color:#dbcbb8; } .fa-windows { color:#0072c6; } 
#bottomText { display:inline-block; float:left; clear:both; background:black; padding:50px; }

#fuss {  position:fixed; bottom:-1px; left:0px; width:100%; z-index:333;
  <?php echo $radTang; ?>; border-top:1px solid <?php echo $hardBlau; ?>;
  white-space:nowrap; <?php fontana("italic","500","1.2","180%"); ?>; <?php txtsh123($softGrau); ?>; }
#fuss a { color:black !important; }
.crite  { position:fixed; bottom:5px; right:10px; font-size:10px; }

#pseudoDialog { background-image:url("http://uozon.com/?tun=ibyid&was=1") !important;
   background-repeat:no-repeat; background-size:45px 45px; background-position:10px 10px;
   background-color:white; padding:35px 5px 5px 45px; }

/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              .uozon-smalltext { font-size:.75em; }
              #textContainer { width:98%; margin:-10 auto; }
              .cssSlideshow { top:0px; min-height:150px; }
              .cssSlideshow figure img { height:200px; }
              #menuBar { margin-left:-30px; }
              .uozon-menu-header { float:none; }
              .uozon-menu-contents { width:90%; }
              #uozonLogo { bottom:50px; }
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
#pikContactSelect { position:absolute; height:100%; <?php fontana("normal","900","1","150%"); ?>;  }
#addContactButton { font-size:2em; padding:10px 0px 5px 10px; }
#ncinp { width:100%; }

                       /* CONTACT DETAILS */
#editContactButton { float:right; }
#removeContactButton { float:right; }
#albumHolder { float:left; width:150px; height:150px; border:1px solid <?php echo $normGrau; ?>; <?php myrad("5%"); ?>; 
   background-size:100px 100px; background-repeat:no-repeat; cursor:pointer; }
#albumHolder:hover { <?php mozart("box-shadow","0px 3px 3px 0px #000,0px 1px 1px #FFF,0px 4px 0px 0px #000"); ?>;
    <?php mozart("transform","translate(0,5px)"); ?>; }
.uozon-contact-label{ font-weight:bold; padding:0px 2px; color:<?php echo $normTang; ?>; }
#ncinp { border:none; }

                          /* CONTACT EDITOR */
#editContactModularDialog{ width:90%; <?php fontana("normal","900","1","150%"); ?>; }
.contactLabel{ width:25% !important; display:inline-block; text-align:right; color:#FF0000; }
.contactText { width:70%!important; <?php fontana("normal","900","1","150%"); ?>!important; float:none !important; }



/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              #editContactModularDialog{ width:100%; }
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
.fa-flask, .fa-bug { color:#4D90FE; }
.fa-trash, .fa-database, .fa-picture-o, .fa-user { color:red !important; }
#adminToolMenu { position:absolute; width:220px; top:10px; left:10px; font-size:2em; color:white; z-index:9999; }
