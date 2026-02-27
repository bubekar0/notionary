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
