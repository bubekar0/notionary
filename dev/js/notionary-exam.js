function getGoodChoice(choicesString){ // Return correct from block separated choices
   DEBUGGER?console.log("[getGoodChoice]"):0;
   var allChoices, goodChoice = choicesString; // Assume nothing to do (i.e. Normal Answer)
   if ( choicesString.toString().indexOf( CHOIXSEP ) > 0 ) { // Found something to do!!
      allChoices = choicesString.toString().split( CHOIXSEP );
      goodChoice = allChoices[0];
   } return(goodChoice); // toString() is needed for indexOf to work (on Math type data)
}
function levenshtein(a, b) {
   // sourced from :  https://coderwall.com/p/uop8jw
   if ( a.length === 0 ) return b.length;
   if ( b.length === 0 ) return a.length;
   var i, j, matrix = [];
   // increment along the first column of each row
   for ( i = 0; i <= b.length; i++ ) matrix[i] = [i];
   for ( j = 0; j <= a.length; j++ ) matrix[0][j] = j;
   // Fill in the rest of the matrix
   for ( i = 1; i <= b.length; i++ ){
      for ( j = 1; j <= a.length; j++ ){
         if ( b.charAt(i-1) == a.charAt(j-1) )
            matrix[i][j] = matrix[i-1][j-1];
         else
            matrix[i][j] = Math.min(matrix[i-1][j-1] + 1, // substitution
                           Math.min(matrix[i][j-1] + 1, // insertion
                                    matrix[i-1][j] + 1)); // deletion
      }
   }
   return matrix[b.length][a.length];
}
function showYouTube(){
   DEBUGGER?console.log("[showYouTube]"):0;
   var VIDOPTNS = "?start=5;?rel=0&amp;fs=1&amp;autoplay=1&amp;autohide=1"+
                       "&amp;modestbranding=1&amp;showsearch=0&amp;showinfo=0",
       VIDWIDTH = "100%",
       VIDHOEHE = 400,
       mu = "", vlink, xampic;
   xampic = document.getElementById( "examPantalla" );
   vlink = NINFDATA[0].video.replace("watch?v=","v/") + VIDOPTNS;
   mu += "<object " +
          "type='application/x-shockwave-flash' " +
          "width='" + VIDWIDTH + "' " +
          "height='" + VIDHOEHE + "' " +
          "data='" + vlink + "'>" +
          "<param name='movie' value='" + vlink + "' />" +
          "<param name='allowNetworking' value='internal' />" +
          "<param name='allowFullScreen' value='true' />" +
       "</object>"; // Disable click-through to YouTube site
      xampic.innerHTML = mu;
}
function anchorButton( whattodo, safename, awesomei ){
   DEBUGGER?console.log("[anchorButton]"):0;
   return("<a href='" + HARDCODE.myurl + "?tun=" + whattodo + "&was=" + safename + "'>" +
             "<button> <span class='fa " + awesomei + "'></span>" + TRANSLAT[whattodo] + "</button>" +
          "</a>");
}
function bindExamWidgets( testtype ){
   DEBUGGER?console.log("[bindExamWidgets]"):0;
   var barrotes = document.getElementById( "examBarrotes" ), timeleft = document.getElementById( "examLifehold" ),
       xamqtext = document.getElementById( "examPregunta" ), xamanser = document.getElementById( "examRisposta" ),
       writings = document.getElementById( "examWritings" ), xamleven = document.getElementById( "examLevenpct" ),
       xamkbikn = document.getElementById( "examKeysicon" ), keyboard = document.getElementById( "examKeyboard" ),
       lenguaje = NINFDATA[0].tlang;

   // Handle Keyboard Input (with Levenshtein Distance and Colored Feedback )
   ausblenden( keyboard );
   xamanser.onkeydown = function(e){ var k = ( e.keyCode ? e.keyCode : e.which ), sendx;
      if ( k == "13" ) { // enter key or correct answer or Levenshtein distance
         if ( WORKDATA[ THEINDEX ].a.length > LVLENGTH && LVPRCENT > LVMINPCT ) sendx = WORKDATA[ THEINDEX ].a;
         else sendx = xamanser.value;
         computeScoreAndContinue(sendx,WORKDATA[ THEINDEX ].a,testtype);
      }
   }
   xamanser.onkeyup = function(e){
      var typed = xamanser.value, trial = getRidOfFluff( typed ),
          chunk = WORKDATA[ THEINDEX ].a.toString().substr(0,typed.length);
      if ( getGoodChoice( WORKDATA[ THEINDEX ].a ).length > LVLENGTH ){
         LVPRCENT = ( LVTARGET.length - levenshtein( trial, LVTARGET ) ) / LVTARGET.length;
         xamleven.innerHTML = ( 100 * LVPRCENT ).toFixed() + "%";
         einblenden(xamleven,1000);
      }
      if ( typed == chunk || LVPRCENT > LVMINPCT ) {      // right up to now
         xamanser.style.setProperty("background","white");
         xamanser.style.setProperty("color","green");
         if ( typed == getGoodChoice( WORKDATA[ THEINDEX ].a ) || LVPRCENT > LVMINPCT ) fireKey( xamanser,13);
      } else {
         xamanser.style.setProperty("background","black");
         xamanser.style.setProperty("color","red");
      }
   }
   xamanser.focus();

   document.getElementById( "examExitante" ).onclick = function(e){ landingPage(); showSupers(); }

   if ( NINFDATA[0].catno == "19" || NINFDATA[0].picto )  ausblenden( xamqtext );       // Standard + Pictions -->> No Question Text
   if ( NINFDATA[0].catno ==  "2" || NINFDATA[0].catno == "3" )  lenguaje = "scimath";  // FKeys use tlang or "scimath" (Math|Science)
   if ( testtype == "lesen" || testtype == "lista" || testtype == "watch" ) ausblenden( barrotes );
   if ( testtype == "lesen" || testtype == "lista" || testtype == "watch" || testtype == "learn" ) ausblenden( timeleft );
   if ( testtype == "learn" || testtype == "trial" || testtype == "mix1b" ||            // Non Written tests hide Write Widgets
        testtype == "lesen" || testtype == "lista" || testtype == "watch" || SMARTFON ) ausblenden(writings,10,true);
   else if ( lenguaje != "en" ) {                                                       // Written tests in foreign tongue use FKeys
      showEditForeignButtons( keyboard, lenguaje, function(){
         xamanser.value = xamanser.value + this.innerHTML; xamanser.focus();
         xamanser.dispatchEvent(new Event('keyup')); // Ensures "typed" even if clicked!
      });
      xamkbikn.onclick = function(){
         if ( keyboard.style.display == "block" ) ausblenden( keyboard, 10, true); 
         else einblenden( keyboard, 100 ); }
      xamkbikn.style.display = "block";
      ausblenden(keyboard);
   }

   if ( NINFDATA[0].catno  == "2" ) document.body.classList.add("quadro");  // Removed automagically@landingPage();
}
function examWidgets( testtype, bindCBK ){
   DEBUGGER?console.log("[examWidgets]"):0;
   var safename, kurzname, learnbtn = trialbtn = writebtn = adeptbtn = listabtn = lesenbtn = watchbtn = amendbtn = "";

   if ( testtype == "probs" ) safename = kurzname = TRANSLAT.repas;
   else {
      safename = NINFDATA[0].nname.sauber(), kurzname,
      kurzname = SMARTFON ? safename.kurzen( MOBINMAX ) : NINFDATA[0].nname.sauber();
      if ( testtype == "mix1b" || testtype == "mix2b" ) kurzname = TRANSLAT.multi;

      if ( testtype != "learn" )                                       learnbtn = anchorButton("learn",safename,"fa-graduation-cap");
      if ( testtype != "trial" )                                       trialbtn = anchorButton("trial",safename,"fa-mouse-pointer");
      if ( testtype != "write" )                                       writebtn = anchorButton("write",safename,"fa-pencil");
      if ( testtype != "adept" )                                       adeptbtn = anchorButton("adept",safename,"fa-undo");
      if ( testtype != "lista" && !SMARTFON )                          listabtn = anchorButton("lista",safename,"fa-file-text");
      if ( NINFDATA[0].dokum && ( testtype != "lesen" ) && !SMARTFON ) lesenbtn = anchorButton("lesen",safename,"fa-file-pdf-o");
      if ( NINFDATA[0].video && testtype != "watch" )               watchbtn = anchorButton("watch",safename,"fa-youtube");
      if ( ( ( NINFDATA[0].ownid == USERINFO[0].uidno ) || ROOTUSER ) && testtype != "amend" )
                                                                    amendbtn = anchorButton("amend",safename,"fa-cogs");

      // Disable testtypes that make no sense for certain Notions or Devices
      if ( NINFDATA[0].forja || ( NINFDATA[0].catno == 19 ) ) learnbtn = writebtn = adeptbtn = listabtn = amendbtn = "";
      if ( NINFDATA[0].picto ) adeptbtn = "";
      if ( SMARTFON ) writebtn = adeptbtn = amendbtn = "";
   }

   document.body.innerHTML = 
      "<div          id='examControls'>" +
         "<div       id='examTitulare'>" + kurzname + "</div>" +
                     learnbtn + trialbtn + writebtn + adeptbtn +
                     listabtn + lesenbtn + watchbtn + amendbtn +
         "<div       id='examExitante' class='fa fa-times'></div>" +
         "<div       id='examBarrotes'>" +
            "<div    id='examFeedback'></div>" +
            "<div    id='examBarOuter'>" +
               "<div id='examBadBarIn'><div id='examBadCount'></div></div>" +
               "<div id='examGutBarIn'><div id='examGutCount'></div></div>" +
               "<div id='examLrnBarIn'><div id='examLrnCount'></div></div>" +
            "</div>" +
         "</div>" +
         "<div       id='examLifehold'><div id='examLifeleft'></div></div>" +
      "</div>" +
      "<div          id='examContents'>" +
         "<div       id='examPantalla'></div>" +
         "<div       id='examPregunta'></div>" +
         "<div       id='examWritings'>" +
            "<span   id='examLevenpct'></span>"+
            "<input  id='examRisposta'>"+
            "<span   id='examKeysicon' class='fa fa-keyboard-o' title='" + TRANSLAT.fkeys + "'></span>" +
            "<div    id='examKeyboard'></div>" +
         "</div>" +
      "</div>" +
      "<div          id='examMultiple'></div>";
   bindCBK();
}
function go4it(nname,testtype){
   DEBUGGER?console.log("[go4it]"):0;
   THEINDEX = TIMEOUTS = SELECTED = KORREKTE = FALSCHER = 0;
   QUESTIME = DEFSPERQ;  MISTAKES = [];        TESTTIME = new Date().getTime();
   if ( typeof NINFDATA[0] === "undefined" || NINFDATA[0].nname != nname )
      jasonNINFO(nname,function(){ renderExam(testtype); });
   else renderExam(testtype);
}
function renderExam(testtype){
   DEBUGGER?console.log("[renderExam]"):0;
   var DOCWIDTH = "80vw",
       DOCHOEHE = "70vh",
       i, j, onetoone = tempo = new Array();

   if ( NINFDATA[0].sperq ) QUESTIME = NINFDATA[0].sperq;
   DECILEFT = 1000 * QUESTIME;
   document.title= "notionary - " + NINFDATA[0].nname;

   switch( testtype ){
      case 'learn': examWidgets( testtype, function (){ bindExamWidgets( testtype );
                       document.getElementById( "examContents" ).innerHTML = markupTheCards( NINFDATA, "" );
                       bindTheCards();
                    }); break;
      case "lesen": examWidgets( testtype, function(){ bindExamWidgets( testtype );
                       document.getElementById( "examPantalla" ).innerHTML =
                          displayPDFFile( HARDCODE.myurl, "pbyid&was=" + NINFDATA[0].dokum, DOCWIDTH, DOCHOEHE );
                    }); break;
      case "lista": examWidgets( testtype, function(){ bindExamWidgets( testtype );
                       document.getElementById( "examPantalla" ).innerHTML =
                          displayPDFFile( HARDCODE.myurl, "dopdf&was=" + NINFDATA[0].nidno, DOCWIDTH, DOCHOEHE );
                    }); break;
      case "watch": examWidgets( testtype, function(){ bindExamWidgets( testtype ); showYouTube(); }); break;
      case "mix1b":
      case "mix2b": WORKDATA = shuffleArray( VIELDATA ); SELECTED = 0, VIELDATA = {}, WAHLLIST = new Array();
                    examWidgets( testtype, function(){ bindExamWidgets( testtype ); getNextPair( testtype ); }); break;
      case "amend": if ( NINFDATA[0].ownid == USERINFO[0].uidno || ROOTUSER ) amendNotion( NINFDATA[0].nname );
                    else { landingPage(); showSupers(); } break;
      case "micro": if ( NINFDATA[0].ownid == USERINFO[0].uidno || ROOTUSER ) showSoundContribution();
                    else { landingPage(); showSupers(); } break;
      default: if ( testtype == "adept" ) { // fill in WORKDATA accordingly .. Formulations nor Pictions are masterable
                  if ( NINFDATA[0].forja || NINFDATA[0].picto){ clickNotiz( TRANSLAT.ispik ); return; }
                  onetoone = NINFDATA[1].qaimg;                  // Masterable IFF 1-1 Q-A. Repeated Q ==>> Non-masterable!
                  for ( i = 0; i < onetoone.length - 1; i++ )
                     for ( j = i + 1; j < onetoone.length; j++ )
                        if ( onetoone[i].a == onetoone[j].a ) { clickNotiz( TRANSLAT.xmstr ); return; }
                  tempo = shuffleArray( NINFDATA[1].qaimg );
                  for ( i = 0; i < tempo.length; i++ ) {         // order is reversed
                     WORKDATA[i] = {}; // Clean the possible enforced choices for backward tests
                     WORKDATA[i].q = getGoodChoice(tempo[i].a);  // forward tests need the data dirty
                     WORKDATA[i].a = tempo[i].q;
                     WORKDATA[i].i = tempo[i].i;
                  }
               } else if ( testtype == "learn" || NINFDATA[0].catno == "19" ) WORKDATA = NINFDATA[1].qaimg; // no shuffle
               else WORKDATA = shuffleArray( NINFDATA[1].qaimg );
               examWidgets( testtype, function (){ bindExamWidgets( testtype ); getNextPair(testtype); });
               break;
   }
}
function markupTheCards(nobj,cards2show){
   DEBUGGER?console.log("markupTheCards"):0;
   var TRESHOLD =   8,   // Length that spans card
       BABYFONT = 1.8,
       MAMAFONT = 3.0,
       mu = "", card, total, count, tacky, sound, imgid,
       frage, anser, theQ, theA, qFont, aFont;
   WORKDATA = shuffleArray( nobj[1].qaimg );
   total = cards2show != "" ? cards2show : WORKDATA.length;
   tacky = "<div class='notionary-exbutton fa fa-times'></div>";
   for ( card = 0; card < total; card++ ) {  // Generate a Flip-Card per QA Pair (Maybe Piction!)
      theQ  = getGoodChoice( WORKDATA[card].q ).toString();
      theA  = getGoodChoice( WORKDATA[card].a ).toString();
      qFont = theQ.length < TRESHOLD ? MAMAFONT : BABYFONT;
      aFont = theA.length < TRESHOLD ? MAMAFONT : BABYFONT;

      sound = WORKDATA[card].s ? " sndid='" + WORKDATA[card].s + "' ": "";
      count = "<div class='notionary-cardzahl'>" + parseInt(card+1) + "/" + WORKDATA.length + "</div>";
      frage = "<div class='notionary-cardtext'>" + theQ + "</div>";
      anser = "<div class='notionary-cardtext'>" + theA + "</div>";

      if ( nobj[0].picto ) { // Pictions MUST have an Image, and MAY have a Sound
         imgid = WORKDATA[card].i ? WORKDATA[card].i : ( nobj[0].nimag ? nobj[0].nimag : "101" );
         frage = "<img class='notionary-picimage' src='" + HARDCODE.image + imgid + "'>" ;
      }

      mu += "<section class='notionary-cardhold' " + sound + "title='" + TRANSLAT.fover + "'>" +
               "<div class='notionary-flipcard' qaIndex='" + card + "'>" +
                  "<figure style='font:normal normal 600 " + qFont + "em/100% Futura,sans-serif,monospace;' " +
                         " class='notionary-cardface'>" + count + tacky + frage +
                  "</figure>" +
                  "<figure style='font:normal normal 600 " + aFont + "em/100% Futura,sans-serif,monospace;' " +
                         " class='notionary-cardback'>" + count + tacky + anser +
                  "</figure>" +
               "</div>" +
            "</section>";
   }
   return(mu);
}
function bindTheCards(){
   DEBUGGER?console.log("[bindTheCards]"):0;
   var SHOWPCNT = 10,
       i, learned = 0, lrnPercent,  tacos, caras, backs;

   if ( SMARTFON ) SHOWPCNT = 20;

   tacos  = document.getElementsByClassName("notionary-exbutton");
   for ( i = 0; i < tacos.length; i++ )
      tacos[i].onclick = function( e ){
         lrnPercent = 100 * learned / WORKDATA.length;
         ausblenden( this.parentNode.parentNode.parentNode, 100, true );
         document.getElementById( "examLrnBarIn" ).style.setProperty("width", ( 100 * ++learned / WORKDATA.length)  + "%");
         if ( lrnPercent > SHOWPCNT ) document.getElementById( "examLrnCount" ).innerHTML = ( lrnPercent ).toFixed(0) + "%";
         if ( learned == WORKDATA.length ) window.location.href = HARDCODE.myurl + "?tun=trial&was=" + NINFDATA[0].nname;
         e.stopPropagation();
      }

   caras = document.getElementsByClassName( "notionary-cardface" );
   for ( i = 0; i < caras.length; i++ ) {
      caras[i].onclick = function( e ){
         if ( this.parentNode.parentNode.getAttribute("sndid") ) playByID( this.parentNode.parentNode.getAttribute("sndid") );
         cssTransform(this,"rotateY(180deg)");
         cssTransform(this.nextSibling, "rotateY(0deg)");
      }
   }

   backs = document.getElementsByClassName( "notionary-cardback" );
   for ( i = 0; i < backs.length; i++ )
      backs[i].onclick = function( e ){
         cssTransform(this,"rotateY(180deg)");
         cssTransform(this.parentNode.firstChild, "rotateY(0deg)");
      }

   // Do a flip-flop to ensure users get the idea
   setTimeout( function(){ caras[0].onclick(); },2000);
   setTimeout( function(){ backs[0].onclick(); },4000);
}
function getScoreToBeat(testtype){
   DEBUGGER?console.log("getScoreToBeat]"):0;
   switch ( testtype ) {
      case 'write': return( NINFDATA[0].scor2 ); break;
      case 'adept': return( NINFDATA[0].scor3 ); break;
      default : return( NINFDATA[0].scor1 ); break;
   }
}
function feedbackControl(talign,borde,msg,farbe){
   DEBUGGER?console.log("feedbackControl"):0;
   var xamfbk = document.getElementById( "examFeedback" );
   xamfbk.style.setProperty("text-align",talign,"important");
   xamfbk.style.setProperty("border",borde,"important");
   xamfbk.style.setProperty("z-index",999,"important");
   announce(xamfbk,msg,farbe);
   setTimeout(function(){
      xamfbk.style.setProperty("z-index",000,"important");
   },10000);
}
function computeScoreAndContinue(typed,anser,testtype){
   DEBUGGER?console.log("computeScoreAndContinue"):0;
   var FBAKTOUT = 5000,
       MARKELEN = 20,
       rottgrun = "Grun", grade, dauer, xamleven, xamanser, marquee;

   clearTimeout( FBAKTOUT );
   anser = getGoodChoice(anser); // Redefine answer if we have forced choices
   xamleven = document.getElementById( "examLevenpct" );
              if ( xamleven ) xamleven.style.visibility = "hidden";
   xamanser = document.getElementById( "examRisposta" );
   if ( typed == "X" &&  anser == "Y" ) TIMEOUTS++; else TIMEOUTS = 0;
   if ( typed == anser ) KORREKTE++;
   else {
      if ( anser == "Y" ) anser = WORKDATA[ THEINDEX ].a; // Prevent Y showing on a timeout
      rottgrun = "Rojo";
      if ( xamanser ) xamanser.focus();
      MISTAKES[FALSCHER] = WORKDATA[ THEINDEX ].q;  // server flips this in case testtype is master
      FALSCHER++;


                                       // Set up the Marquee and shorten if necessary, SMARTFON sees only answer
      marquee                        = "<markee>";
      if ( !SMARTFON )        marquee +=    "<span style='color:red'>" +
                                             WORKDATA[ THEINDEX ].q.kurzen( MARKELEN ) +
                                          "</span> ➾  ";
                            marquee +=    "<span style='color:green'>" +
                                             getGoodChoice( WORKDATA[ THEINDEX ].a ) +
                                          "</span>" +
                                       "</markee>";

                                       // Special case of Marquee for Pictions.
      if ( NINFDATA[0].picto ) marquee  = "<markee>" + WORKDATA[ THEINDEX ].q +  "</markee>";

      // Visual Feedback of Error and Correct Answer
      feedbackControl("right","none", marquee, "");
      FBAKTOUT = setTimeout(function(){feedbackControl("left","none","",""); }, FBAKTOUT);

      // Auditory Feedback of Error and Correct Answer
      if ( !NINFDATA[0].picto && testtype == "trial" && WORKDATA[ THEINDEX ].s )
         playByID( WORKDATA[ THEINDEX ].s );
      else playByID(2);
   }

   THEINDEX++;   // compute score and time taken
   updateProgressbars(rottgrun);

   if ( THEINDEX < WORKDATA.length ) getNextPair(testtype);
   else { // we have finished the test, now let's egg user on to continue
      clearInterval( ENERGIZE );
      grade = Math.floor( Math.round( parseFloat( 10000 * KORREKTE / THEINDEX ) ) )/100;
      dauer = Math.floor( ( new Date().getTime() - TESTTIME ) / 1000 );
      concludeTest( testtype, KORREKTE, grade, dauer, MISTAKES );
   }
}
function shuffleArray(oriAR){
   DEBUGGER?console.log("[shuffleArray]"):0;
   var r, i, j, k, nextK, count = 0,
       quele = new Array(); trget = new Array();
   for ( k in oriAR) if ( oriAR.hasOwnProperty( k ) ) count++;
   for ( i = 0; i < count; i++ ) quele[i] = oriAR[i];               // leave oriAr intact
   for ( i = 0; i < count; i++ ){                                   // randomly move Quelle->Target
      r = ( Math.floor( Math.random() * ( count - i )));
      if ( quele[r] ) { trget[i] = quele[r]; delete quele[r]; }
   }                                                                // repeated r-hits cause gaps in trget[]
   for ( j = 0; j < count; j++ )                                    // fill in the gaps in trget[]
      if ( !trget[j] ) {                                            // here is a gap
         for ( k = 0; k < count; k++ )                              // find a quele datapoint
            if ( quele[k] ) { nextK = k; break; }                   // got it
         trget[j] = quele[nextK];
         delete quele[nextK];
      }
   return( trget );
}
function randomizeTheseXoices(answer){
   DEBUGGER?console.log("[randomizeTheseXoices]"):0;
   var DUMMYVAL = "FOOPLE GOOPLE",
       einAR = answer.toString().split( CHOIXSEP ),
       sourceIndex = 0, ausAR = new Array(), movingItem, i, randomPlace;

   if ( einAR.length < CHOIXMIN ) { clickNotiz( TRANSLAT.enuff ); }

   for ( i = 0; i < einAR.length; i++ ) ausAR[i] = DUMMYVAL;       // Initialize the target array with random garbage

   while ( einAR.length - sourceIndex ) {                           // From source(linearly) to target(randomly)
      movingItem = einAR[sourceIndex];
      randomPlace = parseInt( Math.random() * ausAR.length );
      while ( ausAR[randomPlace] != DUMMYVAL )                     // Keep looking for an empty new place
         randomPlace = parseInt( Math.random() * ausAR.length );
      ausAR[randomPlace] = movingItem; 
      sourceIndex++;
   }
   return(ausAR);
}
function generateUniqeRandomAnswers(anser,optns){
   DEBUGGER?console.log("[generateUniqeRandomAnswers]"):0;
   var i, j, rndno, rndAR = new Array(), retAR = new Array();
   for ( i = 0; i < optns; i++ ) rndAR[i] = -1;                     // initialize with garbage
   i = 0; while ( i < optns ) {                                     // pick n="optns" random answers from notion
      rndno = parseInt( Math.random() * WORKDATA.length );
      if ( getGoodChoice( WORKDATA[rndno].a) != anser )                 // picked a different one?
         for ( j = 0; j <= i; j++ ){                                // fill the next available slot
            if ( rndAR[j] == rndno ) { break; }                     // skip this used up slot
            if ( ( rndAR[j] != rndno ) && (rndAR[j] == -1) ) {      // use this slot
               rndAR[j] = rndno;
               i++; break
            }
         }
   }
   for ( i = 0; i <= optns; i++ ) retAR[i] = -1;                    // prepare "retAR" with garbage
   rndno = parseInt( Math.random() * optns );                       // randomly place answer somewhere
   retAR[rndno] = anser;
   i = 0; j = 0; while ( i <= optns ) {                             // move choices from rndAR -> retAR
      if ( ( retAR[i] != anser ) && ( retAR[i] == -1 ) )
         retAR[i] = getGoodChoice( WORKDATA[ rndAR[j] ].a);               // if "anser" pops up, put at end and never revisit it
      else { retAR[optns] = getGoodChoice( WORKDATA[ rndAR[j] ].a); j--; }
      i++; j++;
   }
   return(retAR);
}
function showMultipleChoices(testtype){ // Watch out for "￭" Block separator
   DEBUGGER?console.log("[showMultipleChoices]"):0;
   var i, mulxoices, xoibtns, xamanser,
       rdmAR = new Array();                                         // Array of randomized Xoices(￭) or Answers

   mulxoices = document.getElementById( "examMultiple" ); mulxoices.innerHTML = "";
   xamanser  = document.getElementById( "examRisposta" );

   // Check for choices separator. Finding one is no guarantee that the string is sane
   if ( WORKDATA[ THEINDEX ].a.toString().indexOf( CHOIXSEP ) > 0 )
      rdmAR = randomizeTheseXoices( WORKDATA[ THEINDEX ].a );
   else rdmAR = generateUniqeRandomAnswers( WORKDATA[ THEINDEX ].a, CHOIXMIN - 1 );

   rdmAR.sort( function( a, b ){ return b.length - a.length; } );

   for ( i = 0; i < CHOIXMIN; i++ )                                // choices-1 randm + answer
      mulxoices.innerHTML += "<button id='reco" + i + "' class='notionary-examwahl'>" + rdmAR[i] + "</button>";
   xoibtns = document.getElementsByClassName( "notionary-examwahl" );
   for ( i = 0; i < xoibtns.length; i++ )
      xoibtns[i].onclick = function(e){
         // Button's text(), or html() of the <span>'s inner for Formulations
         var clickedText, clickedHTML, clickedChoice;
         clickedText = this.innerHTML;
         clickedHTML = clickedText.replace("⁄","&frasl;");
         clickedChoice = clickedText;
         if ( NINFDATA[0].forja ) clickedChoice = clickedHTML;
         computeScoreAndContinue( clickedChoice, WORKDATA[ THEINDEX ].a, testtype);
         if ( xamanser ) xamanser.focus();
      }
}
function showStandardizedTests(testtype){
   DEBUGGER?console.log("[showStandardizedTests]"):0;
   var i, xoice, mu = "", alfa8 = "ABCDEFGH", mulxoices, xoibtns;
   mulxoices   = document.getElementById( "examMultiple" );
   xoice = WORKDATA[ THEINDEX ].q.substr(0,1); // first char=# choices or q=4
   if ( xoice == "q" ) xoice = 4;
   for ( i = 0; i < xoice; i++ )
      mu += "<button id='reco" + i + "' class='notionary-examwahl'>" +
               alfa8.substr(i,1) + "</button>\n";
   mulxoices.innerHTML = mu;
   xoibtns = document.getElementsByClassName( "notionary-examwahl" );
   for ( i = 0; i < xoibtns.length; i++ )
      xoibtns[i].onclick = function(e){
      computeScoreAndContinue( WORKDATA[ THEINDEX ].a.toLowerCase(), this.innerHTML.toLowerCase(), testtype);
   }
}
function getNextPair(testtype){
   DEBUGGER?console.log("[getNextPair]"):0;
   var DESKQLEN =  20,    MOBIQLEN =  12,   // Length that exhausts width
       BABYFONT = 3.0,    MAMAFONT = 4.5,   // Desktop + iPads
       TINYMOBI = 1.5,    HUGEMOBI = 2.5,   // Mobiles
       imsrc        = HARDCODE.image + "101",
       frage, fsize, nextq = "", 
       xamanser, xamqtext, xampicto, xamimage;
   if ( NINFDATA[0].nimag ) imsrc = HARDCODE.image + NINFDATA[0].nimag,
   xamanser  = document.getElementById( "examRisposta" );
   xamqtext  = document.getElementById( "examPregunta" );
   xampicto  = document.getElementById( "examPantalla" );
   xamimage  = document.getElementById( "examImagenes" );

   nextq = WORKDATA[ THEINDEX ].q;
   fsize = nextq.length > DESKQLEN ? BABYFONT : MAMAFONT;
   if ( SMARTFON ) fsize = nextq.length > MOBIQLEN ? TINYMOBI : HUGEMOBI;

   if ( !NINFDATA[0].picto ) 
      xamqtext.style.cssText = "font:normal normal 500 " + fsize + "em/110% Futura, sans-serif,monospace;";

   switch( testtype ) {
      case "learn": case "trial": case "mix1b":
         if ( NINFDATA[0].catno == "19" ) showStandardizedTests(testtype); else showMultipleChoices(testtype);
         if ( ( testtype == "learn" || NINFDATA[0].picto ) && WORKDATA[ THEINDEX ].s ) playByID( WORKDATA[ THEINDEX ].s);
         break;
      case "write": case "adept": case "mix2b":
         LVPRCENT = 0, LVTARGET = getRidOfFluff( getGoodChoice( WORKDATA[ THEINDEX ].a ) );
         if ( NINFDATA[0].picto && WORKDATA[ THEINDEX ].s ) playByID( WORKDATA[ THEINDEX ].s );
         break;
   }
   xamqtext.innerHTML = nextq;
   if ( xamanser )  xamanser.value = "";
   if ( testtype == "adept" ) frage = WORKDATA[ THEINDEX ].a; else frage = WORKDATA[ THEINDEX ].q;
   if ( NINFDATA[0].picto && WORKDATA[ THEINDEX ].i ) {
      imsrc = HARDCODE.image + WORKDATA[ THEINDEX ].i;
      xampicto.innerHTML = "<img id='examImagenes' src='" + imsrc + "'>";
   } else ausblenden(xampicto,10,true);

   clearInterval( ENERGIZE );
   if ( TIMEOUTS < MAXTOUTS ) {
      DECILEFT = 1000 * QUESTIME;
      ENERGIZE = setInterval("updateEnergizer('" + testtype + "')",10);
   } else nentr(); 
}
function updateEnergizer(testtype){
   DEBUGGER?console.log("[updateEnergizer]"):0;
   var deciseks, lifepcnt, xamqtext;

   DECILEFT -= 10;
   deciseks  = document.getElementById( "examLifeleft" );
   xamqtext  = document.getElementById( "examPregunta" );
   lifepcnt  = DECILEFT / ( 10 * QUESTIME );
   
   deciseks.style.setProperty( "width", lifepcnt +"%" );
   if ( DECILEFT <= 10 ) computeScoreAndContinue("X","Y",testtype); // force wrong Q=X, A=Y
   if ( lifepcnt <= 50 ) {  deciseks.style.setProperty("background", "#E78F08" );
      if ( lifepcnt <= 20 ) deciseks.style.setProperty("background", "#FF0000" );
   } else                   deciseks.style.setProperty("background", "#2B7930" );
   
}
function updateProgressbars(rottgrun){
   DEBUGGER?console.log("[updateProgressbars]"):0;
   var SHOWPCNT = 10,
       gutPercent = 100 * KORREKTE / WORKDATA.length,
       badPercent = 100 * FALSCHER / WORKDATA.length;

   if ( SMARTFON ) SHOWPCNT = 20;

   if ( rottgrun == "Rojo" ) blinkNode( document.getElementsByTagName("body")[0], "radRojo",true);
   document.getElementById( "examGutBarIn" ).style.setProperty("width",gutPercent + "%");
   if ( gutPercent > SHOWPCNT ) document.getElementById( "examGutCount" ).innerHTML = ( 100 * KORREKTE / WORKDATA.length ).toFixed(0) + "%";
   document.getElementById( "examBadBarIn" ).style.setProperty("width",badPercent + "%");
   if ( badPercent > SHOWPCNT ) document.getElementById( "examBadCount" ).innerHTML = ( 100 * FALSCHER / WORKDATA.length ).toFixed(0) + "%";
}
