function bindBetaTest( cback ){
   DEBUGGER?console.log("[bindBetaTest]"):0;
   var betaButton = document.getElementById( "rootBetatest" );
   betaButton.onclick = cback;
}
function bindDebugger(target_id){
   DEBUGGER?console.log("[bindDebugger]"):0;
   dbugbtn = document.getElementById( "rootDebugger" );
   dbugbtn.onclick = function(){
      document.getElementById( "rootMenuclik" ).onclick();
      onNAJAX("debug");
         httpget("admindex.php/?tun=debug").then(
            function( response ) {
               target_id.innerHTML = response;
            }, function( error ) { }
         ).then ( function(){ offNAJAX("debug"); } );
   }
}
function bindClearCache(){
   DEBUGGER?console.log("[bindClearCache]"):0;
   var decache = document.getElementById( "rootDecacher" );
   decache.onclick = function(){ onNAJAX("xcach");
      document.getElementById( "rootMenuclik" ).onclick();
      httpost("admindex.php","tun=xcach").then(
         function(response){ offNAJAX("xcach"); },
         function( error ) { clickNotiz(error); }
      );
   }
}
function mediaIDChange(e,cette,Obj){
   DEBUGGER?console.log("[mediaIDChange]"):0;
   var medid, media, instr, dn_input, editor,
       k = ( e.keyCode ? e.keyCode : e.which );
   instr  = document.getElementById( "mediaEditInstruction" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "rootEditbutn" );
   if ( k == "13" || k == "9" ) { // only handle keydown "Enter" or "Tab"
      if ( cette.value.issane( DIGITREG[0] ) ) { // only numeric IDs
         //instruct(instr,"","black");
         clearInput.apply(cette,[cette,dn_input]);
         medid = parseInt( cette.value );
         media = mediaIdxObj(cette.value,Obj);
         if ( media != -1 ) {
            dn_input.value = Obj[media].nom;
            editor.setAttribute("title",medid);
         } else dn_input.value = "";
      } else { instruct(instr,TRANSLAT.notre,"red");
         colorById( cette ,"radRojo");
         dn_input.value = "";
      }
   }
}
function mediaIdxObj( medid, Obj ){ for ( i = 0; i < Obj.length; i++ ) if ( Obj[i].idx == medid ) return (i); return(-1); }
function showMediaGallery(Obj,gnode,startIdx,gsize,medium){
   DEBUGGER?console.log("[showMediaGallery]"):0;
   var i, grenze, meinpu, dn_input, editor, morep, gmarkup = "", galembas;
   meinpu = document.getElementById( "meinp" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "rootEditbutn" );
   morep  = document.getElementById( "loadMorePages" );
   grenze = parseInt( startIdx + gsize );
   if ( grenze > Obj.length ) grenze = Obj.length;
   if ( startIdx >= Obj.length ) { blinkNode(morep,"radBlau",true); return; }
   for ( i = startIdx; i < grenze; i++ ) {
      if ( medium == "image" ) {
         if ( Obj[i].idx ) 
              gmarkup += "<img  class='notionary-gallery' title='" + Obj[i].idx + "' src='" + HARDCODE.image + Obj[i].idx + "'/>";
         else gmarkup += "<img  class='notionary-gallery'                            src='" + HARDCODE.image + "101" + "'/>";
      } else  gmarkup += "<span class='notionary-gallery fa fa-headphones' title='" + Obj[i].idx + "'></span>";
   }
   gnode.innerHTML = gmarkup;
   galembas = document.getElementsByClassName("notionary-gallery");
   for ( i = 0; i < galembas.length; i++ ) {
      galembas[i].onclick = function(e) {
         meinpu.value = this.getAttribute("title"); fireKey(meinpu,13);
         dn_input.value = Obj[mediaIdxObj(this.getAttribute("title"),Obj)].nom;
         editor.setAttribute("title",this.getAttribute("title"));
      }
   }
}
function showMediaNavigator( node, Obj, defsiz, medium){
   DEBUGGER?console.log("[showMediaNavigator]"):0;
   var DATASIZE = 500,                        // Unlink from showMediaGallery before modularizing
       ppage, pages, morep, galembas, htreq;
   node.innerHTML =
      "<div     class='notionary-navigator'>" + TRANSLAT.pages +
         "<span class='notionary-pageindex'> 1 </span>" +
         "<span class='notionary-pageindex'> 2 </span>" +
         "<span class='notionary-pageindex'> 3 </span>" +
         "<span class='notionary-pageindex'> 4 </span>" +
         "<span class='notionary-pageindex'> 5 </span>" +
         "<span id='loadMorePages' class='notionary-clickable-text'>" + TRANSLAT.mload + "</span>" +
         markupPopupMenue("pp",["25","50","100"],defsiz,false) +
      "</div>";
   if ( medium == "image" ) htreq = "idata"; else htreq = "sdata";
   ppage  = document.getElementById( "ppsel" );
   pages  = document.getElementsByClassName( "notionary-pageindex" );
   morep  = document.getElementById( "loadMorePages" );
   galembas = document.getElementById( "rootGalerias" );
   ppage.onchange  = function(e) { showMediaGallery(Obj,galembas,0,this.value,medium); }
   morep.onclick   = function(e) { onNAJAX("morep");
      httpget("admindex.php/?tun=" + htreq + "&was=" +
         JSON.stringify({"fromi":parseInt(Obj[Obj.length-1].idx),"xmany":DATASIZE})
      ).then(function( response ){
         if ( response ) Obj.push.apply( Obj, JSON.parse( response ) );
      }, function ( error ) { clickNotiz( error ); }).then(function(){ offNAJAX("morep"); });
   }
   for ( i = 0; i < pages.length; i++ ) {
      pages[i].onclick = function(e) { var cette = this;
         for ( i = 0; i < pages.length; i++ ) colorById(pages[i],"radWeis");
         setTimeout(function(){ colorById(cette,"radBlau"); } ,500);
         showMediaGallery(Obj,galembas, parseInt(ppage.value) * ( parseInt(this.innerHTML ) - 1 ),parseInt(ppage.value),medium);
      }
   }
}
function bindSoundEditor(){
   DEBUGGER?console.log("[bindSoundEditor]"):0;
   var DATASIZE = 500,
       seditBtn  = document.getElementById( "rootSoundchg" );
   seditBtn.onclick = function(){
      var CODESTR = HARDCODE.grava,
          workarea, sonolist, me_input, dn_input, editsono, galembas, navgator;
      workarea = document.getElementById( "anonRealarea" );
      workarea.innerHTML = markupSmartInput("me","1",true,"") + markupSmartInput("dn","",true,"") +
         "<button id='rootEditbutn'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='rootGalerias'></div>" +
         "<div id='rootNavigate' class='notionary-navigator'></div>";
      document.getElementById( "rootMenuclik" ).onclick();
      onNAJAX("sdata");
      httpget("admindex.php/?tun=sdata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) sonolist = JSON.parse( response );
         me_input = document.getElementById( "meinp" );           dn_input = document.getElementById( "dninp" );
         editsono = document.getElementById( "rootEditbutn" );    galembas = document.getElementById( "rootGalerias" );
         navgator = document.getElementById( "rootNavigate" );
         showMediaGallery( sonolist, galembas, 0, 100, "sound");  showMediaNavigator( navgator, sonolist, 100, "sound");
         editsono.onclick = function(e){ var snsrc = this.getAttribute("title");
            zentraller("soundEditor",
               markupRecorder("se") + "<div id='sephp' class='notionary-phpUpload'></div>",
               function(){
                  ausblenden( document.getElementById( "soundEditorZentralUser" ), 10, true );
                  bindRecorder("se",CODESTR,snsrc,snsrc);
                  bindUploader("se","",snsrc,"","");
               },
               function(){ landingPage(); showSupers(); }
            );
         }
         me_input.onfocus = wakeClean;
         me_input.onkeydown = function(e) { mediaIDChange(e,this,sonolist); }
         dn_input.onchange = function(e) {
            seter("aasound","name",this.value,"soundID",me_input.value,function(){ colorById(dn_input,"radGrun"); });
         }
      }, function(error) { clickNotiz( error ); }).then( function(){ offNAJAX("sdata"); } );
  
   }
}
function bindImageEditor(){
   DEBUGGER?console.log("[bindImageEditor]"):0;
   var DATASIZE = 500, ieditBtn = document.getElementById( "rootImagechg" );
   ieditBtn.onclick = function(){
      var workarea, imagenes, me_input, dn_input, editimag, galembas, navgator, previews;
      workarea = document.getElementById( "anonRealarea" );
      workarea.innerHTML = markupSmartInput("me","1",true,"") + markupSmartInput("dn","",true,"") +
         "<button id='rootEditbutn'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='rootGalerias'></div>" + 
         "<div id='rootNavigate' class='notionary-navigator'></div>" +
         "<div id='rootPreviews'></div>";
      document.getElementById( "rootMenuclik" ).onclick();
      onNAJAX("idata");
      httpget("admindex.php/?tun=idata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) imagenes = JSON.parse( response ); 
         me_input = document.getElementById( "meinp" );             dn_input = document.getElementById( "dninp" );
         editimag = document.getElementById( "rootEditbutn" );      galembas = document.getElementById( "rootGalerias" );
         navgator = document.getElementById( "rootNavigate" );      previews = document.getElementById( "rootPreviews" );
         showMediaGallery( imagenes, galembas, 0, 100, "image");    showMediaNavigator( navgator, imagenes, 100, "image");
         editimag.onclick  = function(e) { handleImageUploads("ie"); }
         me_input.onfocus  = wakeClean;
         me_input.onkeydown = function(e){ var k=(e.keyCode ? e.keyCode : e.which);
            mediaIDChange( e, this, imagenes);
            if ( k == "13" ) previews.innerHTML = "<img width=40% src='" + HARDCODE.image + me_input.value + "'>";
         }
         dn_input.onchange = function(e) {
            seter("aaimage","name",this.value,"imageID",me_input.value,function(){ colorById(dn_input,"radGrun"); });
         }
     }, function( error ){ clickNotiz(error); }).then(function(){ offNAJAX("idata"); });  // The get
   } 
}
