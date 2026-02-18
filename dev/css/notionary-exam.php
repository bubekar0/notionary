.notionary-flipcard { position:absolute; width:100%; height:100%; cursor:pointer; <?php mozart("transform-style","preserve-3d"); ?>; }
.notionary-cardface,
.notionary-cardback { display:table; position:absolute; width:100%; height:100%; margin:0px; word-break:normal; word-wrap:normal;
                      border:1px solid #999; <?php mozart("backface-visibility","hidden"); ?>;
                      <?php mozart("transition","all 500ms ease-in-out"); ?>; <?php mozart("text-shadow","1px 1px black !important"); ?>;
                      <?php mozart("box-shadow","8px 8px 5px rgba(0,0,0,0.40)"); ?>; }
.notionary-cardface { color:red; background-color:white; <?php mozart("transform","rotateY(0deg)"); ?>;
                      background-image:linear-gradient(to bottom,transparent 0px,
                            transparent  49px,<?php echo $softRojo; ?>  49px,<?php echo $softRojo; ?>  50px,transparent  51px,
                            transparent  69px,<?php echo $softGrau; ?>  69px,<?php echo $softGrau; ?>  70px,transparent  71px,
                            transparent  89px,<?php echo $softGrau; ?>  89px,<?php echo $softGrau; ?>  90px,transparent  91px,
                            transparent 109px,<?php echo $softGrau; ?> 109px,<?php echo $softGrau; ?> 110px,transparent 111px,
                            transparent 129px,<?php echo $softGrau; ?> 129px,<?php echo $softGrau; ?> 130px,transparent 131px,
                            transparent 149px,<?php echo $softGrau; ?> 149px,<?php echo $softGrau; ?> 150px,transparent 151px,
                            transparent 169px,<?php echo $softGrau; ?> 169px,<?php echo $softGrau; ?> 170px,transparent 171px,
                            transparent 189px,<?php echo $softGrau; ?> 189px,<?php echo $softGrau; ?> 190px,transparent 191px,
                            transparent 209px,<?php echo $softGrau; ?> 209px,<?php echo $softGrau; ?> 210px,transparent 211px,
                            transparent 229px,<?php echo $softGrau; ?> 229px,<?php echo $softGrau; ?> 230px,transparent 231px,
                            transparent 249px,<?php echo $softGrau; ?> 249px,<?php echo $softGrau; ?> 250px,transparent 251px);}
.notionary-cardback { color:green; background-color:white; <?php mozart("transform","rotateY(180deg)"); ?>;
                      background-image:linear-gradient(to bottom,transparent 0px,
                            transparent  49px,<?php echo $hardGrun; ?>  49px,<?php echo $hardGrun; ?>  50px,transparent  51px,
                            transparent  69px,<?php echo $softGrau; ?>  69px,<?php echo $softGrau; ?>  70px,transparent  71px,
                            transparent  89px,<?php echo $softGrau; ?>  89px,<?php echo $softGrau; ?>  90px,transparent  91px,
                            transparent 109px,<?php echo $softGrau; ?> 109px,<?php echo $softGrau; ?> 110px,transparent 111px,
                            transparent 129px,<?php echo $softGrau; ?> 129px,<?php echo $softGrau; ?> 130px,transparent 131px,
                            transparent 149px,<?php echo $softGrau; ?> 149px,<?php echo $softGrau; ?> 150px,transparent 151px,
                            transparent 169px,<?php echo $softGrau; ?> 169px,<?php echo $softGrau; ?> 170px,transparent 171px,
                            transparent 189px,<?php echo $softGrau; ?> 189px,<?php echo $softGrau; ?> 190px,transparent 191px,
                            transparent 209px,<?php echo $softGrau; ?> 209px,<?php echo $softGrau; ?> 210px,transparent 211px,
                            transparent 229px,<?php echo $softGrau; ?> 229px,<?php echo $softGrau; ?> 230px,transparent 231px,
                            transparent 249px,<?php echo $softGrau; ?> 249px,<?php echo $softGrau; ?> 250px,transparent 251px);}
.notionary-cardzahl { position:absolute; top:0px; left:0px; padding:3px; z-index:333;
                      font-size:12px; line-height:100%; background:white; text-shadow:none; }
.notionary-thumbtak { position:absolute; top: 0px; right:5px; font-size:45px; z-index:333; cursor:pointer; }
.notionary-cardtext { display:table-cell; vertical-align:middle; white-space:normal; }
.notionary-picimage { position:absolute; top:-1px; left:-1px; width:317px; height:210px; /* Kludge w x h from figure border 2px extra */ }
.notionary-examwahl { min-width:80px; min-height:50px; margin:3px !important; }

