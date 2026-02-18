

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
