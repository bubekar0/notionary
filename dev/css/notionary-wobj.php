/* MARQUEE -- Notionary shows Correct answer on a marquee */
@keyframes marquee {
   0% { <?php mozart("transform","translateX(0%)"); ?>; }
  50% { <?php mozart("transform","translateX(-150%)"); ?>; }
}

/* TYPEWRITER -- https://css-tricks.com/snippets/css/typewriter-effect/ */
.typewriter h2 { position:relative; text-align:center; overflow:hidden; <?php fontana("normal","900","1","1"); ?>;
  width:80%; max-width:<?php echo $MOB_WIDTH;?>px; border-right:.15em solid black; letter-spacing:.05em;
  white-space:nowrap; margin:0 auto; animation: typing 5s steps(20,end), blink-caret .75s step-end infinite; }
@keyframes typing { from { width: 0 } to { width: 50% } }
@keyframes blink-caret { from, to { border-color: transparent } 50% { border-color:black; } }


/* The following are programmatically interchangeable via colorNode(), so must only use via addClass() */
.notionary-linWeis { <?php echo $linWeis; ?> } .notionary-radWeis { <?php echo $radWeis; ?> }
.notionary-linBlak { <?php echo $linBlak; ?> } .notionary-radBlak { <?php echo $radBlak; ?> }
.notionary-linGrau { <?php echo $linGrau; ?> } .notionary-radGrau { <?php echo $radGrau; ?> }
.notionary-linKaki { <?php echo $linKaki; ?> } .notionary-radKaki { <?php echo $radKaki; ?> }
.notionary-linGelb { <?php echo $linGelb; ?> } .notionary-radGelb { <?php echo $radGelb; ?> }
.notionary-linBlau { <?php echo $linBlau; ?> } .notionary-radBlau { <?php echo $radBlau; ?> }
.notionary-linGrun { <?php echo $linGrun; ?> } .notionary-radGrun { <?php echo $radGrun; ?> }
.notionary-linTang { <?php echo $linTang; ?> } .notionary-radTang { <?php echo $radTang; ?> }
.notionary-linRojo { <?php echo $linRojo; ?> } .notionary-radRojo { <?php echo $radRojo; ?> }


.notionary-tracking { display:none; }

.notionary-logo0815 { position:relative; top:0px; left:10px; height:45px;
                      display:inline-block; cursor:pointer; color:<?php echo $normBlau; ?>;
                      <?php fontana("normal","900","2","1.3") ?>; <?php txtsh123($softGrau);?>; }

                         /* DIALOGS */
.notionary-barsmgif { position:fixed; top:-1px; width:100%; height:5px;
                      background-image:url(<?php echo "${MY_HTTP}?tun=ibyid&was=108"; ?>) ;
                      background-size:100% 5px; background-repeat:no-repeat; z-index:9999; }

.notionary-modaller { height:100%; <?php echo $radWeis; ?>; }

.notionary-temporary { position:fixed; top:200px; left:20%; width:60%; z-index:888; margin:0 auto; background:white;
                       <?php fontana("normal","500","1","1"); ?>; <?php mozart("box-shadow","4px 8px 12px $normGrau,4px 8px 12px $hardGrau"); ?>;}

.notionary-modulator div,    .notionary-temporary div    { width:100%; display:inline-block; }
.notionary-modulator input,  .notionary-temporary input  { float:right; width:60%; }
.notionary-modulator select, .notionary-temporary select { float:right; <?php fontana("normal","900","1.7","1.7"); ?>; }
#pedalOverlay { position:fixed; bottom:0px; left:0px; width:100%; height:40px; z-index:999999;  <?php echo $radTang ?>;
                <?php fontana("normal","500","1.5","1"); ?>; 
                visibility: hidden; <?php opaque(".96"); ?>; }

#modalOverlay { position:fixed; top:0px; left:0px; width:100%; height:100%; z-index:888;
                background-color:#eee; visibility: hidden; <?php opaque(".96"); ?>; }
#transientDialog, #pseudoDialog { position:fixed; top:50%; left:50%; <?php mozart("transform","translate(-50%,-50%)"); ?>; z-index:999; }
#transientDialog { top:40%; <?php fontana("normal","900","15","1"); ?>; }
#pseudoDialog { padding:5px 5px 5px 5px; margin:0 auto; width:<?php echo $NAV_WIDTH; ?>px; max-width:96%; height:240px;
                text-align:center; white-space:normal; word-wrap:break-word;
                border:1px solid black; <?php mozart("box-shadow","4px 4px 2px $hardGrau") ?>; }
