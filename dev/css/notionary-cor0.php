<?php
   $animatecss = file_get_contents('../css/animate.min.css'); echo $animatecss;
   $fontawesom = file_get_contents('../css/font-awesome.min.css'); echo $fontawesom;
?>

@font-face { font-family:'notionary'; src:url('../fonts/notionary.eot?#iefix') format('embedded-opentype'),
   url('../fonts/notionary.woff') format('woff'), url('../fonts/notionary.ttf')  format('truetype'),
   url('../fonts/notionary.svg#notionary') format('svg'); font-weight: normal; font-style: normal; }
hisho { display:inline-block; margin:10px; color:<?php echo $normBlau; ?>; <?php fontana("normal","500","1.2","1"); ?>; }
nclues { display:block; margin:20px 0px; <?php echo $radWeis; ?>; }
.papier { <?php papel($softBlau,"#FFFFFF","20px","10%"); ?>; }
.papier boton { width:<?php echo $BTN_ICONS; ?>px; height:<?php echo $BTN_ICONS; ?>px;
   font-size:2.5em !important; line-height:.7em; margin:0px 10px; }
.stapel { <?php stapel(9,2,$hardWeis,$softGrau,$hardWeis); ?>; }
.quadro { <?php quads($softBlau,"#FFFFFF","20px","1%"); ?>; }




/* TOOLTIP POPUPS -- Require a list of toolitem divs with spanned image or icons. See Language Selection or Admin Tools */
.notionary-tooltips { position:absolute; width:95%; z-index:999; background:white; border:1px solid black;
                      text-align:center; <?php mozart("box-shadow","8px 8px 5px #777"); ?>; <?php myrad("5px"); ?>; }
.notionary-tooltips:before { position:absolute; top:-34px; right:120px; border-width:17px; border-style:solid; content: "";
                             border-color:transparent transparent black transparent; }
.notionary-tooltips:after  { position:absolute; top:-32px; right:120px; border-width:17px; border-style:solid; content: "";
                             border-color:transparent transparent white transparent; }
.notionary-toolitem { display:inline-block; width:45%; height:34px; margin:5px; border:1px solid black; cursor:pointer; }
.notionary-toolitem:hover  { background-color:orange; }
.notionary-toolitem span { float:left; font-size:30px; }



#signInModularDialog #uninp, #signInModularDialog #pwinp { <?php opaque("1"); ?> !important; }
#acceptAdvice { position:fixed; bottom:0px; left:0px;  padding:10px; font-size:20px; }
#acceptExiter { position:fixed; bottom:0px; right:0px; padding:10px; font-size:20px;
                cursor:pointer; border-top:2px solid white; border-left:2px solid white; }
#acceptExiter .fa-check { color:white !important; }


.notionary-cardhold,
.notionary-supernotion,
.notionary-plainnotion  { position:relative; display:inline-table;
                          width:92%; max-width:<?php echo $BLG_IMG_W; ?>px !important; height:250px;
                          margin:10px; cursor:pointer; text-align:center;
                          <?php fontana("normal","500","1","1"); ?>; <?php mozart("perspective","800px"); ?>; }
.notionary-supernotion { <?php echo $radWeis; ?>; }

   .notionary-supernotion,
   .notionary-plainnotion  { border:1px solid #999; <?php mozart("box-shadow","8px 8px 5px rgba(0,0,0,0.40)"); ?>; }

   .notionary-supernotion:hover { <?php echo $radTang; ?>; }
   .notionary-plainnotion:hover img { <?php opaque("1"); ?>; }

   .notionary-supername,
   .notionary-notioname { position:relative; top:10px; <?php fontana("normal","900","1.3","1"); ?>; z-index:888; }

   .notionary-superdesk { position:relative; top:50px; left:10%; width:85%; height:90px; line-height:1; }

   .notionary-checkbox  { position:absolute; top:5px; left:5px; width:20px; height:20px; z-index:999;
                          cursor:pointer; <?php mozart("transform","scale(1.5)"); ?>; }
   .notionary-thumbnail { position:absolute; top:0px; left:0px; width:100%; height:100%; <?php opaque("0.15"); ?>; }
   .notionary-howmany   { position:relative; font-size:0.8em; font-weight:900; top:40px; }
   .notionary-prozent   { position:relative; font-size:0.8em; font-weight:900; top:60px; }
   .notionary-topscore  { position:relative; font-size:0.8em; font-weight:900; top:70px; }
   .notionary-ratings   { position:relative; font-size:1.3em; font-weight:900; top:50px; color:orange; min-height:20px;  }


#pseudoDialog { background-color:<?php echo $softWeis; ?>;
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
         transparent 249px,<?php echo $softGrau; ?> 249px,<?php echo $softGrau; ?> 250px,transparent 251px);
}

 /* SERVER SIDE (NO MINIFY ) */
