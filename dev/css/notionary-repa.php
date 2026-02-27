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
