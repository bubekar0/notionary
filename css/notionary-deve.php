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
/* SUPERNOTIONS */


.notionary-idempotent { margin:5px; }





#mix1b, #mix2b { float:left; margin:0px 15px; padding:8px; }
.notpad { display:inline-block;
   width:<?php echo $NTN_WIDTH;?>px; height:<?php echo $NTN_WIDTH/$PHI_KONST;?>px;
   margin:25px; cursor:pointer; border:1px solid <?php echo $softGrau; ?>;
   background-image:linear-gradient(to bottom,white 0px,
         white  49px,<?php echo $softRojo; ?>  49px,<?php echo $softRojo; ?>  50px,white  51px,
         white  69px,<?php echo $softGrau; ?>  69px,<?php echo $softGrau; ?>  70px,white  71px,
         white  89px,<?php echo $softGrau; ?>  89px,<?php echo $softGrau; ?>  90px,white  91px,
         white 109px,<?php echo $softGrau; ?> 109px,<?php echo $softGrau; ?> 110px,white 111px,
         white 129px,<?php echo $softGrau; ?> 129px,<?php echo $softGrau; ?> 130px,white 131px,
         white 149px,<?php echo $softGrau; ?> 149px,<?php echo $softGrau; ?> 150px,white 151px,
         white 169px,<?php echo $softGrau; ?> 169px,<?php echo $softGrau; ?> 170px,white 171px,
         white 189px,<?php echo $softGrau; ?> 189px,<?php echo $softGrau; ?> 190px,white 191px,
         white 209px,<?php echo $softGrau; ?> 209px,<?php echo $softGrau; ?> 210px,white 211px,
         white 229px,<?php echo $softGrau; ?> 229px,<?php echo $softGrau; ?> 230px,white 231px,
         white 249px,<?php echo $softGrau; ?> 249px,<?php echo $softGrau; ?> 250px,white 251px);
    <?php stapel(9,2,$hardWeis,$softGrau,$hardGrau); ?>; }
.notpad:hover { <?php mozart("transform","scale(1.1) translate(0,10px)") ?>; z-index:999; }
.notpad span { display:block; margin-top:12px; color:<?php echo $hardGrau; ?>; text-align:center; }
.notpad img { position:relative; top:16px; width:100%; height:77%; }

#displayMixedCounter { <?php fontana("normal","900","3","1"); ?>; <?php txtsh123($softGrau);?>; }

/* TOOLTIP STYLING */
.notionary-ninfo-popup { width:<?php echo $NTN_WIDTH-65;?>px; min-height:<?php echo $BAR_WIDTH ?>px;
    position:absolute; display:none; z-index:100; border:2px solid <?php echo $normGrau; ?>;
    <?php mozart("box-shadow","8px 8px 5px rgba(0,0,0,0.40)"); ?>;
    border-top:2px dashed <?php echo $softGrau; ?>;  <?php myrad("0px 0px 5px 5px"); ?>; }
.notionary-ninfo-popup:after { visibility:hidden; }
.notionary-creavatar img { width:<?php echo $ACC_HEDER; ?>px; height:<?php echo $MID_ICONS ?>px;
    border:2px solid black; <?php myrad("50%"); ?>; }
.notionary-groupie   { <?php fontana("normal","300","0.8","0.8"); ?>; margin:8px 0px 8px 5px; }
.notionary-myscores  { <?php fontana("normal","500","0.6","1.3"); ?>; margin:8px 0px 8px 5px; }
.notionary-call2act  { <?php fontana("normal","300","0.8","60%"); ?>; color:<?php echo $normBlau; ?>; }



.notionary-likeable { position:relative; top:20px; left:30px; width:<?php echo $MIN_WIDTH;?>px; height:21px; }

/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              .notionary-supernotion, .notionary-plainnotion { max-width:unset; }
}
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
/* PERFORMANCE marked up by server doneTest.php */
.frecom { width:230px !important; height:21px; }
.trecom { height:21px; }
.trecom body div .btn-o { min-width:60px;}
.grecom { width:230px !important;height:21px;display:inline; }
.grecom div, .grecom div iframe { width:230px !important; }

.notionary-problem-row { margin:5px; }
.notionary-blog-image { width:<?php echo $BLG_WIDTH; ?>px; height:<?php echo $BLG_HOEHE; ?>px; }
.notionary-campeon img { <?php myrad("10px"); ?>; }

