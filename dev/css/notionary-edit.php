.notionary-image-saved { width:<?php echo $BIG_ICONS;?>px; height:<?php echo $BIG_ICONS;?>px; <?php myrad("10px"); ?>; }
.notionary-passbild  { display:inline;float:left; cursor:pointer; <?php opaque(".6"); ?>;
    <?php myrad("10px"); ?>; width:<?php echo $BIG_ICONS;?>px; height:<?php echo $BIG_ICONS;?>px; padding:1px; }
.notionary-passbild:hover  { <?php opaque("1"); ?>; }
.notionary-qaRow { width:100%; display:inline-block; }
.notionary-cardback .fa-ellipsis-h { font-size:5em; }
.notionary-qaInput { height:<?php echo $MOB_ICONS;?>px; border:none; padding:0px;
    border-bottom:1px solid #91d1d3; outline:none; <?php fontana("normal","600","1.5","1.5"); ?>; }
.notionary-textarea { display:block; box-sizing:border-box; width:100%; min-height:54px; height:auto;
    overflow:hidden; outline:none; resize:vertical; <?php opaque("1"); ?>;
    border:1px solid <?php echo $normBlau; ?>; text-align:center;
    <?php fontana("normal","500","1","1.35"); ?>; }

/* FLAT Q/A EDITOR ROWS  (the flashcards TEST mode keeps its own flip-card CSS — do not touch that) */
.notionary-qarow { display:grid; grid-template-columns:54px 1fr 1fr 28px 28px; align-items:start;
    gap:6px; width:96%; max-width:900px; margin:8px auto; padding:6px;
    border:1px solid #e0e0e0; <?php myrad("6px"); ?>; }
.notionary-qarow:hover { border-color:<?php echo $normBlau; ?>; }
.notionary-qanum { font-size:11px; color:<?php echo $hardGrau; ?>; text-align:center; padding-top:6px; }
.notionary-optlabel { display:block; margin-top:3px; font-size:9px; font-style:italic; color:<?php echo $hardTang; ?>; }
.notionary-qaopt { opacity:0.85; }
.notionary-qadots { cursor:pointer; font-size:1.4em; color:<?php echo $hardGrau; ?>; text-align:center; padding-top:6px; }
.notionary-qadots:hover { color:<?php echo $normBlau; ?>; }
.notionary-qarow .notionary-basurero { cursor:pointer; font-size:1.1em; color:<?php echo $softRojo; ?>; text-align:center; padding-top:6px; }
.notionary-qarow .notionary-pregunta { color:<?php echo $hardRojo; ?>; }
.notionary-qarow .notionary-risposta { color:<?php echo $hardGrun; ?>; }
/* MOBILE: stack question above answer */
@media( max-width:<?php echo $MOB_WIDTH;?>px ) {
   .notionary-qarow { display:block; }
   .notionary-qarow .notionary-textarea { width:100%; margin:4px 0; }
   .notionary-qanum, .notionary-qadots, .notionary-qarow .notionary-basurero {
      display:inline-block; vertical-align:middle; margin-right:12px; padding-top:0; }
}

.notionary-caption { color: <?php echo $hardTang; ?>; <?php fontana("normal","400","0.7","200%"); ?>; }
.notionary-label { display:inline-block; min-width:12%; }

.notionary-pictimag { position:absolute; top:0px; left:0px; z-index:-1; width:100%; height:100%; <?php opaque("0"); ?>; }
.notionary-camarita.fa-camera { position:absolute; top:3px; left: 80px; font-size:3em; }
.notionary-speakers.fa-play   { position:absolute; top:3px; left:180px; font-size:3em; }


/* NOTION EDITOR — header chrome (rebuilt: one consistent flow layout, app tokens) */
#editControls { position:sticky; top:0px; left:0px; width:100%; box-sizing:border-box;
                padding:12px 44px 14px 18px; background:#fff; border-bottom:1px solid #ddd; z-index:888;
                <?php fontana("normal","500","0.95","1.45"); ?>; }
   #editExitante { position:absolute; top:8px; right:14px; font-size:24px; color:#888; cursor:pointer; z-index:999; }
   #editExitante:hover { color:#444; }

   #editNnameDiv, #editNdescDiv { display:flex; align-items:center; gap:10px; margin:3px 0px; }
      #editNnameTit, #editNdescTit { flex:0 0 140px; text-align:right; white-space:nowrap; color:#444; <?php fontana("normal","600","0.95","1.3"); ?>; }
      #editNnameTxt, #editNdescTxt { flex:1 1 auto; min-width:0px; padding:5px 9px; box-sizing:border-box; outline:none;
            border:1px solid <?php echo $softGrau; ?>; <?php myrad("6px"); ?>; <?php fontana("normal","500","0.95","1.3"); ?>; }
      #editNnameTxt:focus, #editNdescTxt:focus { border-color:<?php echo $normBlau; ?>; }
      #editNdescLen { font-size:9px; color:<?php echo $softRojo; ?>; margin-left:4px; }

   #editMetadata { display:flex; align-items:center; flex-wrap:wrap; gap:10px 22px; margin-top:8px; }
      #editKatseDiv, #editSperqDiv, #editPieceDiv { display:inline-flex; align-items:center; gap:6px; color:#444; }
      #editLanghtml { position:relative; display:inline-flex; align-items:center; gap:6px; color:#444; }
      #editLangtit { white-space:nowrap; }
      #editPieceCbx { font-size:18px; cursor:pointer; }
      #editPieceGui { margin-left:10px; }
      #editTracking { display:none; }

   #editActions { display:inline-flex; align-items:center; gap:12px; margin-left:auto; }
      #editExtrarow, #editSubmiter, #editDeletion { position:static; margin:0px; }
      #editDeletion { background:<?php echo $softRojo; ?>; color:#fff !important; }
      #editDeletion span { color:#fff; }

      #editChoosing { position:absolute; top:0px; width:100%; height:170px; margin:0 auto; z-index:9999;
                      text-align:center; <?php echo $radWeis; ?>; <?php fontana("normal","500","1.2","1"); ?>; }
      #editQAandGallery { max-height:<?php echo $PAD_WIDTH; ?>px; }

#editContents { text-align:center; max-width:100%; margin-top:12px; overflow:hidden; }
#editContents .notionary-exbutton { font-size:35px !important; }

      .notionary-pregunta { color:<?php echo $hardRojo; ?>; }
      .notionary-risposta   { color:<?php echo $hardGrun; ?>; }
      #editContents .conti { box-shadow:none; }
   #editFBContainer { position:relative;top:12px; display:inline-block; }
