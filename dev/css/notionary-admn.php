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
