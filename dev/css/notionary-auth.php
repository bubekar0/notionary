.notionary-centered { position:fixed; top:50%; left:50%; padding:0px !important; border:1px solid <?php echo $softGrau; ?>; <?php myrad("5px"); ?>;
                      <?php mozart("transform","translate(-50%,-50%)"); ?>; /*<?php fontana("normal","500","1","1"); ?>; */}
.notionary-mediocre { display:block; height:60px; margin-top:35px; text-align:center;
                      <?php fontana("normal","900","1","1"); ?>; font-size:35px; }

.notionary-hinweise { margin:20px 0px; text-align:center; color:black; <?php fontana("normal","100","1.2","1") ?>; }
.notionary-framedid { display:table; margin:20px auto; padding:5px; border:1px solid black;
                      text-align:center; <?php myrad("25px"); ?>; font-size:1.3em; }
.notionary-thelabel { width:30%; display:inline-block; text-align:right; }
.notionary-loadings { position:absolute; top:25px; right:5px; width:50px; height:16px; visibility:hidden;
                      background-image: url(<?php echo "${MY_HTTP}?tun=ibyid&was=153"; ?>) !important;
                      background-repeat: no-repeat; <?php opaque("0.5"); ?>; }


.notionary-fieldset { padding:0px; <?php myrad("5px") ?>; }
.notionary-contents { outline:none; }
.notionary-legendas { text-align:left; margin-left:30px; color:<?php echo $normBlau; ?>; }



/* GET RID OF BELOW TWO */
.notionary-dormant  { border:1px solid #555555; color: #555555; <?php opaque(".5"); ?>; }
.notionary-active   { border:1px solid <?php echo $hardTang; ?>!important; margin:1px 0px;outline:none;
                      color: <?php echo $hardTang; ?>; <?php opaque("1"); ?>; }

.notionary-enfocado { color:<?php echo $hardGrau; ?>; <?php opaque("1"); ?>; }
.notionary-exfocado { color:<?php echo $normGrau; ?>; <?php opaque("0.5"); ?>; }


.notionary-chekmark { position:absolute; display:none; top:20px; right:5px; width:25px; height:25px;
                      background-image: url(<?php echo "${MY_HTTP}?tun=ibyid&was=156"; ?>) !important;
                      background-size:24px 24px; background-repeat: no-repeat; }

.notionary-facebook,
.notionary-googling,
.notionary-tweeting { display:inline-table; margin:0px 10px; <?php myrad("50%"); ?> !important; }

.notionary-facebook { <?php makeimg("150",45,45,"none"); ?>; }
.notionary-googling { <?php makeimg("151",45,45,"none"); ?>; }
.notionary-tweeting { <?php makeimg("152",45,45,"none"); ?>; }

.notionary-facebook:hover,
.notionary-googling:hover,
.notionary-tweeting:hover { <?php mozart("box-shadow","2px 4px 6px $hardGrau,1px 2px 4px $hardGrau"); ?>; }

.notionary-facebook:active,
.notionary-googling:active,
.notionary-tweeting:active { <?php mozart("transform","translate(0,5px)"); ?>; }



#signInZentralLogo { cursor:pointer; }
#signInZentralHold,
#signUpZentralHold,
#elogerZentralHold { width:60%; max-width:450px; height:60%; min-height:500px; }

#signInZentralHold .notionary-thelabel,
#signUpZentralHold .notionary-thelabel,
#elogerZentralHold .notionary-thelabel { display:none; width:0px; }

#signInZentralHold .notionary-fieldset,
#signUpZentralHold .notionary-fieldset,
#elogerZentralHold .notionary-fieldset,
#signInZentralHold .notionary-contents,
#signUpZentralHold .notionary-contents,
#elogerZentralHold .notionary-contents { position:fixed; top:40%; left:5%; width:90%; height:60px; border:0;
                                         text-align:center; <?php fontana("normal","100","1.2","1"); ?>; background:transparent; }


#contiKnopf,
#siginKnopf,
#confoKnopf,
#sigupKnopf { position:fixed; top:60%; right:5%; color:<?php echo $normBlau; ?>; }
#signupLink,
#forgotPwrd,
#stickyArea { position:fixed; left:5%; cursor:pointer; font-size:1.3em; color:<?php echo $normBlau; ?>; }
   #signupLink, #forgotPwrd { top:65%; }
   #stickyArea { top:55%; }
#stickyChbx { float:left; width:15px; cursor:pointer; }
#netButtons { position:fixed; bottom:10%; left:15%; width:70%; text-align:center; }



#termsAgreeButton { display:block; margin:80px auto; <?php fontana("normal","900","2","150%"); ?>; }





/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              #signInZentralHold, #signUpZentralHold, #elogerZentralHold {
                 top:0%; left:0%; width:100%; height:100%; border:none;
                 <?php mozart("transform","translate(0%,0%)!important"); ?>;
              }
}