.notionary-opaque { cursor:none; <?php opaque(".2"); ?>; }

#perfArea { position:relative; width:50%; min-width:700px; margin:0 auto;
    border:1px solid <?php echo $hardGrau; ?>; padding:20px;
    <?php fontana("normal","300","1","1"); ?>; <?php mozart("box-shadow","4px 4px 2px $hardGrau") ?>;  }
#perfArea h4 { margin-top:-15px; }
#perfPanela2{ width:90%; min-width:<?php echo $SIG_WIDTH; ?>px; }
#prfid { position:absolute; top:0px; left:0px; width:100%; <?php echo $radTang; ?>; }
#eggon { display:none; }
#ones, #twos, #tris { display:none; }
#perfPanela2 { margin-left:<?php echo $BIG_ICONS; ?>px; }
#perfTemporaHolder { position:relative; max-width:<?php echo $SIG_WIDTH; ?>px; <?php echo $radWeis; ?>; }
#perfNotionSharing { color: <?php echo $normBlau; ?>; }
#cacha { margin:2px 16px; }
#shareByMailPopup { min-height:0 !important; height:auto; }
#shnom { width:100%; <?php echo $radWeis; ?>; }
#shinp { height:<?php echo $MID_ICONS; ?>px; <?php fontana("normal","900","1.5","1");?>; }
#shajx { max-width:0px !important; }
#perfRatingsBar { float:left; margin:5px 10px 0px 50px; <?php opaque(".5"); ?>; }
#perfRatingsBar span { color:<?php echo $normBlau; ?>; }
#perfRatingsBar:hover { <?php opaque("1"); ?>; }
#reviewStandaloneButton { display:inline-block; position:relative; top:5px; font-size:2em;
    color:<?php echo $normBlau; ?>; <?php opaque(".5"); ?>; }
#perfReviewCommentHolder { top:10px; }
#reviewStandaloneButton:hover { <?php opaque("1"); ?>; }
#perfReviewCommentSubmit { font-size:2em; }

#flotgraph .flot-x-axis { visibility:hidden; }


/* MOBILE */  @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
              .ggrade,.bgrade { left:0px; <?php mozart("transform","rotate(350deg)translate(40px,-220px)"); ?>; }
              #perfArea { width:95%; min-width:95%; padding:20px 2px; }
              #perfPanela2{ margin-left:10px; width:99%; min-width:96%; }
              #perfTemporaHolder {width:99%}
}
/* PORTPAD */ @media( min-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: portrait ) {
              #perfArea { padding:20px; }
              #perfArea h4 { margin-top:-15px; }
              #perfPanela2{ min-width:<?php echo $SIG_WIDTH; ?>px; margin-left:10px; }
}
/* LANDPAD */ @media( min-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
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
   echo "/* <![CDATA[
   *! notionary - vMY_VERSION_STRING_HERE
   * https://notionary.com
   * Copyright 2021 notionary.com, Dresden - DEUTSCHLAND */";
?>



#profileZentralLogo { cursor:pointer; }
#profileZentralHold { width:80%; max-width:550px; /*height:fit-content; */ }
#profileZentralHold .notionary-thelabel { display:none; width:0px; }

#profileZentralHold .notionary-fieldset { position:relative; left:5%; width:90%; height:75px; margin:2px auto;
                                          border:2px solid #4D90FE; text-align:center; background:transparent;
                                          <?php fontana("normal","100","1","1"); ?>; }
#profileZentralHold .notionary-contents { position:absolute; top:6px; left:0px; width:100%; height:35px; border:0;
                                          /*  outline:2px solid red; */
                                          text-align:center; background:transparent;
                                          <?php fontana("normal","100","1.3","1"); ?>; }

#saverKnopf { display:block; margin:10px auto; color:<?php echo $normBlau; ?>; }


.notionary-englisch { <?php makeimg("50",45,34,"none"); ?>; } .notionary-tedeschi { <?php makeimg("52",45,34,"none"); ?>; }
.notionary-spanisch { <?php makeimg("51",45,34,"none"); ?>; } .notionary-francais { <?php makeimg("53",45,34,"none"); ?>; }
.notionary-italiano { <?php makeimg("54",45,34,"none"); ?>; } .notionary-portuges { <?php makeimg("55",45,34,"none"); ?>; }
.notionary-russians { <?php makeimg("56",45,34,"none"); ?>; } .notionary-magyarul { <?php makeimg("63",45,34,"none"); ?>; }

