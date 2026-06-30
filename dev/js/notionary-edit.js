function transcribe(){
   var editrack, node, fcle, cpos, olds, leng, novo;
   editrack = document.getElementById( "editTracking" );
   node = document.getElementById( editrack.innerHTML ),
   fcle = this.innerHTML,
   cpos = node.selectionStart,
   olds = node.value,
   leng = olds.length,
   novo = olds.substr(0,cpos) + fcle + olds.substr(cpos,leng);
   node.focus();
   node.value = novo;
   node.setSelectionRange(cpos+1,cpos+1);
   node.oninput();
}
function createNotionManually(){
   DEBUGGER?console.log("[createNotionManually]"):0;
   var DEFCATEG = 20,                // Others
       DEFSPEAK = USERINFO[0].ulang; // Use the User's Language by default
   if ( !USERINFO[0].uname ) { clickNotiz( TRANSLAT.logfn ); return false; }
   NINFDATA = {};
   MOREDATA = showNotionContents( DEFCATEG, "", "", DEFSPEAK, "");
   MOREDATA = showAddOneMoreButton( MOREDATA );
   showSubmitButton( "", MOREDATA, MOREDATA, "schaf");
}
function amendNotion(nname){
   DEBUGGER?console.log("[amend] nname="+nname):0;
   ISEXTANT = true;
   QAIMDATA = NINFDATA[1].qaimg;
   MOREDATA = showNotionContents( NINFDATA[0].catno, NINFDATA[0].nname, NINFDATA[0].ndesc, NINFDATA[0].tlang, QAIMDATA );
   MOREDATA = showAddOneMoreButton( MOREDATA );
   showSubmitButton( NINFDATA[0].nname, MOREDATA, QAIMDATA, "ander" );
}
function bindNotionEditInput(nodnm){
   DEBUGGER?console.log("[bindNotionEditInput]"):0;
   var deschars;
   deschars = document.getElementById( "editDesczahl" );
   nodnm.onkeydown = function(e){ var sofar; activateInput(this);
      if ( this.value.match(TRANSLAT.nndef) || this.value.match(TRANSLAT.nddef)) nodnm.value = ""; 
      sofar = this.value.length + 1; clearInput(this);
      if ( this.id == "editDesctext" ) deschars.innerHTML = NDESCREG[3] - sofar;
   }
}


