function fireKey(node_id,tecla_code){ var evento;
    if ( document.createEventObject ) {
        evento = document.createEventObject();
        evento.keyCode = tecla_code;
        node_id.fireEvent("onkeydown", evento);
        evento.keyCode = tecla_code;   
    } else if ( document.createEvent ) {
        evento = document.createEvent("Events");
        evento.initEvent("keydown", true, true);
        evento.which = tecla_code; 
        evento.keyCode = tecla_code;
        node_id.dispatchEvent(evento);
    }
} 
function opaka(ident,nivel){ ident.style.opacity = nivel; ident.style.filter = "alpha(opacity=nivel)"; }
function turnOff( my_Id ) {
   for ( var i = 0; i < arguments.length; i++ ) {
       arguments[i].style.opacity = 0;
       arguments[i].style.filter = "alpha(opacity=0)";
       arguments[i].style.display = "none";
       arguments[i].style.visibility = "hidden";
  }
}
function turnOn( my_Id ) {
   for ( var i = 0; i < arguments.length; i++ ) {
      arguments[i].style.opacity = 1;
      arguments[i].style.filter = "alpha(opacity=100)";
      arguments[i].style.display = "block";
      arguments[i].style.visibility = "visible";
   }
}
function einblenden( my_Id, ms, disptype ) {
   var opacity, timer,
       blendas = "block";
   if ( disptype ) blendas = disptype;
   if ( ! my_Id ) return;
   if ( my_Id.style.display == blendas && my_Id.style.visibility == "visible" ) return; // idempotent
   my_Id.style.opacity = 0;
   my_Id.style.filter = "alpha(opacity=0)";
   my_Id.style.display = blendas;
   my_Id.style.visibility = "visible";
   if ( ms ) {
      opacity = 0;
      timer = setInterval(
         function() {
            opacity += 50 / ms;
            if ( opacity >= 1 ) { clearInterval(timer); opacity = 1; }
            my_Id.style.opacity = opacity;
            my_Id.style.filter = "alpha(opacity=" + opacity * 100 + ")";
         }, 50 );
   } else {
      my_Id.style.opacity = 1;
      my_Id.style.filter = "alpha(opacity=1)";
   }
}
function ausblenden( my_Id, ms, goner ) {
   var opacity, timer;
   if ( ! my_Id ) return;
   if ( ms ) {
      opacity = 1;
      timer = setInterval(
         function() {
            opacity -= 50 / ms;
            if ( opacity <= 0 ) {
               clearInterval(timer);
               opacity = 0;
               if ( goner ) my_Id.style.display = "none";
               else my_Id.style.display = "contents";
               my_Id.style.visibility = "hidden";
            }
            my_Id.style.opacity = opacity;
            my_Id.style.filter = "alpha(opacity=" + opacity * 100 + ")";
         }, 50 );
   } else {
      my_Id.style.opacity = 0;
      my_Id.style.filter = "alpha(opacity=0)";
      if ( goner ) my_Id.style.display = "none";
      else my_Id.style.display = "contents";
      my_Id.style.visibility = "hidden";
   }
}
function vibrateNode(node){
   DEBUGGER?console.log("[vibrateNode]"):0;
   setTimeout(function(){ cssTransform(node,"translate(25px,0px)"); },200);
   setTimeout(function(){ cssTransform(node,"translate( 0px,0px)"); },400);
   setTimeout(function(){ cssTransform(node,"translate(25px,0px)"); },600);
   setTimeout(function(){ cssTransform(node,"translate( 0px,0px)"); },800);
}
function cssTransform(node,transform){
   DEBUGGER?console.log("[cssTransform]"):0;
   node.style.setProperty ( "-webkit-transform" ,  transform );
   node.style.setProperty (    "-moz-transform" ,  transform );
   node.style.setProperty (     "-ms-transform" ,  transform );
   node.style.setProperty (      "-o-transform" ,  transform );
   node.style.setProperty (         "transform" ,  transform );
}
function wakeClean(){ this.focus(); this.value = ""; activateInput( this ); }
function wakeDirty(){ this.focus(); activateInput( this ); }
function killMetas(){
   DEBUGGER?console.log("[killMetas]"):0;
   if ( !this.value.substr( this.value.length-1,1 ).issane( NOMETACH[0] ))
      this.value = this.value.match( NOMETACH[1] );
}
function clearInput(cette){
   DEBUGGER?console.log("[clearInput]"):0;
   for ( var i = 0; i < arguments.length; i++ ) {
      colorById(arguments[i],"CLEAR");
      arguments[i].classList.remove("notionary-dormant");
      arguments[i].classList.add("notionary-active");
   }
}
function deactivateInput(my_Id){
   DEBUGGER?console.log("[deactivateInput]"):0;
   for ( var i = 0; i < arguments.length; i++ ) {
      arguments[i].setAttribute("disabled","true");
      arguments[i].classList.remove("notionary-active");
      arguments[i].classList.add("notionary-dormant");
   }
}
function activateInput(my_Id){
   DEBUGGER?console.log("[activateInput]"):0;
   for ( var i = 0; i < arguments.length; i++ ) {
      arguments[i].removeAttribute("disabled");
      arguments[i].classList.remove("notionary-dormant");
      arguments[i].classList.add("notionary-active");
   }
}
function chuinfo(inpval,uinfet){ // Check USERINFO vs an input and amend if different
   DEBUGGER?console.log("[chuinfo]"):0;
   if ( (inpval != uinfet) && (inpval || uinfet) ) { uinfet = inpval; return true; }
   return false;
}
function goodInput(inode,metas,minsiz,maxsiz,fback){
   DEBUGGER?console.log("[goodInput]"):0;
   if ( inode.value.issane(metas) && inode.value.sizeok(minsiz,maxsiz) ) return true;
   else { instruct(fback,TRANSLAT.notre,"red"); alarmNode(inode,"radRojo"); }
   return false;
}
function sanitized(thevalue,thearray){
   DEBUGGER?console.log("[sanitized]"):0;
   if ( thevalue.length >= thearray[2] &&
        thevalue.length <= thearray[3] &&
        thearray[1].test( thevalue ) ) return true;
   return false;
}
function sanekeys(popinp,sanarr,fbnode,goodCBK){
   DEBUGGER?console.log("[sanekeys]"):0;
   var chekmark = popinp.nextSibling;
   popinp.onkeyup = function(e){ var cette = this;           // Check each keystroke on keyup vs sanity array
      if ( cette.value &&                                    // A keystroke has occurred
              ( cette.value.length > sanarr[3] ||            // We've gone past the max length
                !sanarr[0].test( cette.value ) )             // We've violated the sanity array
         ) { ausblenden(chekmark,10,true); if ( fbnode ) instruct(fbnode,sanarr[4],"red"); }
   }

   //Final Sanity Check done vs total regexp as soon as we hit Enter or Tab
   popinp.onkeydown = function(e){
      var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
      if ( fbnode ) instruct(fbnode,"","CLEAR");
      if ( k == "13" || k == "9" ) {                         // Pressing Enter or Tab
         if ( cette.value &&                                 // Something has been entered
                 ( cette.value.length < sanarr[2] ||         // Too short
                   cette.value.length > sanarr[3] ||         // Too long or bad chars (below)
                   !sanarr[1].test( cette.value ) ) ) if ( fbnode ) instruct(fbnode,sanarr[4],"red");
         else if ( cette.value.length >= sanarr[2] &&
                     cette.value.length <= sanarr[3] &&
                     sanarr[1].test( cette.value ) ) { einblenden(chekmark,100); goodCBK(); }
      }
   }
}
function alarmNode(my_Id,gradient){ // Blink and stay colored
   DEBUGGER?console.log("[alarmNode]"):0;
   my_Id.classList.add("notionary-" + gradient);
   setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },  300);
   setTimeout(function(){ my_Id.classList.add(   "notionary-" + gradient); },  600);
   setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },  900);
   setTimeout(function(){ my_Id.classList.add(   "notionary-" + gradient); }, 1200);
}
function blinkNode(my_Id,gradient,clearme){
   DEBUGGER?console.log("[blinkNode]"):0;
   alarmNode(my_Id,gradient);
   if ( clearme ) setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },1500);
}
function announce(myId,message,gradient){ myId.innerHTML = message; colorById( myId, gradient ); }
function instruct(myId,message,color){ myId.style.color = color; myId.innerHTML = message; }
function colorById(myId,gradient){
   DEBUGGER?console.log("[colorById]"):0;
   // Clear from color and potentially give it a new one
   ["Weis","Blak","Grau","Kaki","Gelb","Blau","Grun","Tang","Rojo"].map( function( val ) {
      myId.classList.remove( "notionary-lin" + val );
      myId.classList.remove( "notionary-rad" + val );
   });
   if ( gradient != "CLEAR" ) myId.classList.add( "notionary-" + gradient );
}