#profLangflag { position:absolute; top:50px; right:120px; width:50px; height:35px; cursor:pointer; border:1px solid black; }
#profLangflag:hover { <?php mozart("box-shadow","0px 3px 3px 0px #000"); ?>; }
#profLangmenu { top:105px; right:10px; display:none; }


/* STATISTICS */
/* Nice trick to get the triangle with border is to instance two triangles slightly offset
   but with different colors: One with bubble color on top of one with bubble border color */
.notionary-counters { position:relative; top:2px; float:left; display:inline; margin:0px 15px 2px 4px;
                      padding:4px; border:1px solid black; font:small-caption; text-shadow:none; background:white; }
.notionary-counters:before { position:absolute;top:6px;left:-10px; border-width:5px;border-style:solid;
                             content: ""; border-color:transparent black transparent  transparent;  }
.notionary-counters:after  { position:absolute;top:6px;left:-8px; border-width:5px;border-style:solid; content: "";
                             border-color:transparent white transparent  transparent;  }
.notionary-trophies { display:inline-block; height:30px; margin:5px; }
.notionary-trophies span { float:left; font-size:40px; <?php txtsh123($softGrau);?>; }


#userSettings { position:absolute; left:30%; min-width:50px; font-size:65px; text-align:center; cursor:pointer; }
#userEscritor { position:absolute; left:50%; min-width:50px; font-size:65px; text-align:center; cursor:pointer; }
#userTrophies { text-align:center; }
#userActivity { display:inline-block; font-size:.4em; color:green; }
#userExmelder { position:absolute; top:5px; right:30px; color:red !important; }
#userExmelder .fa-sign-out { color:red !important; }


#userClikdata .fa-shield { color:<?php echo $normBlau; ?>; }
#userWritdata .fa-trophy { color:<?php echo $normGrun; ?>; }
#userMastdata .fa-star   { color:<?php echo $normTang; ?>; }
#userProblems .fa-thumbs-o-down { color:<?php echo $normRojo; ?>; }

#userClikdata:hover,
#userWritdata:hover,
#userMastdata:hover { background:transparent !important; background-color:transparent !important;}



#avatarHolder { position:relative; width:45px; height:45px; margin:0 auto; cursor:pointer;
                <?php myrad("50%"); ?>; background-size:45px 45px; background-repeat:no-repeat; }
#avatarHolder:hover { <?php mozart("box-shadow","0px 3px 3px 0px #000"); ?>; }



/* LANDSCAPE */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
                #profileZentralHold .notionary-contents { top:-10px; height:30px; width:95%; }
                #userLerndata { left:30%; }
}
/* PORTRAIT  */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: portrait ) {
                #profileZentralHold .notionary-contents { top:-10px; height:30px; width:95%; }
                #userLerndata { left:28%; }
}
/* MOBILE    */ @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
                #userExmelder { right:10px; }
                #profileZentralHold { width:100%; height:100%; }
                #profileZentralHold .notionary-contents { top:-10px; height:30px; width:93%; }
                #userSettings,
                #userLernclik { width:33%; }
                #userLerndata { top:unset; left:unset; bottom:70px; right:2%; width:95%; font-size:.8em; }
                #userLerndata.notionary-tooltips:before { top:141px; right:48%;
                                border-color:black transparent transparent transparent; }
                #userLerndata.notionary-tooltips:after  { top:140px; right:48%;
                                 border-color:white transparent transparent transparent; }
                #userEscritor { display:none; }
}


                   /* SOUNDS */
.fa-soundcloud { padding:8px 14px 8px 2px; }
.notionary-qandarow { height:<?php echo $BIG_ICONS;?>px; }
.notionary-readonly { background:transparent; <?php fontana("normal","600","1.8","1"); ?>; }


