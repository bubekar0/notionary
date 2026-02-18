function countProblemsInUINFO(){
   DEBUGGER?console.log("[countProblemsInUINFO]"):0;
   var i, j, k, psize="";
   if ( USERINFO[3] ) {
      for ( i = 0; i < USERINFO[3].probs.length; i++ ) // one object per tested notion
         for ( j in USERINFO[3].probs[i] ) // just the notion name -> serves as index
            for ( k = 0; k < USERINFO[3].probs[i][j].length; k++ ) // one per problem question
               if ( USERINFO[3].probs[i][j][k].prb != "" ) psize++;
   } return( psize );
}
function repasoSession(){
   DEBUGGER?console.log("[repasoSession]"):0;
   THEINDEX = TIMEOUTS = 0; QUESTIME = 30; KORREKTE = 0;
   var i = 0, w, x, y, z;
   if ( !USERINFO[3].probs.length ) { landingPage(); return; }
   for ( w in USERINFO[3].probs ) {
      for ( x in USERINFO[3].probs[w] ) {
         for ( y in USERINFO[3].probs[w][x]) {
            PROBLEMS[ i ] = {}; PROBLEMS[ i ].weg = PENANCES;
            PROBLEMS[ i ].nam = x; PROBLEMS[ i ].eye = w; PROBLEMS[ i ].kay = y;
            for ( z in USERINFO[3].probs[w][x][y] ) {
               if ( z == "dec" ) {
                  PROBLEMS[ i ].ch1 = USERINFO[3].probs[w][x][y][z][0]; PROBLEMS[ i ].ch2 = USERINFO[3].probs[w][x][y][z][1];
                  PROBLEMS[ i ].ch3 = USERINFO[3].probs[w][x][y][z][2]; PROBLEMS[ i ].ch4 = USERINFO[3].probs[w][x][y][z][3];
               } else PROBLEMS[ i ][z] = USERINFO[3].probs[w][x][y][z];
            } i++;
         }
      }
   }
   PROBZAHL = PROBLEMS.length;

   examWidgets( "probs", function(){
      ausblenden( document.getElementById( "examWritings" ) );
      document.getElementById( "examExitante" ).onclick = function(e){ landingPage(); showSupers(); }
      continueWithNextError();
   });
}
function updateRepasobars(rottgrun){
   DEBUGGER?console.log("[updateRepasobars]"):0;
   var gutPercent = ( 100 * KORREKTE ) / ( PENANCES * PROBZAHL ),
       gutbarein = document.getElementById( "examGutBarIn" ),
       gutcount  = document.getElementById( "examGutCount" );

   gutbarein.style.setProperty("width",gutPercent + "%");
   if ( gutPercent > 15 ) gutcount.innerHTML = KORREKTE + "&nbsp;/&nbsp;" + ( PENANCES * PROBZAHL );
}
function continueWithNextError(){
   DEBUGGER?console.log("[continueWithNextError]"):0;
   var DESKQLEN =  20,    MOBIQLEN =  12,   // Length that exhausts width
       BABYFONT = 3.0,    MAMAFONT = 4.5,   // Desktop + iPads
       TINYMOBI = 2.3,    HUGEMOBI = 3.2,   // Mobiles
       btn, buttonsMarkup = "",
       fsize,
       reptile, xampicto, xamimage, xamxoice, xamqtext, xoibtns,
       xoices = new Array(), imsrc;
   reptile  = document.getElementById( "examTitulare" );
   xampicto = document.getElementById( "examPantalla" );
   xamqtext = document.getElementById( "examPregunta" );
   xamxoice = document.getElementById( "examMultiple" );
   xoices = shuffleArray(
               [ PROBLEMS[ THEINDEX ].sol,
                 PROBLEMS[ THEINDEX ].ch1,
                 PROBLEMS[ THEINDEX ].ch2,
                 PROBLEMS[ THEINDEX ].ch3,
                 PROBLEMS[ THEINDEX ].ch4
               ]);

   fsize = PROBLEMS[THEINDEX].prb.length > DESKQLEN ? BABYFONT : MAMAFONT;
   if ( SMARTFON ) fsize = PROBLEMS[THEINDEX].prb.length > MOBIQLEN ? TINYMOBI : HUGEMOBI;
   if ( !PROBLEMS[THEINDEX].pik )
      xamqtext.style.cssText = "font:normal normal 900 " + fsize + "em/100% Futura, sans-serif,monospace;";

   for ( btn = 0; btn < 5; btn++ ) 
      buttonsMarkup += "<button id='reco" + btn + "' class='notionary-examwahl'>" + xoices[ btn ] + "</button>";

   reptile.innerHTML = PROBLEMS[ THEINDEX ].nam.kurzen( DESKNMAX );
   xamimage = document.getElementById( "examImagenes" );
   if ( PROBLEMS[ THEINDEX ].pik ) ausblenden(xamqtext,10,true); else einblenden(xamqtext,10);

   // Play the sound of a soundtion when available
   if ( PROBLEMS[THEINDEX].pik && PROBLEMS[THEINDEX].snd ) playByID( PROBLEMS[THEINDEX].snd );
   xamxoice.innerHTML = buttonsMarkup;
   xoibtns = document.getElementsByClassName( "notionary-examwahl" );
   for ( i = 0; i < xoibtns.length; i++ ) xoibtns[i].onclick = function(e){
      if ( this.innerHTML == PROBLEMS[ THEINDEX ].sol ){ // Right Answer
         PROBLEMS[ THEINDEX ].weg--;
         KORREKTE++;
         updateRepasobars("Grun");
         if ( PROBLEMS[ THEINDEX ].weg == 0 ) {          // Hurdles passed, excise index and handle next (no need to bump)
            httpost("usrindex.php","tun=prdel&was=" + JSON.stringify(
               { "prfid": PROBLEMS[ THEINDEX ].pid,
                 "pblem": PROBLEMS[ THEINDEX ].prb
               })
            );
            USERINFO[3].probs[ PROBLEMS[THEINDEX].eye ][ PROBLEMS[THEINDEX].nam ].splice( PROBLEMS[THEINDEX].kay, 1 ); // excise from USERINFO
            PROBLEMS.splice( THEINDEX, 1 ); // excise from PROBLEMS
         }
      } else {
         PROBLEMS[ THEINDEX ].weg++; updateRepasobars("Rojo");
         if ( PROBLEMS[ THEINDEX ].snd )  playByID( PROBLEMS[ THEINDEX ].snd );
      }
      clearInterval( ENERGIZE );
      THEINDEX = ( THEINDEX + 1 ).mod( PROBLEMS.length );
      if ( PROBLEMS.length > 0 )  continueWithNextError(); else { landingPage(); showSupers(); }
   }

   xamqtext.innerHTML = PROBLEMS[ THEINDEX ].prb;
   if ( PROBLEMS[ THEINDEX ].pik && PROBLEMS[ THEINDEX ].img ) {
      imsrc = HARDCODE.image + PROBLEMS[ THEINDEX ].img;
      xampicto.innerHTML = "<img id='examImagenes' src='" + imsrc + "'>";
      einblenden(xampicto);
   } else ausblenden(xampicto,10,true);
   clearInterval( ENERGIZE );
   if ( TIMEOUTS < MAXTOUTS ){
      DECILEFT = 1000 * QUESTIME;

      ENERGIZE = setInterval(function(){
                 var deciseks, lifepcnt, xamqtext;
                 DECILEFT -= 10;
                 deciseks  = document.getElementById( "examLifeleft" );
                 xamqtext  = document.getElementById( "examPregunta" );
                 lifepcnt  = DECILEFT / ( 10 * QUESTIME );

                 deciseks.style.setProperty( "width", lifepcnt +"%" );
                 if ( DECILEFT <= 10 ) { TIMEOUTS++; THEINDEX++; continueWithNextError(); }
                 if ( lifepcnt <= 50 ) {  deciseks.style.setProperty("background", "#E78F08" );
                    if ( lifepcnt <= 20 ) deciseks.style.setProperty("background", "#FF0000" );
                 } else                   deciseks.style.setProperty("background", "#2B7930" );
              },10);
   } else nentr();

}