/* Pseudo Dialogs */
function FireEvent( ElementId, EventName )
{
    if( document.getElementById(ElementId) != null )    
    {   
        if( document.getElementById( ElementId ).fireEvent ) 
        {
            document.getElementById( ElementId ).fireEvent( 'on' + EventName );     
        }
        else 
        {   
            var evObj = document.createEvent( 'Events' );
            evObj.initEvent( EventName, true, false );
            document.getElementById( ElementId ).dispatchEvent( evObj );
        }
    }
}
function onNAJAX(rufer){
   DEBUGGER?console.log("[onNAJAX]:"+rufer):0;
   var ajaxmbar = document.createElement("div");
   ajaxmbar.setAttributes({ "class" : "notionary-barsmgif", "id" : "loadings-" + rufer });
   document.body.appendChild( ajaxmbar );
}
function offNAJAX(rufer){
   DEBUGGER?console.log("[offNAJAX]:"+rufer):0;
   var ajaxmbar = document.getElementById( "loadings-" + rufer );
   if ( ajaxmbar ) document.body.removeChild( ajaxmbar );
}
function popupFAI(icono,color,fsize){
   DEBUGGER?console.log("[popupFAI]"):0;
   var MS_DURATION = 3000, faidiv, faispa;
   faidiv = document.createElement("div");
   faidiv.setAttribute("id","transientDialog");
   faispa = document.createElement("span");
   faispa.setAttributes({
      "class" : "fa " + icono,
      "style" : "color:" + color + ";font-size:" + fsize
   });
   faidiv.appendChild( faispa );
   document.body.appendChild( faidiv );
   setTimeout( function() { document.body.removeChild( faidiv ); }, MS_DURATION );
}
function timedNotiz(contents){
   DEBUGGER?console.log("[timedNotiz]"):0;
   var DURATION = 3000,
       thenotiz = document.createElement("div");
                  thenotiz.setAttribute("id","notionaryNotiz");
                  thenotiz.setAttribute("class","animated fadeInDown");
                  thenotiz.innerHTML = "<div class='notionary-midtexto'>" + contents + "</div>";

   document.body.insertBefore(thenotiz,document.body.firstChild);
   setTimeout(function(){ document.body.removeChild( thenotiz ); }, DURATION);
}
function clickNotiz(contents){
   DEBUGGER?console.log("[clickNotiz]"):0;
   var offnotiz,
       thenotiz = document.createElement("div");
                  thenotiz.setAttribute("id","notionaryNotiz");
                  thenotiz.setAttribute("class","animated fadeInDown");
                  thenotiz.innerHTML = 
                     "<div class='notionary-midtexto'>" + contents + "</div>" +
                     "<div class='notionary-exbutton fa fa-times' id='notizExit'></div>";
   document.body.insertBefore(thenotiz,document.body.firstChild);
   offnotiz = document.getElementById( "notizExit" );
   offnotiz.onclick = function(){ document.body.removeChild(thenotiz); /*landingPage(); showSupers(); */ }
}
function confoNotiz(warne,jaBtn,noBtn,jaCBK,noCBK){
   DEBUGGER?console.log("[confoNotiz]"):0;
   var jabutton, nobutton,
       thenotiz = document.createElement("div");
       thenotiz.setAttribute("id","notionaryNotiz");
       thenotiz.setAttribute("class","animated fadeInDown");
       thenotiz.innerHTML = 
          "<div class='notionary-midtexto'>" + warne + "</div>" +
          "<button id='wobjKeepsbtn'><span class='fa fa-hand-paper-o'></span>" + noBtn + "</button>" +
          "<button id='wobjDeletbtn'><span class='fa fa-trash'></span>" + jaBtn + "</button>";

   document.body.insertBefore( thenotiz,document.body.firstChild );
   jabutton = document.getElementById( "wobjKeepsbtn" );
   nobutton = document.getElementById( "wobjDeletbtn" );
   jabutton.onclick = function(){ document.body.removeChild( thenotiz ); jaCBK(); }
   nobutton.onclick = function(){ document.body.removeChild( thenotiz ); noCBK(); }
}
function disruptPopup(markup,exitCBK){
   DEBUGGER?console.log("[disruptPopup]"):0;
   var overlay, exiter;
   overlay = document.createElement( "div" );
   overlay.setAttribute("id","pedalOverlay");
   overlay.innerHTML = markup;

   document.body.appendChild( overlay );

   einblenden(overlay,1000);
   exiter = document.getElementById( "acceptExiter" );
   exiter.onclick = function(e) { document.body.removeChild( overlay ); exitCBK(); };
}
function zentraller(ident,markup,bindCBK,exitCBK){
   DEBUGGER?console.log("[zentraller]"):0;
   var themodal, modahold, mainlogo, crossbtn;
       themodal = document.createElement( "div" );
       themodal.setAttribute("id","modalOverlay");
   themodal.innerHTML = 
      "<div        class='notionary-modaller' id='" + ident + "ModalHold'>" +
         "<div     class='notionary-exbutton fa fa-times'     id='" + ident + "ZentralExit'></div>" +
         "<div     class='notionary-centered' id='" + ident + "ZentralHold' onclick='function doNothing(){}'>" +
            "<span class='notionary-logo0815' id='" + ident + "ZentralLogo'>" + HARDCODE.myenv + "</span>" +
            "<div  class='notionary-hinweise' id='" + ident + "ZentralInfo'></div>" +
            "<div  class='notionary-framedid' id='" + ident + "ZentralUser'></div>" +
            markup +
         "</div>" +
      "</div>";
   document.body.appendChild( themodal );

   modahold = document.getElementById( ident + "ModalHold" );
   mainlogo = document.getElementById( ident + "ZentralLogo" );
   mainlogo.onclick = function( e ) { document.body.removeChild( themodal ); exitCBK(); }

   crossbtn = document.getElementById( ident + "ZentralExit" );
   crossbtn.onclick = function ( e ) { document.body.removeChild( themodal ); }

   explorerCentral( modahold );      // Kludge Hack to avoid MSFT IE Bug ignoring margin: 0 auto;
   einblenden( themodal );
   bindCBK();
}
function markupComment(ident,lineas,columnas,defText){
   DEBUGGER?console.log("[markupComment]"):0;
   return(
      "<div            id='" + ident + "CommentHolder'   class='notionary-commhold'>" +
         "<span        id='" + ident + "CommentExiter'   class='notionary-exbutton fa fa-times'></span>"+
         "<div         id='" + ident + "CommentFeedback' class='notionary-feedback'></div>"+
         "<textarea    id='" + ident + "CommentTextarea' class='notionary-commtext notionary-dormant'" +
            " rows='" + lineas + "' cols='" + columnas+"'>" + defText +
         "</textarea>" +
         "<div         id='" + ident + "CommentButtons'  class='notionary-commbtns'>" +
             "<span    id='" + ident + "CommentCounter'  class='notionary-commzahl'></span>" +
             "<span    id='" + ident + "CommentSubmit'   class='notionary-commsend fa fa-paper-plane'"+
                  " title='" + TRANSLAT.savit + "'></span>" +
         "</div>" +
      "</div>");
}
function bindComment(ident,deftxt,carmin,carmax,regex,clikme,offbtn,clkCBK,offCBK,senCBK){
   DEBUGGER?console.log("[bindComment]"):0;
   var holder, exiter, texter, counts, sender;
   holder = document.getElementById( ident + "CommentHolder" );
   exiter = document.getElementById( ident + "CommentExiter" );
   texter = document.getElementById( ident + "CommentTextarea" );
   counts = document.getElementById( ident + "CommentCounter" );
   sender = document.getElementById( ident + "CommentSubmit" );       ausblenden(sender,1000,true);
   clikme.onclick = function(e){ einblenden(holder,1000); clkCBK(); }
   offbtn.onclick = offCBK;
   if ( texter.value == deftxt ) ausblenden(holder,1000,true); else einblenden(holder,1000);
   exiter.onclick = function(e){ ausblenden(holder,1000,true); }  // Different from the offbtn
   sender.onclick = senCBK;
   texter.onfocus = function(e){ if ( this.value == deftxt ) this.value = ""; activateInput( this ); }
   texter.onkeydown = function(e){ var cpos, news, k = (e.keyCode ? e.keyCode : e.which);
      if ( k == 13 ) { cpos = texter.selectionStart;
         news = texter.value.substr(0,cpos) + texter.value.substr(cpos,texter.value.length);
         texter.value = news; texter.setSelectionRange( cpos+1, cpos+1 );
      }

      if ( texter.value != deftxt && texter.value.issane( regex ) &&
          texter.value.sizeok( carmin, carmax ) ) einblenden(sender,1000);
      else ausblenden(sender,1000,true);

      if ( texter.value.length < carmin ) counts.innerHTML = carmin - texter.value.length;
      else counts.innerHTML = "";
   }
}
function getStyleProp(elem, prop){
   DEBUGGER?console.log("[getStyleProp]"):0;
    if (window.getComputedStyle)
        return window.getComputedStyle(elem, null).getPropertyValue(prop);
    else if (elem.currentStyle) return elem.currentStyle[prop]; //IE
}
function refocusSmartInput(my_Id,deftxt){
   DEBUGGER?console.log("[refocusSmartInput]"):0;
   var legenda = my_Id.parentNode.firstChild;
   if ( my_Id.value == deftxt ) my_Id.value = "";
   my_Id.classList.remove("notionary-exfocado");
   my_Id.classList.add("notionary-enfocado");
   my_Id.parentNode.style.setProperty("border","2px solid #4D90FE");
   einblenden(legenda);
}
function unfocusSmartInput(my_Id,deftxt){
   DEBUGGER?console.log("[unfocusSmartInput]"):0;
   var legenda = my_Id.parentNode.firstChild;
   if ( !my_Id.value ) {
      my_Id.value = deftxt;
      ausblenden(legenda);
      my_Id.parentNode.style.setProperty("border","2px solid #CDCDCD");
      my_Id.setAttribute("type","text");
   }
   my_Id.classList.remove("notionary-enfocado");
   my_Id.classList.add("notionary-exfocado");
   
}
function markupSmartInput(inits,usevalue,nolabels,uniqueid){
   DEBUGGER?console.log("[markupSmartInput]"):0;
   var thelabel = TRANSLAT[inits+"txt"],
       thevalue = "",
       inputype = "text";
   if ( !uniqueid ) uniqueid = inits;                // Use for multiple instances with same label
   if (  nolabels ) thelabel = "";                   // Useful for Mobile devices with little room
   if (  usevalue ) thevalue = usevalue;             // Prevent "null" from DB showing
   if (  inits == "p2" ) inputype = "password";      // Whether the input is clear text
   return("<fieldset id='" + uniqueid + "nom' class='notionary-fieldset'>" +
            "<legend id='" + uniqueid + "leg' class='notionary-legendas'>" + TRANSLAT[inits+"txt"] + "</legend>" +
             "<span  id='" + uniqueid + "txt' class='notionary-thelabel'>" + thelabel + "</span>" +
             "<span  id='" + uniqueid + "ajx' class='notionary-loadings'></span>" +
             "<input id='" + uniqueid + "inp' class='notionary-contents notionary-exfocado' " +
                 " type='" + inputype + "'    value='" + thevalue + "'/>" +
             "<span  id='" + uniqueid + "stg' class='notionary-chekmark'></span>" +
          "</fieldset>");
}
function markupPopupMenue(inits,olist,dbval,quiet){
   DEBUGGER?console.log("[markupPopupMenue]"):0;
   var x, optionsString = "", inval = "", texto = "";
   texto = TRANSLAT[ inits + "txt" ];
   if ( quiet ) { inval = texto; texto = ""; }
   for ( x in olist )
      if ( olist[x] == dbval ) optionsString += "<option selected>" + olist[x] + "</option>";
      else optionsString += "<option>" + olist[x] + "</option>";
   return("<span id='" + inits + "nom' class='notionary-labinput'>" +
             "<span   id='" + inits + "txtSelect' class='notionary-thelabel'>" + texto + "</span>" +
             "<select id='" + inits + "sel' class='notionary-popmenue'>" + optionsString + "</select>" +
          "</span>");
}
function markupOffOnRadio(inits,rlist,torf){
   DEBUGGER?console.log("[markupOffOnRadio]"):0;
   // rlist -> The (false/true) arbitrary multilingual labels e.g. no/yes, disable/enable
   //          The ids of the buittons are irrelevant as they bind ..ByName(inits+offon)
   // torf  -> Whether the positive (True/Yes/Enable/..) is checked, default to negative
   var jachk = "  ", nochk = " checked='checked' ";
   if ( torf != 0 )  { jachk = " checked='checked' "; nochk = "  "; }
   return("<fieldset  id='" + inits + "nom' class='notionary-fieldset'>" +
             "<legend id='" + inits + "leg' class='notionary-legendas'>" + TRANSLAT[ inits + "txt" ] + "</legend>" +
             "<div>" + 
                "<div class='notionary-ynbutton'>" + // Negative "false" "no" choice
                   "<label for='" + inits + 0 + "'>" +  rlist[0] + "</label>" +
                   "<input type='radio' id='" + inits + 0 + "' name='" + inits + "offon' " + nochk + " value='" + rlist[0] + "'>" +
                "</div>" +
                "<div class='notionary-ynbutton'>" +
                   "<label for='" + inits + 1 + "'>" +  rlist[1] + "</label>" +
                   "<input type='radio' id='" + inits + 1 + "' name='" + inits + "offon' " + jachk + " value='" + rlist[1] + "'>" +
                "</div>" +
             "</div>" +
          "</fieldset>");
}
function offOnVal(inits){ if ( document.getElementById( inits + "0" ).checked ) return 0; return 1; }
function snapProzent(theNode,thePercent,theFarbe){
   DEBUGGER?console.log("[snapProzent]"):0;
   var canvasSize = 50,
       centre = radius = canvasSize/2,
       spn, s, arc, path = "",
       startY = centre-radius;
   theNode.innerHTML = "<div id='snapPercentNumber'></div><svg id='snapPercentCircle'></svg>" ;
   spn = document.getElementById( "snapPercentNumber" );
   s = Snap('#snapPercentCircle');
   arc = s.path(path);

   function run(percent) {
      var endpoint = percent*360;
      Snap.animate(0, endpoint,   function (val) { arc.remove(); 
        var d = val,
            dr = d-90;
            radians = Math.PI*(dr)/180,
            endx = centre + radius*Math.cos(radians),
            endy = centre + radius * Math.sin(radians),
            largeArc = d>180 ? 1 : 0;
            path = "M"+centre+","+startY+" A"+radius+","+radius+" 0 "+largeArc+",1 "+endx+","+endy; 
        arc = s.path(path);
        arc.attr({ stroke: theFarbe, fill: 'none', strokeWidth: 10 });
        spn.innerHTML = Math.round(val/360*100) +'%';
      }, 2000, mina.easeinout);
   }
   run( thePercent );
}
function showEditForeignButtons(nhold,tlang,cback){
   DEBUGGER?console.log("[showEditForeignButtons]"):0;
   // cback should render the pressed key onto the #input widget pointed to by
   // the focus tracking: initialzed and updated ( via #input.focus() ) separately
   var k, fcode, keysMarkup="";
   switch(tlang){
      case "de":
         fcode={"aumlt":"&#228;","oumlt":"&#246;","uumlt":"&#252;","break1":"break",
                "Aumlt":"&#196;","Oumlt":"&#214;","Uumlt":"&#220;","eszet":"&#223;"
               }; break;
      case "es":
         fcode={"aacut":"&#225;","eacut":"&#233;","iacut":"&#237;","oacut":"&#243;",
                "uacut":"&#250;","ntild":"&#241;","break1":"break",
                "Aacut":"&#193;","Eacut":"&#201;","Iacut":"&#205;","Oacut":"&#211;",
                "Uacut":"&#218;","Ntild":"&#209;","pregu":"¿"
               }; break;
      case "fr":
         fcode={"agrav":"&#224;","acirc":"&#226;","egrav":"&#232;","eacut":"&#233;",
                "ecirc":"&#234;","eumlt":"&#235;","icirc":"&#238;","iumlt":"&#239;",
                "ocirc":"&#244;","ucirc":"&#251;","cedil":"&#231;","break1":"break",
                "Agrav":"&#192;","Acirc":"&#194;","Egrav":"&#200;","Eacut":"&#201;",
                "Ecirc":"&#202;","Eumlt":"&#203;","Icirc":"&#206;","Iumlt":"&#207;",
                "Ocirc":"&#212;","Ucirc":"&#219;","Cedil":"&#199;"
               }; break;
      case "pt":
         fcode={"agrav":"&#224;","aacut":"&#225;","acirc":"&#226;","atild":"&#227;",
                "eacut":"&#233;","ecirc":"&#234;","oacut":"&#243;","ocirc":"&#244;",
                "otild":"&#245;","cedil":"&#231;","break1":"break",
                "Agrav":"&#192;","Aacut":"&#193;","Acirc":"&#194;","Atild":"&#195;",
                "Eacut":"&#201;","Ecirc":"&#202;","Oacut":"&#211;","Ocirc":"&#212;",
                "Otild":"&#213;","Cedil":"&#199;"
               }; break;
      case "it":
         fcode={"agrav":"&#224;","egrav":"&#232;","eacut":"&#233;","igrav":"&#236;",
                "ograv":"&#242;","oacut":"&#243;","ugrav":"&#249;","break1":"break",
                "Agrav":"&#192;","Egrav":"&#200;","Eacut":"&#201;","Igrav":"&#204;",
                "Ograv":"&#210;","Oacut":"&#211;","Ugrav":"&#217;"
               }; break;
      case "ru":
         fcode={"russi":"й", "rustse":"ц", "rusu":"у", "ruska":"к", "rusie":"е", "rusio":"ё",
                "rusen":"н", "rusghe":"г", "russha":"ш","russhcha":"щ", "rusze":"з", "rusha":"х",
                "break1":"break",
                "rusef":"ф", "rusyeru":"ы", "rusve":"в", "rusa":"а", "ruspe":"п", "ruser":"р",
                "ruso":"о", "rusel":"л", "rusde":"д", "ruszhe":"ж", "ruse":"э",
                "break2":"break",
                "rusya":"я", "rusche":"ч", "ruses":"с", "rusem":"м", "rusi":"и", "ruste":"т",
                "rushard":"ъ", "russoft":"ь", "rusbe":"б", "rusyu":"ю", 
                "break3":"break",
                "rucsi":"Й", "ructse":"Ц", "rucu":"У", "rucka":"К", "rucie":"Е", "rucio":"Ё",
                "rucen":"Н", "rucghe":"Г", "rucsha":"Ш", "rucshcha":"Щ", "rucze":"З", "rucha":"Х",
                "break4":"break",
                "rucef":"Ф", "rucyeru":"Ы", "rucve":"В", "ruca":"А", "rucpe":"П", "rucer":"Р",
                "ruco":"О", "rucel":"Л", "rucde":"Д", "ruczhe":"Ж", "ruce":"Э",
                "break5":"break",
                "rucya":"Я", "rucche":"Ч", "ruces":"С", "rucem":"М", "ruci":"И", "ructe":"Т",
                "ruchard":"Ъ", "rucsoft":"Ь", "rucbe":"Б", "rucyu":"Ю"
                }; break;
      case "tr":
         fcode={"iflat":"&#305;","oumlt":"&#246;","uumlt":"&#252;",
                "cedil":"&#231;","gbrev":"&#287;","scedi":"&#351;","break1":"break",
                "Iflat":"&#304;","Oumlt":"&#214;","Uumlt":"&#220;",
                "Cedil":"&#199;","Gbrev":"&#286;","Scedi":"&#350;"
               }; break;
      case "hu":
         fcode={"aacut":"&#225;","eacut":"&#233;","iacut":"&#237;","oacut":"&#243;",
                "oumlt":"&#246;","oluml":"&#337;","uacut":"&#250;","uumlt":"&#252;",
                "uluml":"&#369;","break1":"break",
                "Aacut":"&#193;","Eacut":"&#201;","Iacut":"&#205;","Oacut":"&#211;",
                "Oumlt":"&#214;","Oluml":"&#336;","Uacut":"&#218;","Uumlt":"&#220;",
                "Uluml":"&#368;"
               }; break;
      case "scimath": // Science+Math: operations, greeks, subs, sups
         fcode={"adder":"+","reste":"−","times":"×","fract":"&divide;","root2":"√","root3":"∛",
                "root4":"∜","lesst":"&lt","moret":"&gt;","leseq":"&le;","moreq":"&ge;",
                "plmin":"&plusmn;","noteq":"&ne;","landr":"↔",
                "break1":"break",
                "supe0":"⁰","supe1":"¹","squar":"²","cubed":"³","supe4":"⁴","supe5":"⁵","supe6":"⁶","supe7":"⁷",
                "supe8":"⁸","supe9":"⁹","upsum":"⁺","upmin":"⁻","supop":"⁽","supcp":"⁾","infin":"∞",
                "break2":"break",
                "subs0":"₀","subs1":"₁","subs2":"₂","subs3":"₃","subs4":"₄","subs5":"₅","subs6":"₆",
                "subs7":"₇","subs8":"₈","subs9":"₉","dnsum":"₊","dnmin":"₋","subop":"₍","subcp":"₎",
                "break3":"break",
                "alpha":"&#945;", "beta":"&#946;","gamma":"γ","theta":"&#952;",
                "pi":"&#960;","sigma":"&#963;","Delta":"&#916;","Gamma":"&#915;",
                "Sigma":"&#931;","angst":"Å","celsi":"℃","faren":"℉",
                "break4":"break",
                "supei":"ⁱ","supej":"ʲ","supek":"ᵏ","supel":"ˡ",
                "supem":"ᵐ","supen":"ⁿ","super":"ʳ","supes":"ˢ",
                "supet":"ᵗ","supex":"ˣ","supey":"ʸ","supez":"ᶻ",
                "break5":"break",
                "subei":"ᵢ","subej":"ⱼ","suber":"&#7523;","subeu":"&#7524;","subev":"&#7525;"
               }; break;
      default:
         fcode={"agrav":"&#224;","aacut":"&#225;","acirc":"&#226;","atild":"&#227;",
                "aumlt":"&#228;",
                "egrav":"&#232;","eacut":"&#233;","ecirc":"&#234;","eumlt":"&#235;",
                "igrav":"&#236;","iacut":"&#237;","icirc":"&#238;","iumlt":"&#239;",
                "iflat":"&#305;",
                "ograv":"&#242;","oacut":"&#243;","ocirc":"&#244;","oumlt":"&#246;",
                "oluml":"&#337;",
                "ugrav":"&#249;","uacut":"&#250;","ucirc":"&#251;","uumlt":"&#252;",
                "uluml":"&#369;","break1":"break",
                "cedil":"&#231;","gbrev":"&#287;","ntild":"&#241;","eszet":"&#223;",
                "scedi":"&#351;","break2":"break",
                "Agrav":"&#192;","Aacut":"&#193;","Acirc":"&#194;","Atild":"&#195;",
                "Aumlt":"&#196;",
                "Egrav":"&#200;","Eacut":"&#201;","Ecirc":"&#202;","Eumlt":"&#203;",
                "Igrav":"&#204;","Iacut":"&#205;","Icirc":"&#206;","Iumlt":"&#207;",
                "Iflat":"&#304;",
                "Ograv":"&#210;","Oacut":"&#211;","Ocirc":"&#212;","Oumlt":"&#214;",
                "Oluml":"&#336;",
                "Ugrav":"&#217;","Uacut":"&#218;","Ucirc":"&#219;","Uumlt":"&#220;",
                "Uluml":"&#368;","break3":"break",
                "Cedil":"&#199;","Gbrev":"&#286;","Ntild":"&#209;","Scedi":"&#350;"
               }; break;
   }
   keysMarkup = "<span id='foreignButtonHolder'>";
      for ( k in fcode ) // Create the string of buttons (with breaks) for User to push
         if ( k.substr(0,5) == "break" ) keysMarkup += "<br/>";
         else keysMarkup += "<button id='" + k + "' class='notionary-foreigns'>" + fcode[k] + "</button>";
   keysMarkup += "</span>";
   nhold.innerHTML = "<div id='foreignKeysHolder'>" + keysMarkup + "</div>";
   einblenden (nhold,1000);
   for ( k in fcode )
      if ( fcode[k] != "break" ) {
         dummy_key = document.getElementById( k );
         dummy_key.onclick = cback;
      }
}
function languageToImage(lange){
   DEBUGGER?console.log("[languageToImage]"):0;
   var FLAGS={"en":"50","es":"51","de":"52","fr":"53","it":"54","pt":"55",
              "tr":"58","da":"59","nl":"56","pl":"57","nb":"60","is":"64",
              "sv":"61","fi":"62","hu":"63","et":"65","ca":"66","eu":"67","ru":"68"};
   return(FLAGS[lange]);
}
function markupLanguagesDropdown(snode,lanAR,defla){
   DEBUGGER?console.log("[markupLanguagesDropdown]"):0;
   var TONGS = {"en":"English ",    "de":"Deutsch ",    "es":"Español ",
                "fr":"Français ",    "pt":"Português ",  "it":"Italiano ",
                "ru":"Pусский  ",    "tr":"Türkçe ",     "hu":"Magyar ",
                "nl":"Nederlands ", "da":"Dansk ",      "pl":"Polski ",
                "nb":"Norsk ",      "is":"Islenska ",   "sv":"Svenska ",
                "fi":"Suomi ",      "et":"Eesti Keel ", "ca":"Català ",       "eu":"Euskara "},

       m ="<div id='" + snode + "LanguageContainer' class='notionary-langhold'>"+
        "<select class='notionary-langpick' id='" + snode + "LanguageSelect'>";
   if ( lanAR ) // A subset of all Languages is desired
     for ( k in lanAR ) {
        console.log(k);
        m += "<option";
        if ( defla == lanAR[k] ) m += " selected ";
        m += " value='" + lanAR[k] + "'>" + TONGS[lanAR[k]] +
           "</option>\n";
     }
   else  // Markup the entire Language set
     for ( t in TONGS ){ m += "<option";
        if ( t == defla ) m += " selected ";
        m+= " value='" + t + "'>" + TONGS[t] +
           "</option>\n";
     }
  m+=   "</select>"+
        "<img id='" + snode + "LanguageImage' "+
           " class='notionary-langimag' src='"+
           HARDCODE.image + languageToImage(defla)+"'/>"+
     "</div>";
   return(m);
}
