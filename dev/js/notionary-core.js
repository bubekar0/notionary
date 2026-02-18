var USERBILD, THEINDEX, TESTTIME, DECILEFT, TIMEOUTS, QUESTIME, KORREKTE, FALSCHER, AUSTREAM,
    ENERGIZE, ACTIVITY, BROWSLAN, SMARTFON, CHOIXHOV, IMAGEHOV, SOUNDHOV, FBAKTOUT,
    LVTARGET, LVPRCENT, LVLENGTH = 12, LVMINPCT = 0.9,
    SELECTED = PROBZAHL = 0, PENANCES = 2, CHOIXMIN = 5, CHOIXSEP = "￭", DEFSPERQ = 30,
    OWNERMAX = CHAMPMAX = REVUEMAX = CARDSMIN = MAXTOUTS = 10, DESKNMAX = 35, MOBINMAX = 18,
    DEBUGGER = PLAYABLE = true,
    LOGGEDIN = ROOTUSER = ISEXTANT = false,
    WORKDATA = WAHLLIST = PROBLEMS = new Array(),
    SERVINFO = USERINFO = TRANSLAT = HARDCODE = NINFDATA = MOREDATA = MISTAKES = VIELDATA = SUPERSET = {},
    NAMESREG = [/^[a-zA-ZäöüÄÖÜßаАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ\- \.\/]+$/,
                /^[a-zA-ZäöüÄÖÜßаАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ\- \.\/]+$/,2,50],
    DESCRREG = [/^[a-zA-ZäöüÄÖÜßаАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ\- \.\/,;]+$/,
                /^[a-zA-ZäöüÄÖÜßаАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ\- \.\/,;]+$/,2,50],
    PWORDREG = [/^[^ "`'&<>\\]+$/,/^[^ "`'&<>\\]+$/,8,20],
    EMAILREG = [/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
                /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,10,50],
    NNAMEREG =  [ NAMESREG[0],  NAMESREG[1],  5,  50], 
    NDESCREG =  [ DESCRREG[0],  DESCRREG[1], 10, 250], 
    DIGITREG =  [ /^\s*(\+|-)?\d+\s*$/, /^\s*(\+|-)?\d+\s*$/, 5,10],
    NOMETACH =  [ /[^§[/(){}=%&#<>$*+?!"'`\\\^\]]/, /[^§[/(){}=%&#<>$*+?!"'`\\\^\]]+/, 10, 10],
    QANDAREG =  [ /^[^"`\\]+$/, /^[^"`\\]+$/, 1,  250];


// Non minimizable classes --- dynamic
// <div class='notionary-enfocado'>
// <div class='notionary-exfocado'>

console.log("%cStop!", "font:5em sans-serif; color:red; background-color:white;text-shadow:1px 2px 4px black");
console.log("This is a browser feature intended for developers." +
            " If someone told you to copy-paste something here," +
            " it is a scam and will give them access to your account.");

if ( isMobile() ) SMARTFON = 1;  // Save subsequent calls to isMobile()

UID = { _current: 0, getNew: function(){ this._current++; return this._current; } };
HTMLElement.prototype.pseudoStyle = function(element,prop,value){
    var _this = this,
        _sheetId = "pseudoStyles",
        _head = document.head || document.getElementsByTagName('head')[0],
        _sheet = document.getElementById(_sheetId) || document.createElement('style'),
        className = "pseudoStyle" + UID.getNew();
    _sheet.id = _sheetId;
    
    _this.className +=  " "+className; 
    
    _sheet.innerHTML += " ."+className+":"+element+"{"+prop+":"+value+"}";
    _head.appendChild(_sheet);
    return this;
}
Element.prototype.setAttributes = function (attrs) {
    var idx, prop;
    for (idx in attrs) {
        if ((idx === 'styles' || idx === 'style') && typeof attrs[idx] === 'object') {
            for (prop in attrs[idx]){this.style[prop] = attrs[idx][prop];}
        } else if (idx === 'html') {
            this.innerHTML = attrs[idx];
        } else {
            this.setAttribute(idx, attrs[idx]);
        }
    }
};
Number.prototype.mod = function(n) { return ((this%n)+n)%n; }
Number.prototype.euro2d = function(){ return this.toFixed(2).replace(".",","); }
String.prototype.dotcom = function(){ return this.replace(".",","); }
String.prototype.comdot = function(){ return this.replace(",","."); }
String.prototype.float2 = function(){ return parseFloat( this ).toFixed(2); }
String.prototype.sauber = function(){ return this.replace(/"/g,"").replace(/&/g,"&amp;") .replace(/</g,"&lt;").replace(/>/g, "&gt;"); }
String.prototype.https  = function(){ return this.replace("https","http").replace("http","https"); }
String.prototype.escapo = function(){ return encodeURIComponent(this).replace(/'/g,"%27"); }
String.prototype.kurzen = function(chars){ if(this.length>chars) return this.substr(0,chars)+" ... "; else return this; }
String.prototype.sizeok = function(minim,maxim){ if(this.length<minim || this.length>maxim) return false; else return true; }
String.prototype.istgut = function(regex,maxsize){ if(!regex.test(this) || this.length > maxsize) return false; else return true; }
String.prototype.issane = function(regex){ if(!regex.test(this)) return false; else return true; }


function Promise(fn) {
  var state = 'pending', value, deferred = null;
  function resolve(newValue) {
    if(newValue && typeof newValue.then === 'function') { newValue.then(resolve, reject); return; }
    state = 'resolved'; value = newValue; if(deferred) { handle(deferred); }
  }
  function reject(reason) { state = 'rejected'; value = reason; if(deferred) { handle(deferred); } }
  function handle(handler) { var handlerCallback, ret;
    if(state === 'pending') { deferred = handler; return; }
    if(state === 'resolved') { handlerCallback = handler.onResolved; } else { handlerCallback = handler.onRejected; }
    if(!handlerCallback) { if(state === 'resolved') { handler.resolve(value); } else { handler.reject(value); } return; }
    ret = handlerCallback(value);
    handler.resolve(ret);
  }
  this.then = function(onResolved, onRejected) {
    return new Promise(function(resolve, reject) {
      handle({ onResolved: onResolved, onRejected: onRejected, resolve: resolve, reject: reject });
    });
  };
  fn(resolve, reject);
}
function detectIE() {
   var ua, msie, trident, rv; //, edge;
   ua = window.navigator.userAgent;
   msie = ua.indexOf('MSIE ');
   if (msie > 0) { return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10); }
   trident = ua.indexOf('Trident/');
   if (trident > 0) { rv = ua.indexOf('rv:'); return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10); }
   // EDGE seems to get things right
   //edge = ua.indexOf('Edge/');
   //if (edge > 0) { return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10); }
   return false;
}
function explorerCentral( esto ){ if ( detectIE() && !SMARTFON ){ esto.style.setProperty("top","20%"); esto.style.setProperty("left","20%"); } }
function isMobile(){ if( /iPad|Kindle|Nexus 7|Nexus 10|Xoom/i.test(navigator.userAgent) ) return false; // Catch iPad and treat as a desktop
   if( /midp|j2me|avantg|docomo|novarra|palmos|palmsource|240x320|opwv|chtml|pda|windows\ ce|mmp\/|blackberry|mib\/|symbian|wireless|nokia|hand|mobi|phone|cdm|up\.b|audio|SIE\-|SEC\-|samsung|HTC|mot\-|mitsu|sagem|sony|alcatel|lg|erics|vx|NEC|philips|mmm|xx|panasonic|sharp|wap|sch|rover|pocket|benq|java|pt|pg|vox|amoi|bird|compal|kg|voda|sany|kdd|dbt|sendo|sgh|gradi|jb|\d\d\di|moto|iphone|Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) return true;
}
function padding(n, len) { s = n.toString(); if (s.length < len) { s = ('0000000000' + s).slice(-len); } return s; }
function addListenerMulti(element, eventNames, listener) {
  var i, events = eventNames.split(' ');
  for ( i = 0, iLen = events.length; i < iLen; i++ ) {
    element.addEventListener(events[i], listener, false);
  }
}
function obfus(){
   DEBUGGER?console.log("[obfus]"):0;
   var i, ob = fu = sk = at = obstr = "", possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
   for ( i = 0; i < 60; i++ ) ob += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) fu += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) sk += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) at += possible.charAt(Math.floor(Math.random() * possible.length));
   obstr = "&ob=" + ob + "&fu=" + fu + "&sk=" + sk + "&at=" + at;
   return(obstr);
}
function afterAmputation(bodyPart,cback){
   if ( typeof( bodyPart ) == 'undefined' ||  bodyPart  == null ) cback();
   else {
      document.body.removeChild( bodyPart ); bodyPart = null; 
      setTimeout(function(){ afterAmputation(bodyPart,cback); },10);
   }
}
function isSet(val) { if ( ( val != undefined) && ( val != null ) ) return true; return false; }
function isEmptyObject(obj) {
   if ( isSet( obj ) ) {
      if ( obj.length && obj.length > 0 ) return false;
      for ( var key in obj ) if ( hasOwnProperty.call(obj, key) ) return false;
   } return true;    
}
function cookieReader(cname){
   DEBUGGER?console.log("[cookieReader]"):0;
   var i, x, y, qkarr = document.cookie.split( ";" ); // read qks in array
   for ( i = 0; i < qkarr.length; i++ ) { // walk thru setting x = y
     x = qkarr[i].substr(0,qkarr[i].indexOf( "=" ));
     y = qkarr[i].substr(qkarr[i].indexOf("=") + 1 );
     x = x.replace(/^\s+|\s+$/g,""); // empty out blanks to avoid hack manipulations
     if ( x == cname ) return unescape(y); // if found, return it
   }
}
function cookieWriter(cname,cwert,xdays){
   DEBUGGER?console.log("[cookieWriter]"):0;
   var qkval = "", qkexp = new Date();
   qkexp.setDate(qkexp.getDate() + xdays);
   qkval = escape(cwert);
   qkval += ( !xdays ? "" : "; expires=" + qkexp.toUTCString());
   document.cookie = cname + "=" + qkval; // write qk
}
function update255Cookie(uname){
   DEBUGGER?console.log("[update255Cookie]"):0;
   // Called by renderMain for LOGGEDIN only, We just update the browser
   var i, old255, two55 = "", possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
   for ( i = 0; i < 40; i++ ) two55 += possible.charAt(Math.floor(Math.random() * possible.length));
   if ( cookieReader("rememberme") == "true" ) { old255 = cookieReader("two55");
      // Update two55 IFF undefined or length < 40. Any 40+ should be ok
      try { // Undefined is the result of cookies being erased !! Unavoidable
         if ( old255.length < 40 ) { // Here the size check is on
            cookieWriter("two55",uname + ":" + two55,365);
         }
      } catch(err) {  // Here size check failed .. we must be undefined
         cookieWriter("two55",uname + ":" + two55,365);
      }
   } else cookieWriter("two55","",-1);
}
function getLocale(){
   DEBUGGER?console.log("[getLocale]"):0;
   var speak = "en"; // default to english
   try { speak = USERINFO[0].ulang; } catch(err){ speak = BROWSLAN; }
   switch ( speak ) { // xx_XX style is not gplus compatible (xx-XX)
      case 'de': localeString = "de_DE"; break;
      case 'es': localeString = "es_ES"; break;
      case 'fr': localeString = "fr_FR"; break;
      case 'it': localeString = "it_IT"; break;
      case 'pt': localeString = "pt_PT"; break;
      case 'ru': localeString = "ru_RU"; break;
      case 'hu': localeString = "hu_HU"; break;
      case 'tr': localeString = "tr_TR"; break;
      default:   localeString = "en_US"; break;
   }
   return(localeString);
}
function getGlocale(){
   DEBUGGER?console.log("[getGlocale]"):0;
   var speak = "en"; // default to english
   try { speak = USERINFO[0].ulang; } catch(err){ speak = BROWSLAN; }
   switch ( speak ) { // xx_XX style is not gplus compatible (xx-XX)
      case 'de': gString = "de"; break;
      case 'es': gString = "es"; break;
      case 'fr': gString = "fr"; break;
      case 'it': gString = "it"; break;
      case 'pt': gString = "pt"; break;
      case 'ru': gString = "ru"; break;
      case 'hu': gString = "hu"; break;
      case 'tr': gString = "tr"; break;
      default:   gString = "en-US"; break;
   }
   return(gString);
}
function convertSecondsToTime(str){
   DEBUGGER?console.log("[convertSecondsToTime]"):0;
   var ret="", min=parseInt(str/60), sec=str-min*60;
   if ( min ) ret = min + "m";
   if ( sec ) ret += sec + "s";
   return(ret);
}
function cleanBrowserAddress(){ history.pushState('', document.title, HARDCODE.myurl); }

// This needs to be open to public for test to work on wrong answers
function playByID(id){
   DEBUGGER?console.log("[playByID]"):0;
   var speakers = document.createElement("div");
                  speakers.setAttribute("id","anonSpeakers");
                  speakers.style.setProperty("visibility","hidden");
                  document.body.appendChild( speakers );

   if ( !USERINFO[0].auchx && PLAYABLE ) {
      speakers.innerHTML = "<audio id='sonido' autoplay controls preload id='playMe'>" +
                              "<source type='audio/mpeg' src='" + HARDCODE.sound + id + "'>" +
                              "<source type='audio/ogg'  src='" + HARDCODE.sound + id + "'>" +
                           "</audio>";
      setTimeout( function(){ document.body.removeChild(speakers) }, 5000);
   }
}
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
function httpget(url,hdr,val){
   DEBUGGER?console.log("[httpget => " + url + "]"):0;
   return new Promise(function(resolve,reject) {
     var req = new XMLHttpRequest();

     req.open('GET',url);
     if ( hdr && val ) {
        req.setRequestHeader("Access-Control-Allow-Headers","Access-Control-Allow-Origin");
        req.setRequestHeader(hdr,val);
     }
     req.onload = function() {
        if ( req.status == 200 ) resolve( req.response );
        else reject( Error( req.statusText ) );
     }
     req.onerror = function() { reject( Error("Network Error") ); };
     req.send();
  });
}
function httpost(url,params){
   DEBUGGER?console.log("[httpost =>" + url + ": " + params + "]"):0;
   return new Promise(function(resolve,reject) {
     var req = new XMLHttpRequest();
     req.open('POST',url);
     req.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
     req.onload = function() {
        if ( req.status == 200 ) resolve( req.response );
        else reject( Error( req.statusText ) );
     }
     req.onerror = function() { reject( Error("Network Error") ); };
     req.send( params );
  });
}
function loadJS(src){
   DEBUGGER?console.log("[loadJS:" + src + "]"):0;
   return new Promise(function(resolve,reject) {
      var s = document.createElement('script');
      s.type = 'text/javascript';  s.src = src;
      s.onload = resolve; s.onerror = reject;
      document.head.appendChild(s);
   });
}
function gLangLoader(src,iazik){
   DEBUGGER?console.log("[gLangLoader:" + src + "]"):0;
   var s = document.createElement('script');
   s.type = 'text/javascript';
   s.innerHTML =
      "window.___gcfg = {" +
        "lang: '" + iazik + "'," +
        "parsetags: 'onload'" +
      "};";
   document.head.appendChild(s);
   loadJS(src);
}
function seter(tafel,chcol,nuval,wocol,olval,cback){
   DEBUGGER?console.log("[seter]"):0;
   var params = "tun=seter&was=" +
          JSON.stringify({'tafel':tafel, 'chcol':chcol,
          'nuval':nuval, 'wocol':wocol, 'olval':olval });
   httpost("usrindex.php",params).then(
      function(response) { cback(); },
      function( error ) { clickNotiz( error ); }
   );
}
function jasonSINFO(lan2L,cback){
   DEBUGGER?console.log("[jasonSINFO]"):0;
   var url = "?tun=sinfo&was=" + lan2L;
   httpget(url).then(
      function(response) { SERVINFO = JSON.parse( response );
         for ( i = 0; i < SERVINFO[2].param.length; i++ )
            for (x in SERVINFO[2].param[i]) HARDCODE[x] = SERVINFO[2].param[i][x];
      },
      function( error ) { clickNotiz( error ); }
   ).then( cback );
}
function jasonUINFO(cback){
   DEBUGGER?console.log("[jasonUINFO]"):0;
   var url = "?tun=uinfo";
   httpget(url).then(
      function(response) {
         if ( response.length ) {
            USERINFO = JSON.parse( response );
            if ( BROWSLAN != USERINFO[0].ulang ) { jasonSINFO( BROWSLAN = USERINFO[0].ulang , 0 ); }
         } else USERINFO[0] = "";
      },
      function(error) { USERINFO[0] = ""; }
   ).then( cback );
}
function jasonXLATE(lan2L,cback){
   DEBUGGER?console.log("[jasonXLATE]"):0;
   var LANGINFO,
       url = "?tun=linfo&was=" + lan2L;
   httpget(url).then(
      function(response) { var i, x;
         LANGINFO = JSON.parse( response );
         for ( i = 0; i < LANGINFO.length; i++ )
            for ( x in LANGINFO[i]) TRANSLAT[x] = LANGINFO[i][x];
      },
      function(error) { clickNotiz( error ); }
   ).then( cback );
}
function loadUserAdminSources(cback){
   DEBUGGER?console.log("[loadUserAdminSources]"):0;
   var usrCssLink, admCssLink;
   httpget("?tun=isusr").then(function( isUser ){ // is this guy an LOGGEDIN ?
      if ( isUser ==  "true" ){ LOGGEDIN = true; // Load the LOGGEDIN Sources
         loadJS("js/" + HARDCODE.mynom + "-user-min.js?version=VERSION_TRACKER").then(function(){
            usrCssLink = document.createElement( "link" );
            usrCssLink.rel  = "stylesheet"; usrCssLink.type = "text/css";
            usrCssLink.href = "css/" + HARDCODE.mynom + "-user-min.php?version=VERSION_TRACKER";
            document.head.appendChild( usrCssLink );
         }).then(function(){ // is this LOGGEDIN the ROOTUSER ?
            httpget("usrindex.php/?tun=isadm").then(function( isAdmin ){
               if ( isAdmin  == "true" ){ ROOTUSER = true; // Load the ROOTUSER Sources
                  loadJS("js/" + HARDCODE.mynom + "-admn-min.js?version=VERSION_TRACKER").then(function(){
                     admCssLink = document.createElement( "link" );
                     admCssLink.rel  = "stylesheet"; admCssLink.type = "text/css";
                     admCssLink.href = "css/" + HARDCODE.mynom + "-admn-min.php?version=VERSION_TRACKER";
                     document.head.appendChild( admCssLink );
                  }).then(cback);
               } else cback(); // This LOGGEDIN is not ROOTUSER so proceed with cback();
            });
         });
      } else cback(); // This guy was outsider, so proceed with cback()
   });
}
function fbookButton(estilo,btnTyp,iazik,urlOrUser,showBubble,extraStyle){
   DEBUGGER?console.log("[fbookButton]"):0;
   // btnTyp = 'folge' needs a FBook User Profile as urlOrUser instead of a website
   var resourceString = "", shareString = "&amp;layout=button", bubbleString = "", actionString ="";
   if ( showBubble ) bubbleString = "&amp;layout=button_count";
   switch( btnTyp ){
      case 'like':  plugin = "like";
                    resourceString = "&href=" + urlOrUser;
                    actionString   = "&amp;action=like"; // like||recommend
                    break;
      case 'share': plugin = "share_button";
                    resourceString = "&href=" + urlOrUser;
                    actionString   = "&amp;action=like"; // like||recommend
                    shareString    = "&amp;share=true";
                    break;
      case 'folge': plugin = "follow"; // DEPRECATED
                    resourceString = "&href=http%3A%2F%2Fwww.facebook.com%2F" + urlOrUser;
                    break;
   }
   return("<iframe class='" + estilo + "' " +
              "src='//www.facebook.com/plugins/" + plugin + ".php?locale=" + iazik +
                 resourceString + shareString + bubbleString + actionString +
              "' scrolling='no' " +
              " frameborder='0' " +
              " style='border:none;overflow:hidden;" + extraStyle + "' " +
              " allowTransparency='true'>" +
          "</iframe>");
}
function gplusButton(estilo,btnTyp,urlOrUser,showBubble){
   DEBUGGER?console.log("[gplusButton]"):0;
   // btnTyp = 'folge' needs a GPlus User Profile as urlOrUser instead of a website
   var actionString = "", datarelString = "", bubbleString = " data-annotation='none' ";
   if ( showBubble ) bubbleString = " data-annotation='bubble' ";
   switch( btnTyp ){
      case 'plus1': klase = "g-plusone"; break;
      case 'share': klase = "g-plus";
                    actionString =   " data-action='share' "; break;
      case 'folge': klase = "g-follow";
                    datarelString  = " data-rel='publisher' "; break;
   }
   return(
      "<div class='" + estilo + "'>" +
          "<div class='" + klase + "' data-size='medium' " +
               bubbleString + actionString + datarelString +
               " data-href='" + urlOrUser + "'>" +
          "</div>" +
      "</div>");
}
function tweetButton(estilo,btnTyp,iazik,urlOrUser,theMSG,extraStyle){
   DEBUGGER?console.log("[tweetButton]"):0;
   // btnTyp = 'folge' needs a Twitter User Profile as urlOrUser instead of a website
   var resourceString = "", tweetString = "";
   if ( theMSG.length )  tweetString = "&text=" + theMSG;
   switch( btnTyp ){
      case 'tweet': plugin = "tweet";
                    resourceString = "url=" + urlOrUser + "&data-counturl=" + urlOrUser; break;
      case 'folge': plugin = "follow";
                    resourceString = "screen_name=" + urlOrUser; break;
   }
   return("<iframe class='" + estilo + "' " +
               "src='//platform.twitter.com/widgets/" + plugin + "_button.html?" +
                  resourceString + tweetString + "&lang=" + iazik + "&show_count=false" + "&data-show-count=false" +
              "' scrolling='no' " +
              " frameborder='0' " +
              " style='border:none;overflow:hidden;" + extraStyle + "' " +
              " allowTransparency='true'>" +
          "</iframe>");
}
function displayPDFFile(server,tuwas,ancho,alto){
   DEBUGGER?console.log("[displayPDFFile]"):0;
   onNAJAX("displayPDFFile");
   return(
      "<iframe "+
         " src='" + server + "?tun=" + tuwas + "' "+
         " onload='offNAJAX(" + '"displayPDFFile"' + ");'" +
         " style='width:" + ancho + ";height:" + alto + ";' "+
         " frameborder='0'>"+
      "</iframe>");
}
function killLoginSession(){
   DEBUGGER?console.log("[killLoginSession]"):0;
   LOGGEDIN = false;
   cookieWriter("rememberme","false",-1);
   cookieWriter("two55","",-1);
   // Kill server side session
   httpget("usrindex.php/?tun=outen").then(
      function( response ) { },
      function( error ) { }
   ).then(function(){ landingPage(); jasonUINFO(); window.location = HARDCODE.myurl; });
}
function nentr(){ onNAJAX("enter");
   httpget("?tun=mylan").then(
      function( response ){ BROWSLAN = response; }
   ).then(function(){
      jasonSINFO( BROWSLAN, function(){
         jasonUINFO(function(){ if ( USERINFO[0].nosnd ) PLAYABLE = false;
            loadSuperNotions(); loadUserAdminSources( linfoThenParseURL ); offNAJAX("enter");
         });
      });
   });
}
function linfoThenParseURL(){ // URL tokens (nname,level,uname) from Server directly into the heap: see ../php/utiles.php:stags()
   DEBUGGER?console.log("[linfoThenParseURL]"):0;
   jasonXLATE( BROWSLAN, function(){ // TRANSLAT loaded, pssibly default 'en', now this
      NAMESREG[4] = TRANSLAT.notre;
      if ( nname == "prvcy" || nname == "condi" || nname == "terms" || nname == "okdok" ) handleServerDirectives(nname);
      else {
         if ( typeof nname == "string" && nname.length ) {// got ?n=xyz, if fake treat as search
            onNAJAX("ninfo"); // Here special fail treatment so avoid shelf jasonNINFO()
            httpget("?tun=ninfo&was=" + nname).then( function( response ) { NINFDATA = JSON.parse( response );
                  switch ( level ) { case "0": level = "learn"; break; case "1": level = "trial"; break;
                                     case "2": level = "write"; break; case "3": level = "adept"; break;
                                     case "4": level = "micro"; break; default : level = "trial"; break; }
                  if ( typeof uname == "string" && uname.length ) // handle "uname" &u=xyz directive => Authenticate()
                     showSigninZentral( function(){ landingPage(); showSupers(); },uname);
                  else { landingPage(); go4it(nname,level); }
               }, function( error ) { searchResults( nname ); } // This failure is treated as a search!!
            ).then(function(){ offNAJAX("ninfo"); });
         } else { landingPage(); showSupers(); }   // No directive nor Notion, so let's paint a page
      }
   });
}
function handleServerDirectives(nnameArg){
   DEBUGGER?console.log("[handleServerDirectives]"):0;
   if ( nnameArg == "terms" ) { // FB|GP|TW|Sigup 1st pass -> '?t' b4 'crack' => Agree then ?tun=oauth cback()
      agreeToTermsOfUse(function(){
         httpget("?tun=oauth").then(
            function( response ) { window.location = HARDCODE.myurl; },
            function( error ) { clickNotiz( error ); }
         );
   });
   }
   if ( nnameArg == "prvcy" ) { landingPage(); showPrivacyPolicy(); }
   if ( nnameArg == "condi" ) { landingPage(); showTermsOfUse(); }
   if ( nnameArg == "okdok" ) { landingPage(); showSupers();
                                onNAJAX("dbhome");
                                setTimeout( function(){ clickNotiz( TRANSLAT.dbhom ); },
                                            2000 );
                                offNAJAX("dbhome");
                              }
}
function anonimize(){
   DEBUGGER?console.log("[anonimize]"):0;
   var mainlogo = document.getElementById( "anonMainlogo" ),
       settings = document.getElementById( "userSettings" ),
       escritor = document.getElementById( "userEscritor" ),
       thumbler = document.getElementById( "mobiThumbler" ),
       anmelder = document.getElementById( "anonAnmelder" ),
       exmelder = document.getElementById( "userExmelder" );
   mainlogo.onclick = function(e) { window.location.href = HARDCODE.myurl; }
   anmelder.onclick = function(e) { showSigninZentral( function(){ landingPage(); showSupers(); }); }
   turnOff.apply(this,[ settings, escritor, thumbler, exmelder ]);
   
   if ( cookieReader("coook") != "true" && !LOGGEDIN )
      disruptPopup(
         "<div>" +
            "<span id='acceptAdvice'>" + TRANSLAT.cooky + "</span> " +
            "<span id='acceptExiter'><span class='fa fa-check'></span>" + TRANSLAT.ackno + "</span> " +
         "</div>",
         function(){ cookieWriter("coook","true",365); }
      );
}
function insiduous(){
   DEBUGGER?console.log("[insiduous]"):0;
   var settings = document.getElementById( "userSettings" ),
       escritor = document.getElementById( "userEscritor" ),
       thumbler = document.getElementById( "mobiThumbler" ),
       anmelder = document.getElementById( "anonAnmelder" ),
       exmelder = document.getElementById( "userExmelder" );
   if ( LOGGEDIN ) {
      if ( USERINFO[0].kenne || USERINFO[0].wrote || USERINFO[0].meist || countProblemsInUINFO() ) showUserProgress();
      settings.onclick = showProfilePopup;
      escritor.onclick = createNotionManually;
      exmelder.onclick = killLoginSession;
      ausblenden( anmelder );
      einblenden( settings, 10, "inline-block" );
      turnOn.apply(this,[ thumbler, exmelder ]);
      if ( !SMARTFON ) einblenden( escritor, 10, "inline-block" );
      update255Cookie(USERINFO[0].uname);                         // Update only Browser and IFF < 40 chars
      if ( ROOTUSER ) bindAdminTools();
   }
}
function rentr(){
   DEBUGGER?console.log("[renter]"):0;
   onNAJAX("renter");
   var tokens, tuner = waser = "", node, ergebnis;
       tokens = document.location.search.split("&");
       tuner = tokens[0].substr(5,tokens[0].length);
       if ( tokens.length > 1 ) { waser = tokens[1].substr(4,tokens[1].length); }
   httpget("?tun=mylan").then(function( response ){ BROWSLAN = response; })
    .then(function(){
      jasonSINFO( BROWSLAN, function(){
         jasonUINFO(function(){ if( USERINFO[0].nosnd ) PLAYABLE = false;
            loadSuperNotions();
            loadUserAdminSources( function(){
               jasonXLATE( BROWSLAN, function(){ NAMESREG[4] = TRANSLAT.notre;
                  document.body.innerHTML = markupSkeleton();
                  anonimize();
                  insiduous();
                  switch ( tuner ) {
                     case 'suche': node = document.getElementById( "anonRealarea" );
                           showSearchEngine();
                           httpget("?tun=busca&was=" + waser ).then(
                              function( response ){
                                 ergebnis = JSON.parse( response );
                                 notns = ergebnis["notns"];
                                 if ( notns ) node.innerHTML = markupNotionsSummary(notns,TRANSLAT.found,"");
                                 else { clickNotiz( TRANSLAT.keine ); showSupers(); }
                              }, function ( error ) { clickNotiz( error ); }
                           ).then(function(){ offNAJAX("suche"); bindNotionDisplayWidgets(); });
                           break;
                     case 'learn':case 'trial':case 'write':case 'adept':case 'micro':
                     case 'lista':case 'lesen':case 'watch':case 'amend': go4it(waser,tuner); break;
                     case 'probs':  repasoSession(); break; 
                     case 'prvcy':  showPrivacyPolicy(); break; 
                     case 'terms':  showTermsOfUse(); break; 
                     case 'guide':  showGuideAtBottom(); break; 
                     case 'cooks':  showCookiesPolicy(); break; 
                     case 'imprs':  showImpressum(); break; 
                     default: showSearchEngine(); break;
                  }
                  renderFuss();
               });
            });
            offNAJAX("renter");
         });
      });
   });
}
function adminMarkup(){
   DEBUGGER?console.log("[adminMarkup]"):0;
   if ( !ROOTUSER ) return("");
   return("<div    id='rootMenuclik' class='fa fa-bars' title='Вы можете получить это далеко, но не дальше'>" +
             "<div id='userActivity'></div>" +
          "</div>" +
          "<div    id='rootMenulist' class='notionary-tooltips'>" +
             "<div id='rootBetatest' class='notionary-toolitem'><span class='fa fa-flask'></span>        Beta Test     </div>" +
             "<div id='rootDebugger' class='notionary-toolitem'><span class='fa fa-bug'></span>          Server Info   </div>" +
             "<div id='rootDecacher' class='notionary-toolitem'><span class='fa fa-trash'></span>        Clean Caches  </div>" +
             "<div id='rootMedclone' class='notionary-toolitem'><span class='fa fa-clone'></span>        Media Cloner  </div>" +
             "<div id='rootImagechg' class='notionary-toolitem'><span class='fa fa-file-image-o'></span> Image Editor  </div>" +
             "<div id='rootImageprg' class='notionary-toolitem'><span class='fa fa-database'></span>     Image Purger  </div>" +
             "<div id='rootSoundchg' class='notionary-toolitem'><span class='fa fa-headphones'></span>   Sound Editor  </div>" +
             "<div id='rootSoundprg' class='notionary-toolitem'><span class='fa fa-music'></span>        Sound Purger  </div>" +
             "<div id='rootUseredit' class='notionary-toolitem'><span class='fa fa-user'></span>         User Editor   </div>" +
             "<div id='rootRecorder' class='notionary-toolitem'><span class='fa fa-microphone'></span>   Microphone    </div>" +
             "<div id='rootGmapstat' class='notionary-toolitem'><span class='fa fa-map'></span>          Static GMaps  </div>" +
             "<div id='rootGmapdyna' class='notionary-toolitem'><span class='fa fa-map-marker'></span>   Dynamic GMaps </div>" +
          "</div>");
}
function markupSkeleton(){
   DEBUGGER?console.log("[markupSkeleton]"):0;
   var deskhtml = mobihtml = "";
   
   if ( SMARTFON )
                 mobihtml = "<div id='userSettings' class='fa fa-cog'></div>" + 
                            "<div id='userEscritor' class='fa fa-pencil-square-o' title='" + TRANSLAT.creak + "'></div>" +
                            adminMarkup();

   else          deskhtml = "<div id='userSettings' class='fa fa-cog' title='" + TRANSLAT.prefs + "'></div>" +
                            "<div id='userEscritor' class='fa fa-pencil-square-o' title='" + TRANSLAT.creak + "'></div>" +
                            adminMarkup();

   return("<div id='fb-root'></div>" +
          "<div          id='anonHeadroom' onclick='function doNothing(){}'>" +
             "<div       id='anonHeadtops'>" +
                "<div    id='anonMainlogo' class='notionary-logo0815'>" + HARDCODE.myenv + "</div>" +  deskhtml +
                "<button id='anonAnmelder'><span class='fa fa-sign-in'> </span>" + TRANSLAT.sigin + "</button>" +
                "<button id='userExmelder'><span class='fa fa-sign-out'></span>" + TRANSLAT.logof + "</button>" +
             "</div>" +
             "<fieldset  id='anonSuchenom' class='notionary-fieldset'>" +
               "<legend  id='anonSucheleg' class='notionary-legendas'></legend>" +
                "<span   id='anonSuchetxt' class='notionary-thelabel'></span>" +
                "<span   id='anonSucheajx' class='notionary-loadings'></span>" +
                "<input  id='anonSucheinp' class='notionary-contents notionary-exfocado'/>" +
                "<span   id='anonSuchestg' class='notionary-chekmark'></span>" +
                "<button id='anonSuchbttn'></button>" +
             "</fieldset>" +
             "<div       id='userTrophies'></div>" +
          "</div>" +
          "<div id='anonRealarea'></div>" +
          "<div id='mobiThumbler'>" + mobihtml + "</div>" +
          "<div id='anonFootings'></div>");
}
function landingPage(){
   DEBUGGER?console.log("[landingPage]"):0;
   cleanBrowserAddress();
   clearInterval( ENERGIZE );
   clearInterval( ACTIVITY );
   document.body.innerHTML = markupSkeleton();
   document.body.classList.remove("quadro");
   anonimize();
   insiduous();
   showSearchEngine();
   renderFuss();
   if ( HARDCODE.myenv == HARDCODE.mynom ) loadJS( HARDCODE.athis );  // The script remains in <head> but its markup gets wiped on exam exit
}
function showSupers(){
   DEBUGGER?console.log("[showSupers]"):0;
   var x, supes, nquot, supid, markup = "",
       supers = SERVINFO[3].supers,
       worker = document.getElementById( "anonRealarea" );

   for ( x=0; x < supers.length; x++ ) {
      nquot = supers[x].sname.sauber();  // good enough for HTML markup
      supid = supers[x].supid;
      title = "[" + nquot + "] " + supers[x].sdesc.sauber();

      markup +=
         '<div class="notionary-supernotion" super="' + supid +'" title="' + title + '" >' +
               "<div class='notionary-supername'>" + nquot +
                  "  ( " + supers[x].snots.split(",").length + " )  " +
               "</div>" +
               "<div class='notionary-superdesk'>" + supers[x].sdesc + "</div>" +
         "</div>";
   }

   worker.innerHTML = markup;

   supes = document.getElementsByClassName( "notionary-supernotion" );
   for ( i = 0; i < supes.length; i++ )
      supes[i].onclick = function(e) { showSuperNotion( this.getAttribute("super"), document.getElementById( "anonRealarea" ) ); }
}
function jasonNINFO(notion,cback){
   DEBUGGER?console.log("[jasonNINFO]"):0;
   onNAJAX("ninfo");
   httpget("?tun=ninfo&was=" + notion).then(function( response ){
      NINFDATA = JSON.parse( response );
   }).then(cback).then(function(){ offNAJAX("ninfo"); });
}
function getFromUINFO1(matchName,matchValue,memberName){
   DEBUGGER?console.log("[getFromUINFO1]"):0;
   var w, // w = where within the dimension of interest does the match occurr
       m; // m = member to find: nname, ndesc, mysc1 , etc ...
   // First walk throught the dimension of interest looking to match
   for ( w = 0; w < USERINFO[1].rcent.length; w++ ) if ( USERINFO[1].rcent[w][matchName] == matchValue ) break;

   // Now walk through the matched object looking for the member of interest
   for( m in USERINFO[1].rcent[w] ) if ( m == memberName ) return USERINFO[1].rcent[w][m];
   return false; // Nothing matched
}


/* FOOTER ROUTINES */
function renderFuss(){
   DEBUGGER?console.log("[showFooter]"):0;
   var footer = document.getElementById("anonFootings");

   httpget("?tun=mudoc&was=fuss")
      .then(function( response ){ footer.innerHTML = response; })
      .then(function(){
         var //twfolg = document.getElementById( "twfolg" ),
             //ytfolg = document.getElementById( "ytfolg" ),
             //blfolg = document.getElementById( "blfolg" ),
             //igfolg = document.getElementById( "igfolg" ),
             skfolg = document.getElementById( "skfolg" );
             //fblike = document.getElementById( "fblike" ),
             //fbshar = document.getElementById( "fbshar" ),
             //twshar = document.getElementById( "twshar" );

/*
         twfolg.innerHTML = tweetButton("netbtn","folge",getGlocale(),HARDCODE.mynom,"","");
         ytfolg.innerHTML = "<div class='netbtn'>" +
                               '<div class="g-ytsubscribe" data-channelid="UConE_1jsXGZkNCRT8-YKZYg" ' +
                                  ' data-layout="default" data-count="default" data-onytevent="onYtEvent">' +
                               '</div>' +
                            "</div>";
         blfolg.innerHTML = "<a href='" + HARDCODE.blogr + "'><img src='" + HARDCODE.image + 124 + "'></a><br/>";
         igfolg.innerHTML = "<a href='" + HARDCODE.igram + "'><img src='" + HARDCODE.image + 126 + "'></a><br/>";
*/
         skfolg.innerHTML = "<a data-config='commands=*;size=14;status=off;" +
                                "theme=logo;language=en;bgcolor=#2a92f3;hostname=www.skaip.org'" +
                                " id='skaip-buttons' href='http://www.skaip.org/'>" +
                            "<a href='skype:notionary'>notionary</a>";
/*

         fblike.innerHTML = fbookButton("netbtn","like", getLocale(),HARDCODE.myurl,false,"");

         fbshar.innerHTML = fbookButton("netbtn","share",getLocale(),HARDCODE.myurl,true,"");
         twshar.innerHTML = tweetButton("netbtn","tweet",getGlocale(),HARDCODE.myurl,TRANSLAT.using.escapo(),"");
*/

         gLangLoader("https://apis.google.com/js/platform.js",getGlocale());
         loadJS("https://apps.skaip.org/buttons/widget/core.min.js");
         loadJS(HARDCODE.myurl + "js/odniklassniki.js");
   });
}
function showPrivacyPolicy(){
   DEBUGGER?console.log("[showPrivacyPolicy]"):0;
   var shower, privacy;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='privacyContents'></div></div>";
   privacy = document.getElementById( "privacyContents" );
   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=privacy").then(function( response ){
      privacy.innerHTML = response;
   }).then(function(){ offNAJAX("mudoc"); });
}
function showTermsOfUse(){  // As opposed to agreeToTermsOfUse() for account creation
   DEBUGGER?console.log("[showTermsOfUse]"):0;
   var shower, terminos;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='termsContents'></div></div>";
   terminos = document.getElementById( "termsContents" );
   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=terms").then(function( response ){
      terminos.innerHTML = response;
   }).then(function(){ offNAJAX("mudoc"); });
}
function showGuideAtBottom(){
   DEBUGGER?console.log("[showGuideAtBottom]"):0;
   var shower, guider, learnNode, learnObj;
   shower = document.getElementById( "anonRealarea" );
            shower.innerHTML = "<div class='mudocu'><div id='guideContents'></div></div>";
   guider = document.getElementById( "guideContents" );
   learnObj = [{"nidno":"274","nname":"EuCaps","nimag":"1","catno":"1","nsize":4,"slang":"de","tlang":"de","picto":false},
               {"qaimg":[{"q":"14\u00b2","a":"196","i":null,"s":""},
                         {"q":"4\u00b3","a":"64","i":null,"s":""},
                         {"q":"11\u00d718","a":"198","i":null,"s":""},
                         {"q":"1\/12","a":"0.0833...","i":null,"s":""}
                        ]
               }];

   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=faq").then(function( response ){
      guider.innerHTML = response;
      learnNode = document.getElementById( "learnExample" );
      learnNode.innerHTML = TRANSLAT.fover + "<br/>" + markupTheCards( learnObj,"" );
      bindTheCards();
   }).then(function(){ offNAJAX("mudoc"); bindNotionDisplayWidgets(); });
}
function showCookiesPolicy(){
   DEBUGGER?console.log("[showCookiesPolicy]"):0;
   var shower, cooker;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='cookieContents'></div></div>";
   cooker = document.getElementById( "cookieContents" );
   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=cookies").then(function( response ){
      cooker.innerHTML = response;
      bindNotionDisplayWidgets();
   }).then(function(){ offNAJAX("mudoc"); });
}
function showImpressum(){
   DEBUGGER?console.log("[showImpressum]"):0;
   var shower, presser;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='impressumContents'></div></div>";
   presser = document.getElementById( "impressumContents" );
   onNAJAX("mudoc");
   httpget("?tun=mudoc&was=impressum").then(function( response ){
      presser.innerHTML = response;
      bindNotionDisplayWidgets();
   }).then(function(){ offNAJAX("mudoc"); });
}

/* SEARCH FUNCTIONALITY */
function loadNotionsArray(){
   DEBUGGER?console.log("[loadNotionsArray]"):0;
   var i, j, n = 0, x, y, notionsArray = new Array();
   for ( i in SERVINFO[0].kitns )        // i= 0, 1, 2,... as many categories
      for ( x in SERVINFO[0].kitns[i] )  // x= Sci,Geo,Lan,...(as nums! i and x is 1-1)
         for ( j = 0; j < SERVINFO[0].kitns[i][x].length; j++ )   // j= 0, 1, 2, ...
            for ( y in SERVINFO[0].kitns[i][x][j] )         // y= nname, ndesc, ,...
               if ( y == "nname" ) notionsArray[n++] = SERVINFO[0].kitns[i][x][j][y];
   return(notionsArray);
}
function showSearchEngine(){
   DEBUGGER?console.log("[showSearchEngine]"):0;
   var suchfeld = document.getElementById( "anonSucheinp" ),
       suchbttn = document.getElementById( "anonSuchbttn" );

   suchfeld.value     = TRANSLAT.sucht;
   suchfeld.onfocus   = function(e) { refocusSmartInput(this,TRANSLAT.sucht); }
   suchfeld.onblur    = function(e) { unfocusSmartInput(this,TRANSLAT.sucht); }
   suchfeld.onkeyup   = killMetas;
   suchfeld.onkeydown = function(e){ var k = ( e.keyCode ? e.keyCode : e.which ); if ( k == "13" ) searchResults( this.value ); }
   suchbttn.onclick   = function(){ fireKey( suchfeld, 13 ); }
   ausblenden(anonSucheleg);
}
function searchResults(sustr){ // Browsers don't HTTP_IF_NONE_MATCH vs ETag => Search must be done
   DEBUGGER?console.log("[searchResults]"):0;
   var MINCHARS = 3;
   if ( sustr < MINCHARS || sustr == TRANSLAT.sucht.toLowerCase() ) return;
   onNAJAX("suche");
   window.location.href = HARDCODE.myurl + "?tun=suche&was=" + longestTwo( getRidOfFluff( sustr ) );
}
function longestTwo(nnameString){
   DEBUGGER?console.log("[longestTwo]"):0;
   var WORDSLEN = 4,
       i, index=0, longCount = 0,
       longestOne = longestDos = "", retWord,
       kurzArray, strWords = nnameString.split(" ");
   for ( i = 0; i < strWords.length; i++ ) { // Find the longest one
      if ( longCount < strWords[i].length ) {
         longCount = strWords[i].length;
         longestOne = strWords[i];
         index = i;
      }
   }
   retWord = longestOne;
   kurzArray = strWords.splice(index,1); // Find the longest two
   longCount = 0;
   for ( i = 0; i < strWords.length; i++ ) {
      if ( longCount < strWords[i].length ) {
         longCount = strWords[i].length;
         longestDos = strWords[i];
      }
   }
   if ( longestDos.length >= WORDSLEN ) retWord += " " + longestDos;
   return retWord;
}
function getRidOfFluff(inputString){
   DEBUGGER?console.log("[getRidOfFluff]"):0;
   var FLUFFSTR = /\ba\b|\ban\b|\bthe\b/g,  // Default to something albeit small
       SUCHEMAX = 20,
       BADCHARS = /[§[/(){}=%&#<>$*+?!"`\\\^\]]+/g,
       outputString;
   switch( BROWSLAN ){
      case 'en': FLUFFSTR=/\ba\b|\ban\b|\ball\b|\bam\b|\ban\b|\band\b|\balso\b|\bany\b|\bare\b|\bas\b|\bat\b|\bbe\b|\bbut\b|\bcan\b|\bdid\b|\bdo\b|\bdoes\b|\bfor\b|\bfrom\b|\bhas\b|\bhad\b|\bhave\b|\bhere\b|\bhow\b|\bi\b|\byou\b|\bif\b|\bin\b|\bis\b|\bit\b|\bno\b|\bnot\b|\bof\b|\bon\b|\bor\b|\bso\b|\bthat\b|\bthe\b|\bthen\b|\bthere\b|\bthis\b|\bto\b|\btoo\b|\bup\b|\buse\b|\bwith\b|\bwithout\b|\bwhat\b|\bwhen\b|\bwhere\b|\bwho\b|\bwhy\b|\byou\b/g; break;
      case 'de': FLUFFSTR=/\bein\b|\beine\b|\balle\b|\bam\b|\ban\b|\bin\b|\bans\b|\bund\b|\begal\b|\bbist\b|\bso\b|\bwie\b|\bbei\b|\bals\b|\baber\b|\bkann\b|\btun\b|\btut\b|\bfür\b|\bvon\b|\bseit\b|\bhat\b|\bhatte\b|\bhaben\b|\bhier\b|\bich\b|\bwenn\b|\bbin\b|\bins\b|\bder\b|\bdie\b|\bdas\b|\bmit\b|\bohne\b|\bsein\b|\bist\b|\bbes\b|\bnein\b|\bnicht\b|\boder\b|\bdass\b|\bdenn\b|\bdann\b|\bdort\b|\bda\b|\bjene\b|\bdiese\b|\bzu\b|\bzum\b|\bauf\b|\bab\b|\baus\b|\bwas\b|\bwann\b|\bwo\b|\bwer\b|\bwarum\b|\bdu\b/g; break;
      case 'es': FLUFFSTR=/\bun\b|\buno\b|\buna\b|\bunos\b|\bunas\b|\ben\b|\bentre\b|\bdentro\b|\by\b|\be\b|\bcualquiera\b|\beres\b|\basi\b|\btodo\b|\btoda\b|\btodos\b|\btodas\b|\bpor\b|\bpara\b|\bentonces\b|\bluego\b|\bmientras\b|\bpero\b|\bpuede\b|\bhacer\b|\bde\b|\bdesde\b|\btiene\b|\btuvo\b|\btener\b|\baqui\b|\byo\b|\btu\b|\bsi\b|\bsoy\b|\bel\b|\bla\b|\blos\b|\blas\b|\bcon\b|\bsin\b|\bser\b|\bes\b|\beso\b|\besa\b|\besos\b|\besas\b|no\b|\bo\b|\bque\b|\balli\b|\baca\b|\balla\b|\beste\b|\besta\b|\estos\b|\bestas\b|\ba\b|\bsobre\b|\bsegun\b|\bbajo\b|\btras\b|\bsegun\b|\bdonde\b|\bquien\b|\bcuando\b|\bque\b|\bcual\b|\bcomo\b|\bporque\b|\btu\b/g; break;
      case 'fr': FLUFFSTR=/\bun\b|\bune\b|\ben\b|\bentre\b|\bet\b|\btous\b|\btout\b|\bensuite\b|\bpar\b|\bpour\b|\bpuis\b|\balors\b|\bmais\b|\bfaire\b|\bde\b|\bdu\b|\ba\b|\bici\b|\bla\b|\bmoi\b|\btoi\b|\bvous\b|\bnous\b|\bil\b|\belle\b|\bils\b|\bavec\b|\bsans\b|\bquoi\b|\bcette\b|\ce\b|\bca\b|\bces\b|non\b|\bou\b|\bqui\b|\bceux\b|\bsuivant\b|\bselon\b|\bsous\b|\bsur\b|\bapres\b/g; break;
      case 'pt': FLUFFSTR=/\bum\b|\btudo\b|\bsou\b|\bum\b|\be\b|\btambém\b|\bqualquer\b|\bsão\b|\bcomo\b|\bno\b|\bser\b|\bmas\b|\bpode\b|\bfazer\b|\bfaz\b|\bpara\b|\bde\b|\bteve\b|\btenho\b|\baqui\b|\bcomo\b|\beu\b|\bse\b|\bé\b|\bem\b|\bnenhum\b|\bnão\b|\bda\b|\b\b|\bou\b|\bque\b|\bo\b|\bentão\b|\bhá\b|\bisso\b|\bcom\b|\bsem\b|\bquando\b|\bonde\b|\blhe\b|\bporquê\b/g; break;
      case 'it': FLUFFSTR=/\bun\b|\buno\b|\buna\b|\bla\b|\blo\b|\btale\b|\bal\b|\ballo\b|\balla\b|\btutto\b|\btutta\b|\bin\b|\ba\b|\bdi\b|\bdentro\b|\bentro\b|\bdurante\b|\bnell\b|\bfra\b|\bcon\b|\bper\b|\bsu\b|\bpresso\b|\be\b|\bpoi\b|\bma\b|\bperò\b|\btuttavia\b|\baltro\b|\bsenza\b|\beccetto\b|\btranne\b|\bsalvo\b|\bsoltanto\b|\bpiù\b|\banche\b|\bpure\b|\binoltre\b|\bqualsiasi\b|\bqualunque\b|\bogni\b|\bdella\b|\bdelle\b|\bdei\b|\balcuno\b|\balcuni\b|\bqualcuno\b|\bsei\b|\bsono\b|\bsiete\b|\bsiamo\b|\bcome\b|\bquanto\b|\btanto\b|\bche\b|\bquale\b|\bcosì\b|\bverso\b|\bcontro\b|\bessere\b|\bfare\b|\bstare\b|\bfor\b|\bdegli\b|\bqui\b|\bqua\b|\bio\b|\btu\b|\bno\b|\bnon\b|\bsu\b|\bavanti\b|\bo\b|\boppure\b|\bovvero\b|\bsicché\b|\bperché\b|\btroppo\b|\bqui\b|\ballora\b|\bdopo\b|\bci\b|\bvi\b|\bsopra\b|\boltre\b|\bsebbene\b|\bdove\b|\bche\b|\bchi\b/g; break;
   }
   if ( inputString.length > SUCHEMAX ) outputString = inputString.substr(0,SUCHEMAX);
   else outputString = inputString.toString();
   outputString = outputString.toLowerCase().replace( BADCHARS , "").replace( FLUFFSTR, "").replace(/ +(?= )/g,'');
   return(outputString);
}

function loadSuperNotions(){
   DEBUGGER?console.log("[loadSuperNotions]"):0;
   for( i = 0; i < SERVINFO[3].supers.length; i++ ){
      var strAR = nidsAR = new Array();
      strAR = SERVINFO[3].supers[i].snots.split(",");
      SUPERSET[ SERVINFO[3].supers[i].supid ] = [ SERVINFO[3].supers[i].sname ];
      for ( j = 0; j < strAR.length; j++ ) SUPERSET[ SERVINFO[3].supers[i].supid ].push( strAR[j] );
   }
}
function katxy( digit ){ if ( digit < 10 ) return( TRANSLAT["kat0" + digit ]); else return( TRANSLAT["kat" + digit] ); }
function categoryID( katxy ){ // kat01->Langs kat02->Math kat03->Sci kat04->Geo kat05->Hist kat19->Standard kat20->Others
   DEBUGGER?console.log("[categoryID]"):0;
   var i, y = "01", catKodex = ["kat01","kat02","kat03","kat04","kat05","kat19","kat20"];
   for ( i = 0; i < catKodex.length; i++ ) if ( TRANSLAT[catKodex[i]] == katxy ) y = catKodex[i].substr(3,2);
   if ( y.substr(0,1) == "0" ) return(y.substr(1,1)); else return(y);
}
function isInSuperNotions( nidno ) { for ( x in SUPERSET ) if ( SUPERSET[ x ].indexOf( nidno ) >= 0 ) return x; return false; }
function showSuperNotion(snotion,node){
   DEBUGGER?console.log("[showSuperNotion]"):0;
console.log("showSuperNotion: " + snotion );
   var i, j, n = 0, x, y, z, retAR = new Array();
   for ( z = 1; z < SUPERSET[snotion].length; z++ )
      for ( i in SERVINFO[0].kitns )        // i= 0, 1, 2,... as many categories
         for ( x in SERVINFO[0].kitns[i] )  // x= Sci,Geo,Lan,...(as nums! i and x is 1-1)
            for ( j = 0; j < SERVINFO[0].kitns[i][x].length; j++ )   // j= 0, 1, 2, ... index of Notion Object
               for ( y in SERVINFO[0].kitns[i][x][j] )         // y= nname, ndesc, ,...
                  if ( y == "nidno" && SUPERSET[snotion][z] == SERVINFO[0].kitns[i][x][j][y] ) retAR[n++]=SERVINFO[0].kitns[i][x][j];
   node.innerHTML = markupNotionsSummary(retAR,SUPERSET[snotion][0],"");
   bindNotionDisplayWidgets();
}
function showSoundContribution(){ // Placed here to give outsiders a chance to ask for this tool
   DEBUGGER?console.log("[showSoundContribution]"):0;
   var xm = "", nakeNode, r; // Markup a Sound Contribution Utility for an entire Notion's Questions set
   nakeNode = document.getElementById( "anonRealarea" );
   if ( !LOGGEDIN ) clickNotiz(TRANSLAT.logfn);
   else {
      inits = "qs";
      xm += "<div id='editFeedback' class='notionary-feedback'></div>";
      for ( THEINDEX = 0; THEINDEX < NINFDATA[1].qaimg.length; THEINDEX++){
         xm+="<div class='notionary-qandarow' id='" + THEINDEX + "'>" +
                "<span  class='notionary-tracking'>" + THEINDEX + "</span>" +
                '<input readonly="readonly" class="notionary-readonly" id="' + THEINDEX + 'a" value="' +
                        NINFDATA[1].qaimg[ THEINDEX ].a.sauber() + '">' +
                markupRecorder( inits + "_" + THEINDEX ) +
             "</div>";
      }
      nakeNode.innerHTML = xm;
      announce( document.getElementById( "editFeedback"), "[" + NINFDATA[0].nname + "]", "radTang" );
      onNAJAX("recorder");
      loadJS("js/recorder.js").then(function(){
         loadJS("js/recorderWorker.js").then(function(){
            for ( r = 0; r < THEINDEX; r++ )
               bindRecorderGuts( inits + "_" + r, NINFDATA[0].nname, NINFDATA[1].qaimg[r].q, NINFDATA[1].qaimg[r].s );
         });
      }).then( function(){ offNAJAX("recorder"); });
   }
}
function agreeToTermsOfUse(cback){
   DEBUGGER?console.log("[agreeToTermsOfUse]"):0;
   var agreeButton; // nary signUP(vrify) + fb/tw/gp(oauth)
   httpget("?tun=mudoc&was=terms").then(
      function( response ) {
         document.body.innerHTML = "<div style='width:80%;margin:0 auto;'>" + response +
                                      "<button id='termsAgreeButton'>" + TRANSLAT.agree + "</button>" +
                                   "</div>";
         agreeButton = document.getElementById( "termsAgreeButton" );
         agreeButton.onclick = cback;
      },
      function( error ) { clickNotiz ( error ); }
   );
}
function showSigninZentral(loginCBK,loginals){
   DEBUGGER?console.log("[showSigninZentral]"):0;
   var COOKDAYS = 365,
       CHEKMAIL = 5000,
       advisory, username, userajax, mailname, mailajax, welcomer, minombre, password, clavedos, newpword,
       contibtn, confobtn, siginbtn, sigupbtn, register, stickers, autologs, vergesen,
       facebook, googling, tweeting;
   zentraller("signIn", 
      markupSmartInput("un",TRANSLAT.untxt,true,"") +                      // Standard Username Widget for known accounts
      markupSmartInput("em",TRANSLAT.emtxt,true,"") +                      // E-Mail Address Widget for new users
      markupSmartInput("pw",TRANSLAT.pwtxt,true,"") +                      // Standard password Widget for known accounts
      markupSmartInput("p2",TRANSLAT.p2txt,true,"") +                      // Password Confirmation Widget for Password Changes
      "<button   id='contiKnopf'>" + TRANSLAT.conti + "</button>" +        // Continue Button when Username is filled in
      "<button   id='siginKnopf'>" + TRANSLAT.sigin + "</button>" +        // Sign In Button when Username and Password filled in
      "<button   id='confoKnopf'>" + TRANSLAT.p2txt + "</button>" +        // Password Confirmation Button when New Password is filled in
      "<button   id='sigupKnopf'>" + TRANSLAT.savit + "</button>" +        // Sign Up Button when Username and Password filled in
      "<a        id='signupLink'>" + TRANSLAT.sigup + "</a>" +
      "<a        id='forgotPwrd'>" + TRANSLAT.i4got + "</a>"+
      "<div      id='stickyArea'>" + "<input id='stickyChbx' type='checkbox'/>" + TRANSLAT.kenne + "</div>" +
      "<div      id='netButtons'>" +
         "<div   id='fbookLogin' title='" + TRANSLAT.sigfb + "' class='notionary-facebook'></div>" +
         "<div   id='gplusLogin' title='" + TRANSLAT.siggp + "' class='notionary-googling'></div>" +
         "<div   id='tweetLogin' title='" + TRANSLAT.sigtw + "' class='notionary-tweeting'></div>" +
      "</div>",
      function(){ // Bind Callback()
         advisory = document.getElementById( "signInZentralInfo" );     welcomer = document.getElementById( "signInZentralUser" );
         username = document.getElementById( "uninp" );                 userajax = document.getElementById( "unajx" );      
         mailname = document.getElementById( "eminp" );                 mailajax = document.getElementById( "emajx" );      
         password = document.getElementById( "pwinp" );                 clavedos = document.getElementById( "p2inp" );
         contibtn = document.getElementById( "contiKnopf" );            confobtn = document.getElementById( "confoKnopf" );
         siginbtn = document.getElementById( "siginKnopf" );            sigupbtn = document.getElementById( "sigupKnopf" );
         vergesen = document.getElementById( "forgotPwrd" );            register = document.getElementById( "signupLink" );
         stickers = document.getElementById( "stickyArea" );            autologs = document.getElementById( "stickyChbx" );
         facebook = document.getElementById( "fbookLogin" );            googling = document.getElementById( "gplusLogin" );
         tweeting = document.getElementById( "tweetLogin" );            quitting = document.getElementById( "signInZentralExit" );

         turnOff.apply(this,[ username.parentNode.firstChild,
            mailname.parentNode, password.parentNode, clavedos.parentNode,
            welcomer, siginbtn, confobtn, sigupbtn, vergesen, stickers ]);

         instruct(advisory,TRANSLAT.track,"black");

         // Handle Create Account (Sign Up)
         register.onclick = function() {
            turnOff.apply(this,[ mailname.parentNode.firstChild,
               username.parentNode, register, facebook, googling, tweeting ]);
            einblenden(mailname.parentNode,100);
            instruct(advisory,TRANSLAT.sigut,"black");
            mailname.onkeyup   = killMetas;
            mailname.onkeydown = function(e){ 
               if ( this.value == TRANSLAT.emtxt ) this.value = "";
               var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
               if ( k == "13" )
                  if ( this.value && sanitized( this.value, EMAILREG ) ) { onNAJAX("known");
                     mailajax.style.visibility = "visible";                   // Check to see if it is a notionary user
                     httpget("?tun=known&was=" + this.value ).then(
                        function( response ) {
                           if ( response ) instruct(advisory,TRANSLAT.taken,"red");
                           else {
                              instruct(advisory,TRANSLAT.pwpls,"black");
                              turnOff.apply(this,[ password.parentNode.firstChild, mailname.parentNode]);
                              einblenden(password.parentNode);
                              einblenden(welcomer,10,"table");
                              minombre = cette.value;
                              welcomer.innerHTML = minombre;
                              password.value = TRANSLAT.pwpls;
                              password.parentNode.firstChild.innerHTML = TRANSLAT.pwpls;
                              password.onkeydown = function(e){
                                 var k = (e.keyCode ? e.keyCode : e.which);
                                 if ( this.value == TRANSLAT.pwpls ){ this.setAttribute("type","password"); this.value = ""; }
                                 if ( k == "13" )
                                    if ( this.value && sanitized( this.value, PWORDREG ) ) { newpword = this.value;
                                       turnOff.apply(this,[ clavedos.parentNode.firstChild, password.parentNode, contibtn ]);
                                       turnOn.apply(this,[ clavedos.parentNode, confobtn ]);
                                       // Process the Password Confirm Input
                                       instruct(advisory,TRANSLAT.p2txt,"black");
                                       clavedos.onkeydown = function(e){
                                          var k = (e.keyCode ? e.keyCode : e.which);
                                          if ( this.value == TRANSLAT.p2txt ){ this.value = ""; this.setAttribute("type","password"); }
                                          if ( k == "13" )
                                             if ( this.value && sanitized( this.value, PWORDREG ) ) {
                                                if ( this.value == newpword ) {
                                                   agreeToTermsOfUse(function(){ 
                                                      httpost("index.php","tun=vrify&was=" +
                                                         JSON.stringify({ "quien":minombre, "pword":newpword, "razon":"crack" })
                                                      ).then(function(response){
                                                            if ( response ) clickNotiz( response );
                                                            else { timedNotiz(TRANSLAT.emchk);
                                                               turnOff.apply(this,[ clavedos.parentNode, welcomer, confobtn ]); }
                                                            setTimeout(function(){ landingPage(); showSupers(); }, CHEKMAIL);
                                                         },function( error ) { clickNotiz( error ); }
                                                      );
                                                   });
                                                } else instruct(advisory,TRANSLAT.pmiss,"red");
                                             } else instruct(advisory,TRANSLAT.pwbad,"red");
                                       }
                                       clavedos.onfocus = function(){ refocusSmartInput(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
                                       clavedos.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.p2txt);
                                          if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,TRANSLAT.p2txt,"black"); }
                                       clavedos.focus(); 
                                       confobtn.onclick = function() { fireKey(clavedos,13); }
                                    } else instruct(advisory,TRANSLAT.pwbad,"red");
                              }
                              password.onfocus = function(){ refocusSmartInput(this,TRANSLAT.pwpls); this.setAttribute("type","password"); }
                              password.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.pwpls);
                                 if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,TRANSLAT.pwpls,"black"); }
                              password.focus();
                              contibtn.onclick = function() { fireKey(password,13); }
                           }
                        }, function( error ) { clickNotiz( error); }
                     ).then ( function(){ offNAJAX("known"); mailajax.style.visibility = "hidden"; } );
                  } else instruct(advisory,TRANSLAT.eapls,"red");
            }
            mailname.onfocus = function(){ refocusSmartInput(this,TRANSLAT.emtxt); } 
            mailname.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.emtxt);
               if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,TRANSLAT.sigut,"black");
            }
            mailname.focus(); if ( SMARTFON ) mailname.blur();  // Give Mobiles clearer display w/o keyboard clutter at first
            contibtn.onclick = function() { fireKey(mailname,13); }
         }

         // Handle Regular Login Session
         username.onkeyup   = killMetas;
         username.onkeydown = function(e){ 
            if ( this.value == TRANSLAT.untxt ) this.value = "";
            var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
            if ( k == "13" )
               if ( this.value && sanitized( this.value, EMAILREG ) ) { onNAJAX("known");
                  userajax.style.visibility = "visible";                   // Check to see if it is a notionary user
                  httpget("?tun=known&was=" + this.value ).then(
                     function( response ) {
                        if ( response ) {                                  // Indeed we have a notionary user
                           turnOff.apply(this,[ password.parentNode.firstChild, username.parentNode,
                              contibtn, register, facebook, googling, tweeting ]);
                           turnOn.apply(this,[ password.parentNode, siginbtn, vergesen, stickers ]);
                           einblenden(welcomer,10,"table");
                           instruct(advisory,"Welcome","black");           // Welcome the User
                           welcomer.innerHTML = cette.value;
                           // Here the Password event handlers keydown, focus, blur
                           password.onkeydown = function(e){               
                              var k = (e.keyCode ? e.keyCode : e.which);
                              if ( this.value == TRANSLAT.pwtxt ){ this.value = ""; this.setAttribute("type","password"); }
                              if ( k == "13" )
                                 if ( this.value && sanitized( this.value, PWORDREG ) ) { onNAJAX("login");
                                    httpost("index.php","tun=login&was=" +
                                       JSON.stringify({ "uname":username.value, "pword":password.value })
                                    ).then(
                                       function(response){
                                          if ( response ){ LOGGEDIN = true;
                                             jasonUINFO(function(){
                                                loadUserAdminSources(function(){ jasonXLATE( BROWSLAN, function(){ loginCBK(); }); });
                                             });
                                          } else instruct(advisory,TRANSLAT.nolog,"red");
                                       }, function( error ){ clickNotiz( error ); }
                                    ).then(function(){ offNAJAX("login"); });
                                 } else instruct(advisory,TRANSLAT.pwbad,"red");
                           }
                           password.onfocus = function(){ refocusSmartInput(this,TRANSLAT.pwtxt); this.setAttribute("type","password"); }
                           password.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.pwtxt);
                              if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,"Welcome","black"); }
                           siginbtn.onclick = function() { fireKey(password,13); }
                           password.focus();

                           // Handle Password Reset (Forgot Password)
                           vergesen.onclick = function() {
                              turnOff.apply(this,[ password.parentNode.firstChild, siginbtn, vergesen, stickers ]);
                              einblenden(contibtn,100);
                              instruct(advisory,TRANSLAT.chpas,"black");
                              password.value = TRANSLAT.pwpls;
                              password.parentNode.firstChild.innerHTML = TRANSLAT.pwpls;
                              password.onkeydown = function(e){
                                 var k = (e.keyCode ? e.keyCode : e.which);
                                 if ( this.value == TRANSLAT.pwpls ){ this.setAttribute("type","password"); this.value = ""; }
                                 if ( k == "13" )
                                    if ( this.value && sanitized( this.value, PWORDREG ) ) { newpword = this.value;
                                       turnOff.apply(this,[ clavedos.parentNode.firstChild, password.parentNode, contibtn ]);
                                       turnOn.apply(this,[ clavedos.parentNode, confobtn ]);
                                       // Process the Password Confirm Input
                                       instruct(advisory,TRANSLAT.chpas,"black");
                                       clavedos.onkeydown = function(e){               
                                          var k = (e.keyCode ? e.keyCode : e.which);
                                          if ( this.value == TRANSLAT.p2txt ){ this.value = ""; this.setAttribute("type","password"); }
                                          if ( k == "13" )
                                             if ( this.value && sanitized( this.value, PWORDREG ) ) {
                                                if ( this.value == newpword ) {
                                                   httpost("index.php","tun=vrify&was=" +
                                                      JSON.stringify({ "quien":welcomer.innerHTML, "pword":this.value, "razon":"i4got" })
                                                   ).then(function(response){
                                                         if ( response ) clickNotiz( response );
                                                         else { timedNotiz(TRANSLAT.emchk);
                                                            turnOff.apply(this,[ clavedos.parentNode, welcomer, confobtn ]); }
                                                         setTimeout(function(){ landingPage(); showSupers(); }, CHEKMAIL);
                                                      },function( error ) { clickNotiz( error ); }
                                                   );
                                                } else instruct(advisory,TRANSLAT.pmiss,"red");
                                             } else instruct(advisory,TRANSLAT.pwbad,"red");
                                       }
                                       clavedos.onfocus = function(){ refocusSmartInput(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
                                       clavedos.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.p2txt);
                                          if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,TRANSLAT.p2txt,"black"); }
                                       clavedos.focus();
                                    } else instruct(advisory,TRANSLAT.pwbad,"red");
                                 confobtn.onclick = function() { fireKey(clavedos,13); }
                              }
                              password.onfocus = function(){ refocusSmartInput(this,TRANSLAT.pwpls); this.setAttribute("type","password"); }
                              password.onblur  = function(){ unfocusSmartInput(this,TRANSLAT.pwpls);
                                 if ( getStyleProp(this,"visibility") == "visible" ) instruct(advisory,TRANSLAT.chpas,"black"); }
                              password.focus();
                              contibtn.onclick = function() { fireKey(password,13); }
                           }
                        } else instruct(advisory,TRANSLAT.emunk,"red");       // This E-mail is not in our Database
                     }, function( error ) { clickNotiz( error); }
                  ).then ( function(){ offNAJAX("known"); userajax.style.visibility = "hidden"; password.focus(); } );
               } else instruct(advisory,TRANSLAT.eapls,"red");               // This is not a valid E-mail Address
         }
         username.onfocus = function(e){ refocusSmartInput(this,TRANSLAT.untxt); }
         username.onblur  = function(e){ unfocusSmartInput(this,TRANSLAT.untxt); }
         username.focus();  if ( SMARTFON ) username.blur();                          // Give Mobiles clear display w/o keyboard clutter

         contibtn.onclick = function() { fireKey(username,13); }
         if ( autologs ) autologs.onchange = function(){
            if ( this.checked  ) cookieWriter("rememberme","true",COOKDAYS);
            else cookieWriter("rememberme","false",COOKDAYS);
         }
         facebook.onclick = function() { window.location = HARDCODE.myurl + "?tun=logfb"; }
         googling.onclick = function() { window.location = HARDCODE.myurl + "?tun=loggg"; }
         tweeting.onclick = function() { window.location = HARDCODE.myurl + "?tun=logtw"; }

         if ( loginals ) { username.value = loginals; fireKey(username,13); }   // For those login through an Email Test Result
      } , function(){ landingPage(); showSupers(); });
}
function markupIdempotentButtons(){
   DEBUGGER?console.log("[markupIdempotentButtons]"):0;
   return("<div class='notionary-idempotent'>" +
      "<button id='mix1b'>" +
         "<span class='fa fa-mouse-pointer'></span>" +
         "<span class='fa fa-mouse-pointer'></span>" +
         TRANSLAT.trial +
      "</button>" +
      "<button id='mix2b'>" +
         "<span class='fa fa-pencil'></span>" +
         "<span class='fa fa-pencil'></span>" +
         TRANSLAT.write +
      "</button>" +
      "<span id='displayMixedCounter'></span>" +
   "</div>");
}
function superSchreiber(supid){
   DEBUGGER?console.log("[superSchreiber]"):0;
   var i, creimg, sidx;
   creimg = HARDCODE.image + "101";
   for ( i = 0; i < SERVINFO[3].supers.length; i++ )
      if ( SERVINFO[3].supers[i].supid == supid ) sidx = i;
   if ( SERVINFO[3].supers[sidx].ownav ) creimg = HARDCODE.image + SERVINFO[3].supers[sidx].ownav;
   return( SERVINFO[3].supers[sidx].sname + 
      "<div class='notionary-creavatar'>" + TRANSLAT.creby +
            SERVINFO[3].supers[sidx].owner.kurzen( OWNERMAX ) +
         "<img src='" + creimg + "'/>" +
      "</div>" +
      "<span class='notionary-call2act'>" + SERVINFO[3].supers[sidx].sdesc + "</span>");
}
function ninfoSchreiber(nobj){
   DEBUGGER?console.log("[ninfoSchreiber]"):0;
   // A decent looking summary info about the Notion as a tooltip on Accordion
   var imag0, pacar = champ = myone = mytwo = mytre = myall ="";
   if(nobj.piece)
      pacar = "<div class='notionary-groupie'>" +
                 "<span class='bnero'>" + TRANSLAT.teile +
                         nobj.piece + "&nbsp;" + TRANSLAT.outof + nobj.parts +
                 "</span>" +
              "</div>";
   nobj.ownav ? imag0 = HARDCODE.image + nobj.ownav : imag0 = HARDCODE.image + "101";
   if ( nobj.mysc1 ) myone = "<br/>[➊]✔" + nobj.mysc1 + "%(" + convertSecondsToTime(nobj.mybt1) + ")<br/>";
   if ( nobj.mysc2 ) mytwo = "[➋]✍" + nobj.mysc2 + "%(" + convertSecondsToTime( nobj.mybt2 ) + ")<br/>";
   if ( nobj.mysc3 ) mytre = "[❸]☜" + nobj.mysc3 + "%(" + convertSecondsToTime( nobj.mybt3 ) + ")<br/>";
   if ( myone + mytwo + mytre != "" ) // Don't render scores unless thre is at least one
      myall = "<div class='notionary-myscores'>" +
                 "<span class='bnero'>" + TRANSLAT.perfo + "</span>" +
                  myone + mytwo + mytre +
              "</div>";
   if (nobj.chmp1 ) // Don't render Champion info unles there is one
      champ = "<div class='notionary-champion'>"+
                 "<span class='bnero'>"  + TRANSLAT.rekor + "</span>" +
                 "<span class='bnero'>[" + nobj.chmp1.kurzen( CHAMPMAX ) + "]</span> " +
                 "<span class='bnero'>"  + nobj.scor1 +
                        "%(" + convertSecondsToTime(nobj.time1) + ")" +
                 "</span>" +
              "</div>";
   return(nobj.nname + "<div class='notionary-creavatar'>" +
             "<span class='nnero'>" + TRANSLAT.creby + "</span>" +
             nobj.owner.kurzen( OWNERMAX ) + 
             "<img src='"+ imag0+"'/>"+
          "</div>" +
          pacar + myall +
          "<span class='notionary-call2act'>" + nobj.ndesc + "</span>" +
          formatGenericReviews(nobj.revus));
}
function formatGenericReviews(reviews){
   DEBUGGER?console.log("[formatGenericReviews]"):0
   // Markup the passed Reviews in a standard form
   var i, rvstr = "<div>", huwat, revAR = new Array();
   revAR = reviews.split( "￭" );
   if ( revAR.length > 1 ) rvstr += "<span class='nhony'>" + TRANSLAT.revus + "</span><br/>";
   for ( i = 0; i < revAR.length-1; i++ ) {
      huwat = revAR[i].split( "-->>" );
      rvstr += "<span class='sazur'>" + huwat[0].kurzen( REVUEMAX ) + ": </span><br/>"+
               "<span class='sgrun'>" + huwat[1] + "</span><br/>";
   }
   rvstr += "</div>";
   return( rvstr );
}
function computeLearnedPercent(keyAR,title,trailer){
   DEBUGGER?console.log("[computeLearnedPercent]"):0;
   var x, progress, totalProgress = 0;
   for( x=0; x < keyAR.length; x++ ){
      progress = 0; 
      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc1") ) progress = 0.33;
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc2") ) progress = 0.66;
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc3") ) progress = 1.00;
      } catch(err){};
      totalProgress += progress;
   }
   if( totalProgress > 0 ) return(" " + Math.round(100*totalProgress/keyAR.length) +"% "); else return("");
}
function markupNotionsSummary(keyAR,titular,trailer){
   DEBUGGER?console.log("[markupNotionsSummary]"):0;
   // Source used to be one of : (found|meine|npops|rcent|nrels)
   var mu = mobMU = "", x, autor, title, sterne, nenco, nquot, nisrc; 
   mu += markupIdempotentButtons() + "<h2>" + titular + "</h2>";
   for ( x=0; x < keyAR.length; x++ ) {
      percnt = "<div class='notionary-prozent'></div>";
      keyAR[x].nimag ? nisrc = HARDCODE.image + keyAR[x].nimag : nisrc = HARDCODE.image + "101";
      nquot = keyAR[x].nname.sauber();  // good enough for HTML markup

      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc1") )
            percnt="<div class='notionary-prozent'> 33%" + TRANSLAT.compl + "</div>";
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc2") )
            percnt="<div class='notionary-prozent'> 66%" + TRANSLAT.compl + "</div>";
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc3") )
            percnt="<div class='notionary-prozent'>100%" + TRANSLAT.compl + "</div>";
      } catch(err){};

      sterne = "";
      for ( i = 1; i <= parseInt(keyAR[x].rated); i++ ) sterne += "<span class='fa fa-star'></span>";
      sterne = '<div class="notionary-ratings">' + sterne + '</div>';
      title = "[" + nquot + "] " + keyAR[x].ndesc.sauber();
      if ( ( keyAR[x].ownid == USERINFO[0].uidno ) || ( USERINFO[0].uidno == "1" ) ) autor = true;
      else autor = false;
      nenco = encodeURIComponent( HARDCODE.myurl + "?tun=trial&was=" + keyAR[x].nname );

      mu += '<div class="notionary-plainnotion" title="' + title +'" rname="' + nquot + '"'+
                  " picto='" + keyAR[x].picto + "' " +
                  " forja='" + keyAR[x].forja + "'>" +
               "<input type='checkbox' " +
                  " class='notionary-checkbox' title='" + TRANSLAT.multi + "' "+
                  ' nname="' + nquot + '"/>'+
               "<div class='notionary-notioname'>" + nquot + "</div>" +
                  "<img class='notionary-thumbnail' src='" + nisrc + "'/>" +
                  "<div class='notionary-howmany'>" + TRANSLAT.total + keyAR[x].nsize + "</div>" +
                  sterne  + percnt ;

           if ( keyAR[x].chmp1 ) mu +=
                    "<div class='notionary-topscore'>" +
                       "<span>"  + TRANSLAT.rekor + "</span>" +
                       "<span>[" + keyAR[x].chmp1.kurzen( CHAMPMAX ) + "]</span> " +
                       "<span>"  + keyAR[x].scor1 +
                              "%(" + convertSecondsToTime(keyAR[x].time1) + ")" +
                       "</span>" +
                    "</div>";


      mu += "</div>";

   }
   return( mu + trailer );
}
function bindNotionDisplayWidgets(){
   DEBUGGER?console.log("[bindNotionDisplayWidgets]"):0;
   var MULTIMAX = 5,
       i, kernNode, mixnum,
       lapices, likables, notpads,/* zeroes, singles, couples, troikas,*/ chekers,
       nopictos, noformos, japictos, jaformos;

   document.body.scrollTop = document.documentElement.scrollTop = 0;

   kernNode = document.getElementById( "anonRealarea" );            
   mix1id   = document.getElementById( "mix1b" );           mix1id ? mix1id.style.visibility = "hidden" : 0;
   mix2id   = document.getElementById( "mix2b" );           mix2id ? mix2id.style.visibility = "hidden" : 0;
   mixnum   = document.getElementById( "displayMixedCounter" );


   lapices = document.getElementsByClassName("notionary-plainnotion");
   for ( i = 0; i < lapices.length; i++ )
      lapices[i].onclick = function( e ){ 
         window.location.href = HARDCODE.myurl + "?tun=trial&was=" + this.getAttribute("rname");
      }

   likables = document.getElementsByClassName( "notionary-likeable" );
   for ( i = 0; i < likables.length; i++ ) likables[i].onmouseover = function( e ){
      if ( this.alreadyHovered == null ) { // Hover once (catch event once via dummy variable Hack )
         this.innerHTML = 
            fbookButton("flike","like", getLocale(), this.getAttribute("nurl"),true,"width:120px;height:21px;") +
            tweetButton("tlike","tweet",getGlocale(),this.getAttribute("nurl"),
                        TRANSLAT.using.escapo() + " ☞  " + this.getAttribute("nurl"),"width:115px;height:21px;");
            //gplusButton("glike","plus1",this.getAttribute("nurl"),true);
         FB.XFBML.parse();   // Looks like hidden fblik and twitt btns aren't rendered unless reparsed by FFox
         gLangLoader("https://apis.google.com/js/platform.js",getGlocale());
         this.alreadyHovered = true;
      }
   }

   notpads = document.getElementsByClassName( "notpad" );
   for ( i = 0; i < notpads.length; i++ )
      notpads[i].onclick = function( e ){
            window.location.href = HARDCODE.myurl + "?tun=trial&was=" + this.getAttribute("nname");
                           }
   chekers = document.getElementsByClassName( "notionary-checkbox" );


   for ( i = 0; i < chekers.length; i++ ) {
      nopictos = document.querySelectorAll('[picto="false"]'); noformos = document.querySelectorAll('[forja="false"]');
      japictos = document.querySelectorAll('[picto="true"]');  jaformos = document.querySelectorAll('[forja="true"]');
      chekers[i].onclick = function(e) { e.stopPropagation();
         var nindx;
         if ( this.checked ) { // checking adds to list
            WAHLLIST[ SELECTED++ ] = this.getAttribute("nname"); mixnum.innerHTML = SELECTED;
            if ( SELECTED > MULTIMAX ) // enforce Max mix
               for ( i = 0; i < chekers.length; i++ ) if ( !chekers[i].checked ) chekers[i].style.visibility = "hidden";
         } else {  // must be removing notion form the list then
            nindx = WAHLLIST.indexOf( this.getAttribute("nname") ); WAHLLIST.splice( nindx, 1 );   SELECTED--;
            if ( SELECTED != 0 ) mixnum.innerHTML = SELECTED; else mixnum.innerHTML = "";
            if ( SELECTED <= MULTIMAX ) for ( i = 0; i < chekers.length; i++ ) chekers[i].style.visibility = "visible";
         }
         // Show multi-buttons when you have at least a pair of ticked checkboxes
         if ( SELECTED > 1 ) { 
            mix1id.style.visibility = "visible"; blinkNode(mix1id,"radBlau", true);
            mix2id.style.visibility = "visible"; blinkNode(mix2id,"radBlau", true);
         } else { mix1id.style.visibility = "hidden";  mix2id.style.visibility = "hidden"; }
         if ( SELECTED == 1 ) { // Ensure no Notion/Piction/Formulation mixing
            // If a Piction is picked first, eliminate all non - piction choices
            if ( this.parentNode.parentNode.getAttribute("picto") == "true" ) // just pictions
               for ( i = 0; i < nopictos.length; i++ )   nopictos[i].style.display = "none";
            else if ( this.parentNode.parentNode.getAttribute("forja") == "true" ) // just formulations
               for ( i = 0; i < noformos.length; i++ )   noformos[i].style.display = "none";
            else { // just notions
               for ( i = 0; i < japictos.length; i++ )   japictos[i].style.display = "none";
               for ( i = 0; i < jaformos.length; i++ )   jaformos[i].style.display = "none";
            }
         }
      }
   }

   // Between ninfo and mixqa You must choose to put one in the other or else you wont
   // know which ends up first and where to put rest of dependent code (go4it)
   // We have a nice wrapper for 'ninfo' so use it -->> jasonNINFO()
   if ( mix1id ) mix1id.onclick = function(){ onNAJAX("mixqa");
      jasonNINFO( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         httpget("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if ( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix1b" );
               }
            },
            function(error) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("mixqa"); } );
      });
   }
   if ( mix2id ) mix2id.onclick = function(){ onNAJAX("mixqa");
      jasonNINFO( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         httpget("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix2b" );
               }
            },
            function(error) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("mixqa"); } );
      });
   }
}
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
function bindRatingsButtons(){
   DEBUGGER?console.log("[bindRatingsButtons]"):0;
   var i, ratings, theRating, ratsHolder;
   ratsHolder = document.getElementById( "perfNotionRating" );
   ratings = document.getElementsByClassName( "notionary-ratings" );
   for ( i = 0; i < ratings.length; i++ )
      ratings[i].onclick = function( e ){
         this.setAttribute("disabled","true");
         this.classList.remove("notionary-opaque");
         theRating = this.getAttribute("title");
         onNAJAX("raupd");
         httpost("usrindex.php","tun=raupd&was=" + JSON.stringify(
            { "nidno": NINFDATA[0].nidno,
              "rated": theRating
            })
         ).then( function( response ) {
               if ( response ) clickNotiz( response );
               else { popupFAI("fa-check","#4D90FE","1em"); ausblenden(ratsHolder,1000,false); }
            }, function( error ) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("raupd"); } );
      }
}
function bindShareByMailButton(){
   DEBUGGER?console.log("[bindShareByMailButton]"):0;
   var msend, whoto, whstg, temporaNode, my_OFF, my_FB;
   msend = document.getElementById( "mail2" );
   if ( msend ) msend.onclick = function(){
      temporaNode = document.getElementById( "perfTemporaHolder" );
      temporaNode.innerHTML = "<span  class='notionary-exbutton fa fa-times'></span>"+
                              "<div   class='notionary-feedback'></div>" +
                              markupSmartInput("sh",TRANSLAT.emtxt,true,"");
      einblenden( temporaNode, 1000);
      my_OFF = temporaNode.firstChild; my_OFF.onclick = function(e){ ausblenden(temporaNode,1000,false); }
      my_FB  = my_OFF.nextSibling;    announce(my_FB,msend.getAttribute("title"),"radTang");
      whoto = document.getElementById( "shinp" ); whstg = document.getElementById( "shstg" );
      whoto.onfocus = function(e){ this.value = ""; activateInput( this ); }
      whoto.onkeydown = function(e){ k =  (e.keyCode ? e.keyCode : e.which );
         clearInput( this );
         if ( k == "13" || k == "9" ){
            if ( sanitized( this.value, EMAILREG ) ) {
               colorById( this,"radGrun");
               deactivateInput( this );
               shstg.style.width = shstg.style.height = "34px";
               onNAJAX("mail2");
               httpost("usrindex.php","tun=mail2&was=" + JSON.stringify({
                        "whoto": this.value, "prfid": msend.getAttribute("prfid") })).then(
                     function( response ){ },
                     function( error ){ announce(my_FB,error,"radRojo"); }
                  ).then(function(){ ausblenden(temporaNode,1000,false); offNAJAX("mail2"); });
            } else { announce(my_FB,TRANSLAT.eapls,"radRojo"); colorById( this,"radRojo"); }
         }
      }
      whoto.style.visibility = "visible";
   }
}
function concludeTest(testtype,right,score,dauer,probs){
   DEBUGGER?console.log("[concludeTest]"):0;
   var s, performance, xamrestitle, xamresoffer,
       reviewerBtn, temporaNode, commentBox, panelaZwote,
       cette, playables, testsTaken1, holdsTest1,
       testsTaken2, holdsTest2, testsTaken3, holdsTest3;
   httpget("usrindex.php/?tun=ercau");
   onNAJAX("doneTest");
   httpost("php/doneTest.php","pdata=" + JSON.stringify(
      { "nidno": NINFDATA[0].nidno, "ttype": testtype, "right": right,
        "score": score, "dauer": dauer, "probs": probs })).then(function( response ){
         if ( response ){ document.body.innerHTML = response;
            performance = document.getElementById( "perfArea" );
            xamrestitle = document.getElementById( "prfid" );
            xamresoffer = document.getElementById( "offff" );
            reviewerBtn = document.getElementById( "reviewStandaloneButton" );
            temporaNode = document.getElementById( "perfTemporaHolder" );
            commentBox  = document.getElementById( "perfCommentBox" );
            panelaZwote = document.getElementById( "perfPanela2" );

            xamrestitle.setAttribute("class","notionary-feedback");
            xamresoffer.classList.add("class","notionary-exbutton");
            xamresoffer.onclick = function(e) { landingPage(); showSupers(); }

            if ( LOGGEDIN && !SMARTFON ) {
               holdsTest1  = document.getElementById( "ones" );
                             if ( holdsTest1 ) testsTaken1 = holdsTest1.getAttribute("count1");
               holdsTest2  = document.getElementById( "twos" );
                             if ( holdsTest2 ) testsTaken2 = holdsTest2.getAttribute("count2");
               holdsTest3  = document.getElementById( "tris" );
                             if ( holdsTest3 ) testsTaken3 = holdsTest3.getAttribute("count3");
            }
            switch( testtype ) {
               case 'trial': popupFAI("fa-shield", "#4D90FE", "2em"); break;
               case 'write': popupFAI("fa-trophy", "#2B7930","2em"); break;
               case 'adept': popupFAI("fa-star",   "#E78F08","2em"); break;
            }
            jasonNINFO( NINFDATA[0].nname, function(){ // Update NINFDATA with this test
               jasonUINFO( function(){ // Update USERINFO with this test
                  if ( LOGGEDIN ) {
                     if ( reviewerBtn ) { onNAJAX("getme");
                        httpget("usrindex.php/?tun=getme&was=" + JSON.stringify(
                           { "secol": "review",
                             "vonta": "aareview",
                             "wocol": "notionID",
                             "valis":  NINFDATA[0].nidno
                           })
                        ).then(
                           function( response ){ var my_FB, defText, holder, texter;
                              defText = TRANSLAT.kmdef;
                              if ( response ) defText = response;
                              commentBox.innerHTML = markupComment("perfReview",8,40,defText);
                              holder = document.getElementById( "perfReviewCommentHolder" );
                              texter = document.getElementById( "perfReviewCommentTextarea" );
                              my_FB  = document.getElementById( "perfReviewCommentFeedback" );
                              announce(my_FB,TRANSLAT.kmnts,"radTang");
                              ausblenden(holder,1000,true);
                              bindComment("perfReview",TRANSLAT.kmdef,10,100,/[^§(){}%$*+!"`\\\^]/,reviewerBtn,"",
                                 function(){}, function(){}, function(){ onNAJAX("reupd");
                                    httpost("usrindex.php","tun=reupd&was=" + JSON.stringify(
                                       { "nidno": NINFDATA[0].nidno,
                                         "rview": texter.value
                                       })
                                    ).then( function(response) {
                                          if ( response ) clickNotiz( response );
                                          else { popupFAI("fa-check","#4D90FE","1em"); ausblenden(holder,1000,true); }
                                       }, function( error ) { clickNotiz( error ); }
                                    ).then( function(){ offNAJAX("reupd"); } );
                                 });
                           },
                           function( error ){ clickNotiz( error ); }
                        ).then(function(){ offNAJAX("getme"); });
                     }
                     bindRatingsButtons(); bindShareByMailButton();
                  }
                  if ( s = isInSuperNotions( NINFDATA[0].nidno ) ) showSuperNotion(s,panelaZwote);
                  playables = document.getElementsByClassName( "playme" );
                  for ( i = 0; i < playables.length; i++ ) {
                     playables[i].onmouseover = function( e ){ cette = this;
                        if ( !SOUNDHOV ) SOUNDHOV = setTimeout(function(){ SOUNDHOV = null;
                              playByID( cette.getAttribute("sndid") ); },1000);
                     }
                     playables[i].onmouseout = function( e ){ cette = this;
                        if ( SOUNDHOV ){ clearTimeout( SOUNDHOV ); SOUNDHOV = null; }
                     }
                  }

               });
            });
         }
      },function( error ){ clickNotiz( error ); }
   ).then(function(){ offNAJAX("doneTest");
      var nimag, nlink;
      nimag = NINFDATA[0].nimag ? NINFDATA[0].nimag : "101";
      nlink = HARDCODE.myurl + "?tun=trial&amp;was=" + NINFDATA[0].nname.escapo();
      FB.ui({
          method:         "feed",
          app_id:         "'" + HARDCODE.fapid + "'",
          link:           nlink,
          picture:        HARDCODE.image + nimag,
          description:    score + "% " + convertSecondsToTime(dauer) + TRANSLAT.using,
          caption:        "'[ " + NINFDATA[0].nname + " ] " + NINFDATA[0].ndesc + "'" },
          function(response) {
             if (response && !response.error_message) console.log('Posting completed.');
             else console.log('Error while posting.');
          }
      );
   });
}
