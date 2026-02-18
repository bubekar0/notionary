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