#examControls { position:fixed; top:0px; width:100vw; height:165px; border-bottom:1px solid #ddd;
                background:white; text-align:center; z-index:999; }
#examTitulare { display:block; color:<?php echo $normBlau; ?>;  <?php txtsh123($softGrau);?>;
                <?php fontana("normal","900","2","1"); ?>; margin:15px 0px; }
#examExitante { position:absolute; top:5px; right:15px; font-size:30px; color:#666; }
#examFeedback { position:absolute; left:15%; width:70%; height:35px; text-align:left; <?php echo $radWeis;?>;
                display:block; overflow:hidden; <?php fontana("normal","900","1","1.5"); ?>; font-size:25px; }
#examFeedback markee { position:absolute; margin:0; white-space:nowrap; animation:marquee 5s linear 1; }
#examBarOuter { position:absolute; top:135px; left:15%; width:70%; height:30px; <?php mozart("box-shadow","1px 2px 3px $hardGrau"); ?>; }
#examBadBarIn { position:absolute; left:0px;  height:100%; <?php echo $radRojo; ?>; }
#examBadCount { position:relative; left:10px;  <?php fontana("normal","600","1","1.5"); ?>; font-size:25px; text-align:left; }
#examGutBarIn { position:absolute; right:0px; height:100%; <?php echo $radGrun; ?>; }
#examGutCount { position:relative; right:10px; <?php fontana("normal","600","1","1.5"); ?>; font-size:25px; text-align:right; }
#examLifehold { position:absolute; top:128px; left:15%; width:70%; height:5px; <?php myrad("10px"); ?>; }
#examLifeleft { position:relative; right:0px; height:100%; /*<?php echo $radGrun; ?>;*/ }
#examLrnBarIn { position:absolute; left:0px;  height:100%; <?php echo $radTang; ?>; }
#examLrnCount { position:relative; left:10px;  <?php fontana("normal","600","1","1.5"); ?>; font-size:25px; text-align:left; }
#examContents { text-align:center; max-width:100%; margin-top:185px; overflow:hidden; }
#examPantalla { width:70%; margin:0 auto; z-index:50; }
#examImagenes { width:100%; height:50vh; border:1px solid <?php echo $normGrau; ?>; }
#examPregunta { position:relative; /*left:5vw; width:90vw; height:20vh; display:table-cell;*/ vertical-align:middle;
                color:<?php echo $hardRojo; ?>; margin:5px 0px 5px 0px; <?php txtsh123($softGrau);?>; }
#examWritings { position:relative; width:70%; margin:0 auto; }
#examLevenpct { position:absolute; top:30px; left:20px; color:<?php echo $hardGrun; ?>; }
#examRisposta { width:100%; max-height:50px; outline:none; z-index:100; margin-top:4px;
                <?php mozart("box-shadow","1px 2px 3px $hardGrau"); ?>; text-align:center;
                border:1px solid <?php echo $normGrau; ?>; <?php fontana("normal","900","3","100%"); ?>; }
#examKeysicon { display:none; float:left; margin:20px; font-size:3em; cursor:pointer; }
#examKeyboard { margin:10px auto 10px; border:1px solid #CCCCCC; <?php echo $radWeis; ?>; <?php myrad("10px"); ?>; z-index:199; }
#examMultiple { width:70vw; margin:0 auto; text-align:center; }

/* LANDSCAPE */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
                #examTitulare { font-size:2.0em; line-height:1.5; }
                #examBarOuter, #examFeedback, #examLifehold { width:80%; left:10%; }
                #examLifehold { top:145px; }
                #examMultiple { width:80vw; }
}
/* PORTRAIT  */ @media all and ( orientation: portrait ) {
                #examTitulare { font-size:2em; line-height:1.5; }
                #examBarOuter, #examFeedback, #examLifehold { width:80%; left:10%; }
                #examLifehold { top:155px; }
                #examPantalla, #examWritings, #examMultiple { width:80%; }
                #examImagenes { width:100%; }
}
/* SMARTFON  */ @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
                #examControls { height:140px; }
                #examContents { margin-top:145px; }
                #examTitulare { font-size:1.5em; line-height:1; }
                #examBarOuter, #examFeedback, #examLifehold { width:98%; left:1%; }
                #examLifehold { top:135px; }
                #examPantalla, #examWritings, #examMultiple { width:98%; }
                #examImagenes { width:100%; height:30vh; }
}