.notionary-recsload { <?php makeimg("149",$MOB_ICONS,$MOB_ICONS,"left"); ?>; position:relative; top:10px; }
.notionary-recsdone { <?php makeimg("167",$MOB_ICONS,$MOB_ICONS,"left"); ?>; }
.notionary-recshoch { float:left; display:contents; width:280px; <?php opaque(".4"); ?>; }
.notionary-recshoch:hover { <?php opaque("1"); ?>; }
.notionary-recshoch boton.fa-microphone { padding:9px 4px 9px 15px; color:<?php echo $hardRojo; ?>; }

#recordedIndex { visibility:hidden; width:0px; height:0px; }


                    /* UPLOADS */
.notionary-hidden { position:absolute; top:4px; left:4px; height:35px; width:180px !important;
   <?php opaque("0"); ?>; font-size:1em!important; cursor:pointer; }

.notionary-phpUpload { position:absolute; top:10px; right:55px; z-index:99; width:auto !important; }

#soundHochZentralHold,
#imageHochZentralHold,
#uploadPDFZentralHold { width:60%; height:40%; min-width:350px; min-height:450px;
                        background-size:100% 100%; background-repeat:no-repeat; }
#hochDeletbtn { position:absolute; top:10px; right:300px; color:<?php echo $hardRojo; ?>!important; }
#hochDeletbtn span { color:<?php echo $hardRojo; ?>; }
.notionary-image-saved { width:<?php echo $BIG_ICONS;?>px; height:<?php echo $BIG_ICONS;?>px; <?php myrad("10px"); ?>; }
.notionary-passbild  { display:inline;float:left; cursor:pointer; <?php opaque(".6"); ?>;
    <?php myrad("10px"); ?>; width:<?php echo $BIG_ICONS;?>px; height:<?php echo $BIG_ICONS;?>px; padding:1px; }
.notionary-passbild:hover  { <?php opaque("1"); ?>; }
.notionary-qaRow { width:100%; display:inline-block; }
.notionary-cardback .fa-ellipsis-h { font-size:5em; }
.notionary-qaInput { height:<?php echo $MOB_ICONS;?>px; border:none; padding:0px;
    border-bottom:1px solid #91d1d3; outline:none; <?php fontana("normal","600","1.5","1.5"); ?>; }
.notionary-textarea { position:absolute; top:100px; left:3px; height:100px;
    width:96%; overflow:hidden; outline:white; resize:none; <?php opaque("0.5"); ?>;
    border:1px solid <?php echo $normBlau; ?>; text-align:center;
    <?php fontana("normal","900","2","1"); ?>; <?php mozart("text-shadow","1px 1px black !important"); ?>; }

.notionary-caption { color: <?php echo $hardTang; ?>; <?php fontana("normal","400","0.7","200%"); ?>; }
.notionary-label { display:inline-block; min-width:12%; }

.notionary-pictimag { position:absolute; top:0px; left:0px; z-index:-1; width:100%; height:100%; <?php opaque("0"); ?>; }
.notionary-camarita.fa-camera { position:absolute; top:3px; left: 80px; font-size:3em; }
.notionary-speakers.fa-play   { position:absolute; top:3px; left:180px; font-size:3em; }


/* NOTION EDITOR */
#editControls { position:fixed; top:0px; width:100%; height:165px; padding:5px 0px 0px 5px; border:1px solid #ddd;
                background:white; <?php fontana("normal","900","1.2","100%"); ?>; z-index:888; }
   #editControls input { <?php fontana("normal","600","1","1"); ?>; }
   #editExitante { position:absolute; right:15px; font-size:30px; color:#666; z-index:999; }
   #editHauptImg { position:absolute; right:280px; width:80px; height:50px; <?php myrad("5%"); ?>; cursor:pointer; }
   #editNnameDiv, #editNdescDiv { width:calc( 100% - 280px ); }
      #editNnameTit, #editNdescTit { width:145px; display:inline-block; }
      #editNnameTxt, #editNdescTxt { width:calc( 100% - 250px); }
      #editNdescLen { font-size:8px; color:<?php echo $softRojo; ?>; }
   #editMetadata { }
      #editKatseDiv, #editSperqDiv { display:inline-block; margin-right:20px; }
      #editPieceDiv, #editPictoDiv { min-width:85%; display:inline-block; }
      #editDokumCbx, #editVideoCbx, #editPieceCbx, #editPictoCbx { font-size:30px !important; cursor:pointer; }
         #editAmendPDF { margin:0px; padding:1px 7px 2px; font-size:12px; }
      #editDokumGui, #editVideoGui, #editPieceGui, #editPictoGui { margin-left:15px; }
      #editPictoGui { font-size:smaller; }


