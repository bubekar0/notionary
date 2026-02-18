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