function showEditInputDiv(nname,ndesc,namedesc,bindCBK){
   DEBUGGER?console.log("[showEditInputDiv]"):0;
   var ndmarkup, defvalue;

   if ( namedesc == "name" ) {
      ndmarkup  = "<span  id='editNnameTit'>" + TRANSLAT.nname + "</span>";
      if ( nname ) defvalue = nname; else defvalue = TRANSLAT.nndef; 
      ndmarkup += "<input id='editNnameTxt' value='" + defvalue + "'>";
      document.getElementById( "editNnameDiv" ).innerHTML = ndmarkup;
   }
   if ( namedesc == "desc" ) {
      ndmarkup  = "<span  id='editNdescTit'>" + TRANSLAT.ndesc +
                     "<span  id='editNdescLen'></span>" +
                  "</span>";
      if ( ndesc ) defvalue = ndesc; else defvalue = TRANSLAT.nddef; 
      ndmarkup += "<input id='editNdescTxt' value='" + defvalue + "'>";
      document.getElementById( "editNdescDiv" ).innerHTML = ndmarkup;
   }

   bindCBK();
}
function showPieceCheckbox(nname,bindCBK){
   DEBUGGER?console.log("[showPieceCheckbox]"):0;
   var cbmarkup = "";
   cbmarkup += "<span id='editPieceLabel'>" + TRANSLAT.piece + "</span>" +
               "<input type='checkbox' id='editPieceCbx'";
                  try { if ( NINFDATA[0].piece ) cbmarkup += " checked "; } catch(err){}
   cbmarkup += "/>" +
               "<label id='editPieceLabel' for='editPieceCbx'>" + TRANSLAT.yeses + "</label>"+
               "<span id='editPieceGui'></span>";

   document.getElementById( "editPieceDiv" ).innerHTML = cbmarkup;
   bindCBK();
}
function bindPieceCheckbox(){
   DEBUGGER?console.log("[bindPieceCheckbox]"):0;
   var NPARTMAX = 10,
       i, compibox, piecegui, pcmarkup, partikel, cardinal;
   compibox = document.getElementById( "editPieceCbx" );
   piecegui = document.getElementById( "editPieceGui" );

   if ( !compibox || !piecegui ) return;

   handlePiece = function(){
      pcmarkup = TRANSLAT.teile + "<select id='editPartWhich'>";
      for ( i = 1; i <= NPARTMAX; i++ ) {
         pcmarkup += "<option";
         if ( NINFDATA[0].parts == i ) pcmarkup += " selected ";
         pcmarkup += " value='" + i + "'>" + i + "</option>";
      }
      pcmarkup += "</select></div>";
      pcmarkup += TRANSLAT.outof + "<select id='editPartTotal'>";
      for ( i = 1; i <= NPARTMAX; i++ ) {
         pcmarkup += "<option";
         if ( NINFDATA[0].piece == i ) pcmarkup += " selected ";
         pcmarkup += " value='" + i + "'>" + i + "</option>";
      }
      pcmarkup += "</select></div>";
      piecegui.innerHTML = pcmarkup;

      partikel = document.getElementById( "editPartWhich" );
      cardinal = document.getElementById( "editPartTotal" );
      partikel.onchange = function(e){ var cette = this.value;
         seter("aapart","part",cette,"notionID",NINFDATA[0].nidno,
            function(){ NINFDATA[0].piece = cette; offNAJAX("seter"); });
      }
      cardinal.onchange = function(e){ var cette = this.value;
         seter("aapart","cardinality",cette,"notionID",NINFDATA[0].nidno,
            function(){ NINFDATA[0].parts = cette; offNAJAX("seter"); });
      }
   }

   if ( compibox.checked )  handlePiece(); 

   compibox.onchange = function(e){
      if ( this.checked ) handlePiece();
      else { piecegui.innerHTML = "";
         seter("aapart","","DELETE","notionID",NINFDATA[0].nidno,
         function(){ NINFDATA[0].piece = null; NINFDATA[0].parts = null; offNAJAX("seter"); });
      }
   }
}
function showEditSelector(nname,which,optslist,opchosen,bindCBK){
   DEBUGGER?console.log("[showEditSelector]"):0;
   var menumkup = "",
       lequelid = "",
       capiname = which.charAt(0).toUpperCase() + which.slice(1);
   
   menumkup +=  TRANSLAT[which] +
                "<select id='edit" + capiname + "Sel'>";
                   for ( x in optslist ) {
                      menumkup += "<option ";
                      if ( which == "katse" ) {
                         if ( katxy( optslist[ x ] ) == katxy( opchosen ) ) menumkup += "selected";
                         menumkup += " value='" +  katxy( optslist[ x ] ) + "'>"+ katxy( optslist[ x ] ) + "</option>";
                         lequelid = "editKatseDiv";
                      } else {
                         if ( optslist[ x ] == opchosen ) menumkup += "selected";
                         menumkup += " value='" +  optslist[ x ] + "'>"+ optslist[ x ] + "</option>";
                         lequelid = "editSperqDiv";
                      }
                   }
   menumkup +=  "</select>";
   document.getElementById( lequelid ).innerHTML = menumkup;
   bindCBK();
}
function showTargetFlags( deflingo ){
   DEBUGGER?console.log("[showTargetFlags]"):0;
   var langs = [["en","English"],["de","Deutsch"],["es","Español"],["fr","Français"],
                ["it","Italiano"],["pt","Português"],["ru","Русский"],["hu","Magyar"]],
       i, menumkup;
   menumkup = "<span id='editLangtit' title='" + TRANSLAT.tarla + "'>Answer language:</span>" +
              "<select id='editLangSel' title='" + TRANSLAT.tarla + "'>";
   for ( i = 0; i < langs.length; i++ )
      menumkup += "<option value='" + langs[i][0] + "'" + ( langs[i][0] == deflingo ? " selected" : "" ) + ">" + langs[i][1] + "</option>";
   menumkup += "</select>";
   document.getElementById( "editLanghtml" ).innerHTML = menumkup;
}
function flatCardRow( idx, total, q, a ){
   var isopt = ( idx >= CARDSMIN ),
       rowcls = isopt ? "notionary-qarow notionary-qaopt" : "notionary-qarow",
       optag  = isopt ? "<div class='notionary-optlabel'>optional</div>" : "";
   return( "<section class='" + rowcls + "' id='" + idx + "'>" +
              "<div class='notionary-qanum'>" + parseInt( idx + 1 ) + "/" + total + optag + "</div>" +
              "<textarea class='notionary-textarea notionary-pregunta' id='" + idx + "q'>" + ( q ? q : "" ) + "</textarea>" +
              "<textarea class='notionary-textarea notionary-risposta' id='" + idx + "a'>" + ( a ? a : "" ) + "</textarea>" +
              "<div class='fa fa-ellipsis-h notionary-qadots' id='" + idx + "x'></div>" +
              "<div class='notionary-basurero fa fa-trash' title='" + TRANSLAT.dcard + "'></div>" +
           "</section>" );
}
function showAddOneMoreButton(qaiAR){
   DEBUGGER?console.log("[showAddOneMoreButton]"):0;
   var addonebtn = document.getElementById( "editExtrarow" ),
       qandafeld = document.getElementById( "editContents" ),
       basurita = "<div class='notionary-basurero fa fa-trash' title='" + TRANSLAT.dcard + "'></div>",
       contador, questext, resptext, ellipsis;

   addonebtn.onclick = function() {
      qaiAR[THEINDEX] = new Object(); qaiAR[THEINDEX].q = ""; qaiAR[THEINDEX].a = "";

      qandafeld.innerHTML += flatCardRow( THEINDEX, THEINDEX + 1, "", "" );

      bindTextAreas( qaiAR, THEINDEX++ );
      bindChoicesButtons();
   }
   return(qaiAR);
}
function showNotionContents(categ,nname,ndesc,tlang,qandatxt){
   DEBUGGER?console.log("[showNotionContents]"):0;
   var contador, questext, resptext, ellipsis, deletion,
       defqtime = DEFSPERQ,
       cartinas = nodelbtn = "",
       uploader = "<div id='editPasteWrap' style='text-align:center;'>" +
                     "<textarea id='editPasteBulk' rows='4' style='display:block;width:90%;max-width:640px;min-height:90px;margin:0.6em auto;' " +
                        "placeholder='Paste your list here, one pair per line:  question , answer   (or Tab / | / ; / &#8212;).  Pairs fill in automatically.'></textarea>" +
                  "</div>",
       basurita = "<div class='notionary-basurero fa fa-trash' title='" + TRANSLAT.dcard + "'></div>",
       qainhalt = new Array(),
       qalength = qandatxt.length ? qandatxt.length : CARDSPREFILL;

   for ( THEINDEX = 0; THEINDEX < qalength; THEINDEX++ ) { qainhalt[THEINDEX] = new Object();

      if ( qandatxt ) { // Ammending or Uploaded -->> Walk through QA list preparing each camera, speaker and image.
         qainhalt[THEINDEX].q = qandatxt[THEINDEX].q.sauber();
         qainhalt[THEINDEX].a = qandatxt[THEINDEX].a.sauber();
      } else qainhalt[THEINDEX].q = qainhalt[THEINDEX].a = "";   // Manualy Writing

      cartinas += flatCardRow( THEINDEX, qalength, qainhalt[THEINDEX].q, qainhalt[THEINDEX].a );
   }

   if ( ISEXTANT ) {
      nodelbtn = "<button id='editDeletion'><span class='fa fa-check'></span>" + TRANSLAT.delek + "</button>";
      defqtime = NINFDATA[0].sperq ? NINFDATA[0].sperq : DEFSPERQ;
   }

   document.body.innerHTML = 
      "<div id='editControls'>" +
            "<div id='editExitante' class='notionary-exbutton fa fa-times'></div>" +
            "<div id='editNnameDiv'></div>" +
            "<div id='editNdescDiv'></div>" +
            "<div id='editMetadata'>" +
               "<div id='editKatseDiv'></div>" +
               "<div id='editSperqDiv'></div>" +
               "<div id='editLanghtml'></div>" +
               "<div id='editPieceDiv'></div>" +
               "<div id='editTracking' class='notionary-tracking'>0q</div>" +
               "<div id='editActions'>" +
                  "<button id='editExtrarow'><span class='fa fa-plus'> </span>" + TRANSLAT.nocht + "</button>" +
                  "<button id='editSubmiter'><span class='fa fa-check'></span>" + TRANSLAT.savit + "</button>" + nodelbtn +
               "</div>" +
            "</div>" +
      "</div>" +
      "<div id='editChoosing'></div>" +
      "<div id='editContents'>" + uploader + cartinas + "</div>";

   showTargetFlags( tlang );

   if ( !qandatxt ) bindPasteBulk( qainhalt );  // Manually Writing -- client-side paste-bulk import

   document.getElementById( "editExitante" ).onclick = function(e){ ISEXTANT = false; landingPage(); showSupers(); }

   showEditInputDiv(nname,ndesc,"name",function(){ 
      document.getElementById( "editNnameTxt" ).onkeydown = function(e){ activateInput(this);
         if ( this.value.match( TRANSLAT.nndef ) ) this.value = "";
      }
   });

   showEditInputDiv(nname,ndesc,"desc",function(){
      document.getElementById( "editNdescTxt" ).onkeydown = function(e){ activateInput(this);
         if ( this.value.match( TRANSLAT.nddef ) ) this.value = "";
         document.getElementById( "editNdescLen" ).innerHTML = NDESCREG[3] - this.value.length + 1;
      }
   });

   showEditSelector(nname,"sperq",[10,15,30,60,120],defqtime,function(){ });

   showEditSelector(nname,"katse",SERVINFO[0].katse,categ,function(){ });

   if ( ISEXTANT ) {
      showPieceCheckbox(nname,bindPieceCheckbox);

      deletion = document.getElementById( "editDeletion" );
      deletion.onclick = function(e){ 
         notindx  = NINFDATA[0].nidno;
         confoNotiz( TRANSLAT.nodel, TRANSLAT.delek, TRANSLAT.deldn,
            function() { },
            function() {
               onNAJAX("nodel");
               httpost("usrindex.php","tun=nodel&was=" + notindx ).then(
                  function( response ){ NINFDATA = {};
                     jasonUINFO( function(){ landingPage(); showSupers(); }, true );
                     jasonSINFO( USERINFO[0].ulang, 0, true );
                     offNAJAX("nodel");
                  },
                  function( error ) { clickNotiz( error ); }
               );
            }
         );
      }
   }

   bindTextAreas( qainhalt, 0 );
   bindChoicesButtons();
   return(qainhalt);
}
function bindPasteBulk( qaiAR ){
   DEBUGGER?console.log("[bindPasteBulk]"):0;
   var box = document.getElementById( "editPasteBulk" );
   if ( !box ) return;
   box.onpaste = function(e){
      setTimeout( function(){                                   // let the browser drop the pasted text in first
         var raw = box.value.split( /\r?\n/ ),
             parsed = [], i, s, line, sep, q, a, at,
             seps = [ "\t", " | ", " \u2014 ", " - ", ";", ", ", "," ];
         for ( i = 0; i < raw.length; i++ ) {
            line = raw[i]; if ( !line.trim() ) continue;
            sep = null;
            for ( s = 0; s < seps.length; s++ ) if ( line.indexOf( seps[s] ) > 0 ) { sep = seps[s]; break; }
            if ( !sep ) continue;                               // no recognizable separator -> skip line
            at = line.indexOf( sep );
            q  = line.substring( 0, at ).trim();
            a  = line.substring( at + sep.length ).trim();
            if ( q && a ) parsed.push( { "q": q, "a": a } );
         }
         if ( !parsed.length ) return;                          // nothing parseable; leave the box for the user
         var nn = document.getElementById( "editNnameTxt" ).value,
             nd = document.getElementById( "editNdescTxt" ).value,
             cc = document.getElementById( "editKatseSel" ).value,
             tl = document.getElementById( "editLangSel" ).value;
         MOREDATA = showNotionContents( cc, nn, nd, tl, parsed );   // re-render the editor populated
         MOREDATA = showAddOneMoreButton( MOREDATA );
         showSubmitButton( "", MOREDATA, MOREDATA, "schaf" );
      }, 0 );
   }
}
function bindTextAreas( qainhalt, highlite ){
   DEBUGGER?console.log("[bindTextAreas]"):0;
   var i, editrack, garbages, textares;
   editrack = document.getElementById( "editTracking" );
   textares = document.getElementsByClassName( "notionary-textarea" );

   for ( i = 0; i < textares.length; i++ ) textares[i].onkeyup = function(e){ var typed = this.value;
      if ( typed.substr( typed.length - 1, 1 ).issane( QANDAREG[0] ) ) { // reject problem metachars
         this.value = typed.match( QANDAREG[1] );
      }
   } // Capture changes to either Q or A
   for ( i = 0; i < textares.length; i++ ) textares[i].oninput = function(e){
      var currentq, currenta, quesnode, rispnode, meinzahl;
      meinzahl = this.parentNode.id;                                  // -qarow
      quesnode = document.getElementById( meinzahl + "q" );
      rispnode = document.getElementById( meinzahl + "a" );
      currentq = quesnode.value; currenta = rispnode.value;

      try { if ( NINFDATA[0].picto ) currentq = currenta; } catch(err){}          // pictions Qs slaves to As. try fails if new notion
      if ( qainhalt[meinzahl].q != currentq ) { qainhalt[meinzahl].q = currentq; }
      if ( qainhalt[meinzahl].a != currenta ) { qainhalt[meinzahl].a = currenta; }
      colorById( this, "radTang" );
   }  // Track focused row for the accented-char keyboard
   for ( i = 0; i < textares.length; i++ ) textares[i].onfocus = function(){
      editrack.innerHTML = this.id;
   }
   document.getElementById( highlite + "q" ).focus();

   garbages = document.getElementsByClassName( "notionary-basurero" );
   for ( i = 0; i < garbages.length; i++ ) garbages[i].onclick = function(e){
      e.stopPropagation();   cette = this;
      confoNotiz( TRANSLAT.qudel, TRANSLAT.delek, TRANSLAT.deldn,
         function() { },
         function() { var myparent = cette.parentNode;
            ausblenden(myparent,1000,true); qainhalt[myparent.id].q = qainhalt[myparent.id].a = "";
         }
      );
   }
}
function bindChoicesButtons(){
   DEBUGGER?console.log("[bindChoicesButtons]"):0;
   var xoipopup = document.getElementById( "editChoosing" ),
       tripdots = document.getElementsByClassName( "fa-ellipsis-h" );

   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=choiceAnswers").then(
      function(response){ xoipopup.innerHTML =  response; ausblenden(xoipopup,100,true); },
      function( error ) { clickNotiz( error ); }
   ).then(function(){
      for ( i = 0; i < tripdots.length; i++ ) {
         tripdots[i].onmouseover = function( e ){
            if ( !CHOIXHOV ) CHOIXHOV = setTimeout(function(){ CHOIXHOV = null; einblenden( xoipopup,200,"block"); },1000);
         }
         tripdots[i].onmouseout = function( e ){
            if ( CHOIXHOV ){ clearTimeout( CHOIXHOV ); CHOIXHOV = null; } else ausblenden( xoipopup,200,true);
         }
         tripdots[i].onclick = function( e ){ e.stopPropagation();  document.getElementById( this.id.slice(0,-1) + "a" ).value = TRANSLAT.xosen; }
      }
   }).then(function(){ offNAJAX("mudoc"); });
}
function thereAreChanges(ncold,spold,npold,nnold,ndold,newAR,oldAR,tlold){
   DEBUGGER?console.log("[thereAreChanges]"):0;
   var nccur = "", nncur = "", ndcur = "", gaton = "", tlnew, gibts = "",
       catsele, spqsele, notname, notdesc;
   catsele  = document.getElementById( "editKatseSel" );
   spqsele  = document.getElementById( "editSperqSel" );
   notname  = document.getElementById( "editNnameTxt" );
   notdesc  = document.getElementById( "editNdescTxt" );

   if ( catsele ) nccur = catsele.value;
   if ( spqsele ) spcur = spqsele.value;
   if ( notname ) nncur = notname.value;
   if ( notdesc ) ndcur = notdesc.value;
   try { gaton = katxy( ncold ); } catch(err){};
   tlnew = document.getElementById( "editLangSel" ).value;


   // Check all possible ways in which new data is extant
   if ( oldAR ) for ( x in oldAR ) if ( ( newAR[x].q != oldAR[x].q ) || ( newAR[x].a != oldAR[x].a ) ) { gibts = true; break; }
   if ( !oldAR && newAR ) for( x in newAR ) if ( newAR[x].q || newAR[x].a ){ gibts = true; break; } // any new QA ?
   if ( oldAR && ( newAR.length > oldAR.length ) ) gibts = true; // check if old Array was augmented
   if ( ( nccur != gaton ) || ( spcur != spold ) ||
        ( nncur != nnold ) || ( ndcur != ndold ) || ( tlnew != tlold ) ) gibts = true;

   if ( gibts ) return true; else return false;
}
function showSubmitButton(oldnn,newAR,oldAR,testtype){
   DEBUGGER?console.log("[showSubmitButton]"):0;
   var edisendo, catsele, spqsele, catnumb, notname, notdesc;
   edisendo = document.getElementById( "editSubmiter" );
   edisendo.onclick = function(e){ 
      notname  = document.getElementById( "editNnameTxt" );
      notdesc  = document.getElementById( "editNdescTxt" );
      catsele  = document.getElementById( "editKatseSel" );   catnumb  = categoryID ( catsele.value );
      spqsele  = document.getElementById( "editSperqSel" );

      sendToDB( notname.value, catnumb, spqsele.value, notdesc.value, newAR, oldAR, BROWSLAN, testtype); 
   }
}
function sendToDB(nncur,nccur,spcur,ndcur,newAR,oldAR,slang,testtype){
   DEBUGGER?console.log("[sendToDB]"):0;
   var CHOIXMIN =  5,
       i, j, tlang,
       edit_NN, edit_ND, problema, problemq, 
       picto = false, sizeOfNewAR = 0;

   edit_NN  = document.getElementById( "editNnameTxt" );
   edit_ND  = document.getElementById( "editNdescTxt" );

   tlang = document.getElementById( "editLangSel" ).value;

   // Notion Name
   if ( nncur.match( TRANSLAT.nndef ) ) { nncur = ""; edit_NN.value = ""; }
   if ( !nncur.sizeok( NNAMEREG[2], NNAMEREG[3] ) ){ colorById(edit_NN,"radRojo"); clickNotiz( TRANSLAT.nname + " " + TRANSLAT.badsz ); return; }
   if ( !nncur.issane( NNAMEREG[0] ) ){ colorById(edit_NN,"radRojo"); clickNotiz( TRANSLAT.nname + " " + TRANSLAT.notre ); return; }

   // Notion Description
   if ( ndcur.match( TRANSLAT.nddef ) ) { ndcur=""; edit_ND.value = ""; }
   if ( !ndcur.sizeok( NDESCREG[2], NDESCREG[3] ) ){ colorById(edit_ND,"radRojo"); clickNotiz( TRANSLAT.ndesc + " " + TRANSLAT.badsz ); return; }
   if ( !ndcur.issane( NDESCREG[0]) ){ colorById(edit_ND,"radRojo"); clickNotiz( TRANSLAT.ndesc + " : " + TRANSLAT.notre); return; }

   for ( i in newAR ){

      if ( typeof( newAR[i].q ) == 'undefined' ) newAR[i].q = ""; else newAR[i].q = newAR[i].q.trim();
      if ( typeof( newAR[i].a ) == 'undefined' ) newAR[i].a = ""; else newAR[i].a = newAR[i].a.trim();

      if ( ( newAR[i].q == "" ) && ( newAR[i].a == "" ) ) continue;
      else { if ( ( newAR[i].q != "" ) && ( newAR[i].a != "" ) ) sizeOfNewAR++;
         if ( !newAR[i].q.sizeok( 1, QANDAREG[3] ) ) {
            problemq = document.getElementById( i + "q" );
            clickNotiz(TRANSLAT.badsz); colorById( problemq,"radRojo");
            return;
         }
         if ( !newAR[i].a.sizeok( 1, QANDAREG[3] ) ) {
            problema = document.getElementById( i + "a" );
            clickNotiz(TRANSLAT.badsz); colorById( problema,"radRojo");
            return;
         }
         if ( newAR[i].q ) { // check extant question sanity
            if ( !newAR[i].q.issane( QANDAREG[0] ) ) {
               problemq = document.getElementById( i + "q" );
               clickNotiz(TRANSLAT.notre); colorById( problemq,"radRojo");
               return;
            }
         }
         if ( newAR[i].a ) { // check extant answer sanity
            if ( !newAR[i].a.issane( QANDAREG[0] ) ) {
               problema = document.getElementById( i + "a" );
               clickNotiz(TRANSLAT.notre); colorById( problema,"radRojo");
               return;
            }
            // Extra check for answers to enforce a minimum number of Chosen Choices
            if ( newAR[i].a.toString().indexOf( CHOIXSEP ) > 0 ) {
               allAnswers = newAR[i].a.toString().split( CHOIXSEP );
               if ( allAnswers.length < CHOIXMIN || // We must have Five non-empty choices
                  !allAnswers[0].length || !allAnswers[1].length || !allAnswers[2].length ||
                  !allAnswers[3].length || !allAnswers[4].length ){
                     problema = document.getElementById( i + "a" );
                     clickNotiz(TRANSLAT.enuff); colorById( problema,"radRojo");
                     return;
               }
            }
         }
         // avoid repeated Questions == multi-edit in MySQL!
         for ( j = 0; j < newAR.length; j++ ) {
            if ( i != j ){
               if ( ( newAR[i].q == newAR[j].q ) && ( newAR[i].q != "" ) ) {
                  problema = document.getElementById( i + "q" );
                  clickNotiz(TRANSLAT.wiedr); colorById( problema,"radRojo");
                  //colorById( document.getElementById(j+"a"),"radRojo");
                  return;
               }
            }
         }
      }
   }
   // Check if the Notion is too small
   if ( sizeOfNewAR < CARDSMIN ) { clickNotiz( TRANSLAT.small ); return; }
   if ( testtype == "schaf" ) nidno="";  // legacy code pre-superArrays
   if ( testtype == "ander" ) { // amending requires actual notion changes before amending
      if ( !thereAreChanges( NINFDATA[0].catno, NINFDATA[0].sperq, NINFDATA[0].picto,
                             NINFDATA[0].nname, NINFDATA[0].ndesc,
                             newAR, oldAR, NINFDATA[0].tlang ) ) { landingPage(); showSupers(); return; }
      else nidno = NINFDATA[0].nidno;
   }
   onNAJAX(testtype);
   httpost("usrindex.php","tun=" + testtype + "&was=" + JSON.stringify({
         "nidno":nidno, "nncur":nncur.escapo(), "spcur":spcur,
         "nccur":nccur, "ndcur":ndcur.escapo(),
         "newAR":newAR, "oldAR":oldAR,
         "slang":slang, "tlang":tlang, "picto":picto })).then(
      function( response ){ NINFDATA = {};
         jasonUINFO( function(){ landingPage(); showSupers(); }, true );
         jasonSINFO( USERINFO[0].ulang, 0, true );
      },
      function( error ) { clickNotiz( error ); }
   ).then( function(){ offNAJAX(testtype); } );
}