#editCatsmenu { <?php fontana("normal","700","0.8","1"); ?>; }

            #targeterLanguageContainer { float:right; height:32px; margin:0px; }
            #targeterLanguageSelect { <?php fontana("normal","400","0.9","1"); ?>; }
            #editMapsZooms { display:inline;margin:0px 20px; }
            #editMapsOverride { width:95%; margin:5px; text-align:center; border:3px solid <?php echo $hardGrau; ?>; }

            #editYTubeURL { width:320px; text-align:center; font-size:10px !important; }
         #pikja { width:12px; height:12px; margin:0px 0px 0px 20px; }
         #editMapsArea img { width:100%; }

         #editLangflag { position:absolute; top:60px; right:480px; width:50px; height:35px; cursor:pointer; border:1px solid black; }
         #editLangflag:hover { <?php mozart("box-shadow","0px 3px 3px 0px #000"); ?>; }
         #editLangmenu { top:130px; right:200px; width:500px; display:none; <?php fontana("normal","900","1.2","2"); ?>; }
         #editLangmenu.notionary-tooltips:before { right:290px; }
         #editLangmenu.notionary-tooltips:after  { right:290px; }

      #editExtrarow { position:absolute; top:60px; right:250px; }
      #editSubmiter { position:absolute; top:60px; right:80px; }
      #editDeletion { position:absolute; top: 5px; right:80px; background:red; color:black !important; }
      #editDeletion span { color:black; }

      #editChoosing { position:absolute; top:0px; width:100%; height:170px; margin:0 auto; z-index:9999;
                      text-align:center; <?php echo $radWeis; ?>; <?php fontana("normal","500","1.2","1"); ?>; }
      #editQAandGallery { max-height:<?php echo $PAD_WIDTH; ?>px; }

#editContents { text-align:center; max-width:100%; margin-top:190px; overflow:hidden; }
#editContents .notionary-exbutton { font-size:35px !important; }

      .notionary-pregunta { color:<?php echo $hardRojo; ?>; }
      .notionary-risposta   { color:<?php echo $hardGrun; ?>; }
      #editContents .conti { box-shadow:none; }
   #editFBContainer { position:relative;top:12px; display:inline-block; }
/* REPASO Section*/
.notionary-repaso-div { float:left; font-size:.6em; width:90%; max-width:<?php echo $BLG_IMG_W;?>px;
    min-height:<?php echo $NTN_WIDTH; ?>px; margin:5px 5px 5px 0px; padding:10px;
    <?php mozart("box-shadow","8px 8px 5px rgba(0,0,0,0.40)") ?>; border:1px solid <?php echo $hardBlau; ?>; }
.notionary-repaso-image { width:240px; height:150px; margin:10px; border:1px solid <?php echo $hardBlau; ?>; }
.notionary-repaso-question { margin-top:10px; color:<?php echo $hardRojo; ?>; 
    font:normal normal normal 3.5em/100% Impact, Roboto, sans-serif; }
.notionary-repaso-choices { font:caption; clear:left; margin-top:10px; }
.notionary-repaso-choices div { margin:8px; cursor:pointer; color:<?php echo $normBlau; ?>; 
    font:normal normal normal 2.2em/100% Impact, Roboto, sans-serif; word-break:break-all; }
#repasoContainer { position:absolute; margin:15px; }
#repasoTitle { position:absolute; left:5px; color:black !important;
    <?php txtsh123($softGrau);?>; <?php fontana("normal","900","1.8","2"); ?>; }
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
   echo "/* <![CDATA[
   *! notionary - vMY_VERSION_STRING_HERE
   * https://notionary.com
   * Copyright 2017 notionary.com, Dresden - DEUTSCHLAND */";
?>



#rootMenuclik { position:absolute; left:75%; min-width:50px; font-size:65px; text-align:center;
                cursor:pointer; color:red; <?php txtsh123($softGrau);?>; }
#rootMenulist { top:80px; right:15%; display:none; max-width:600px; }
#rootMenulist.notionary-tooltips:before { right:185px; border-color:transparent transparent black transparent; }
#rootMenulist.notionary-tooltips:after  { right:185px; border-color:transparent transparent white transparent; }
#rootMenulist .notionary-toolitem span { font-size:25px; margin:5px 0px 0px 5px; }