#pseudoDialog div { margin-top:50px; }
#pseudoDialog span { display:inline-block; }
#popupAcknoButton { position:relative; top:25px; font-size:30px; }

#wobjKeepsbtn { position:absolute; top:110px; right:100px; color:<?php echo $normBlau; ?>!important; }
#wobjDeletbtn { position:absolute; top:110px;  left:100px; background:red; color:black !important; }
#wobjKeepsbtn span { color:<?php echo $normBlau; ?>; }
#wobjDeletbtn span { color:black; }

.notionary-conceals { position:absolute; float:left; top:0px; left:10px; font-size:2em !important; }
.notionary-feedback { height:<?php echo $MOB_ICONS; ?>px; text-align:center; <?php fontana("normal","900","2","150%"); ?>; }
.notionary-exbutton { position:absolute; top:0px; right:5px; z-index:111; color:#666!important;
                      font-size:30px !important; <?php txtsh123($softGrau);?>; }
.notionary-basurero { position:absolute; top:0px; right:5px; z-index:111; color:#F00!important;
                      font-size:45px !important; <?php txtsh123($softGrau);?>; }
.notionary-labinput { position:relative; width:90%; height:60px; margin:10px auto; text-align:center;
                      border:2px solid <?php echo $normBlau; ?>; <?php myrad("5px") ?>; }
.notionary-yesornot { display:block; font-size:1.5em; padding:5px 0px 10px 0px; }
.notionary-ynbutton { display:inline-block;  margin:0px 15%; }


/* Notices */
.notionary-midtexto { position:relative; top:50%; transform:translateY(-50%); }
#notionaryNotiz { position:fixed; width:100%; height:165px; top:0px; left:0%; text-align:center;
                  <?php echo $radTang; ?>; <?php fontana("normal","900","1.5","1.5") ?>; z-index:9999; }
#notionaryNotiz .notionary-exbutton { color:black; }

.notionary-popmenue { font-size:.8em; }



.notionary-commhold { position:relative; width:60% !important; }
.notionary-commtext { width:98.9%; margin:0 auto; resize:vertical; <?php fontana("normal","300","0.8","1.2"); ?>; }
.notionary-commbtns { position:relative; top:-40px; }
.notionary-commzahl { float:right; margin: 0px 15px 10px 0px; color:<?php echo $hardRojo; ?>; }
.notionary-commsend { float:right; }



/* LANGUAGE SELECTOR */
/*
.notionary-langhold { width:<?php echo $BLG_HOEHE; ?>px; overflow:hidden; display:inline; }
.notionary-langpick { width:<?php echo $BLG_HOEHE - $MID_ICONS; ?>px; height:32px; outline:none; <?php fontana("normal","400","1","1"); ?>; }
.notionary-langimag { position:relative; width:<?php echo $ACC_HEDER; ?>px; height:30px; <?php myrad("0px 5px 5px 0px") ?>; }
*/


/* FOREIGN MENUS & KEYS */
.notionary-foreigns { width:<?php echo $MOB_ICONS ?>px; height:<?php echo $MOB_ICONS ?>px;
                      border:1px solid black; <?php myrad("50%"); ?>; <?php fontana("normal","900","1.5","1"); ?>; }

#foreignButtonHolder button span { padding:0px 2px; width:<?php echo $MIN_ICONS; ?>px; }

/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              .notionary-temporary { top:0px; left:0%; width:100%; background:white; }
              .notionary-modulator { <?php mozart("transform","unset !important"); ?>; <?php mozart("box-shadow","unset"); ?>;
                                     min-width:unset; top:0px; left:0px; width:100%; <?php mozart("transform","translate(10px,10px)"); ?>; }
              #transientDialog { top:40%; }
              #pedalOverlay { height:75px; }
}
/* PORTPAD */ @media( max-height:<?php echo $PAD_WIDTH;?>px ) and ( orientation: portrait ) {
              #transientDialog { <?php mozart("transform","translate(-50%,10%)"); ?>; }
}
/* LANDPAD */ @media( max-height:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
              #transientDialog { <?php mozart("transform","translate(-170%,-20%)"); ?>; }
}
