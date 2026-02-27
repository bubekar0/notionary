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
