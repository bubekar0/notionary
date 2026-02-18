<?php
   require_once "utiles.php";
   require_once "dbutil.php";

   $PHI_KONST = 1.618;
   $MIN_ICONS =    16; $BTN_ICONS  =    28; $MID_ICONS  =    35; $MOB_ICONS  =    44; $ACC_HEDER  =    60;
   $BIG_ICONS =    80; $BAR_WIDTH  =   100; $BLG_WIDTH  =   120; $ROT_WIDTH  =   150; $BLG_HOEHE  =   180;
   $BLG_IMG_H =   200; $MIN_WIDTH  =   300; $BLG_IMG_W  =   403; $NTN_WIDTH  =   360; $NAV_WIDTH  =   380;
   $VID_HOEHE =   400; $LOG_HOEHE  =   450; $MOB_WIDTH  =   700; $SIG_WIDTH  =   720; $PAD_WIDTH  =   770; $PDF_HOEHE  =   970;
   $normWeis  = "#FFFFF0 ";  $hardWeis  = "#FFFFFF "; $softWeis  = "#F0F7FF ";  $eggsWeis = "#F0EAD6 ";  $koolWeis = "#CCBE8D ";
   $normGrau  = "#888888 ";  $hardGrau  = "#000000 "; $softGrau  = "#CDCDCD ";  $niceGrau = "#EAE7E7 ";  $auchGrau = "#4D4D4D ";
   $normKaki  = "#D1C269 ";  $hardKaki  = "#D6CFA5 "; $softKaki  = "#E1D4A8 ";
   $normGelb  = "#FAD210 ";  $hardGelb  = "#FFCC00 "; $softGelb  = "#FFFFCC ";  $gbroGelb = "#FFFF02 ";
   $normBlau  = "#4D90FE ";  $hardBlau  = "#627AAC "; $softBlau  = "#8DA1D7 ";  $niceBlau = "#637AB9 ";  $auchBlau = "#6080D8 ";
   $normRojo  = "#FF0000 ";  $hardRojo  = "#FF0000 "; $softRojo  = "#DD4B39 ";  $gbroRojo = "#D60000";
   $normGrun  = "#2B7930 ";  $hardGrun  = "#006400 "; $softGrun  = "#409646 ";  $gbroGrun = "#9CC401 ";
   $normTang  = "#E78F08 ";  $hardTang  = "#FF8300 "; $softTang  = "#FFAB03 ";
   $linWeis = lingrad($hardGrau,$softGrau,$eggsWeis,$hardWeis);       $radWeis = radgrad($normBlau,$softGrau,$eggsWeis,$normWeis);
   $linGrau = lingrad($hardWeis,$normGrau,$normGrau,$hardGrau);       $radGrau = radgrad($hardWeis,$normGrau,$normGrau,$hardGrau);
   $linBlak = lingrad($eggsWeis,$hardGrau,$auchGrau,$niceGrau);       $radBlak = radgrad($eggsWeis,$hardGrau,$auchGrau,$niceGrau);
   $linKaki = lingrad($hardGrau,$hardWeis,$hardKaki,$softKaki);       $radKaki = radgrad($hardGrau,$hardWeis,$hardKaki,$softKaki);
   $linGelb = lingrad($hardGrau,$hardBlau,$hardGelb,$softGelb);       $radGelb = radgrad($hardGrau,$hardBlau,$hardGelb,$softGelb);
   $linBlau = lingrad($eggsWeis,$hardGrau,$hardBlau,$softBlau);       $radBlau = radgrad($hardGrau,$softWeis,$niceBlau,$normBlau);
   $linRojo = lingrad($hardGrau,$hardWeis,$hardRojo,$softRojo);       $radRojo = radgrad($hardGrau,$hardWeis,$hardRojo,$softRojo);
   $linGrun = lingrad($hardWeis,$hardGrau,$hardGrun,$softGrun);       $radGrun = radgrad($hardWeis,$normGrau,$hardGrun,$softGrun);
   $linTang = lingrad($hardWeis,$hardGrau,$hardTang,$softTang);       $radTang = radgrad($hardWeis,$normGrau,$hardTang,$softTang);