#mail2 { position:relative; top:10px; display:inline-block; font-size:2em;
    color:<?php echo $normBlau; ?>; <?php opaque(".5"); ?>; }
#mail2:hover { <?php opaque("1"); ?>; }

.notionary-perftrial  { display:block; margin-left:20%; color:<?php echo $hardBlau; ?>; font-size:1em; }
.notionary-perfwrite  { display:block; margin-left:20%; color:<?php echo $hardGrun; ?>; font-size:1em; }
.notionary-perfadept  { display:block; margin-left:20%; color:<?php echo $hardTang; ?>; font-size:1em; }
.notionary-problem-image { position:relative; top:10px; width:<?php echo $MOB_ICONS;?>px; height:<?php echo $MID_ICONS; ?>px; }
.notionary-nextstep { float:left; clear:left;  margin: 30px 0px; }
.notionary-completed { width:65%; padding:5px; overflow:hidden; }

.mudocu { float:left; clear:left; width:80%; min-height:1200px; <?php fontana("normal","400","1.2","1.2") ?>;
    margin-left:<?php echo $BAR_WIDTH; ?>px; margin-bottom:<?php echo $BAR_WIDTH; ?>px; }


/* SKELETON */
#anonHeadroom       { height:200px; overflow:hidden; border-bottom:1px solid #ddd; }
   #anonHeadtops    { height:75px; overflow:hidden; }
      #anonAnmelder { position:absolute; top:5px; right:5px; }
   #anonSuchenom    { position:relative; display:block; width:80%; height:35px; background:white;
                      margin:0 auto; border:2px solid #CDCDCD; <?php myrad("5px"); ?>; }
      #anonSucheleg { float:left; }
      #anonSucheinp { position:absolute; top:0px; display:block; width:97%; height:31px; border:none;
                      text-align:center; text-overflow:ellipsis; background:transparent;
                      <?php fontana("normal","500","1.3","1") ?>; font-size:20px; }
      #anonSucheajx { top:15px; right:50px; }
      #anonSuchbttn,
      #anonSuchbttn:hover { position:absolute; top:3px; right:-3px; border:none; <?php makeimg("105",30,30,"none"); ?>; }
#anonRealarea { position:relative; width:99%; margin:0 auto; text-align:center; }
  #privacyContents, #termsContents { text-align:left; }
  #anonFootings { bottom:0px; left:0px; width:100%; margin-top:500px; padding:20px 0px; }
  #anonFootings img { width:30px; height:22px; }
      #skfolg a { color:#00aeef !important; }
      #footerColumns { display:flex; width:80%; margin:0 auto; border-top:1px solid #ccc; }
      .footercolumn { width:33%; }
      .footerRegion { display:inline-block; width:<?php echo $BLG_HOEHE; ?>px; }
      .netbtn { float:left; height:21px; margin:3px 10px; }
      #blfolg, #igfolg { float:left; margin:10px; }
      #__okShare0 { width:120px; height:22px; }
  #anonFollower { position:static; width:100%; bottom:0px; font-size:3em; text-align:center; }
  #anonFollower span { color:black; width:23%; cursor:pointer; }

#mobiThumbler { position:fixed; bottom:0px; left:0px; width:100%; height:0px; <?php echo $radWeis; ?>; }
#priorEinsen,#priorZweien,#priorDreien { display:inline; width:30%; color:<?php echo $hardGrau; ?>; }
#guideContents { font-family:Calibri; }


/* LANDSCAPE */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
                #dummy { }
}
/* PORTRAIT  */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: portrait ) {
                #dummy { }
}
/* MOBILE    */ @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
                .mudocu { margin-left:0px; }
                .notionary-cardhold { max-width:unset; }
                #anonHeadroom { height:140px; }
                #anonSuchenom { width:96%; }
                #anonFootings { margin-bottom:50px; font-size:x-small; }
                #anonFollower span { width:20%; }
                #mobiThumbler { height:50px; }
                #acceptAdvice { padding:10px 80px 10px 10px; font-size:20px; }
}
