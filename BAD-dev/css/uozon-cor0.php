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
