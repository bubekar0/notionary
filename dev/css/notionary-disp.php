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