.notionary-purge-image { width:<?php echo $MID_ICONS; ?>px; height:<?php echo $MID_ICONS; ?>px;
   margin:4px; cursor:pointer;border:3px solid <?php echo $normGrau; ?>; }
.notionary-media-count { float:left; clear:left; text-align:right; width:<?php echo $BAR_WIDTH; ?>px;
   padding-right:10px; <?php fontana("italic","400","1.8","1"); ?>; }
.notionary-media-name { float:left;width:<?php echo $SIG_WIDTH; ?>px; padding:0px;margin:0px;
   <?php fontana("italic","400","1.8","1"); ?>; }
.notionary-cloninput { padding:0px; margin:0px; width:45%; text-align:center;
   <?php fontana("normal","300","1","1"); ?>; }


/* MEDIA CLONE */
#adminCloneControls { float:left; clear:left; }
#adminCloneHeader { margin-top:30px; }
#adminNotionFilter { float:left; clear:left; text-align:center; <?php echo $radGrun; ?>; <?php fontana("normal","900","2","100%") ?>; }
#adminCloneSource, #cloneSourceCategory { float:left; <?php fontana("normal","900","1","100%") ?>; }
#adminCloneTarget, #cloneTargetCategory { float:left; <?php fontana("normal","900","1","100%") ?>; }
#adminCloneFeedback markee { position:absolute; margin:0; line-height:35px; white-space:nowrap;
     animation:marquee 5s linear 1; }


/* USERS */
#admnDumyarea .notionary-fieldset { width:70% !important; }
.notionary-userdata { display:inline-table; width:300px; height:100px; cursor:pointer; border:1px solid #ccc; }
.notionary-userdata:hover { <?php echo $radTang; ?>; }
.notionary-usruidno { position:relative; float:left; top:80px; left:-50px; }
#admnUcontrol { width:80%; margin:0 auto; }
   #admnSelector { position:absolute; z-index:9999; }
   #admnUserbtns { width: calc( 100% - 310px ); display:block; float:right; }
      #admnDeletion { background:red; color:black !important; }
      #admnDeletion span { color:black; }
#admnUgallery { position:relative; width:100%; margin:0 auto; }
#userToolSubmit { float:right; margin:0px 10px; }


#adminCloneWorkArea { width:80%; margin:0 auto; text-align:center; }

/* GOOGLE MAPS */
#adminGoogleMapsTool { position:relative;top:60px; }
#adminMapArea { border:3px solid <?php echo $hardTang; ?>; width:640px; height:432px; }

#adminLangEditButton, #adminUserDelete { <?php echo $radRojo; ?>; }



/* LANDSCAPE */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: landscape ) {
                #rootMenulist { left:20%; }
}
/* PORTRAIT  */ @media ( max-width:<?php echo $PAD_WIDTH;?>px ) and ( orientation: portrait ) {
                #rootMenulist { right:19%; }
}
/* MOBILE    */ @media( max-width:<?php echo $MOB_WIDTH;?>px ) {
                #rootMenuclik { width:33%; }
                #rootMenulist { top:unset; left:unset; bottom:65px; right:2%; font-size:.8em; }
                #rootMenulist.notionary-tooltips:before { top:276px; right:55px; border-color:black transparent transparent transparent; }
                #rootMenulist.notionary-tooltips:after  { top:275px; right:55px; border-color:white transparent transparent transparent; }
}

#anonRealarea .notionary-fieldset { position:relative; display:inline; width:30%; height:40px; margin:0 auto; 
                                    border:1px solid <?php echo $normBlau; ?>; <?php fontana("normal","100","1.2","1"); ?>; }

.notionary-navigator { font-size:1.5em; }
.notionary-gallery { width:48px; height:48px; cursor:pointer; <?php echo $radKaki; ?>; font-size:2.5em; }
.notionary-gallery:hover { <?php echo $radTang; ?>; }
.notionary-pageindex { cursor:pointer; }

#mediaEditEditor .fa-pencil { color:red; }

#soundEditorZentralHold { width:60%; height:40%; min-width:350px; min-height:450px;
                        background-size:100% 100%; background-repeat:no-repeat; }