function farben(){ // A collection of coloring classes of assorted sizes
   global $normGrau, $normBlau, $hardWeis, $hardGrau, $hardRojo, $hardBlau, $hardGrun, $hardTang;
   return(
       ".snero,.sroso,.sazur,.sgrun,.shony { font-size: .5em; }"
      .".nnero,.nroso,.nazur,.ngrun,.nhony { font-size:1.0em; }"
      .".bnero,.broso,.bazur,.bgrun,.bhony { font-size:1.2em; }"
      .".hnero,.hroso,.hazur,.hgrun,.hhony { font-size:1.5em; }"
      .".snero,.nnero,.bnero,.hnero{ color:${hardGrau} !important;}"
      .".sroso,.nroso,.broso,.hroso{ color:${hardRojo} !important;}"
      .".sazur,.nazur,.bazur,.hazur{ color:${normBlau} !important;}"
      .".sgrun,.ngrun,.bgrun,.hgrun{ color:${hardGrun} !important;}"
      .".shony,.nhony,.bhony,.hhony{ color:${hardTang} !important;}"
      .".bnero,.hnero{" . ludwig("text-shadow","0px 1px 2px $normGrau, 1px 2px 3px $normGrau") . "}"
      .".broso,.hroso{" . ludwig("text-shadow","0px 1px 2px $hardGrau, 1px 2px 3px $hardGrau") . "}"
      .".bazur,.hazur{" . ludwig("text-shadow","0px 1px 2px $normGrau, 1px 2px 3px $hardWeis") . "}"
      .".bgrun,.hgrun{" . ludwig("text-shadow","0px 1px 2px $hardGrau, 1px 2px 3px $hardGrau") . "}"
      .".bhony,.hhony{" . ludwig("text-shadow","0px 1px 2px $hardGrau, 1px 2px 3px $hardGrau") . "}"
   ); /*!hack*/
}
function knopfe(){ // A collection of round buttons of assorted sizes
   global $normGrau, $softGrau, $hardGrau, $normGrun, $hardGrun, $hardWeis,
          $niceBlau, $hardBlau, $softBlau, $normBlau, $normRojo, $hardRojo,
          $normWeis, $hardWeis, $normTang, $hardTang,
          $normGelb, $radWeis, $radTang, $radBlau,
          $MID_ICONS, $MOB_ICONS, $BIG_ICONS;
   return(
       ".netbtn { width:100%; height:22px;" . ludwig("transform","scale(2)")
      . ludwig("transform-origin","top left") ."}"
      .".flike { position:relative; top:1px; left:2px; }"
      .".tlike { position:relative; top:1px; width:90px !important; }"
      .".glike { display:inline-block; width:60px; }"
      ."button { outline:none; cursor:pointer; margin:0px 3px 5px 0px; border:1px solid $normGrau; "
      ."  background:white; padding:5px; font-family:Futura, sans-serif, monospace; font-size:28px; font-weight:bolder; "
      .   $radWeis
      .   ludwig("text-shadow","1px 2px 3px $softGrau")
      .   ludwig("border-radius","3px") . "}"
      ."@media ( hover:hover ) { button:hover { background:$hardWeis; border:1px solid $hardGrau; } }"
      ."button:active {"
      .   ludwig("box-shadow","0px 3px 3px 0px #000,0px 1px 1px #FFF,0px 4px 0px 0px #000")
      .   ludwig("transform","translate(0,2px)") . "}"
      ."button span { padding-right:3px; font-size:1.25em !important; }"
      .".fa { color:$normBlau; " . tshade($normGrau) . "}"
      .".fa:hover { color:$normBlau; }"
   ); /*!hack*/
}
function tshade($farbe){
   echo "-webkit-text-shadow:2px 2px 1px $farbe;"
       ."-ms-text-shadow:    2px 2px 1px $farbe;"
       ."-o-text-shadow:     2px 2px 1px $farbe;"
       ."text-shadow:        2px 2px 1px $farbe;"
   ; /*!hack*/
}
function txtsh123($farbe){
   echo "-webkit-text-shadow:1px 2px 3px $farbe,0px 1px 2px $farbe;"
       ."-ms-text-shadow:    1px 2px 3px $farbe,0px 1px 2px $farbe;"
       ."-o-text-shadow:     1px 2px 3px $farbe,0px 1px 2px $farbe;"
       ."text-shadow:        1px 2px 3px $farbe,0px 1px 2px $farbe;"
   ; /*!hack*/
}
function woody(/*$farbe*/){
   echo "-webkit-text-shadow:0 1px #fff,-1px 0 #aaa,-1px 2px #fff,-2px 1px #aaa,-2px 3px #fff,-3px 2px #aaa,-3px 4px #fff,-4px 3px #aaa,-4px 5px #fff;"
       ."-ms-text-shadow:    0 1px #fff,-1px 0 #aaa,-1px 2px #fff,-2px 1px #aaa,-2px 3px #fff,-3px 2px #aaa,-3px 4px #fff,-4px 3px #aaa,-4px 5px #fff;"
       ."-o-text-shadow:     0 1px #fff,-1px 0 #aaa,-1px 2px #fff,-2px 1px #aaa,-2px 3px #fff,-3px 2px #aaa,-3px 4px #fff,-4px 3px #aaa,-4px 5px #fff;"
       ."text-shadow:        0 1px #fff,-1px 0 #aaa,-1px 2px #fff,-2px 1px #aaa,-2px 3px #fff,-3px 2px #aaa,-3px 4px #fff,-4px 3px #aaa,-4px 5px #fff;"
   ; /*!hack*/
}
function papel($linea,$fondo,$spacing,$bleeding){
   echo "background:$fondo;"
       ."background: -webkit-linear-gradient(top, $linea 1%, $fondo $bleeding);"
       ."background:    -moz-linear-gradient(top, $linea 1%, $fondo $bleeding);"
       ."background:     -ms-linear-gradient(top, $linea 1%, $fondo $bleeding);"
       ."background:      -o-linear-gradient(top, $linea 1%, $fondo $bleeding);"
       ."background:         linear-gradient(top, $linea 1%, $fondo $bleeding);"
       . ludwig("background-size","100% $spacing");
   ; /*!hack*/
}
function quads($linea,$fondo,$spacing,$bleeding){
   echo "background:"
        ."linear-gradient(-90deg, $linea 1px, transparent $bleeding),  "
        ."linear-gradient($linea 1px, $fondo $bleeding);   "
        ."background-size:$spacing $spacing; "
   ; /*!hack*/
}
function stapel($count,$spacing,$light,$dark,$shadow){
   $retStr = "1px 1px $dark,";
   for( $i=$spacing; $i <= $count * $spacing; $i += $spacing ){ $j = $i + 1;
      $retStr .= "${i}px  ${i}px $light, ${j}px ${j}px $dark ";
      if( $i < $count * $spacing ) $retStr .= " , ";
   }
   $retStr .= ", ${i}px ${i}px ${i}px $shadow !important";
   echo ludwig("box-shadow",$retStr);
   ; /*!hack*/
}
function myrad($radii){
   echo "-webkit-border-radius:$radii;"
       ."-ms-border-radius:$radii;"
       ."-o-border-radius:$radii;"
       ."border-radius:$radii"
   ; /*!hack*/
}
function fontana($norita,$centos,$talla,$leading){
   echo "font: ".$norita." normal ".$centos." ".$talla."em/".$leading . " Futura, Calibri, sans-serif,monospace" ; /*!hack*/
}
function fountain($norita,$centos,$talla,$leading){
   return("font: ".$norita." normal ".$centos." ".$talla."em/".$leading . " Futura, Calibri, sans-serif,monospace; "); /*!hack*/
}
function mozart($cssProperty,$cssValue){
   echo "-webkit-".$cssProperty.": ".$cssValue.";"
       ."-ms-".$cssProperty.": ".$cssValue.";"
       ."-o-".$cssProperty.": ".$cssValue.";"
       .$cssProperty.": ".$cssValue." "
   ; /*!hack*/
}
function ludwig($cssProperty,$cssValue){
   return( "-webkit-".$cssProperty.": ".$cssValue.";"
       ."-ms-".$cssProperty.": ".$cssValue.";"
       ."-o-".$cssProperty.": ".$cssValue.";"
       .$cssProperty.": ".$cssValue.";"
   ); /*!hack*/
}
function radgrad($textColor,$shadeColor,$fromColor,$toColor){
   return(
      "color:$textColor !important;"
    . "-webkit-text-shadow:0px 1px 2px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "-ms-text-shadow:    0px 1px 2px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "-o-text-shadow:     0px 1px 2px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "text-shadow:        0px 1px 2px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "background-color:$fromColor;"
    . "background:-webkit-radial-gradient(center,circle closest-corner,$fromColor,$toColor 98%);"
    . "background:-ms-radial-gradient(center,circle closest-corner,$fromColor,$toColor 98%);"
    . "background:-o-radial-gradient(center,circle closest-corner,$fromColor,$toColor 98%);"
    . "background:radial-gradient(center,circle closest-corner, $fromColor,$toColor 98%);"
    //. "filter:'progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorStr=".$fromColor.",EndColorStr=".$toColor.")';"
   ); /*!hack*/
}
function lingrad($textColor,$shadeColor,$fromColor,$toColor){
   return(
      "color:$textColor !important;"
    . "-webkit-text-shadow:1px 2px 3px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "-ms-text-shadow:    1px 2px 3px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "-o-text-shadow:     1px 2px 3px $shadeColor, 1px 2px 4px $shadeColor !important;"
    . "text-shadow:        1px 2px 2px $shadeColor !important;"
    . "background-color:$fromColor;"
    . "background:-webkit-linear-gradient(180deg,$fromColor 5%,$toColor 95%);"
    . "background:-ms-linear-gradient(180deg,$fromColor 5%,$toColor 95%);"
    . "background:-o-linear-gradient(180deg,$fromColor 5%,$toColor 95%);"
    . "background:linear-gradient(180deg,$fromColor 5%,$toColor 95%);"
    //. "filter:'progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorStr=".$fromColor.",EndColorStr=".$toColor.")';"
   ); /*!hack*/
}
function makeimg($imgID,$wide,$high,$float){
   $urltxt = param("image");
   echo "cursor:pointer;"
       //."-webkit-border-radius:0px;"
       //."-ms-border-radius:0px;"
       //."-o-border-radius:0px;"
       //."border-radius:0px;"
       ."width:${wide}px;height:${high}px; float:$float;"
       ."background:transparent !important;"
       ."background-image: url(${urltxt}${imgID}) !important;"
       ."background-repeat: no-repeat !important;"
       ."background-size:${wide}px ${high}px !important"
   ; /*!hack*/
}
function opaque($oto1){ $aspct=100*$oto1;
   echo "-ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=${aspct})';"
      //. "-moz-opacity:$oto1;"
      . "-khtml-opacity: $oto1;"
      . "-ms-filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=$oto1)"
      . "filter:alpha(opacity:${aspct}%);"
      . "opacity:$oto1" ; /*!hack*/
}
function flipColor($flipant){ /* right opposite color -> fails for grays! */
    $hexcode  = substr($flipant,1,6);   /* HSL: serennu.com/colour/rgbtools.php */
    $redhex   = substr($hexcode,0,2);   /* hacks blind YUI of trailing ';' */
    $greenhex = substr($hexcode,2,2);
    $bluehex  = substr($hexcode,4,2);
    $var_r    = (hexdec($redhex))/255;
    $var_g    = (hexdec($greenhex))/255;
    $var_b    = (hexdec($bluehex))/255;
    $var_min  = min($var_r,$var_g,$var_b);
    $var_max  = max($var_r,$var_g,$var_b);
    $del_max  = $var_max - $var_min;
    $l = ($var_max + $var_min) / 2;
    if ($del_max == 0) { $h = 0; $s = 0;  /*!hack*/}
    else {
       if ($l < 0.5) { $s = $del_max / ($var_max + $var_min);  /*!hack*/}
       else { $s = $del_max / (2 - $var_max - $var_min);  /*!hack*/};
       $del_r = ((($var_max - $var_r) / 6) + ($del_max / 2)) / $del_max;
       $del_g = ((($var_max - $var_g) / 6) + ($del_max / 2)) / $del_max;
       $del_b = ((($var_max - $var_b) / 6) + ($del_max / 2)) / $del_max;
       if ($var_r == $var_max) { $h = $del_b - $del_g;  /*!hack*/}
       elseif ($var_g == $var_max) { $h = (1 / 3) + $del_r - $del_b;  /*!hack*/}
       elseif ($var_b == $var_max) { $h = (2 / 3) + $del_g - $del_r;  /*!hack*/};
       if ($h < 0) { $h += 1;  /*!hack*/};
       if ($h > 1) { $h -= 1;  /*!hack*/}; /*!hack*/
    };
    $h2 = $h + 0.5;
    if ($h2 > 1) { $h2 -= 1;  /*!hack*/};
    if ($s == 0) { $r = $l * 255; $g = $l * 255; $b = $l * 255;  /*!hack*/}
    else {
       if ($l < 0.5) { $var_2 = $l * (1 + $s);  /*!hack*/}
       else { $var_2 = ($l + $s) - ($s * $l);  /*!hack*/};
       $var_1 = 2 * $l - $var_2;
       $r = 255 * hue_2_rgb($var_1,$var_2,$h2 + (1 / 3));
       $g = 255 * hue_2_rgb($var_1,$var_2,$h2);
       $b = 255 * hue_2_rgb($var_1,$var_2,$h2 - (1 / 3)); /*!hack*/
    };
    $rhex = sprintf("%02X",round($r));
    $ghex = sprintf("%02X",round($g));
    $bhex = sprintf("%02X",round($b));
    $rgbhex = $rhex.$ghex.$bhex;
    return "#".$rgbhex; /*!hack*/
}
function hue_2_rgb($v1,$v2,$vh) { /* part of the above code scheme */
    if($vh < 0){ $vh += 1;  /*!hack*/};
    if($vh > 1){ $vh -= 1;  /*!hack*/};
    if((6 * $vh) < 1){ return ($v1 + ($v2 - $v1) * 6 * $vh);  /*!hack*/};
    if((2 * $vh) < 1){ return ($v2);  /*!hack*/};
    if((3 * $vh) < 2){ return ($v1+($v2-$v1)*((2/3-$vh)*6));  /*!hack*/};
    return ($v1); /*!hack*/
}
function reverseColor($flipant){ /* color reversal  HEX value (255 - value) */
    $oldred  = substr($flipant,1,2); /* works well for grays */
    $oldgreen = substr($flipant,3,2);
    $oldblue = substr($flipant,5,2);
    $newred  = 255-hexdec($oldred);
    $newgreen = 255-hexdec($oldgreen);
    $newblue = 255-hexdec($oldblue);
    return "#".str_pad(dechex($newred),2,'0',STR_PAD_LEFT)
              .str_pad(dechex($newgreen),2,'0',STR_PAD_LEFT)
              .str_pad(dechex($newblue),2,'0',STR_PAD_LEFT) ;/*!hack*/
}
?>
