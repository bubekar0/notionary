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
function showDokumCheckbox(nname,bindCBK){
   DEBUGGER?console.log("[showDokumCheckbox]"):0;
   var cbmarkup = "";
   cbmarkup += "<span id='editDokumLabel'>" + TRANSLAT.dokum + "</span>" +
               "<input type='checkbox' id='editDokumCbx'";
                  try { if ( NINFDATA[0].dokum ) cbmarkup += " checked "; } catch(err){}
   cbmarkup += "/>" +
               "<label id='editDokumLabel' for='editDokumCbx'>" + TRANSLAT.yeses + "</label>"+
               "<span id='editDokumGui'></span>";

   document.getElementById( "editDokumDiv" ).innerHTML = cbmarkup;
   bindCBK();
}
function bindDokumCheckbox(){
   DEBUGGER?console.log("[bindDokumCheckbox]"):0;
   var dokumbox, dokumgui;
   dokumbox = document.getElementById( "editDokumCbx" );
   dokumgui = document.getElementById( "editDokumGui" );

   if ( !dokumbox || !dokumgui ) return;

   handleDokum = function(){
      dokumgui.innerHTML = "<button id='editAmendPDF'>" +
                              "<span class='fa fa-file-pdf-o'></span>" + TRANSLAT.uload +
                           "</button>";
      document.getElementById( "editAmendPDF" ).onclick = function(e){
         zentraller("uploadPDF","<div class='notionary-phpUpload' id='pdphp'></div>",
            function(){ 
               ausblenden( document.getElementById( "uploadPDFZentralUser" ), 10, true );
               bindUploader("pd",NINFDATA[0].nname,"","","uploadPDFModalHold");
            },
            function(){ landingPage(); showSupers(); });
      }
   }

   if ( dokumbox.checked ) handleDokum();

   dokumbox.onchange = function(e){
      if ( this.checked ) handleDokum();
      else { dokumgui.innerHTML = "";
         if ( NINFDATA[0].dokum ) {
            seter("aapdf","","DELETE","pdfID",NINFDATA[0].dokum,function(){ 
               seter("aapdfid","","DELETE","notionID",NINFDATA[0].nidno,function(){
                  offNAJAX("seter"); NINFDATA[0].dokum = null; });
            });
         }
      }
   }
}
function showVideoCheckbox(nname,bindCBK){
   DEBUGGER?console.log("[showVideoCheckbox]"):0;
   var cbmarkup = "";
   cbmarkup += "<span id='editVideoLabel'>" + TRANSLAT.video + "</span>" +
               "<input type='checkbox' id='editVideoCbx'";
                  try { if ( NINFDATA[0].video ) cbmarkup += " checked "; } catch(err){}
   cbmarkup += "/>" +
               "<label id='editVideoLabel' for='editVideoCbx'>" + TRANSLAT.yeses + "</label>"+
               "<span id='editVideoGui'></span>";

   document.getElementById( "editVideoDiv" ).innerHTML = cbmarkup;
   bindCBK();
}
function bindVideoCheckbox(){
   DEBUGGER?console.log("[bindVideoCheckbox]"):0;
   var VIDEOURL = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/,
       DEFYTUBE ="YouTube URL ↵",
       videobox, videogui, ytubeurl;
   videobox = document.getElementById( "editVideoCbx" );
   videogui = document.getElementById( "editVideoGui" );

   if ( !videobox || !videogui ) return;

   handleVideo = function(){
      videogui.innerHTML = "<input id='editYTubeURL' value='" + (NINFDATA[0].video ? NINFDATA[0].video : DEFYTUBE) + "'>";
      einblenden( videogui,10,"inline-block" );

      ytubeurl = document.getElementById( "editYTubeURL" );
      ytubeurl.addEventListener("focus",function enfoque(){ 
         if ( this.value == DEFYTUBE ) this.value = "";        // clear default values
         this.removeEventListener("focus",enfoque, false);     // Prevent multiple firings
      },false);
      ytubeurl.onblur = function(e){ fireKey(this,13); }
      ytubeurl.onkeydown = function(e){ var typed, k = (e.keyCode ? e.keyCode : e.which); clearInput(this);
         if ( k == "13" || k == "9" ) {                        // process tab or enter keys only
            ytubeurl.onblur = null;                            // Prevent the Blur event being handled after hitting enter
            typed = this.value;                                // Video URL sanity
            if ( typed.issane( VIDEOURL ) && this.value != NINFDATA[0].video ) { //deactivateInput( this );
               seter("aavideo","video", this.value.replace('http:','https:'),"notionID",NINFDATA[0].nidno, function(){
                  popupFAI("fa-check","#4D90FE","1em");
                  onNAJAX("geter");
                  httpost("usrindex.php","tun=geter&was=" + JSON.stringify({
                     "secol": "video", "vonta": "aavideo",
                     "wocol": "notionID", "valis": NINFDATA[0].nidno })
                  ).then( function(response) {
                        NINFDATA[0].video = response;
                        ytubeurl.innerHTML = NINFDATA[0].video;
                     },function(error) { clickNotiz( error ); }
                  ).then( function(){ offNAJAX("geter"); } );
               });
            } else 
               videogui.innerHTML = "<input id='editYTubeURL' value='" + (NINFDATA[0].video ? NINFDATA[0].video : DEFYTUBE) + "'>";
         }
      }
   }

   if ( videobox.checked )  handleVideo(); 

   videobox.onchange = function(){
      if ( this.checked ) handleVideo();
      else { ausblenden(videogui);
         if ( NINFDATA[0].video ) seter("aavideo","","DELETE","notionID",NINFDATA[0].nidno,
               function(){ offNAJAX("seter"); NINFDATA[0].video = null; });
      }
   }
}
function showPictoCheckbox(nname,bindCBK){
   DEBUGGER?console.log("[showPictoCheckbox]"):0;
   var cbmarkup = "";
   cbmarkup += "<span id='editPictoLabel'>" + TRANSLAT.picto + "</span>" +
               "<input type='checkbox' id='editPictoCbx'";
                  try { if ( NINFDATA[0].picto ) cbmarkup += " checked "; } catch(err){}
   cbmarkup += "/>" +
               "<label id='editPictoLabel' for='editPictoCbx'>" + TRANSLAT.yeses + "</label>"+
               "<span id='editPictoGui'></span>";

   document.getElementById( "editPictoDiv" ).innerHTML = cbmarkup;
   bindCBK();
}
function bindPictoCheckbox(){
   DEBUGGER?console.log("[bindPictoCheckbox]"):0;
   var i, pictobox, pictogui, camerons, imagenes, questext;

   pictobox = document.getElementById( "editPictoCbx" );
   pictogui = document.getElementById( "editPictoGui" );
   camerons = document.getElementsByClassName("notionary-camarita");
   imagenes = document.getElementsByClassName("notionary-pictimag");
   questext = document.getElementsByClassName("notionary-pregunta");

   if ( !pictobox || !pictogui ) return;

   handlePicto = function(){
      pictogui.innerHTML = TRANSLAT.pikme;
      for ( i = 0; i < questext.length; i++ ) ausblenden( questext[i], 100, false );
      for ( i = 0; i < imagenes.length; i++ ) einblenden( imagenes[i], 100 );
      for ( i = 0; i < camerons.length; i++ ) einblenden( camerons[i], 100 );
   }

   if ( pictobox.checked ) handlePicto();

   try { if ( NINFDATA[0].picto ) handlePicto();
         else for ( i = 0; i < camerons.length; i++ ) ausblenden( camerons[i] , 100, false );
   } catch( err ){}

   pictobox.onchange = function(e){
      if ( this.checked ) handlePicto();
      else { pictogui.innerHTML = "";
         for ( i = 0; i < questext.length; i++ ) einblenden( questext[i], 100, "inline-block" );
         for ( i = 0; i < imagenes.length; i++ ) ausblenden( imagenes[i], 100, false );
         for ( i = 0; i < camerons.length; i++ ) ausblenden( camerons[i], 100, false );
      }
   }
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
   var enoption = deoption = esoption = froption = itoption = ptoption = ruoption = huoption = "",
       langhtml, flagclik, flagmenu, vanderas;

   enoption = "<div class='notionary-toolitem' language='en'><span class='notionary-englisch'></span> English   </div>";
   deoption = "<div class='notionary-toolitem' language='de'><span class='notionary-tedeschi'></span> Deutsch   </div>";
   esoption = "<div class='notionary-toolitem' language='es'><span class='notionary-spanisch'></span> Español   </div>";
   froption = "<div class='notionary-toolitem' language='fr'><span class='notionary-francais'></span> Français  </div>";
   itoption = "<div class='notionary-toolitem' language='it'><span class='notionary-italiano'></span> Italiano  </div>";
   ptoption = "<div class='notionary-toolitem' language='pt'><span class='notionary-portuges'></span> Português </div>";
   ruoption = "<div class='notionary-toolitem' language='ru'><span class='notionary-russians'></span> Pусский   </div>";
   huoption = "<div class='notionary-toolitem' language='hu'><span class='notionary-magyarul'></span> Magyar    </div>";

   langhtml = document.getElementById( "editLanghtml" );
   langhtml.innerHTML = "<img id='editLangflag' title='" + TRANSLAT.tarla + "' " +
                           " tgetlang='"+ deflingo + "' " +
                           " src='"+ HARDCODE.image + languageToImage( deflingo ) +
                        "'/>" +
                        "<div id='editLangmenu' class='notionary-tooltips'>" +
                           enoption + deoption + esoption + froption + 
                           itoption + ptoption + ruoption + huoption +
                        "</div>";

   flagclik = document.getElementById( "editLangflag" ); // Clickable to shide or show the Menu
   flagmenu = document.getElementById( "editLangmenu" ); // Container of Flag Menu HTML
   flagclik.onclick = function(e){ if ( flagmenu.style.display == "block" ) ausblenden(flagmenu,10,true); else einblenden(flagmenu); }

   vanderas = document.getElementsByClassName( "notionary-toolitem" );
   for ( i = 0; i < vanderas.length; i++ )
      vanderas[i].onclick = function( e ){
         e.preventDefault();
         ausblenden(flagmenu,10,true);
         document.getElementById( "editLangflag" ).setAttribute("src", HARDCODE.image + languageToImage( this.getAttribute("language") ) );
         document.getElementById( "editLangflag" ).setAttribute("tgetlang",this.getAttribute("language") );
      }
}
function showAddOneMoreButton(qaiAR){
   DEBUGGER?console.log("[showAddOneMoreButton]"):0;
   var addonebtn = document.getElementById( "editExtrarow" ),
       qandafeld = document.getElementById( "editContents" ),
       pictobox  = document.getElementById( "editPictoCbx" ),
       basurita = "<div class='notionary-basurero fa fa-trash' title='" + TRANSLAT.dcard + "'></div>",
       contador, questext, resptext, ellipsis,
       camarita = cardimag = parlante = "";

   addonebtn.onclick = function() {
      contador = "<div class='notionary-cardzahl'>" + parseInt( THEINDEX + 1 ) + "/" + parseInt( THEINDEX + 1 ) + "</div>",
      questext = "<textarea class='notionary-textarea notionary-pregunta' id='" + THEINDEX + "q'></textarea>",
      resptext = "<textarea class='notionary-textarea notionary-risposta' id='" + THEINDEX + "a'></textarea>",
      ellipsis = "<div class='fa fa-ellipsis-h'  id='" + THEINDEX + "x'></div>",
      qaiAR[THEINDEX] = new Object(); qaiAR[THEINDEX].q = ""; qaiAR[THEINDEX].a = "";

      if ( ISEXTANT ) {
         // SOUNDS -->> All Notions ( Piction or not ) can sound
         cardimag = "<img class='notionary-pictimag' src='" + HARDCODE.image + 166 + "'>";
         parlante = "<div style='color:#E78F08' class='notionary-speakers fa fa-play' id='" +
                        THEINDEX + "s' title='" + TRANSLAT.rcord + "'>" +
                     "</div>";
         // IMAGES -->> Only Pictions can show images -- Make icons available in case Piction is desired
         camarita = "<div style='color:#E78F08' class='notionary-camarita fa fa-camera' id='" +
                        THEINDEX + "i' title='" + TRANSLAT.qitxt + "'>" +
                     "</div>";
      }

      qandafeld.innerHTML += "<section class='notionary-cardhold' id='" + THEINDEX + "'>" +
                                "<div  class='notionary-flipcard' qaIndex='" + THEINDEX + "'>" +
                                   "<figure class='notionary-cardface'>" +
                                      //contador + camarita + parlante + questext + basurita +
                                      questext + contador + camarita + parlante + basurita +
                                   "</figure>" +
                                   "<figure class='notionary-cardback'>" +
                                      //contador + ellipsis + resptext +
                                      resptext + contador + ellipsis +
                                   "</figure>" +
                                "</div>" +
                             "</section>";

      if ( ISEXTANT ) { NINFDATA[1].qaimg[THEINDEX] = {};         // Need a dummy new entry for proper Media rebinding
         NINFDATA[1].qaimg[THEINDEX].q = TRANSLAT.qkopf;
         NINFDATA[1].qaimg[THEINDEX].a = TRANSLAT.akopf;
      }

      if ( pictobox.checked ) ausblenden( document.getElementById( THEINDEX + "q" ), 100, false);
      else ausblenden( document.getElementById( THEINDEX + "i" ), 100, false);
      bindTextAreas( qaiAR, THEINDEX++ );
      if ( ISEXTANT ) { bindSpeakerButtons(); handleImageUploads("qi"); } // Bump THEINDEX before rebinding Media
      bindChoicesButtons();
   }
   return(qaiAR);
}
function showNotionContents(categ,nname,ndesc,tlang,qandatxt){
   DEBUGGER?console.log("[showNotionContents]"):0;
   var contador, questext, resptext, ellipsis, nimgzahl, deletion,
       defqtime = DEFSPERQ,
       cartinas = cardimag = camarita = parlante = imaginer = nodelbtn = "",
       uploader = "<div id='csphp' class='notionary-phpUpload'></div>",
       basurita = "<div class='notionary-basurero fa fa-trash' title='" + TRANSLAT.dcard + "'></div>",
       qainhalt = new Array(),
       qalength = qandatxt.length ? qandatxt.length : CARDSMIN;

   for ( THEINDEX = 0; THEINDEX < qalength; THEINDEX++ ) { qainhalt[THEINDEX] = new Object();

      if ( qandatxt ) { // Ammending or Uploaded -->> Walk through QA list preparing each camera, speaker and image.
         qainhalt[THEINDEX].q = qandatxt[THEINDEX].q.sauber();
         qainhalt[THEINDEX].a = qandatxt[THEINDEX].a.sauber();
         cardimag = "";

         if ( ISEXTANT ) {
            // SOUNDS -->> All Notions ( Piction or not ) can sound
            parlante = "<div style='color:#E78F08' class='notionary-speakers fa fa-play' id='" +
                          THEINDEX + "s' title='" + TRANSLAT.rcord + "'>" +
                       "</div>";
            if ( qandatxt[THEINDEX].s ) { // A sound is extant -->> show image of speaker and blue icon
               cardimag = "<img class='notionary-pictimag' src='" + HARDCODE.image + 166 + "'>";
               parlante = "<div style='color:#4D90FE' class='notionary-speakers fa fa-play' id='" +
                             THEINDEX + "s' title='" + TRANSLAT.rcord + "'>" +
                          "</div>";
            }

            // IMAGES -->> Only Pictions can show images -- Make icons available in case Piction is desired
            camarita = "<div style='color:#E78F08' class='notionary-camarita fa fa-camera' id='" +
                          THEINDEX + "i' title='" + TRANSLAT.qitxt + "'>" +
                       "</div>";

            if ( qandatxt[THEINDEX].i ) { // An image is extant -->> show it and blue icon
               camarita = "<div style='color:#4D90FE' class='notionary-camarita fa fa-camera' id='" +
                             THEINDEX + "i' title='" + TRANSLAT.qitxt + "'>" +
                          "</div>";
               cardimag = "<img class='notionary-pictimag' " +  // Randomize source for easy image editing
                             " src='" + HARDCODE.image + qandatxt[THEINDEX].i + "&r=" + Math.random( )* 100 +
                          "'>";
            } 
         }
      } else qainhalt[THEINDEX].q = qainhalt[THEINDEX].a = "";   // Manualy Writing

      contador = "<div class='notionary-cardzahl'>" + parseInt( THEINDEX + 1 ) + "/" + qalength + "</div>";
      questext = "<textarea class='notionary-textarea notionary-pregunta' id='" + THEINDEX + "q'>" + qainhalt[THEINDEX].q + "</textarea>";
      resptext = "<textarea class='notionary-textarea notionary-risposta' id='" + THEINDEX + "a'>" + qainhalt[THEINDEX].a + "</textarea>";
      ellipsis = "<div class='fa fa-ellipsis-h'  id='" + THEINDEX + "x'></div>";

      cartinas += "<section class='notionary-cardhold' id='" + THEINDEX + "'>" +
                     "<div  class='notionary-flipcard' qaIndex='" + THEINDEX + "'>" +
                        "<figure class='notionary-cardface'>" +
                           //contador + camarita + cardimag + parlante + questext + basurita +
                           questext + contador + camarita + cardimag + parlante + basurita +
                        "</figure>" +
                        "<figure class='notionary-cardback'>" +
                           //contador + ellipsis + resptext +
                           resptext + contador + ellipsis +
                        "</figure>" +
                     "</div>" +
                  "</section>";
   }

   if ( ISEXTANT ) {
      nimgzahl = NINFDATA[0].nimag ? NINFDATA[0].nimag : 101 + "&r=" + Math.random() * 100;  
      imaginer = "<img id='editHauptImg' notimage='" + nimgzahl + "' src='" + HARDCODE.image + nimgzahl + "'/>";
      nodelbtn = "<button id='editDeletion'><span class='fa fa-check'></span>" + TRANSLAT.delek + "</button>";
      defqtime = NINFDATA[0].sperq ? NINFDATA[0].sperq : DEFSPERQ;
   }

   document.body.innerHTML = 
      "<div id='editControls'>" +
            "<div id='editExitante' class='notionary-exbutton fa fa-times'></div>" + imaginer +
            "<div id='editNnameDiv'></div>" +
            "<div id='editNdescDiv'></div>" +
            "<div id='editMetadata'>" +
               "<div id='editKatseDiv'></div>" +
               "<div id='editSperqDiv'></div>" +
               "<div id='editDokumDiv'></div>" +
               "<div id='editVideoDiv'></div>" +
               "<div id='editPieceDiv'></div>" +
               "<div id='editPictoDiv'></div>" +
               "<div id='editTracking' class='notionary-tracking'>0q</div>" +
            "</div>" +
            "<div id='editLanghtml'></div>" + uploader +
            "<button id='editExtrarow'><span class='fa fa-plus'> </span>" + TRANSLAT.nocht + "</button>" +
            "<button id='editSubmiter'><span class='fa fa-check'></span>" + TRANSLAT.savit + "</button>" + nodelbtn +
      "</div>" +
      "<div id='editChoosing'></div>" +
      "<div id='editContents'>" + cartinas + "</div>";

   showTargetFlags( tlang );

   if ( !qandatxt ) bindUploader("cs","","","","");  // Manually Writing or will Upload

   document.getElementById( "editExitante" ).onclick = function(e){ ISEXTANT = false; landingPage(); showSupers(); }

   if ( imaginer ) document.getElementById( "editHauptImg" ).onclick = function(e){ handleImageUploads("ni"); }
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
      showDokumCheckbox(nname,bindDokumCheckbox);
      showVideoCheckbox(nname,bindVideoCheckbox);
      showPieceCheckbox(nname,bindPieceCheckbox);
      bindSpeakerButtons();
      handleImageUploads("qi");
       
      deletion = document.getElementById( "editDeletion" );
      deletion.onclick = function(e){ 
         notindx  = NINFDATA[0].nidno;
         confoNotiz( TRANSLAT.nodel, TRANSLAT.delek, TRANSLAT.deldn,
            function() { },
            function() {
               onNAJAX("nodel");
               httpost("usrindex.php","tun=nodel&was=" + notindx ).then(
                  function( response ){ NINFDATA = {};
                     jasonUINFO( function(){ landingPage(); showSupers(); } );
                     jasonSINFO( USERINFO[0].ulang, 0 );
                     offNAJAX("nodel");
                  },
                  function( error ) { clickNotiz( error ); }
               );
            }
         );
      }
       
   }
   showPictoCheckbox(nname,bindPictoCheckbox);



   bindTextAreas( qainhalt, 0 );
   bindChoicesButtons();
   return(qainhalt);
}
function bindTextAreas( qainhalt, highlite ){
   DEBUGGER?console.log("[bindTextAreas]"):0;
   var i, editrack, 
       garbages, textares, tripdots, caras, backs;
   editrack = document.getElementById( "editTracking" );
   tripdots = document.getElementsByClassName( "fa-ellipsis-h" );
   textares = document.getElementsByClassName( "notionary-textarea" );

   for ( i = 0; i < textares.length; i++ ) textares[i].onkeyup = function(e){ var typed = this.value;
      if ( typed.substr( typed.length - 1, 1 ).issane( QANDAREG[0] ) ) { // reject problem metachars
         this.value = typed.match( QANDAREG[1] ); 
      }
   } // Capture changes to either Q or A
   for ( i = 0; i < textares.length; i++ ) textares[i].oninput = function(e){
      var currentq, currenta, nagyoppa, quesnode, rispnode, meinzahl;
      meinzahl = this.parentNode.parentNode.parentNode.id;             // -cardhold

      nagyoppa = this.parentNode.parentNode;                           // -flipcard
      quesnode = nagyoppa.firstChild.firstChild;
      rispnode = nagyoppa.firstChild.nextSibling.firstChild;
      currentq = quesnode.value; currenta = rispnode.value;

      try { if ( NINFDATA[0].picto ) currentq = currenta; } catch(err){}          // pictions Qs slaves to As. try fails if new notion
      if ( qainhalt[meinzahl].q != currentq ) { qainhalt[meinzahl].q = currentq; }
      if ( qainhalt[meinzahl].a != currenta ) { qainhalt[meinzahl].a = currenta; }
      colorById( this, "radTang" );
   }  // Highlight focused card
   for ( i = 0; i < textares.length; i++ ) textares[i].onfocus = function(){
      editrack.innerHTML = this.id; activeta = document.getElementById( this.id );
      activeta.style.opacity = 1; activeta.style.filter  = "alpha(opacity=100)";
   } // Lowlight blurred cards
   for ( i = 0; i < textares.length; i++ ) textares[i].onblur = function(){
      activeta = document.getElementById( this.id );
      activeta.style.opacity = 0.4; activeta.style.filter  = "alpha(opacity=40)";
   }
   document.getElementById( highlite + "q" ).focus();

   garbages = document.getElementsByClassName( "notionary-basurero" );
   for ( i = 0; i < garbages.length; i++ ) garbages[i].onclick = function(e){
      e.stopPropagation();   cette = this;
      confoNotiz( TRANSLAT.qudel, TRANSLAT.delek, TRANSLAT.deldn,
         function() { },
         function() { var myparent = cette.parentNode.parentNode.parentNode; 
            ausblenden(myparent,1000,true); qainhalt[myparent.id].q = qainhalt[myparent.id].a = "";
         }
      );
   }

   caras = document.getElementsByClassName( "notionary-cardface" );
   for ( i = 0; i < caras.length; i++ )
      caras[i].onclick = function( e ){
         cssTransform(this,"rotateY(180deg)");
         cssTransform(this.parentNode.firstChild.nextSibling,"rotateY(0deg)");
      }

   backs = document.getElementsByClassName( "notionary-cardback" );
   for ( i = 0; i < backs.length; i++ )
      backs[i].onclick = function( e ){
         cssTransform(this,"rotateY(180deg)");
         cssTransform(this.parentNode.firstChild,"rotateY(0deg)");
      }

   // Prevent the flipping of cards by actioning card icons
   for ( i = 0; i < textares.length; i++ ) textares[i].onclick = function(e){ e.stopPropagation(); }
   for ( i = 0; i < tripdots.length; i++ ) tripdots[i].onclick = function(e){ e.stopPropagation(); }
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
         tripdots[i].onclick = function( e ){ e.stopPropagation();  this.parentNode.firstChild.value = TRANSLAT.xosen; }
      }
   }).then(function(){ offNAJAX("mudoc"); });
}
function bindSpeakerButtons(){
   DEBUGGER?console.log("[bindSpeakerButtons]"):0;
   var r, opiid, speaker;
   for ( r = 0; r < THEINDEX; r++ ) {
      speaker = document.getElementById( r + "s" );
      speaker.onmouseover = function( e ){
         opiid = this.parentNode.parentNode.parentNode.id;
         if ( !SOUNDHOV ) SOUNDHOV = setTimeout(function(){ SOUNDHOV = null;
         if ( NINFDATA[1].qaimg[opiid].s ) playByID( NINFDATA[1].qaimg[ opiid ].s + "&r=" + Math.random() * 100 ); },1000);
      }
      speaker.onmouseout = function( e ){ if ( SOUNDHOV ){ clearTimeout( SOUNDHOV ); SOUNDHOV = null; } }
      speaker.onclick = function( e ){
         e.stopPropagation();
         opiid = this.parentNode.parentNode.parentNode.id;
         zentraller("soundHoch", markupRecorder("qs") +
            "<span id='recordedIndex' monindex='" + opiid + "'></span>" +
            "<div id='qsphp' class='notionary-phpUpload'></div>",
            function(){
               ausblenden( document.getElementById( "soundHochZentralUser" ), 10, true );
               bindRecorder("qs",NINFDATA[0].nname,NINFDATA[1].qaimg[opiid].q,NINFDATA[1].qaimg[opiid].s);
               bindUploader("qs",NINFDATA[0].nname,NINFDATA[1].qaimg[opiid].q,opiid,"");
            },
            function(){ landingPage(); showSupers(); });
      }
      speaker.style.visibility = "visible";
   }
}
function thereAreChanges(ncold,spold,npold,nnold,ndold,newAR,oldAR,tlold){
   DEBUGGER?console.log("[thereAreChanges]"):0;
   var nccur = "", npcur = false, nncur = "", ndcur = "", gaton = "", tlnew, gibts = "",
       catsele, spqsele, notname, notdesc, pictobox;
   catsele  = document.getElementById( "editKatseSel" );
   spqsele  = document.getElementById( "editSperqSel" );
   notname  = document.getElementById( "editNnameTxt" );
   notdesc  = document.getElementById( "editNdescTxt" );
   pictobox = document.getElementById( "editPictoCbx" );

   if ( catsele ) nccur = catsele.value;
   if ( spqsele ) spcur = spqsele.value;
   if ( notname ) nncur = notname.value;
   if ( notdesc ) ndcur = notdesc.value;
   try { gaton = katxy( ncold ); } catch(err){};
   if ( pictobox.checked ) npcur = true;
   tlnew = document.getElementById( "editLangflag" ).getAttribute("tgetlang");


   // Check all possible ways in which new data is extant
   if ( oldAR ) for ( x in oldAR ) if ( ( newAR[x].q != oldAR[x].q ) || ( newAR[x].a != oldAR[x].a ) ) { gibts = true; break; }
   if ( !oldAR && newAR ) for( x in newAR ) if ( newAR[x].q || newAR[x].a ){ gibts = true; break; } // any new QA ?
   if ( oldAR && ( newAR.length > oldAR.length ) ) gibts = true; // check if old Array was augmented
   if ( ( nccur != gaton ) || ( spcur != spold ) || ( npcur != npold ) ||
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
       edit_NN, edit_ND, problema, problemq, pictobox, 
       picto = false, sizeOfNewAR = 0;

   edit_NN  = document.getElementById( "editNnameTxt" );
   edit_ND  = document.getElementById( "editNdescTxt" );
   pictobox = document.getElementById( "editPictoCbx" );

   if ( pictobox.checked ) { picto = true; for ( i = 0; i < THEINDEX; i++ ) newAR[i].q = newAR[i].a; }

   tlang = document.getElementById( "editLangflag" ).getAttribute("tgetlang");

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
            problemq.parentNode.nextSibling.onclick(); return;        // in case it is flipped
         }
         if ( !newAR[i].a.sizeok( 1, QANDAREG[3] ) ) {
            problema = document.getElementById( i + "a" );
            clickNotiz(TRANSLAT.badsz); colorById( problema,"radRojo");
            problema.parentNode.previousSibling.onclick(); return;    // in case it is flipped
         }
         if ( newAR[i].q ) { // check extant question sanity
            if ( !newAR[i].q.issane( QANDAREG[0] ) ) {
               problemq = document.getElementById( i + "q" );
               clickNotiz(TRANSLAT.notre); colorById( problemq,"radRojo");
               problemq.parentNode.nextSibling.onclick(); return;     // in case it is flipped
            }
         }
         if ( newAR[i].a ) { // check extant answer sanity
            if ( !newAR[i].a.issane( QANDAREG[0] ) ) {
               problema = document.getElementById( i + "a" );
               clickNotiz(TRANSLAT.notre); colorById( problema,"radRojo");
               problema.parentNode.previousSibling.onclick(); return; // in case it is flipped
            }
            // Extra check for answers to enforce a minimum number of Chosen Choices
            if ( newAR[i].a.toString().indexOf( CHOIXSEP ) > 0 ) {
               allAnswers = newAR[i].a.toString().split( CHOIXSEP );
               if ( allAnswers.length < CHOIXMIN || // We must have Five non-empty choices
                  !allAnswers[0].length || !allAnswers[1].length || !allAnswers[2].length ||
                  !allAnswers[3].length || !allAnswers[4].length ){
                     problema = document.getElementById( i + "a" );
                     clickNotiz(TRANSLAT.enuff); colorById( problema,"radRojo");
                     // Flip reveal the Problem Answer in case it is flipped
                     problema.parentNode.previousSibling.onclick(); return;
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
                  problema.parentNode.previousSibling.onclick(); return;
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
         jasonUINFO( function(){ landingPage(); showSupers(); } );
         jasonSINFO( USERINFO[0].ulang, 0 );
      },
      function( error ) { clickNotiz( error ); }
   ).then( function(){ offNAJAX(testtype); } );
}
