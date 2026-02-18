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

if ( f_z4() ) SMARTFON = 1;  // Save subsequent calls to f_z4()

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


function f_l1(fn) {
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
    return new f_l1(function(resolve, reject) {
      handle({ onResolved: onResolved, onRejected: onRejected, resolve: resolve, reject: reject });
    });
  };
  fn(resolve, reject);
}
function f_i2() {
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
function f_c3( esto ){ if ( f_i2() && !SMARTFON ){ esto.style.setProperty("top","20%"); esto.style.setProperty("left","20%"); } }
function f_z4(){ if( /iPad|Kindle|Nexus 7|Nexus 10|Xoom/i.test(navigator.userAgent) ) return false; // Catch iPad and treat as a desktop
   if( /midp|j2me|avantg|docomo|novarra|palmos|palmsource|240x320|opwv|chtml|pda|windows\ ce|mmp\/|blackberry|mib\/|symbian|wireless|nokia|hand|mobi|phone|cdm|up\.b|audio|SIE\-|SEC\-|samsung|HTC|mot\-|mitsu|sagem|sony|alcatel|lg|erics|vx|NEC|philips|mmm|xx|panasonic|sharp|wap|sch|rover|pocket|benq|java|pt|pg|vox|amoi|bird|compal|kg|voda|sany|kdd|dbt|sendo|sgh|gradi|jb|\d\d\di|moto|iphone|Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) return true;
}
function f_h5(n, len) { s = n.toString(); if (s.length < len) { s = ('0000000000' + s).slice(-len); } return s; }
function f_v6(element, eventNames, listener) {
  var i, events = eventNames.split(' ');
  for ( i = 0, iLen = events.length; i < iLen; i++ ) {
    element.addEventListener(events[i], listener, false);
  }
}
function obfus(){
   var i, ob = fu = sk = at = obstr = "", possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
   for ( i = 0; i < 60; i++ ) ob += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) fu += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) sk += possible.charAt(Math.floor(Math.random() * possible.length));
   for ( i = 0; i < 60; i++ ) at += possible.charAt(Math.floor(Math.random() * possible.length));
   obstr = "&ob=" + ob + "&fu=" + fu + "&sk=" + sk + "&at=" + at;
   return(obstr);
}
function f_d8(bodyPart,cback){
   if ( typeof( bodyPart ) == 'undefined' ||  bodyPart  == null ) cback();
   else {
      document.body.removeChild( bodyPart ); bodyPart = null; 
      setTimeout(function(){ f_d8(bodyPart,cback); },10);
   }
}
function isSet(val) { if ( ( val != undefined) && ( val != null ) ) return true; return false; }
function f_h10(obj) {
   if ( isSet( obj ) ) {
      if ( obj.length && obj.length > 0 ) return false;
      for ( var key in obj ) if ( hasOwnProperty.call(obj, key) ) return false;
   } return true;    
}
function f_11(cname){
   var i, x, y, qkarr = document.cookie.split( ";" ); // read qks in array
   for ( i = 0; i < qkarr.length; i++ ) { // walk thru setting x = y
     x = qkarr[i].substr(0,qkarr[i].indexOf( "=" ));
     y = qkarr[i].substr(qkarr[i].indexOf("=") + 1 );
     x = x.replace(/^\s+|\s+$/g,""); // empty out blanks to avoid hack manipulations
     if ( x == cname ) return unescape(y); // if found, return it
   }
}
function f_e12(cname,cwert,xdays){
   var qkval = "", qkexp = new Date();
   qkexp.setDate(qkexp.getDate() + xdays);
   qkval = escape(cwert);
   qkval += ( !xdays ? "" : "; expires=" + qkexp.toUTCString());
   document.cookie = cname + "=" + qkval; // write qk
}
function f_y13(uname){
   // Called by renderMain for LOGGEDIN only, We just update the browser
   var i, old255, two55 = "", possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
   for ( i = 0; i < 40; i++ ) two55 += possible.charAt(Math.floor(Math.random() * possible.length));
   if ( f_11("rememberme") == "true" ) { old255 = f_11("two55");
      // Update two55 IFF undefined or length < 40. Any 40+ should be ok
      try { // Undefined is the result of cookies being erased !! Unavoidable
         if ( old255.length < 40 ) { // Here the size check is on
            f_e12("two55",uname + ":" + two55,365);
         }
      } catch(err) {  // Here size check failed .. we must be undefined
         f_e12("two55",uname + ":" + two55,365);
      }
   } else f_e12("two55","",-1);
}
function f_d14(){
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
function f_t15(){
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
function f_c16(str){
   var ret="", min=parseInt(str/60), sec=str-min*60;
   if ( min ) ret = min + "m";
   if ( sec ) ret += sec + "s";
   return(ret);
}
function f_i17(){ history.pushState('', document.title, HARDCODE.myurl); }

// This needs to be open to public for test to work on wrong answers
function f_a18(id){
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
function f_z19(node_id,tecla_code){ var evento;
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
function f_c21( my_Id ) {
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
function f_l23( my_Id, ms, disptype ) {
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
function f_z24( my_Id, ms, goner ) {
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
function f_b25(node){
   setTimeout(function(){ f_v26(node,"translate(25px,0px)"); },200);
   setTimeout(function(){ f_v26(node,"translate( 0px,0px)"); },400);
   setTimeout(function(){ f_v26(node,"translate(25px,0px)"); },600);
   setTimeout(function(){ f_v26(node,"translate( 0px,0px)"); },800);
}
function f_v26(node,transform){
   node.style.setProperty ( "-webkit-transform" ,  transform );
   node.style.setProperty (    "-moz-transform" ,  transform );
   node.style.setProperty (     "-ms-transform" ,  transform );
   node.style.setProperty (      "-o-transform" ,  transform );
   node.style.setProperty (         "transform" ,  transform );
}
function f_c27(){ this.focus(); this.value = ""; f_g32( this ); }
function f_x28(){ this.focus(); f_g32( this ); }
function f_n29(){
   if ( !this.value.substr( this.value.length-1,1 ).issane( NOMETACH[0] ))
      this.value = this.value.match( NOMETACH[1] );
}
function f_n30(cette){
   for ( var i = 0; i < arguments.length; i++ ) {
      f_l41(arguments[i],"CLEAR");
      arguments[i].classList.remove("notionary-dormant");
      arguments[i].classList.add("notionary-active");
   }
}
function f_l31(my_Id){
   for ( var i = 0; i < arguments.length; i++ ) {
      arguments[i].setAttribute("disabled","true");
      arguments[i].classList.remove("notionary-active");
      arguments[i].classList.add("notionary-dormant");
   }
}
function f_g32(my_Id){
   for ( var i = 0; i < arguments.length; i++ ) {
      arguments[i].removeAttribute("disabled");
      arguments[i].classList.remove("notionary-dormant");
      arguments[i].classList.add("notionary-active");
   }
}
function f_l33(inpval,uinfet){ // Check USERINFO vs an input and amend if different
   if ( (inpval != uinfet) && (inpval || uinfet) ) { uinfet = inpval; return true; }
   return false;
}
function f_r34(inode,metas,minsiz,maxsiz,fback){
   if ( inode.value.issane(metas) && inode.value.sizeok(minsiz,maxsiz) ) return true;
   else { f_h40(fback,TRANSLAT.notre,"red"); f_37(inode,"radRojo"); }
   return false;
}
function f_o35(thevalue,thearray){
   if ( thevalue.length >= thearray[2] &&
        thevalue.length <= thearray[3] &&
        thearray[1].test( thevalue ) ) return true;
   return false;
}
function f_y36(popinp,sanarr,fbnode,goodCBK){
   var chekmark = popinp.nextSibling;
   popinp.onkeyup = function(e){ var cette = this;           // Check each keystroke on keyup vs sanity array
      if ( cette.value &&                                    // A keystroke has occurred
              ( cette.value.length > sanarr[3] ||            // We've gone past the max length
                !sanarr[0].test( cette.value ) )             // We've violated the sanity array
         ) { f_z24(chekmark,10,true); if ( fbnode ) f_h40(fbnode,sanarr[4],"red"); }
   }

   //Final Sanity Check done vs total regexp as soon as we hit Enter or Tab
   popinp.onkeydown = function(e){
      var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
      if ( fbnode ) f_h40(fbnode,"","CLEAR");
      if ( k == "13" || k == "9" ) {                         // Pressing Enter or Tab
         if ( cette.value &&                                 // Something has been entered
                 ( cette.value.length < sanarr[2] ||         // Too short
                   cette.value.length > sanarr[3] ||         // Too long or bad chars (below)
                   !sanarr[1].test( cette.value ) ) ) if ( fbnode ) f_h40(fbnode,sanarr[4],"red");
         else if ( cette.value.length >= sanarr[2] &&
                     cette.value.length <= sanarr[3] &&
                     sanarr[1].test( cette.value ) ) { f_l23(chekmark,100); goodCBK(); }
      }
   }
}
function f_37(my_Id,gradient){ // Blink and stay colored
   my_Id.classList.add("notionary-" + gradient);
   setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },  300);
   setTimeout(function(){ my_Id.classList.add(   "notionary-" + gradient); },  600);
   setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },  900);
   setTimeout(function(){ my_Id.classList.add(   "notionary-" + gradient); }, 1200);
}
function f_r38(my_Id,gradient,clearme){
   f_37(my_Id,gradient);
   if ( clearme ) setTimeout(function(){ my_Id.classList.remove("notionary-" + gradient); },1500);
}
function f_x39(myId,message,gradient){ myId.innerHTML = message; f_l41( myId, gradient ); }
function f_h40(myId,message,color){ myId.style.color = color; myId.innerHTML = message; }
function f_l41(myId,gradient){
   // Clear from color and potentially give it a new one
   ["Weis","Blak","Grau","Kaki","Gelb","Blau","Grun","Tang","Rojo"].map( function( val ) {
      myId.classList.remove( "notionary-lin" + val );
      myId.classList.remove( "notionary-rad" + val );
   });
   if ( gradient != "CLEAR" ) myId.classList.add( "notionary-" + gradient );
}

/* Pseudo Dialogs */
function f_42( ElementId, EventName )
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
function f_o43(rufer){
   var ajaxmbar = document.createElement("div");
   ajaxmbar.setAttributes({ "class" : "notionary-barsmgif", "id" : "loadings-" + rufer });
   document.body.appendChild( ajaxmbar );
}
function f_k44(rufer){
   var ajaxmbar = document.getElementById( "loadings-" + rufer );
   if ( ajaxmbar ) document.body.removeChild( ajaxmbar );
}
function f_e45(icono,color,fsize){
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
function f_l46(contents){
   var DURATION = 3000,
       thenotiz = document.createElement("div");
                  thenotiz.setAttribute("id","notionaryNotiz");
                  thenotiz.setAttribute("class","animated fadeInDown");
                  thenotiz.innerHTML = "<div class='notionary-midtexto'>" + contents + "</div>";

   document.body.insertBefore(thenotiz,document.body.firstChild);
   setTimeout(function(){ document.body.removeChild( thenotiz ); }, DURATION);
}
function f_n47(contents){
   var offnotiz,
       thenotiz = document.createElement("div");
                  thenotiz.setAttribute("id","notionaryNotiz");
                  thenotiz.setAttribute("class","animated fadeInDown");
                  thenotiz.innerHTML = 
                     "<div class='notionary-midtexto'>" + contents + "</div>" +
                     "<div class='notionary-exbutton fa fa-times' id='notizExit'></div>";
   document.body.insertBefore(thenotiz,document.body.firstChild);
   offnotiz = document.getElementById( "notizExit" );
   offnotiz.onclick = function(){ document.body.removeChild(thenotiz); /*f_g86(); f_i87(); */ }
}
function f_y48(warne,jaBtn,noBtn,jaCBK,noCBK){
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
function f_o49(markup,exitCBK){
   var overlay, exiter;
   overlay = document.createElement( "div" );
   overlay.setAttribute("id","pedalOverlay");
   overlay.innerHTML = markup;

   document.body.appendChild( overlay );

   f_l23(overlay,1000);
   exiter = document.getElementById( "acceptExiter" );
   exiter.onclick = function(e) { document.body.removeChild( overlay ); exitCBK(); };
}
function f_x50(ident,markup,bindCBK,exitCBK){
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

   f_c3( modahold );      // Kludge Hack to avoid MSFT IE Bug ignoring margin: 0 auto;
   f_l23( themodal );
   bindCBK();
}
function f_z51(ident,lineas,columnas,defText){
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
function f_n52(ident,deftxt,carmin,carmax,regex,clikme,offbtn,clkCBK,offCBK,senCBK){
   var holder, exiter, texter, counts, sender;
   holder = document.getElementById( ident + "CommentHolder" );
   exiter = document.getElementById( ident + "CommentExiter" );
   texter = document.getElementById( ident + "CommentTextarea" );
   counts = document.getElementById( ident + "CommentCounter" );
   sender = document.getElementById( ident + "CommentSubmit" );       f_z24(sender,1000,true);
   clikme.onclick = function(e){ f_l23(holder,1000); clkCBK(); }
   offbtn.onclick = offCBK;
   if ( texter.value == deftxt ) f_z24(holder,1000,true); else f_l23(holder,1000);
   exiter.onclick = function(e){ f_z24(holder,1000,true); }  // Different from the offbtn
   sender.onclick = senCBK;
   texter.onfocus = function(e){ if ( this.value == deftxt ) this.value = ""; f_g32( this ); }
   texter.onkeydown = function(e){ var cpos, news, k = (e.keyCode ? e.keyCode : e.which);
      if ( k == 13 ) { cpos = texter.selectionStart;
         news = texter.value.substr(0,cpos) + texter.value.substr(cpos,texter.value.length);
         texter.value = news; texter.setSelectionRange( cpos+1, cpos+1 );
      }

      if ( texter.value != deftxt && texter.value.issane( regex ) &&
          texter.value.sizeok( carmin, carmax ) ) f_l23(sender,1000);
      else f_z24(sender,1000,true);

      if ( texter.value.length < carmin ) counts.innerHTML = carmin - texter.value.length;
      else counts.innerHTML = "";
   }
}
function f_z53(elem, prop){
    if (window.getComputedStyle)
        return window.getComputedStyle(elem, null).getPropertyValue(prop);
    else if (elem.currentStyle) return elem.currentStyle[prop]; //IE
}
function f_j54(my_Id,deftxt){
   var legenda = my_Id.parentNode.firstChild;
   if ( my_Id.value == deftxt ) my_Id.value = "";
   my_Id.classList.remove("notionary-exfocado");
   my_Id.classList.add("notionary-enfocado");
   my_Id.parentNode.style.setProperty("border","2px solid #4D90FE");
   f_l23(legenda);
}
function f_l55(my_Id,deftxt){
   var legenda = my_Id.parentNode.firstChild;
   if ( !my_Id.value ) {
      my_Id.value = deftxt;
      f_z24(legenda);
      my_Id.parentNode.style.setProperty("border","2px solid #CDCDCD");
      my_Id.setAttribute("type","text");
   }
   my_Id.classList.remove("notionary-enfocado");
   my_Id.classList.add("notionary-exfocado");
   
}
function f_a56(inits,usevalue,nolabels,uniqueid){
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
function f_e57(inits,olist,dbval,quiet){
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
function f_o58(inits,rlist,torf){
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
function f_y59(inits){ if ( document.getElementById( inits + "0" ).checked ) return 0; return 1; }
function f_s60(theNode,thePercent,theFarbe){
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
function f_b61(nhold,tlang,cback){
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
   f_l23 (nhold,1000);
   for ( k in fcode )
      if ( fcode[k] != "break" ) {
         dummy_key = document.getElementById( k );
         dummy_key.onclick = cback;
      }
}
function f_i62(lange){
   var FLAGS={"en":"50","es":"51","de":"52","fr":"53","it":"54","pt":"55",
              "tr":"58","da":"59","nl":"56","pl":"57","nb":"60","is":"64",
              "sv":"61","fi":"62","hu":"63","et":"65","ca":"66","eu":"67","ru":"68"};
   return(FLAGS[lange]);
}
function f_z63(snode,lanAR,defla){
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
           HARDCODE.image + f_i62(defla)+"'/>"+
     "</div>";
   return(m);
}
function f_n64(url,hdr,val){
   return new f_l1(function(resolve,reject) {
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
function f_65(url,params){
   return new f_l1(function(resolve,reject) {
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
   return new f_l1(function(resolve,reject) {
      var s = document.createElement('script');
      s.type = 'text/javascript';  s.src = src;
      s.onload = resolve; s.onerror = reject;
      document.head.appendChild(s);
   });
}
function f_n67(src,iazik){
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
   var params = "tun=seter&was=" +
          JSON.stringify({'tafel':tafel, 'chcol':chcol,
          'nuval':nuval, 'wocol':wocol, 'olval':olval });
   f_65("usrindex.php",params).then(
      function(response) { cback(); },
      function( error ) { f_n47( error ); }
   );
}
function f_k69(lan2L,cback){
   var url = "?tun=sinfo&was=" + lan2L;
   f_n64(url).then(
      function(response) { SERVINFO = JSON.parse( response );
         for ( i = 0; i < SERVINFO[2].param.length; i++ )
            for (x in SERVINFO[2].param[i]) HARDCODE[x] = SERVINFO[2].param[i][x];
      },
      function( error ) { f_n47( error ); }
   ).then( cback );
}
function f_70(cback){
   var url = "?tun=uinfo";
   f_n64(url).then(
      function(response) {
         if ( response.length ) {
            USERINFO = JSON.parse( response );
            if ( BROWSLAN != USERINFO[0].ulang ) { f_k69( BROWSLAN = USERINFO[0].ulang , 0 ); }
         } else USERINFO[0] = "";
      },
      function(error) { USERINFO[0] = ""; }
   ).then( cback );
}
function f_f71(lan2L,cback){
   var LANGINFO,
       url = "?tun=linfo&was=" + lan2L;
   f_n64(url).then(
      function(response) { var i, x;
         LANGINFO = JSON.parse( response );
         for ( i = 0; i < LANGINFO.length; i++ )
            for ( x in LANGINFO[i]) TRANSLAT[x] = LANGINFO[i][x];
      },
      function(error) { f_n47( error ); }
   ).then( cback );
}
function f_h72(cback){
   var usrCssLink, admCssLink;
   f_n64("?tun=isusr").then(function( isUser ){ // is this guy an LOGGEDIN ?
      if ( isUser ==  "true" ){ LOGGEDIN = true; // Load the LOGGEDIN Sources
         loadJS("js/" + HARDCODE.mynom + "-user-min.js?version=Mon25Jul2022164404").then(function(){
            usrCssLink = document.createElement( "link" );
            usrCssLink.rel  = "stylesheet"; usrCssLink.type = "text/css";
            usrCssLink.href = "css/" + HARDCODE.mynom + "-user-min.php?version=Mon25Jul2022164404";
            document.head.appendChild( usrCssLink );
         }).then(function(){ // is this LOGGEDIN the ROOTUSER ?
            f_n64("usrindex.php/?tun=isadm").then(function( isAdmin ){
               if ( isAdmin  == "true" ){ ROOTUSER = true; // Load the ROOTUSER Sources
                  loadJS("js/" + HARDCODE.mynom + "-admn-min.js?version=Mon25Jul2022164404").then(function(){
                     admCssLink = document.createElement( "link" );
                     admCssLink.rel  = "stylesheet"; admCssLink.type = "text/css";
                     admCssLink.href = "css/" + HARDCODE.mynom + "-admn-min.php?version=Mon25Jul2022164404";
                     document.head.appendChild( admCssLink );
                  }).then(cback);
               } else cback(); // This LOGGEDIN is not ROOTUSER so proceed with cback();
            });
         });
      } else cback(); // This guy was outsider, so proceed with cback()
   });
}
function f_g73(estilo,btnTyp,iazik,urlOrUser,showBubble,extraStyle){
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
function f_q74(estilo,btnTyp,urlOrUser,showBubble){
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
function f_g75(estilo,btnTyp,iazik,urlOrUser,theMSG,extraStyle){
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
function f_w76(server,tuwas,ancho,alto){
   f_o43("f_w76");
   return(
      "<iframe "+
         " src='" + server + "?tun=" + tuwas + "' "+
         " onload='f_k44(" + '"f_w76"' + ");'" +
         " style='width:" + ancho + ";height:" + alto + ";' "+
         " frameborder='0'>"+
      "</iframe>");
}
function f_b77(){
   LOGGEDIN = false;
   f_e12("rememberme","false",-1);
   f_e12("two55","",-1);
   // Kill server side session
   f_n64("usrindex.php/?tun=outen").then(
      function( response ) { },
      function( error ) { }
   ).then(function(){ f_g86(); f_70(); window.location = HARDCODE.myurl; });
}
function nentr(){ f_o43("enter");
   f_n64("?tun=mylan").then(
      function( response ){ BROWSLAN = response; }
   ).then(function(){
      f_k69( BROWSLAN, function(){
         f_70(function(){ if ( USERINFO[0].nosnd ) PLAYABLE = false;
            f_101(); f_h72( f_k79 ); f_k44("enter");
         });
      });
   });
}
function f_k79(){ // URL tokens (nname,level,uname) from Server directly into the heap: see ../php/utiles.php:stags()
   f_f71( BROWSLAN, function(){ // TRANSLAT loaded, pssibly default 'en', now this
      NAMESREG[4] = TRANSLAT.notre;
      if ( nname == "prvcy" || nname == "condi" || nname == "terms" || nname == "okdok" ) f_g80(nname);
      else {
         if ( typeof nname == "string" && nname.length ) {// got ?n=xyz, if fake treat as search
            f_o43("ninfo"); // Here special fail treatment so avoid shelf f_k88()
            f_n64("?tun=ninfo&was=" + nname).then( function( response ) { NINFDATA = JSON.parse( response );
                  switch ( level ) { case "0": level = "learn"; break; case "1": level = "trial"; break;
                                     case "2": level = "write"; break; case "3": level = "adept"; break;
                                     case "4": level = "micro"; break; default : level = "trial"; break; }
                  if ( typeof uname == "string" && uname.length ) // handle "uname" &u=xyz directive => Authenticate()
                     f_w108( function(){ f_g86(); f_i87(); },uname);
                  else { f_g86(); go4it(nname,level); }
               }, function( error ) { f_l98( nname ); } // This failure is treated as a search!!
            ).then(function(){ f_k44("ninfo"); });
         } else { f_g86(); f_i87(); }   // No directive nor Notion, so let's paint a page
      }
   });
}
function f_g80(nnameArg){
   if ( nnameArg == "terms" ) { // FB|GP|TW|Sigup 1st pass -> '?t' b4 'crack' => Agree then ?tun=oauth cback()
      f_z107(function(){
         f_n64("?tun=oauth").then(
            function( response ) { window.location = HARDCODE.myurl; },
            function( error ) { f_n47( error ); }
         );
   });
   }
   if ( nnameArg == "prvcy" ) { f_g86(); f_l91(); }
   if ( nnameArg == "condi" ) { f_g86(); f_v92(); }
   if ( nnameArg == "okdok" ) { f_g86(); f_i87();
                                f_o43("dbhome");
                                setTimeout( function(){ f_n47( TRANSLAT.dbhom ); },
                                            2000 );
                                f_k44("dbhome");
                              }
}
function f_p81(){
   var mainlogo = document.getElementById( "anonMainlogo" ),
       settings = document.getElementById( "userSettings" ),
       escritor = document.getElementById( "userEscritor" ),
       thumbler = document.getElementById( "mobiThumbler" ),
       anmelder = document.getElementById( "anonAnmelder" ),
       exmelder = document.getElementById( "userExmelder" );
   mainlogo.onclick = function(e) { window.location.href = HARDCODE.myurl; }
   anmelder.onclick = function(e) { f_w108( function(){ f_g86(); f_i87(); }); }
   f_c21.apply(this,[ settings, escritor, thumbler, exmelder ]);
   
   if ( f_11("coook") != "true" && !LOGGEDIN )
      f_o49(
         "<div>" +
            "<span id='acceptAdvice'>" + TRANSLAT.cooky + "</span> " +
            "<span id='acceptExiter'><span class='fa fa-check'></span>" + TRANSLAT.ackno + "</span> " +
         "</div>",
         function(){ f_e12("coook","true",365); }
      );
}
function f_i82(){
   var settings = document.getElementById( "userSettings" ),
       escritor = document.getElementById( "userEscritor" ),
       thumbler = document.getElementById( "mobiThumbler" ),
       anmelder = document.getElementById( "anonAnmelder" ),
       exmelder = document.getElementById( "userExmelder" );
   if ( LOGGEDIN ) {
      if ( USERINFO[0].kenne || USERINFO[0].wrote || USERINFO[0].meist || f_a179() ) f_y145();
      settings.onclick = f_c143;
      escritor.onclick = f_a157;
      exmelder.onclick = f_b77;
      f_z24( anmelder );
      f_l23( settings, 10, "inline-block" );
      turnOn.apply(this,[ thumbler, exmelder ]);
      if ( !SMARTFON ) f_l23( escritor, 10, "inline-block" );
      f_y13(USERINFO[0].uname);                         // Update only Browser and IFF < 40 chars
      if ( ROOTUSER ) f_v183();
   }
}
function rentr(){
   f_o43("renter");
   var tokens, tuner = waser = "", node, ergebnis;
       tokens = document.location.search.split("&");
       tuner = tokens[0].substr(5,tokens[0].length);
       if ( tokens.length > 1 ) { waser = tokens[1].substr(4,tokens[1].length); }
   f_n64("?tun=mylan").then(function( response ){ BROWSLAN = response; })
    .then(function(){
      f_k69( BROWSLAN, function(){
         f_70(function(){ if( USERINFO[0].nosnd ) PLAYABLE = false;
            f_101();
            f_h72( function(){
               f_f71( BROWSLAN, function(){ NAMESREG[4] = TRANSLAT.notre;
                  document.body.innerHTML = f_l85();
                  f_p81();
                  f_i82();
                  switch ( tuner ) {
                     case 'suche': node = document.getElementById( "anonRealarea" );
                           f_r97();
                           f_n64("?tun=busca&was=" + waser ).then(
                              function( response ){
                                 ergebnis = JSON.parse( response );
                                 notns = ergebnis["notns"];
                                 if ( notns ) node.innerHTML = f_m114(notns,TRANSLAT.found,"");
                                 else { f_n47( TRANSLAT.keine ); f_i87(); }
                              }, function ( error ) { f_n47( error ); }
                           ).then(function(){ f_k44("suche"); f_p115(); });
                           break;
                     case 'learn':case 'trial':case 'write':case 'adept':case 'micro':
                     case 'lista':case 'lesen':case 'watch':case 'amend': go4it(waser,tuner); break;
                     case 'probs':  f_y180(); break; 
                     case 'prvcy':  f_l91(); break; 
                     case 'terms':  f_v92(); break; 
                     case 'guide':  f_i93(); break; 
                     case 'cooks':  f_j94(); break; 
                     case 'imprs':  f_m95(); break; 
                     default: f_r97(); break;
                  }
                  f_t90();
               });
            });
            f_k44("renter");
         });
      });
   });
}
function f_w84(){
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
function f_l85(){
   var deskhtml = mobihtml = "";
   
   if ( SMARTFON )
                 mobihtml = "<div id='userSettings' class='fa fa-cog'></div>" + 
                            "<div id='userEscritor' class='fa fa-pencil-square-o' title='" + TRANSLAT.creak + "'></div>" +
                            f_w84();

   else          deskhtml = "<div id='userSettings' class='fa fa-cog' title='" + TRANSLAT.prefs + "'></div>" +
                            "<div id='userEscritor' class='fa fa-pencil-square-o' title='" + TRANSLAT.creak + "'></div>" +
                            f_w84();

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
function f_g86(){
   f_i17();
   clearInterval( ENERGIZE );
   clearInterval( ACTIVITY );
   document.body.innerHTML = f_l85();
   document.body.classList.remove("quadro");
   f_p81();
   f_i82();
   f_r97();
   f_t90();
   if ( HARDCODE.myenv == HARDCODE.mynom ) loadJS( HARDCODE.athis );  // The script remains in <head> but its markup gets wiped on exam exit
}
function f_i87(){
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
      supes[i].onclick = function(e) { f_e105( this.getAttribute("super"), document.getElementById( "anonRealarea" ) ); }
}
function f_k88(notion,cback){
   f_o43("ninfo");
   f_n64("?tun=ninfo&was=" + notion).then(function( response ){
      NINFDATA = JSON.parse( response );
   }).then(cback).then(function(){ f_k44("ninfo"); });
}
function f_q89(matchName,matchValue,memberName){
   var w, // w = where within the dimension of interest does the match occurr
       m; // m = member to find: nname, ndesc, mysc1 , etc ...
   // First walk throught the dimension of interest looking to match
   for ( w = 0; w < USERINFO[1].rcent.length; w++ ) if ( USERINFO[1].rcent[w][matchName] == matchValue ) break;

   // Now walk through the matched object looking for the member of interest
   for( m in USERINFO[1].rcent[w] ) if ( m == memberName ) return USERINFO[1].rcent[w][m];
   return false; // Nothing matched
}


/* FOOTER ROUTINES */
function f_t90(){
   var footer = document.getElementById("anonFootings");

   f_n64("?tun=mudoc&was=fuss")
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
         twfolg.innerHTML = f_g75("netbtn","folge",f_t15(),HARDCODE.mynom,"","");
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

         fblike.innerHTML = f_g73("netbtn","like", f_d14(),HARDCODE.myurl,false,"");

         fbshar.innerHTML = f_g73("netbtn","share",f_d14(),HARDCODE.myurl,true,"");
         twshar.innerHTML = f_g75("netbtn","tweet",f_t15(),HARDCODE.myurl,TRANSLAT.using.escapo(),"");
*/

         f_n67("https://apis.google.com/js/platform.js",f_t15());
         loadJS("https://apps.skaip.org/buttons/widget/core.min.js");
         loadJS(HARDCODE.myurl + "js/odniklassniki.js");
   });
}
function f_l91(){
   var shower, privacy;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='privacyContents'></div></div>";
   privacy = document.getElementById( "privacyContents" );
   f_o43("mudoc");
   f_n64("?tun=mudoc&was=privacy").then(function( response ){
      privacy.innerHTML = response;
   }).then(function(){ f_k44("mudoc"); });
}
function f_v92(){  // As opposed to f_z107() for account creation
   var shower, terminos;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='termsContents'></div></div>";
   terminos = document.getElementById( "termsContents" );
   f_o43("mudoc");
   f_n64("?tun=mudoc&was=terms").then(function( response ){
      terminos.innerHTML = response;
   }).then(function(){ f_k44("mudoc"); });
}
function f_i93(){
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

   f_o43("mudoc");
   f_n64("?tun=mudoc&was=faq").then(function( response ){
      guider.innerHTML = response;
      learnNode = document.getElementById( "learnExample" );
      learnNode.innerHTML = TRANSLAT.fover + "<br/>" + f_v124( learnObj,"" );
      f_h125();
   }).then(function(){ f_k44("mudoc"); f_p115(); });
}
function f_j94(){
   var shower, cooker;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='cookieContents'></div></div>";
   cooker = document.getElementById( "cookieContents" );
   f_o43("mudoc");
   f_n64("?tun=mudoc&was=cookies").then(function( response ){
      cooker.innerHTML = response;
      f_p115();
   }).then(function(){ f_k44("mudoc"); });
}
function f_m95(){
   var shower, presser;
   shower  = document.getElementById( "anonRealarea" );
             shower.innerHTML = "<div class='mudocu'><div id='impressumContents'></div></div>";
   presser = document.getElementById( "impressumContents" );
   f_o43("mudoc");
   f_n64("?tun=mudoc&was=impressum").then(function( response ){
      presser.innerHTML = response;
      f_p115();
   }).then(function(){ f_k44("mudoc"); });
}

/* SEARCH FUNCTIONALITY */
function f_k96(){
   var i, j, n = 0, x, y, notionsArray = new Array();
   for ( i in SERVINFO[0].kitns )        // i= 0, 1, 2,... as many categories
      for ( x in SERVINFO[0].kitns[i] )  // x= Sci,Geo,Lan,...(as nums! i and x is 1-1)
         for ( j = 0; j < SERVINFO[0].kitns[i][x].length; j++ )   // j= 0, 1, 2, ...
            for ( y in SERVINFO[0].kitns[i][x][j] )         // y= nname, ndesc, ,...
               if ( y == "nname" ) notionsArray[n++] = SERVINFO[0].kitns[i][x][j][y];
   return(notionsArray);
}
function f_r97(){
   var suchfeld = document.getElementById( "anonSucheinp" ),
       suchbttn = document.getElementById( "anonSuchbttn" );

   suchfeld.value     = TRANSLAT.sucht;
   suchfeld.onfocus   = function(e) { f_j54(this,TRANSLAT.sucht); }
   suchfeld.onblur    = function(e) { f_l55(this,TRANSLAT.sucht); }
   suchfeld.onkeyup   = f_n29;
   suchfeld.onkeydown = function(e){ var k = ( e.keyCode ? e.keyCode : e.which ); if ( k == "13" ) f_l98( this.value ); }
   suchbttn.onclick   = function(){ f_z19( suchfeld, 13 ); }
   f_z24(anonSucheleg);
}
function f_l98(sustr){ // Browsers don't HTTP_IF_NONE_MATCH vs ETag => Search must be done
   var MINCHARS = 3;
   if ( sustr < MINCHARS || sustr == TRANSLAT.sucht.toLowerCase() ) return;
   f_o43("suche");
   window.location.href = HARDCODE.myurl + "?tun=suche&was=" + f_y99( f_r100( sustr ) );
}
function f_y99(nnameString){
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
function f_r100(inputString){
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

function f_101(){
   for( i = 0; i < SERVINFO[3].supers.length; i++ ){
      var strAR = nidsAR = new Array();
      strAR = SERVINFO[3].supers[i].snots.split(",");
      SUPERSET[ SERVINFO[3].supers[i].supid ] = [ SERVINFO[3].supers[i].sname ];
      for ( j = 0; j < strAR.length; j++ ) SUPERSET[ SERVINFO[3].supers[i].supid ].push( strAR[j] );
   }
}
function katxy( digit ){ if ( digit < 10 ) return( TRANSLAT["kat0" + digit ]); else return( TRANSLAT["kat" + digit] ); }
function f_i103( katxy ){ // kat01->Langs kat02->Math kat03->Sci kat04->Geo kat05->Hist kat19->Standard kat20->Others
   var i, y = "01", catKodex = ["kat01","kat02","kat03","kat04","kat05","kat19","kat20"];
   for ( i = 0; i < catKodex.length; i++ ) if ( TRANSLAT[catKodex[i]] == katxy ) y = catKodex[i].substr(3,2);
   if ( y.substr(0,1) == "0" ) return(y.substr(1,1)); else return(y);
}
function f_r104( nidno ) { for ( x in SUPERSET ) if ( SUPERSET[ x ].indexOf( nidno ) >= 0 ) return x; return false; }
function f_e105(snotion,node){
console.log("f_e105: " + snotion );
   var i, j, n = 0, x, y, z, retAR = new Array();
   for ( z = 1; z < SUPERSET[snotion].length; z++ )
      for ( i in SERVINFO[0].kitns )        // i= 0, 1, 2,... as many categories
         for ( x in SERVINFO[0].kitns[i] )  // x= Sci,Geo,Lan,...(as nums! i and x is 1-1)
            for ( j = 0; j < SERVINFO[0].kitns[i][x].length; j++ )   // j= 0, 1, 2, ... index of Notion Object
               for ( y in SERVINFO[0].kitns[i][x][j] )         // y= nname, ndesc, ,...
                  if ( y == "nidno" && SUPERSET[snotion][z] == SERVINFO[0].kitns[i][x][j][y] ) retAR[n++]=SERVINFO[0].kitns[i][x][j];
   node.innerHTML = f_m114(retAR,SUPERSET[snotion][0],"");
   f_p115();
}
function f_p106(){ // Placed here to give outsiders a chance to ask for this tool
   var xm = "", nakeNode, r; // Markup a Sound Contribution Utility for an entire Notion's Questions set
   nakeNode = document.getElementById( "anonRealarea" );
   if ( !LOGGEDIN ) f_n47(TRANSLAT.logfn);
   else {
      inits = "qs";
      xm += "<div id='editFeedback' class='notionary-feedback'></div>";
      for ( THEINDEX = 0; THEINDEX < NINFDATA[1].qaimg.length; THEINDEX++){
         xm+="<div class='notionary-qandarow' id='" + THEINDEX + "'>" +
                "<span  class='notionary-tracking'>" + THEINDEX + "</span>" +
                '<input readonly="readonly" class="notionary-readonly" id="' + THEINDEX + 'a" value="' +
                        NINFDATA[1].qaimg[ THEINDEX ].a.sauber() + '">' +
                f_p146( inits + "_" + THEINDEX ) +
             "</div>";
      }
      nakeNode.innerHTML = xm;
      f_x39( document.getElementById( "editFeedback"), "[" + NINFDATA[0].nname + "]", "radTang" );
      f_o43("recorder");
      loadJS("js/recorder.js").then(function(){
         loadJS("js/recorderWorker.js").then(function(){
            for ( r = 0; r < THEINDEX; r++ )
               f_g147Guts( inits + "_" + r, NINFDATA[0].nname, NINFDATA[1].qaimg[r].q, NINFDATA[1].qaimg[r].s );
         });
      }).then( function(){ f_k44("recorder"); });
   }
}
function f_z107(cback){
   var agreeButton; // nary signUP(vrify) + fb/tw/gp(oauth)
   f_n64("?tun=mudoc&was=terms").then(
      function( response ) {
         document.body.innerHTML = "<div style='width:80%;margin:0 auto;'>" + response +
                                      "<button id='termsAgreeButton'>" + TRANSLAT.agree + "</button>" +
                                   "</div>";
         agreeButton = document.getElementById( "termsAgreeButton" );
         agreeButton.onclick = cback;
      },
      function( error ) { f_n47 ( error ); }
   );
}
function f_w108(loginCBK,loginals){
   var COOKDAYS = 365,
       CHEKMAIL = 5000,
       advisory, username, userajax, mailname, mailajax, welcomer, minombre, password, clavedos, newpword,
       contibtn, confobtn, siginbtn, sigupbtn, register, stickers, autologs, vergesen,
       facebook, googling, tweeting;
   f_x50("signIn", 
      f_a56("un",TRANSLAT.untxt,true,"") +                      // Standard Username Widget for known accounts
      f_a56("em",TRANSLAT.emtxt,true,"") +                      // E-Mail Address Widget for new users
      f_a56("pw",TRANSLAT.pwtxt,true,"") +                      // Standard password Widget for known accounts
      f_a56("p2",TRANSLAT.p2txt,true,"") +                      // Password Confirmation Widget for Password Changes
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

         f_c21.apply(this,[ username.parentNode.firstChild,
            mailname.parentNode, password.parentNode, clavedos.parentNode,
            welcomer, siginbtn, confobtn, sigupbtn, vergesen, stickers ]);

         f_h40(advisory,TRANSLAT.track,"black");

         // Handle Create Account (Sign Up)
         register.onclick = function() {
            f_c21.apply(this,[ mailname.parentNode.firstChild,
               username.parentNode, register, facebook, googling, tweeting ]);
            f_l23(mailname.parentNode,100);
            f_h40(advisory,TRANSLAT.sigut,"black");
            mailname.onkeyup   = f_n29;
            mailname.onkeydown = function(e){ 
               if ( this.value == TRANSLAT.emtxt ) this.value = "";
               var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
               if ( k == "13" )
                  if ( this.value && f_o35( this.value, EMAILREG ) ) { f_o43("known");
                     mailajax.style.visibility = "visible";                   // Check to see if it is a notionary user
                     f_n64("?tun=known&was=" + this.value ).then(
                        function( response ) {
                           if ( response ) f_h40(advisory,TRANSLAT.taken,"red");
                           else {
                              f_h40(advisory,TRANSLAT.pwpls,"black");
                              f_c21.apply(this,[ password.parentNode.firstChild, mailname.parentNode]);
                              f_l23(password.parentNode);
                              f_l23(welcomer,10,"table");
                              minombre = cette.value;
                              welcomer.innerHTML = minombre;
                              password.value = TRANSLAT.pwpls;
                              password.parentNode.firstChild.innerHTML = TRANSLAT.pwpls;
                              password.onkeydown = function(e){
                                 var k = (e.keyCode ? e.keyCode : e.which);
                                 if ( this.value == TRANSLAT.pwpls ){ this.setAttribute("type","password"); this.value = ""; }
                                 if ( k == "13" )
                                    if ( this.value && f_o35( this.value, PWORDREG ) ) { newpword = this.value;
                                       f_c21.apply(this,[ clavedos.parentNode.firstChild, password.parentNode, contibtn ]);
                                       turnOn.apply(this,[ clavedos.parentNode, confobtn ]);
                                       // Process the Password Confirm Input
                                       f_h40(advisory,TRANSLAT.p2txt,"black");
                                       clavedos.onkeydown = function(e){
                                          var k = (e.keyCode ? e.keyCode : e.which);
                                          if ( this.value == TRANSLAT.p2txt ){ this.value = ""; this.setAttribute("type","password"); }
                                          if ( k == "13" )
                                             if ( this.value && f_o35( this.value, PWORDREG ) ) {
                                                if ( this.value == newpword ) {
                                                   f_z107(function(){ 
                                                      f_65("index.php","tun=vrify&was=" +
                                                         JSON.stringify({ "quien":minombre, "pword":newpword, "razon":"crack" })
                                                      ).then(function(response){
                                                            if ( response ) f_n47( response );
                                                            else { f_l46(TRANSLAT.emchk);
                                                               f_c21.apply(this,[ clavedos.parentNode, welcomer, confobtn ]); }
                                                            setTimeout(function(){ f_g86(); f_i87(); }, CHEKMAIL);
                                                         },function( error ) { f_n47( error ); }
                                                      );
                                                   });
                                                } else f_h40(advisory,TRANSLAT.pmiss,"red");
                                             } else f_h40(advisory,TRANSLAT.pwbad,"red");
                                       }
                                       clavedos.onfocus = function(){ f_j54(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
                                       clavedos.onblur  = function(){ f_l55(this,TRANSLAT.p2txt);
                                          if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,TRANSLAT.p2txt,"black"); }
                                       clavedos.focus(); 
                                       confobtn.onclick = function() { f_z19(clavedos,13); }
                                    } else f_h40(advisory,TRANSLAT.pwbad,"red");
                              }
                              password.onfocus = function(){ f_j54(this,TRANSLAT.pwpls); this.setAttribute("type","password"); }
                              password.onblur  = function(){ f_l55(this,TRANSLAT.pwpls);
                                 if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,TRANSLAT.pwpls,"black"); }
                              password.focus();
                              contibtn.onclick = function() { f_z19(password,13); }
                           }
                        }, function( error ) { f_n47( error); }
                     ).then ( function(){ f_k44("known"); mailajax.style.visibility = "hidden"; } );
                  } else f_h40(advisory,TRANSLAT.eapls,"red");
            }
            mailname.onfocus = function(){ f_j54(this,TRANSLAT.emtxt); } 
            mailname.onblur  = function(){ f_l55(this,TRANSLAT.emtxt);
               if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,TRANSLAT.sigut,"black");
            }
            mailname.focus(); if ( SMARTFON ) mailname.blur();  // Give Mobiles clearer display w/o keyboard clutter at first
            contibtn.onclick = function() { f_z19(mailname,13); }
         }

         // Handle Regular Login Session
         username.onkeyup   = f_n29;
         username.onkeydown = function(e){ 
            if ( this.value == TRANSLAT.untxt ) this.value = "";
            var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
            if ( k == "13" )
               if ( this.value && f_o35( this.value, EMAILREG ) ) { f_o43("known");
                  userajax.style.visibility = "visible";                   // Check to see if it is a notionary user
                  f_n64("?tun=known&was=" + this.value ).then(
                     function( response ) {
                        if ( response ) {                                  // Indeed we have a notionary user
                           f_c21.apply(this,[ password.parentNode.firstChild, username.parentNode,
                              contibtn, register, facebook, googling, tweeting ]);
                           turnOn.apply(this,[ password.parentNode, siginbtn, vergesen, stickers ]);
                           f_l23(welcomer,10,"table");
                           f_h40(advisory,"Welcome","black");           // Welcome the User
                           welcomer.innerHTML = cette.value;
                           // Here the Password event handlers keydown, focus, blur
                           password.onkeydown = function(e){               
                              var k = (e.keyCode ? e.keyCode : e.which);
                              if ( this.value == TRANSLAT.pwtxt ){ this.value = ""; this.setAttribute("type","password"); }
                              if ( k == "13" )
                                 if ( this.value && f_o35( this.value, PWORDREG ) ) { f_o43("login");
                                    f_65("index.php","tun=login&was=" +
                                       JSON.stringify({ "uname":username.value, "pword":password.value })
                                    ).then(
                                       function(response){
                                          if ( response ){ LOGGEDIN = true;
                                             f_70(function(){
                                                f_h72(function(){ f_f71( BROWSLAN, function(){ loginCBK(); }); });
                                             });
                                          } else f_h40(advisory,TRANSLAT.nolog,"red");
                                       }, function( error ){ f_n47( error ); }
                                    ).then(function(){ f_k44("login"); });
                                 } else f_h40(advisory,TRANSLAT.pwbad,"red");
                           }
                           password.onfocus = function(){ f_j54(this,TRANSLAT.pwtxt); this.setAttribute("type","password"); }
                           password.onblur  = function(){ f_l55(this,TRANSLAT.pwtxt);
                              if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,"Welcome","black"); }
                           siginbtn.onclick = function() { f_z19(password,13); }
                           password.focus();

                           // Handle Password Reset (Forgot Password)
                           vergesen.onclick = function() {
                              f_c21.apply(this,[ password.parentNode.firstChild, siginbtn, vergesen, stickers ]);
                              f_l23(contibtn,100);
                              f_h40(advisory,TRANSLAT.chpas,"black");
                              password.value = TRANSLAT.pwpls;
                              password.parentNode.firstChild.innerHTML = TRANSLAT.pwpls;
                              password.onkeydown = function(e){
                                 var k = (e.keyCode ? e.keyCode : e.which);
                                 if ( this.value == TRANSLAT.pwpls ){ this.setAttribute("type","password"); this.value = ""; }
                                 if ( k == "13" )
                                    if ( this.value && f_o35( this.value, PWORDREG ) ) { newpword = this.value;
                                       f_c21.apply(this,[ clavedos.parentNode.firstChild, password.parentNode, contibtn ]);
                                       turnOn.apply(this,[ clavedos.parentNode, confobtn ]);
                                       // Process the Password Confirm Input
                                       f_h40(advisory,TRANSLAT.chpas,"black");
                                       clavedos.onkeydown = function(e){               
                                          var k = (e.keyCode ? e.keyCode : e.which);
                                          if ( this.value == TRANSLAT.p2txt ){ this.value = ""; this.setAttribute("type","password"); }
                                          if ( k == "13" )
                                             if ( this.value && f_o35( this.value, PWORDREG ) ) {
                                                if ( this.value == newpword ) {
                                                   f_65("index.php","tun=vrify&was=" +
                                                      JSON.stringify({ "quien":welcomer.innerHTML, "pword":this.value, "razon":"i4got" })
                                                   ).then(function(response){
                                                         if ( response ) f_n47( response );
                                                         else { f_l46(TRANSLAT.emchk);
                                                            f_c21.apply(this,[ clavedos.parentNode, welcomer, confobtn ]); }
                                                         setTimeout(function(){ f_g86(); f_i87(); }, CHEKMAIL);
                                                      },function( error ) { f_n47( error ); }
                                                   );
                                                } else f_h40(advisory,TRANSLAT.pmiss,"red");
                                             } else f_h40(advisory,TRANSLAT.pwbad,"red");
                                       }
                                       clavedos.onfocus = function(){ f_j54(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
                                       clavedos.onblur  = function(){ f_l55(this,TRANSLAT.p2txt);
                                          if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,TRANSLAT.p2txt,"black"); }
                                       clavedos.focus();
                                    } else f_h40(advisory,TRANSLAT.pwbad,"red");
                                 confobtn.onclick = function() { f_z19(clavedos,13); }
                              }
                              password.onfocus = function(){ f_j54(this,TRANSLAT.pwpls); this.setAttribute("type","password"); }
                              password.onblur  = function(){ f_l55(this,TRANSLAT.pwpls);
                                 if ( f_z53(this,"visibility") == "visible" ) f_h40(advisory,TRANSLAT.chpas,"black"); }
                              password.focus();
                              contibtn.onclick = function() { f_z19(password,13); }
                           }
                        } else f_h40(advisory,TRANSLAT.emunk,"red");       // This E-mail is not in our Database
                     }, function( error ) { f_n47( error); }
                  ).then ( function(){ f_k44("known"); userajax.style.visibility = "hidden"; password.focus(); } );
               } else f_h40(advisory,TRANSLAT.eapls,"red");               // This is not a valid E-mail Address
         }
         username.onfocus = function(e){ f_j54(this,TRANSLAT.untxt); }
         username.onblur  = function(e){ f_l55(this,TRANSLAT.untxt); }
         username.focus();  if ( SMARTFON ) username.blur();                          // Give Mobiles clear display w/o keyboard clutter

         contibtn.onclick = function() { f_z19(username,13); }
         if ( autologs ) autologs.onchange = function(){
            if ( this.checked  ) f_e12("rememberme","true",COOKDAYS);
            else f_e12("rememberme","false",COOKDAYS);
         }
         facebook.onclick = function() { window.location = HARDCODE.myurl + "?tun=logfb"; }
         googling.onclick = function() { window.location = HARDCODE.myurl + "?tun=loggg"; }
         tweeting.onclick = function() { window.location = HARDCODE.myurl + "?tun=logtw"; }

         if ( loginals ) { username.value = loginals; f_z19(username,13); }   // For those login through an Email Test Result
      } , function(){ f_g86(); f_i87(); });
}
function f_x109(){
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
function f_t110(supid){
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
function f_y111(nobj){
   // A decent looking summary info about the Notion as a tooltip on Accordion
   var imag0, pacar = champ = myone = mytwo = mytre = myall ="";
   if(nobj.piece)
      pacar = "<div class='notionary-groupie'>" +
                 "<span class='bnero'>" + TRANSLAT.teile +
                         nobj.piece + "&nbsp;" + TRANSLAT.outof + nobj.parts +
                 "</span>" +
              "</div>";
   nobj.ownav ? imag0 = HARDCODE.image + nobj.ownav : imag0 = HARDCODE.image + "101";
   if ( nobj.mysc1 ) myone = "<br/>[➊]✔" + nobj.mysc1 + "%(" + f_c16(nobj.mybt1) + ")<br/>";
   if ( nobj.mysc2 ) mytwo = "[➋]✍" + nobj.mysc2 + "%(" + f_c16( nobj.mybt2 ) + ")<br/>";
   if ( nobj.mysc3 ) mytre = "[❸]☜" + nobj.mysc3 + "%(" + f_c16( nobj.mybt3 ) + ")<br/>";
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
                        "%(" + f_c16(nobj.time1) + ")" +
                 "</span>" +
              "</div>";
   return(nobj.nname + "<div class='notionary-creavatar'>" +
             "<span class='nnero'>" + TRANSLAT.creby + "</span>" +
             nobj.owner.kurzen( OWNERMAX ) + 
             "<img src='"+ imag0+"'/>"+
          "</div>" +
          pacar + myall +
          "<span class='notionary-call2act'>" + nobj.ndesc + "</span>" +
          f_h112(nobj.revus));
}
function f_h112(reviews){
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
function f_a113(keyAR,title,trailer){
   var x, progress, totalProgress = 0;
   for( x=0; x < keyAR.length; x++ ){
      progress = 0; 
      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if( f_q89( "nidno", keyAR[x].nidno, "mysc1") ) progress = 0.33;
         if( f_q89( "nidno", keyAR[x].nidno, "mysc2") ) progress = 0.66;
         if( f_q89( "nidno", keyAR[x].nidno, "mysc3") ) progress = 1.00;
      } catch(err){};
      totalProgress += progress;
   }
   if( totalProgress > 0 ) return(" " + Math.round(100*totalProgress/keyAR.length) +"% "); else return("");
}
function f_m114(keyAR,titular,trailer){
   // Source used to be one of : (found|meine|npops|rcent|nrels)
   var mu = mobMU = "", x, autor, title, sterne, nenco, nquot, nisrc; 
   mu += f_x109() + "<h2>" + titular + "</h2>";
   for ( x=0; x < keyAR.length; x++ ) {
      percnt = "<div class='notionary-prozent'></div>";
      keyAR[x].nimag ? nisrc = HARDCODE.image + keyAR[x].nimag : nisrc = HARDCODE.image + "101";
      nquot = keyAR[x].nname.sauber();  // good enough for HTML markup

      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if ( f_q89( "nidno", keyAR[x].nidno, "mysc1") )
            percnt="<div class='notionary-prozent'> 33%" + TRANSLAT.compl + "</div>";
         if ( f_q89( "nidno", keyAR[x].nidno, "mysc2") )
            percnt="<div class='notionary-prozent'> 66%" + TRANSLAT.compl + "</div>";
         if ( f_q89( "nidno", keyAR[x].nidno, "mysc3") )
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
                              "%(" + f_c16(keyAR[x].time1) + ")" +
                       "</span>" +
                    "</div>";


      mu += "</div>";

   }
   return( mu + trailer );
}
function f_p115(){
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
            f_g73("flike","like", f_d14(), this.getAttribute("nurl"),true,"width:120px;height:21px;") +
            f_g75("tlike","tweet",f_t15(),this.getAttribute("nurl"),
                        TRANSLAT.using.escapo() + " ☞  " + this.getAttribute("nurl"),"width:115px;height:21px;");
            //f_q74("glike","plus1",this.getAttribute("nurl"),true);
         FB.XFBML.parse();   // Looks like hidden fblik and twitt btns aren't rendered unless reparsed by FFox
         f_n67("https://apis.google.com/js/platform.js",f_t15());
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
            mix1id.style.visibility = "visible"; f_r38(mix1id,"radBlau", true);
            mix2id.style.visibility = "visible"; f_r38(mix2id,"radBlau", true);
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
   // We have a nice wrapper for 'ninfo' so use it -->> f_k88()
   if ( mix1id ) mix1id.onclick = function(){ f_o43("mixqa");
      f_k88( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         f_n64("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if ( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix1b" );
               }
            },
            function(error) { f_n47( error ); }
         ).then( function(){ f_k44("mixqa"); } );
      });
   }
   if ( mix2id ) mix2id.onclick = function(){ f_o43("mixqa");
      f_k88( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         f_n64("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix2b" );
               }
            },
            function(error) { f_n47( error ); }
         ).then( function(){ f_k44("mixqa"); } );
      });
   }
}
function f_w116(choicesString){ // Return correct from block separated choices
   var allChoices, goodChoice = choicesString; // Assume nothing to do (i.e. Normal Answer)
   if ( choicesString.toString().indexOf( CHOIXSEP ) > 0 ) { // Found something to do!!
      allChoices = choicesString.toString().split( CHOIXSEP );
      goodChoice = allChoices[0];
   } return(goodChoice); // toString() is needed for indexOf to work (on Math type data)
}
function f_z117(a, b) {
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
function f_x118(){
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
function f_d119( whattodo, safename, awesomei ){
   return("<a href='" + HARDCODE.myurl + "?tun=" + whattodo + "&was=" + safename + "'>" +
             "<button> <span class='fa " + awesomei + "'></span>" + TRANSLAT[whattodo] + "</button>" +
          "</a>");
}
function f_i120( testtype ){
   var barrotes = document.getElementById( "examBarrotes" ), timeleft = document.getElementById( "examLifehold" ),
       xamqtext = document.getElementById( "examPregunta" ), xamanser = document.getElementById( "examRisposta" ),
       writings = document.getElementById( "examWritings" ), xamleven = document.getElementById( "examLevenpct" ),
       xamkbikn = document.getElementById( "examKeysicon" ), keyboard = document.getElementById( "examKeyboard" ),
       lenguaje = NINFDATA[0].tlang;

   // Handle Keyboard Input (with Levenshtein Distance and Colored Feedback )
   f_z24( keyboard );
   xamanser.onkeydown = function(e){ var k = ( e.keyCode ? e.keyCode : e.which ), sendx;
      if ( k == "13" ) { // enter key or correct answer or Levenshtein distance
         if ( WORKDATA[ THEINDEX ].a.length > LVLENGTH && LVPRCENT > LVMINPCT ) sendx = WORKDATA[ THEINDEX ].a;
         else sendx = xamanser.value;
         f_t128(sendx,WORKDATA[ THEINDEX ].a,testtype);
      }
   }
   xamanser.onkeyup = function(e){
      var typed = xamanser.value, trial = f_r100( typed ),
          chunk = WORKDATA[ THEINDEX ].a.toString().substr(0,typed.length);
      if ( f_w116( WORKDATA[ THEINDEX ].a ).length > LVLENGTH ){
         LVPRCENT = ( LVTARGET.length - f_z117( trial, LVTARGET ) ) / LVTARGET.length;
         xamleven.innerHTML = ( 100 * LVPRCENT ).toFixed() + "%";
         f_l23(xamleven,1000);
      }
      if ( typed == chunk || LVPRCENT > LVMINPCT ) {      // right up to now
         xamanser.style.setProperty("background","white");
         xamanser.style.setProperty("color","green");
         if ( typed == f_w116( WORKDATA[ THEINDEX ].a ) || LVPRCENT > LVMINPCT ) f_z19( xamanser,13);
      } else {
         xamanser.style.setProperty("background","black");
         xamanser.style.setProperty("color","red");
      }
   }
   xamanser.focus();

   document.getElementById( "examExitante" ).onclick = function(e){ f_g86(); f_i87(); }

   if ( NINFDATA[0].catno == "19" || NINFDATA[0].picto )  f_z24( xamqtext );       // Standard + Pictions -->> No Question Text
   if ( NINFDATA[0].catno ==  "2" || NINFDATA[0].catno == "3" )  lenguaje = "scimath";  // FKeys use tlang or "scimath" (Math|Science)
   if ( testtype == "lesen" || testtype == "lista" || testtype == "watch" ) f_z24( barrotes );
   if ( testtype == "lesen" || testtype == "lista" || testtype == "watch" || testtype == "learn" ) f_z24( timeleft );
   if ( testtype == "learn" || testtype == "trial" || testtype == "mix1b" ||            // Non Written tests hide Write Widgets
        testtype == "lesen" || testtype == "lista" || testtype == "watch" || SMARTFON ) f_z24(writings,10,true);
   else if ( lenguaje != "en" ) {                                                       // Written tests in foreign tongue use FKeys
      f_b61( keyboard, lenguaje, function(){
         xamanser.value = xamanser.value + this.innerHTML; xamanser.focus();
         xamanser.dispatchEvent(new Event('keyup')); // Ensures "typed" even if clicked!
      });
      xamkbikn.onclick = function(){
         if ( keyboard.style.display == "block" ) f_z24( keyboard, 10, true); 
         else f_l23( keyboard, 100 ); }
      xamkbikn.style.display = "block";
      f_z24(keyboard);
   }

   if ( NINFDATA[0].catno  == "2" ) document.body.classList.add("quadro");  // Removed automagically@f_g86();
}
function f_m121( testtype, bindCBK ){
   var safename, kurzname, learnbtn = trialbtn = writebtn = adeptbtn = listabtn = lesenbtn = watchbtn = amendbtn = "";

   if ( testtype == "probs" ) safename = kurzname = TRANSLAT.repas;
   else {
      safename = NINFDATA[0].nname.sauber(), kurzname,
      kurzname = SMARTFON ? safename.kurzen( MOBINMAX ) : NINFDATA[0].nname.sauber();
      if ( testtype == "mix1b" || testtype == "mix2b" ) kurzname = TRANSLAT.multi;

      if ( testtype != "learn" )                                       learnbtn = f_d119("learn",safename,"fa-graduation-cap");
      if ( testtype != "trial" )                                       trialbtn = f_d119("trial",safename,"fa-mouse-pointer");
      if ( testtype != "write" )                                       writebtn = f_d119("write",safename,"fa-pencil");
      if ( testtype != "adept" )                                       adeptbtn = f_d119("adept",safename,"fa-undo");
      if ( testtype != "lista" && !SMARTFON )                          listabtn = f_d119("lista",safename,"fa-file-text");
      if ( NINFDATA[0].dokum && ( testtype != "lesen" ) && !SMARTFON ) lesenbtn = f_d119("lesen",safename,"fa-file-pdf-o");
      if ( NINFDATA[0].video && testtype != "watch" )               watchbtn = f_d119("watch",safename,"fa-youtube");
      if ( ( ( NINFDATA[0].ownid == USERINFO[0].uidno ) || ROOTUSER ) && testtype != "amend" )
                                                                    amendbtn = f_d119("amend",safename,"fa-cogs");

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
   THEINDEX = TIMEOUTS = SELECTED = KORREKTE = FALSCHER = 0;
   QUESTIME = DEFSPERQ;  MISTAKES = [];        TESTTIME = new Date().getTime();
   if ( typeof NINFDATA[0] === "undefined" || NINFDATA[0].nname != nname )
      f_k88(nname,function(){ f_y123(testtype); });
   else f_y123(testtype);
}
function f_y123(testtype){
   var DOCWIDTH = "80vw",
       DOCHOEHE = "70vh",
       i, j, onetoone = tempo = new Array();

   if ( NINFDATA[0].sperq ) QUESTIME = NINFDATA[0].sperq;
   DECILEFT = 1000 * QUESTIME;
   document.title= "notionary - " + NINFDATA[0].nname;

   switch( testtype ){
      case 'learn': f_m121( testtype, function (){ f_i120( testtype );
                       document.getElementById( "examContents" ).innerHTML = f_v124( NINFDATA, "" );
                       f_h125();
                    }); break;
      case "lesen": f_m121( testtype, function(){ f_i120( testtype );
                       document.getElementById( "examPantalla" ).innerHTML =
                          f_w76( HARDCODE.myurl, "pbyid&was=" + NINFDATA[0].dokum, DOCWIDTH, DOCHOEHE );
                    }); break;
      case "lista": f_m121( testtype, function(){ f_i120( testtype );
                       document.getElementById( "examPantalla" ).innerHTML =
                          f_w76( HARDCODE.myurl, "dopdf&was=" + NINFDATA[0].nidno, DOCWIDTH, DOCHOEHE );
                    }); break;
      case "watch": f_m121( testtype, function(){ f_i120( testtype ); f_x118(); }); break;
      case "mix1b":
      case "mix2b": WORKDATA = f_q129( VIELDATA ); SELECTED = 0, VIELDATA = {}, WAHLLIST = new Array();
                    f_m121( testtype, function(){ f_i120( testtype ); f_f134( testtype ); }); break;
      case "amend": if ( NINFDATA[0].ownid == USERINFO[0].uidno || ROOTUSER ) f_w158( NINFDATA[0].nname );
                    else { f_g86(); f_i87(); } break;
      case "micro": if ( NINFDATA[0].ownid == USERINFO[0].uidno || ROOTUSER ) f_p106();
                    else { f_g86(); f_i87(); } break;
      default: if ( testtype == "adept" ) { // fill in WORKDATA accordingly .. Formulations nor Pictions are masterable
                  if ( NINFDATA[0].forja || NINFDATA[0].picto){ f_n47( TRANSLAT.ispik ); return; }
                  onetoone = NINFDATA[1].qaimg;                  // Masterable IFF 1-1 Q-A. Repeated Q ==>> Non-masterable!
                  for ( i = 0; i < onetoone.length - 1; i++ )
                     for ( j = i + 1; j < onetoone.length; j++ )
                        if ( onetoone[i].a == onetoone[j].a ) { f_n47( TRANSLAT.xmstr ); return; }
                  tempo = f_q129( NINFDATA[1].qaimg );
                  for ( i = 0; i < tempo.length; i++ ) {         // order is reversed
                     WORKDATA[i] = {}; // Clean the possible enforced choices for backward tests
                     WORKDATA[i].q = f_w116(tempo[i].a);  // forward tests need the data dirty
                     WORKDATA[i].a = tempo[i].q;
                     WORKDATA[i].i = tempo[i].i;
                  }
               } else if ( testtype == "learn" || NINFDATA[0].catno == "19" ) WORKDATA = NINFDATA[1].qaimg; // no shuffle
               else WORKDATA = f_q129( NINFDATA[1].qaimg );
               f_m121( testtype, function (){ f_i120( testtype ); f_f134(testtype); });
               break;
   }
}
function f_v124(nobj,cards2show){
   var TRESHOLD =   8,   // Length that spans card
       BABYFONT = 1.8,
       MAMAFONT = 3.0,
       mu = "", card, total, count, tacky, sound, imgid,
       frage, anser, theQ, theA, qFont, aFont;
   WORKDATA = f_q129( nobj[1].qaimg );
   total = cards2show != "" ? cards2show : WORKDATA.length;
   tacky = "<div class='notionary-exbutton fa fa-times'></div>";
   for ( card = 0; card < total; card++ ) {  // Generate a Flip-Card per QA Pair (Maybe Piction!)
      theQ  = f_w116( WORKDATA[card].q ).toString();
      theA  = f_w116( WORKDATA[card].a ).toString();
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
function f_h125(){
   var SHOWPCNT = 10,
       i, learned = 0, lrnPercent,  tacos, caras, backs;

   if ( SMARTFON ) SHOWPCNT = 20;

   tacos  = document.getElementsByClassName("notionary-exbutton");
   for ( i = 0; i < tacos.length; i++ )
      tacos[i].onclick = function( e ){
         lrnPercent = 100 * learned / WORKDATA.length;
         f_z24( this.parentNode.parentNode.parentNode, 100, true );
         document.getElementById( "examLrnBarIn" ).style.setProperty("width", ( 100 * ++learned / WORKDATA.length)  + "%");
         if ( lrnPercent > SHOWPCNT ) document.getElementById( "examLrnCount" ).innerHTML = ( lrnPercent ).toFixed(0) + "%";
         if ( learned == WORKDATA.length ) window.location.href = HARDCODE.myurl + "?tun=trial&was=" + NINFDATA[0].nname;
         e.stopPropagation();
      }

   caras = document.getElementsByClassName( "notionary-cardface" );
   for ( i = 0; i < caras.length; i++ ) {
      caras[i].onclick = function( e ){
         if ( this.parentNode.parentNode.getAttribute("sndid") ) f_a18( this.parentNode.parentNode.getAttribute("sndid") );
         f_v26(this,"rotateY(180deg)");
         f_v26(this.nextSibling, "rotateY(0deg)");
      }
   }

   backs = document.getElementsByClassName( "notionary-cardback" );
   for ( i = 0; i < backs.length; i++ )
      backs[i].onclick = function( e ){
         f_v26(this,"rotateY(180deg)");
         f_v26(this.parentNode.firstChild, "rotateY(0deg)");
      }

   // Do a flip-flop to ensure users get the idea
   setTimeout( function(){ caras[0].onclick(); },2000);
   setTimeout( function(){ backs[0].onclick(); },4000);
}
function f_g126(testtype){
   switch ( testtype ) {
      case 'write': return( NINFDATA[0].scor2 ); break;
      case 'adept': return( NINFDATA[0].scor3 ); break;
      default : return( NINFDATA[0].scor1 ); break;
   }
}
function f_d127(talign,borde,msg,farbe){
   var xamfbk = document.getElementById( "examFeedback" );
   xamfbk.style.setProperty("text-align",talign,"important");
   xamfbk.style.setProperty("border",borde,"important");
   xamfbk.style.setProperty("z-index",999,"important");
   f_x39(xamfbk,msg,farbe);
   setTimeout(function(){
      xamfbk.style.setProperty("z-index",000,"important");
   },10000);
}
function f_t128(typed,anser,testtype){
   var FBAKTOUT = 5000,
       MARKELEN = 20,
       rottgrun = "Grun", grade, dauer, xamleven, xamanser, marquee;

   clearTimeout( FBAKTOUT );
   anser = f_w116(anser); // Redefine answer if we have forced choices
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
                                             f_w116( WORKDATA[ THEINDEX ].a ) +
                                          "</span>" +
                                       "</markee>";

                                       // Special case of Marquee for Pictions.
      if ( NINFDATA[0].picto ) marquee  = "<markee>" + WORKDATA[ THEINDEX ].q +  "</markee>";

      // Visual Feedback of Error and Correct Answer
      f_d127("right","none", marquee, "");
      FBAKTOUT = setTimeout(function(){f_d127("left","none","",""); }, FBAKTOUT);

      // Auditory Feedback of Error and Correct Answer
      if ( !NINFDATA[0].picto && testtype == "trial" && WORKDATA[ THEINDEX ].s )
         f_a18( WORKDATA[ THEINDEX ].s );
      else f_a18(2);
   }

   THEINDEX++;   // compute score and time taken
   f_e136(rottgrun);

   if ( THEINDEX < WORKDATA.length ) f_f134(testtype);
   else { // we have finished the test, now let's egg user on to continue
      clearInterval( ENERGIZE );
      grade = Math.floor( Math.round( parseFloat( 10000 * KORREKTE / THEINDEX ) ) )/100;
      dauer = Math.floor( ( new Date().getTime() - TESTTIME ) / 1000 );
      f_d139( testtype, KORREKTE, grade, dauer, MISTAKES );
   }
}
function f_q129(oriAR){
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
function f_w130(answer){
   var DUMMYVAL = "FOOPLE GOOPLE",
       einAR = answer.toString().split( CHOIXSEP ),
       sourceIndex = 0, ausAR = new Array(), movingItem, i, randomPlace;

   if ( einAR.length < CHOIXMIN ) { f_n47( TRANSLAT.enuff ); }

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
function f_f131(anser,optns){
   var i, j, rndno, rndAR = new Array(), retAR = new Array();
   for ( i = 0; i < optns; i++ ) rndAR[i] = -1;                     // initialize with garbage
   i = 0; while ( i < optns ) {                                     // pick n="optns" random answers from notion
      rndno = parseInt( Math.random() * WORKDATA.length );
      if ( f_w116( WORKDATA[rndno].a) != anser )                 // picked a different one?
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
         retAR[i] = f_w116( WORKDATA[ rndAR[j] ].a);               // if "anser" pops up, put at end and never revisit it
      else { retAR[optns] = f_w116( WORKDATA[ rndAR[j] ].a); j--; }
      i++; j++;
   }
   return(retAR);
}
function f_n132(testtype){ // Watch out for "￭" Block separator
   var i, mulxoices, xoibtns, xamanser,
       rdmAR = new Array();                                         // Array of randomized Xoices(￭) or Answers

   mulxoices = document.getElementById( "examMultiple" ); mulxoices.innerHTML = "";
   xamanser  = document.getElementById( "examRisposta" );

   // Check for choices separator. Finding one is no guarantee that the string is sane
   if ( WORKDATA[ THEINDEX ].a.toString().indexOf( CHOIXSEP ) > 0 )
      rdmAR = f_w130( WORKDATA[ THEINDEX ].a );
   else rdmAR = f_f131( WORKDATA[ THEINDEX ].a, CHOIXMIN - 1 );

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
         f_t128( clickedChoice, WORKDATA[ THEINDEX ].a, testtype);
         if ( xamanser ) xamanser.focus();
      }
}
function f_n133(testtype){
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
      f_t128( WORKDATA[ THEINDEX ].a.toLowerCase(), this.innerHTML.toLowerCase(), testtype);
   }
}
function f_f134(testtype){
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
         if ( NINFDATA[0].catno == "19" ) f_n133(testtype); else f_n132(testtype);
         if ( ( testtype == "learn" || NINFDATA[0].picto ) && WORKDATA[ THEINDEX ].s ) f_a18( WORKDATA[ THEINDEX ].s);
         break;
      case "write": case "adept": case "mix2b":
         LVPRCENT = 0, LVTARGET = f_r100( f_w116( WORKDATA[ THEINDEX ].a ) );
         if ( NINFDATA[0].picto && WORKDATA[ THEINDEX ].s ) f_a18( WORKDATA[ THEINDEX ].s );
         break;
   }
   xamqtext.innerHTML = nextq;
   if ( xamanser )  xamanser.value = "";
   if ( testtype == "adept" ) frage = WORKDATA[ THEINDEX ].a; else frage = WORKDATA[ THEINDEX ].q;
   if ( NINFDATA[0].picto && WORKDATA[ THEINDEX ].i ) {
      imsrc = HARDCODE.image + WORKDATA[ THEINDEX ].i;
      xampicto.innerHTML = "<img id='examImagenes' src='" + imsrc + "'>";
   } else f_z24(xampicto,10,true);

   clearInterval( ENERGIZE );
   if ( TIMEOUTS < MAXTOUTS ) {
      DECILEFT = 1000 * QUESTIME;
      ENERGIZE = setInterval("f_x135('" + testtype + "')",10);
   } else nentr(); 
}
function f_x135(testtype){
   var deciseks, lifepcnt, xamqtext;

   DECILEFT -= 10;
   deciseks  = document.getElementById( "examLifeleft" );
   xamqtext  = document.getElementById( "examPregunta" );
   lifepcnt  = DECILEFT / ( 10 * QUESTIME );
   
   deciseks.style.setProperty( "width", lifepcnt +"%" );
   if ( DECILEFT <= 10 ) f_t128("X","Y",testtype); // force wrong Q=X, A=Y
   if ( lifepcnt <= 50 ) {  deciseks.style.setProperty("background", "#E78F08" );
      if ( lifepcnt <= 20 ) deciseks.style.setProperty("background", "#FF0000" );
   } else                   deciseks.style.setProperty("background", "#2B7930" );
   
}
function f_e136(rottgrun){
   var SHOWPCNT = 10,
       gutPercent = 100 * KORREKTE / WORKDATA.length,
       badPercent = 100 * FALSCHER / WORKDATA.length;

   if ( SMARTFON ) SHOWPCNT = 20;

   if ( rottgrun == "Rojo" ) f_r38( document.getElementsByTagName("body")[0], "radRojo",true);
   document.getElementById( "examGutBarIn" ).style.setProperty("width",gutPercent + "%");
   if ( gutPercent > SHOWPCNT ) document.getElementById( "examGutCount" ).innerHTML = ( 100 * KORREKTE / WORKDATA.length ).toFixed(0) + "%";
   document.getElementById( "examBadBarIn" ).style.setProperty("width",badPercent + "%");
   if ( badPercent > SHOWPCNT ) document.getElementById( "examBadCount" ).innerHTML = ( 100 * FALSCHER / WORKDATA.length ).toFixed(0) + "%";
}
function f_k137(){
   var i, ratings, theRating, ratsHolder;
   ratsHolder = document.getElementById( "perfNotionRating" );
   ratings = document.getElementsByClassName( "notionary-ratings" );
   for ( i = 0; i < ratings.length; i++ )
      ratings[i].onclick = function( e ){
         this.setAttribute("disabled","true");
         this.classList.remove("notionary-opaque");
         theRating = this.getAttribute("title");
         f_o43("raupd");
         f_65("usrindex.php","tun=raupd&was=" + JSON.stringify(
            { "nidno": NINFDATA[0].nidno,
              "rated": theRating
            })
         ).then( function( response ) {
               if ( response ) f_n47( response );
               else { f_e45("fa-check","#4D90FE","1em"); f_z24(ratsHolder,1000,false); }
            }, function( error ) { f_n47( error ); }
         ).then( function(){ f_k44("raupd"); } );
      }
}
function f_m138(){
   var msend, whoto, whstg, temporaNode, my_OFF, my_FB;
   msend = document.getElementById( "mail2" );
   if ( msend ) msend.onclick = function(){
      temporaNode = document.getElementById( "perfTemporaHolder" );
      temporaNode.innerHTML = "<span  class='notionary-exbutton fa fa-times'></span>"+
                              "<div   class='notionary-feedback'></div>" +
                              f_a56("sh",TRANSLAT.emtxt,true,"");
      f_l23( temporaNode, 1000);
      my_OFF = temporaNode.firstChild; my_OFF.onclick = function(e){ f_z24(temporaNode,1000,false); }
      my_FB  = my_OFF.nextSibling;    f_x39(my_FB,msend.getAttribute("title"),"radTang");
      whoto = document.getElementById( "shinp" ); whstg = document.getElementById( "shstg" );
      whoto.onfocus = function(e){ this.value = ""; f_g32( this ); }
      whoto.onkeydown = function(e){ k =  (e.keyCode ? e.keyCode : e.which );
         f_n30( this );
         if ( k == "13" || k == "9" ){
            if ( f_o35( this.value, EMAILREG ) ) {
               f_l41( this,"radGrun");
               f_l31( this );
               shstg.style.width = shstg.style.height = "34px";
               f_o43("mail2");
               f_65("usrindex.php","tun=mail2&was=" + JSON.stringify({
                        "whoto": this.value, "prfid": msend.getAttribute("prfid") })).then(
                     function( response ){ },
                     function( error ){ f_x39(my_FB,error,"radRojo"); }
                  ).then(function(){ f_z24(temporaNode,1000,false); f_k44("mail2"); });
            } else { f_x39(my_FB,TRANSLAT.eapls,"radRojo"); f_l41( this,"radRojo"); }
         }
      }
      whoto.style.visibility = "visible";
   }
}
function f_d139(testtype,right,score,dauer,probs){
   var s, performance, xamrestitle, xamresoffer,
       reviewerBtn, temporaNode, commentBox, panelaZwote,
       cette, playables, testsTaken1, holdsTest1,
       testsTaken2, holdsTest2, testsTaken3, holdsTest3;
   f_n64("usrindex.php/?tun=ercau");
   f_o43("doneTest");
   f_65("php/doneTest.php","pdata=" + JSON.stringify(
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
            xamresoffer.onclick = function(e) { f_g86(); f_i87(); }

            if ( LOGGEDIN && !SMARTFON ) {
               holdsTest1  = document.getElementById( "ones" );
                             if ( holdsTest1 ) testsTaken1 = holdsTest1.getAttribute("count1");
               holdsTest2  = document.getElementById( "twos" );
                             if ( holdsTest2 ) testsTaken2 = holdsTest2.getAttribute("count2");
               holdsTest3  = document.getElementById( "tris" );
                             if ( holdsTest3 ) testsTaken3 = holdsTest3.getAttribute("count3");
            }
            switch( testtype ) {
               case 'trial': f_e45("fa-shield", "#4D90FE", "2em"); break;
               case 'write': f_e45("fa-trophy", "#2B7930","2em"); break;
               case 'adept': f_e45("fa-star",   "#E78F08","2em"); break;
            }
            f_k88( NINFDATA[0].nname, function(){ // Update NINFDATA with this test
               f_70( function(){ // Update USERINFO with this test
                  if ( LOGGEDIN ) {
                     if ( reviewerBtn ) { f_o43("getme");
                        f_n64("usrindex.php/?tun=getme&was=" + JSON.stringify(
                           { "secol": "review",
                             "vonta": "aareview",
                             "wocol": "notionID",
                             "valis":  NINFDATA[0].nidno
                           })
                        ).then(
                           function( response ){ var my_FB, defText, holder, texter;
                              defText = TRANSLAT.kmdef;
                              if ( response ) defText = response;
                              commentBox.innerHTML = f_z51("perfReview",8,40,defText);
                              holder = document.getElementById( "perfReviewCommentHolder" );
                              texter = document.getElementById( "perfReviewCommentTextarea" );
                              my_FB  = document.getElementById( "perfReviewCommentFeedback" );
                              f_x39(my_FB,TRANSLAT.kmnts,"radTang");
                              f_z24(holder,1000,true);
                              f_n52("perfReview",TRANSLAT.kmdef,10,100,/[^§(){}%$*+!"`\\\^]/,reviewerBtn,"",
                                 function(){}, function(){}, function(){ f_o43("reupd");
                                    f_65("usrindex.php","tun=reupd&was=" + JSON.stringify(
                                       { "nidno": NINFDATA[0].nidno,
                                         "rview": texter.value
                                       })
                                    ).then( function(response) {
                                          if ( response ) f_n47( response );
                                          else { f_e45("fa-check","#4D90FE","1em"); f_z24(holder,1000,true); }
                                       }, function( error ) { f_n47( error ); }
                                    ).then( function(){ f_k44("reupd"); } );
                                 });
                           },
                           function( error ){ f_n47( error ); }
                        ).then(function(){ f_k44("getme"); });
                     }
                     f_k137(); f_m138();
                  }
                  if ( s = f_r104( NINFDATA[0].nidno ) ) f_e105(s,panelaZwote);
                  playables = document.getElementsByClassName( "playme" );
                  for ( i = 0; i < playables.length; i++ ) {
                     playables[i].onmouseover = function( e ){ cette = this;
                        if ( !SOUNDHOV ) SOUNDHOV = setTimeout(function(){ SOUNDHOV = null;
                              f_a18( cette.getAttribute("sndid") ); },1000);
                     }
                     playables[i].onmouseout = function( e ){ cette = this;
                        if ( SOUNDHOV ){ clearTimeout( SOUNDHOV ); SOUNDHOV = null; }
                     }
                  }

               });
            });
         }
      },function( error ){ f_n47( error ); }
   ).then(function(){ f_k44("doneTest");
      var nimag, nlink;
      nimag = NINFDATA[0].nimag ? NINFDATA[0].nimag : "101";
      nlink = HARDCODE.myurl + "?tun=trial&amp;was=" + NINFDATA[0].nname.escapo();
      FB.ui({
          method:         "feed",
          app_id:         "'" + HARDCODE.fapid + "'",
          link:           nlink,
          picture:        HARDCODE.image + nimag,
          description:    score + "% " + f_c16(dauer) + TRANSLAT.using,
          caption:        "'[ " + NINFDATA[0].nname + " ] " + NINFDATA[0].ndesc + "'" },
          function(response) {
             if (response && !response.error_message) console.log('Posting completed.');
             else console.log('Error while posting.');
          }
      );
   });
}
function f_f140(){
   var enopt = deopt = esopt = fropt = itopt = ptopt = ruopt = huopt = "",
       neulingo = false, langhtml, flagclik, flagmenu, vanderas;

   if ( USERINFO[0].ulang != "en") enopt = "<div class='notionary-toolitem' spk='englis'><span class='notionary-englisch'></span> English   </div>";
   if ( USERINFO[0].ulang != "de") deopt = "<div class='notionary-toolitem' spk='german'><span class='notionary-tedeschi'></span> Deutsch   </div>";
   if ( USERINFO[0].ulang != "es") esopt = "<div class='notionary-toolitem' spk='spanis'><span class='notionary-spanisch'></span> Español   </div>";
   if ( USERINFO[0].ulang != "fr") fropt = "<div class='notionary-toolitem' spk='french'><span class='notionary-francais'></span> Français  </div>";
   if ( USERINFO[0].ulang != "it") itopt = "<div class='notionary-toolitem' spk='italia'><span class='notionary-italiano'></span> Italiano  </div>";
   if ( USERINFO[0].ulang != "pt") ptopt = "<div class='notionary-toolitem' spk='portug'><span class='notionary-portuges'></span> Português </div>";
   if ( USERINFO[0].ulang != "ru") ruopt = "<div class='notionary-toolitem' spk='russky'><span class='notionary-russians'></span> Pусский   </div>";
   if ( USERINFO[0].ulang != "hu") huopt = "<div class='notionary-toolitem' spk='magyar'><span class='notionary-magyarul'></span> Magyar    </div>";

   langhtml = document.getElementById( "profLanghtml" );
   langhtml.innerHTML = "<img id='profLangflag' src='"+ HARDCODE.image + f_i62( USERINFO[0].ulang ) + "'/>" + 
      "<div id='profLangmenu' class='notionary-tooltips'>" + enopt + deopt + esopt + fropt + itopt + ptopt + ruopt + huopt + "</div>";

   flagclik = document.getElementById( "profLangflag" ); // Clickable to shide or show the Menu
   flagmenu = document.getElementById( "profLangmenu" ); // Container of Flag Menu HTML
   flagclik.onclick = function(e){ if ( flagmenu.style.display == "block" ) f_z24(flagmenu,10,true); else f_l23(flagmenu); }

   vanderas = document.getElementsByClassName( "notionary-toolitem" );
   for ( i = 0; i < vanderas.length; i++ )
      vanderas[i].onclick = function( e ){
         e.preventDefault();
         f_z24(flagmenu,10,true);
         switch( this.getAttribute("spk") ){
            case "englis": BROWSLAN = USERINFO[0].ulang = "en"; seter("aauser","ulang","en","","",function(){}); neulingo = true; break;
            case "german": BROWSLAN = USERINFO[0].ulang = "de"; seter("aauser","ulang","de","","",function(){}); neulingo = true; break;
            case "spanis": BROWSLAN = USERINFO[0].ulang = "es"; seter("aauser","ulang","es","","",function(){}); neulingo = true; break;
            case "french": BROWSLAN = USERINFO[0].ulang = "fr"; seter("aauser","ulang","fr","","",function(){}); neulingo = true; break;
            case "italia": BROWSLAN = USERINFO[0].ulang = "it"; seter("aauser","ulang","it","","",function(){}); neulingo = true; break;
            case "portug": BROWSLAN = USERINFO[0].ulang = "pt"; seter("aauser","ulang","pt","","",function(){}); neulingo = true; break;
            case "russky": BROWSLAN = USERINFO[0].ulang = "ru"; seter("aauser","ulang","ru","","",function(){}); neulingo = true; break;
            case "magyar": BROWSLAN = USERINFO[0].ulang = "hu"; seter("aauser","ulang","hu","","",function(){}); neulingo = true; break;
         }
         if ( neulingo ) f_k69( USERINFO[0].ulang, function(){
                            f_f71( USERINFO[0].ulang, function(){ f_g86(); f_101(); f_i87(); });
                         });
   }
}
function f_i141(inits,enable){
   var tafel;
   switch(inits){ // update local USERINFO Superarray to obviate refresh
      case "au": tafel="aanosnd"; USERINFO[0].nosnd = enable; break;
      case "ms": tafel="aajamsg"; USERINFO[0].msges = enable; break;
   }
   f_65("usrindex.php","tun=prefs&was=" + JSON.stringify({"tafel":tafel,"value":enable})).then(
      function( response ){ if ( response ) f_n47( response ); },
      function( error ) { f_n47( error ); }
   );
}
function f_y142(elementID,clickCBK){
   var FACEBOOK = "https://graph.facebook.com/",
       //GOOOOGLE = "https://picasaweb.google.com/data/entry/api/user/",
       //gpjson,
       avatarElement = document.getElementById(elementID);
       USERBILD = HARDCODE.image + "101" +  "&r=" + Math.random( )* 100; // default no image -->> Notionary owl

   if      ( USERINFO[0].uimag ) USERBILD = HARDCODE.image + USERINFO[0].uimag + "&r=" + Math.random() * 100;
   else if ( USERINFO[0].fbusr ) USERBILD = FACEBOOK + USERINFO[0].fbusr + "/picture";
   else if ( USERINFO[0].twusr ) USERBILD = USERINFO[0].twusr.replace(/\\/g,"");
   /*
   else if ( USERINFO[0].gpusr ) {
      ijson = GOOOOGLE + USERINFO[0].gpusr + "?alt=json";
      f_n64(ijson,"Access-Control-Allow-Origin",HARDCODE.myurl).then(
         function( response ) { gpjson = JSON.parse( response );
            USERBILD  = gpjson.entry.gphoto$thumbnail.$t;
            avatarElement.style.setProperty("background-image","url(" + USERBILD + ")","important");
            avatarElement.onclick = function(e){ f_y151("av"); }
         },
         function( error ) { f_n47( error); }
      );
   }
   */
   if ( USERBILD != "" ) avatarElement.style.setProperty("background-image","url(" + USERBILD + ")","important");
   avatarElement.onclick = clickCBK;
}
function f_c143(){
   var soundsno, soundsja, emailsno, emailsja, nickname, nickajax, nickchek, fullname,
       username, userajax, userchek, mailname, mailajax, mailchek,
       password, passchek, clavedos, clavchek, advisory, saverbtn,
       knsan = fnsan = pwsan = false,
       kndif = fndif = pwdif = undif = emdif = false,
       kn_ok = un_ok = em_ok = true; // Stronger check Logic evaluated IFF Actual input
   f_x50("profile",
      "<div id='avatarHolder'></div>" +
      "<div id='profLanghtml'></div>" +
      f_o58("sx",[TRANSLAT.nopes,TRANSLAT.yeses],!USERINFO[0].nosnd) +
      f_o58("ex",[TRANSLAT.nopes,TRANSLAT.yeses],USERINFO[0].msges) +
      f_a56("kn",USERINFO[0].kname,true,"") + f_a56("fn",USERINFO[0].fname,true,"") +
      f_a56("un",USERINFO[0].uname,true,"") + f_a56("em",USERINFO[0].email,true,"") +
      f_a56("pw","********",true,"")        + f_a56("p2","********",true,"") +
      "<button id='saverKnopf'>" + TRANSLAT.savit + "</button>",
     function(){ // Binding Callback()
         f_f140();
         f_y142("avatarHolder",function(){ f_y151("av"); });
         advisory = document.getElementById( "profileZentralInfo" );     welcomer = document.getElementById( "profileZentralUser" );
         soundsno = document.getElementById( "sx0" );   soundsja = document.getElementById( "sx1" );
         emailsno = document.getElementById( "ex0" );   emailsja = document.getElementById( "ex1" );
         nickname = document.getElementById( "kninp" ); nickajax = document.getElementById( "knajx" ); nickchek = document.getElementById( "knstg" );
         fullname = document.getElementById( "fninp" );
         username = document.getElementById( "uninp" ); userajax = document.getElementById( "unajx" ); userchek = document.getElementById( "unstg" );
         mailname = document.getElementById( "eminp" ); mailajax = document.getElementById( "emajx" ); mailchek = document.getElementById( "emstg" );
         password = document.getElementById( "pwinp" ); passchek = document.getElementById( "pwstg" );
         clavedos = document.getElementById( "p2inp" ); clavchek = document.getElementById( "p2stg" );
         saverbtn = document.getElementById( "saverKnopf" );

         // Establish current state of preferences and prepare to handle changes
         if ( f_y59( "sx" ) ) soundsja.setAttribute("disabled","true"); else soundsno.setAttribute("disabled","true");
         if ( f_y59( "ex" ) ) emailsja.setAttribute("disabled","true"); else emailsno.setAttribute("disabled","true");
         soundsno.onclick = function(e){ PLAYABLE = false;
                               f_i141("au",true); f_l46(TRANSLAT.pfcok);
                               soundsno.setAttribute("disabled","true"); soundsja.removeAttribute("disabled"); }
         soundsja.onclick = function(e){ PLAYABLE = true;
                               f_i141("au",false); f_l46(TRANSLAT.pfcok);
                               soundsja.setAttribute("disabled","true"); soundsno.removeAttribute("disabled"); }
         emailsno.onclick = function(e){ f_i141("ms",false); f_l46(TRANSLAT.pfcok);
                               emailsno.setAttribute("disabled","true"); emailsja.removeAttribute("disabled"); }
         emailsja.onclick = function(e){ f_i141("ms",true); f_l46(TRANSLAT.pfcok);
                               emailsja.setAttribute("disabled","true"); emailsno.removeAttribute("disabled"); }

         // Regular Users can't choose E-mail while Social Network Users can't choose Username nor Password
         if ( f_o35( USERINFO[0].uname, EMAILREG ) ) f_z24(mailname.parentNode,10,true);
         else f_c21.apply(this,[ username.parentNode, password.parentNode ]);

         f_c21.apply(this,[ username.parentNode.firstChild, mailname.parentNode.firstChild,
                              password.parentNode.firstChild, clavedos.parentNode.firstChild,
                              welcomer, clavedos ]);

         nickname.onfocus = function(e) { f_j54(this,TRANSLAT.kntxt); }
         nickname.onblur  = function(e) { f_l55(this,TRANSLAT.kntxt); }
         fullname.onfocus = function(e) { f_j54(this,TRANSLAT.fntxt); }
         fullname.onblur  = function(e) { f_l55(this,TRANSLAT.fntxt); }
         username.onfocus = function(e) { f_j54(this,TRANSLAT.untxt); }
         username.onblur  = function(e) { f_l55(this,TRANSLAT.untxt); }
         mailname.onfocus = function(e) { f_j54(this,TRANSLAT.emtxt); }
         mailname.onblur  = function(e) { f_l55(this,TRANSLAT.emtxt); }
         password.onfocus = function(e) { f_j54(this,TRANSLAT.pwtxt); this.setAttribute("type","password"); }
         password.onblur  = function(e) { f_l55(this,TRANSLAT.pwtxt); }
         clavedos.onfocus = function(e) { f_j54(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
         clavedos.onblur  = function(e) { f_l55(this,TRANSLAT.p2txt); }

         // Make them all visible and prevent SMARTFON keyboard clutter
         nickname.focus(); fullname.focus(); username.focus(); mailname.focus(); password.focus();
         setTimeout( function(){ password.blur(); },100);
         //fullname.blur(); username.blur(); mailname.blur(); password.blur(); nickname.blur();

         // Handle onkey{up|down} for Full Name and Nickname
         f_y36( fullname, NAMESREG, advisory, function(){ fnsan = true; });
         f_y36( nickname, NAMESREG, advisory, function(){ knsan = true;
            nickajax.style.visibility = "visible";     // Ahow ajax mgif while checking
            f_n64("usrindex.php/?tun=taken&was=" + nickname.value ).then(
               function( response ) {
                  if ( !response ) { kn_ok = true; f_l23(nickchek,100); }
                  else { kn_ok = false; f_z24(nickchek,10,true);
                     f_h40(advisory,TRANSLAT.notmp,"red");
                  }
               },
               function( error ) { f_n47 ( error ); }
            ).then(function(){ nickajax.style.visibility = "hidden"; });
         });

         // Handle onkey{up|down} for User Name (Regular Users) and Mail Name (Social Network Users)
         username.onkeyup   = mailname.onkeyup = f_n29;
         username.onkeydown = mailname.onkeydown = function(e) {
            var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
            if ( cette == username ) { mychk = USERINFO[0].uname; myajx = userajax; mystg = userchek; }
            else                     { mychk = USERINFO[0].email; myajx = mailajax; mystg = mailchek; }
            f_z24(mystg,10,true);
            if ( k == "13" || k == "9" )
               if ( f_o35( cette.value, EMAILREG ) )   // Sanity Check
                  if ( cette.value != mychk ) {    // Availability Check -- HTTP_Req IFF diff && sane
                     myajx.style.visibility = "visible";
                     f_n64("?tun=known&was=" + cette.value ).then(
                        function( response ) {
                           if ( !response ) { f_l23(mystg,100);
                              cette == username ? un_ok = true : em_ok = true;
                           } else { f_h40(advisory,TRANSLAT.taken,"red");
                              cette == username ? un_ok = false : em_ok = false;
                              //cette.id.substr(0,2) == "un" ? un_ok = false : em_ok = false;
                           }
                        }, function( error ) { f_n47( error ); }
                     ).then(function(){ myajx.style.visibility = "hidden"; });
                  }
         }

         // Handle Password Input
         password.onkeydown = function(e) { var k = (e.keyCode ? e.keyCode : e.which);
            if ( k == "13" || k == "9" )
               if ( f_o35( password.value, PWORDREG ) ) {
                  f_h40(advisory,TRANSLAT.p2txt,"black");
                  f_l23(clavedos.parentNode,10,"inline-block");
                  turnOn.apply(this,[passchek, clavedos]);
                  clavedos.focus();
               } else { password.value = "********";
                  f_h40(advisory,TRANSLAT.pwbad,"red");
                  f_c21.apply(this,[passchek, clavedos.parentNode]);
               }
         }

         // Handle Password Confirmation
         clavedos.onkeydown = function(e) { var k = (e.keyCode ? e.keyCode : e.which);
            if ( k == "13" || k == "9" ) {
               if ( password.value == clavedos.value ) { f_h40(advisory,"","black");
                  turnOn.apply(this,[passchek, clavchek]);
               } else  { clavedos.value = TRANSLAT.p2txt; f_h40(advisory,TRANSLAT.pmiss,"red"); }
            }
         }

         // Process all inputs en-masse 
         saverbtn.onclick = function(){ // Handle special inputs first EM/- PW
            if ( ( nickname.value != USERINFO[0].kname ) && ( nickname.value || USERINFO[0].kname ) ) kndif = true;

            if ( ( fullname.value != USERINFO[0].fname ) && ( fullname.value || USERINFO[0].fname ) ) fndif = true;

            if (   username.value != USERINFO[0].uname )                                           undif = true;

            if (   mailname.value == TRANSLAT.emtxt ) mailname.value ="";
            if (   mailname.value != USERINFO[0].email && f_o35( mailname.value, EMAILREG ) )     emdif = true;

            if (   password.value != "********" ) {
               if ( !clavedos.value || clavedos.value == "********" ) f_z19(password,13);
               if (  clavedos.value && ( password.value == clavedos.value ) )                   pwdif = true;
            }

            if ( fullname.value.length >= NAMESREG[2] &&
                 fullname.value.length <= NAMESREG[3] && NAMESREG[1].test(fullname.value) )           fnsan = true;

            if ( !password.value ||
                 ( f_o35( password.value, PWORDREG ) && password.value == clavedos.value ) )   pwsan = true;

            if (  un_ok && em_ok && kn_ok && pwsan && fnsan && ( undif || emdif || kndif || pwdif || fndif ) ) { f_o43("pfupd");
               f_65("usrindex.php","tun=pfupd&was=" + JSON.stringify(
                  { "kname": nickname.value, "fname": fullname.value,
                    "uname": username.value, "email": mailname.value, "pword": password.value
                  })).then(function(response){
                     if ( response ) f_n47( response );
                     else {
                        if ( undif || emdif ) f_n47(TRANSLAT.emchk);
                        else f_l46(TRANSLAT.pfcok);
                        f_70();
                     }
                  }, function( error ){ f_n47( error ); }
               ).then(function(){ f_k44("pfupd"); });
            }
         }
   }, function(){ f_g86(); f_i87(); } );
}
function f_q144(){
   var DEFCATEG = 20,
       DEFSPEAK = "en",
       QANDATXT = {},
       category = DEFCATEG,
       language = DEFSPEAK;

   if ( document.getElementById( "editKatseSel" ) )
      category = f_i103( document.getElementById( "editKatseSel" ).value );

   if ( document.getElementById( "editLangflag" ) )
      language = document.getElementById( "editLangflag" ).getAttribute("tgetlang")

   f_o43("txget");
   f_n64("usrindex.php/?tun=txget").then(
      function( response ){                                        // JSONless call
         if ( response ) { QANDATXT = JSON.parse( response );
            if ( ( QANDATXT.length == 10 ) &&                      // Check if the fail over Notion was returned
                 ( QANDATXT[0].q == TRANSLAT.qkopf + "1" ) &&
                 ( QANDATXT[9].a == TRANSLAT.akopf + "10" ) )
                    f_n47( TRANSLAT.fnoul );
            for ( i = 0; i < QANDATXT.length; i++ ) {              // Failsafe clean up of Server garbage
               if ( !QANDATXT[i].q ) QANDATXT[i].q = "";
               if ( !QANDATXT[i].a ) QANDATXT[i].a = "";
            }
            MOREDATA = f_y172( category, "", "", language, QANDATXT );
            MOREDATA = f_q171( MOREDATA );
            f_j177( "", MOREDATA, MOREDATA, "schaf" );
         } else f_n47( TRANSLAT.fnoul );
      },
      function( error ) { f_n47( error ); }
   ).then(function(){ f_k44("txget"); });
}
function f_y145(){
   var trophies = document.getElementById( "userTrophies" );

   if ( USERINFO[0].kenne )
      trophies.innerHTML += "<div id='userClikdata' class='notionary-trophies'>" +
                               "<span class='fa fa-shield'></span>" +
                               "<div class='notionary-counters'>" + USERINFO[0].kenne + "</div>" +
                            "</div>";
   if ( USERINFO[0].wrote )
      trophies.innerHTML += "<div id='userWritdata' class='notionary-trophies'>" +
                               "<span class='fa fa-trophy'></span>" +
                               "<div class='notionary-counters'>" + USERINFO[0].wrote + "</div>" +
                            "</div>";
   if ( USERINFO[0].meist )
      trophies.innerHTML += "<div id='userMastdata' class='notionary-trophies'>" +
                               "<span class='fa fa-star'></span>" +
                               "<div class='notionary-counters'>" + USERINFO[0].meist + "</div>" +
                            "</div>";

   if ( f_a179() ) {
      trophies.innerHTML += "<div id='userProblems' class='notionary-trophies' title='" + TRANSLAT.repas + "'>" +
                               "<span class='fa fa-thumbs-o-down'></span>" +
                               "<div class='notionary-counters'>" + f_a179() + "</div>" +
                            "</div>";
      document.getElementById( "userProblems" ).onclick = function(e) { window.location.href = HARDCODE.myurl + "?tun=probs"; }
   }

}
// SOUNDS
function f_p146(inits){
   return(
    "<div class='notionary-recshoch'>" +
      "<audio  id='" + inits + "Audio'></audio>" +
      "<div    id='" + inits + "Spiner' class='notionary-recsload'></div>" +
      "<button id='" + inits + "Record'><span class='fa fa-microphone'></span>" + TRANSLAT.speak + "</button>" +
      "<button id='" + inits + "Stop'   style='display:none;'><span class='fa fa-stop-circle'></span></button>" +
      "<span   id='" + inits + "Done'   class='notionary-recsdone'></span>" +
      "<button id='" + inits + "Listen'><span class='fa fa-play'></span>" + TRANSLAT.ecout + "</button>" +
    "</div>");
}
function f_g147(inits,nname,frage,currs){
   f_o43("recorder");
   loadJS("js/recorder.js").then(function(){
      loadJS("js/recorderWorker.js").then(function(){
         f_g147Guts(inits,nname,frage,currs);
      });
   }).then( function(){ f_k44("recorder"); });
}
function f_g147Guts(inits,nname,frage,currs){
   var CODESTR = HARDCODE.grava,
       recorder, stopper, audio, spinner, recobtn, stopbtn, donebtn, listen;
   audio   = document.getElementById( inits + "Audio");
   spinner = document.getElementById( inits + "Spiner");
   recobtn = document.getElementById( inits + "Record");
   stopbtn = document.getElementById( inits + "Stop");
   donebtn = document.getElementById( inits + "Done");
   listen  = document.getElementById( inits + "Listen");
   f_z24( donebtn , 2000, false);
   window.URL = window.URL || window.webkitURL;
   navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia ||
                            navigator.mozGetUserMedia || navigator.msGetUserMedia;
   recobtn.onclick = function(){
      f_z24( donebtn, 2000, false); f_l23( spinner, 2000);
      stopbtn.onclick = function(){ // click bind IFF "RECORD" clicked
         clearTimeout(stopper); recorder.stop();
         recorder.exportWAV(function(stream){ // get blob sound data base64
            var reader = new FileReader();
            audio.src = window.URL.createObjectURL(stream);
            reader.onload = function(event){ // The spinner suffices f_o43("qsupd");
               f_65("usrindex.php","tun=qsupd&was=" +
                  JSON.stringify({"nname":nname, "frage":frage, "data":event.target.result })
               ).then(
                  function( response ) {
                     if (  response  ) {
                        sonido = JSON.parse( response );
                        sndid  = sonido.sndid; sname = sonido.name;
                        f_o149(listen,sndid + "&r=" + Math.random() * 100,false);
                        f_l23( donebtn, 2000);
                        // Admin Sound Editor (CODESTR) - Otherwise must be naryEdit | naryExam (Pause|Contrib)
                        if ( nname != CODESTR ) f_c150(inits,nname,frage,sndid);
                     } 
                     f_z24( spinner, 2000, false);
                  },
                  function( error ){ f_n47( error ); }
               ); // Spinner suffices.then(function(){ f_k44("qsupd"); });
            }; reader.readAsDataURL(stream); // cause above lambda f() to be called
         });
         recorder.clear();
      }
      if ( navigator.getUserMedia ){
         navigator.getUserMedia({audio:true},function(stream){
            window.AudioContext = window.AudioContext || window.webkitAudioContext;
            if ( !AUSTREAM ) AUSTREAM = new AudioContext(); // static var avoids resource limit(4)
            mediaStreamSource = AUSTREAM.createMediaStreamSource( stream );
            recorder = new Recorder(mediaStreamSource); recorder.record();
            stopper=setTimeout(function(){ stopbtn.click(); },3000);
         },function(){ f_l46("HTML4 Error"); });
      } else f_l46("HTML4 Error");
   }
   listen.style.visibility = "hidden";
   if ( currs ) f_o149(listen,currs + "&r=" + Math.random() * 100,false);
   f_z24( spinner, 2000, false);
}
function f_o149(node,soundID,playNow){
   if ( playNow ) f_a18( soundID );
   node.onclick = function(){ f_a18( soundID ); };
   node.style.visibility = "visible";
}
function f_c150(inits,nname,frage,sndid){
   // Called by f_g147: User via naryEdit||naryExam-Pause(Works) or Sound Contributions
   // Designed to fail (the main IF) for Sound Contrib
   var idxvalue, recidx, listen, snaped;
   listen = document.getElementById( inits + "Listen");
   recidx = document.getElementById( "recordedIndex" );
   if ( recidx ) idxvalue  = recidx.getAttribute("monindex"); // Fails for Voice Contribution
   if ( idxvalue ) { NINFDATA[1].qaimg[idxvalue].s = sndid;
      snaped = document.getElementById( idxvalue + "s" );
      if ( listen ) f_o149(listen,sndid + "&r=" + Math.random() * 100,true);
   }
}

// IMAGES
function f_y151(inits){
   var theTable, theColumn, theIndex, hauptimg, imagenum, admName, admIeid, r, cam = new Array();
   switch(inits){
      case "av": theTable  = "",   theColumn = "",   theIndex = "";
                 USERINFO[0].uimag ? imagenum = USERINFO[0].uimag : imagenum = 101 ;
                 f_y152( inits, imagenum, theTable, theColumn, theIndex ); break;
      case "ni": theTable = NINFDATA[0].nname,   theColumn = "",   theIndex = "";
                 hauptimg = document.getElementById( "editHauptImg" );
                 imagenum = hauptimg.getAttribute("notimage") ? hauptimg.getAttribute("notimage") : 101;
                 f_y152( inits, imagenum, theTable, theColumn, theIndex ); break;
      case "qi": theTable = NINFDATA[0].nname;
                 console.log("f_y151 -> THEINDEX : " + THEINDEX );
                 for( r = 0; r < THEINDEX; r++ ) { 
                    cam[ r ] = document.getElementById( r + "i" );
                    cam[ r ].setAttribute( "title" , TRANSLAT.qitxt );
                    cam[ r ].onmouseover = function(e){
                       var qim = this.parentNode.firstChild.nextSibling;
                       if ( !IMAGEHOV ) IMAGEHOV = setTimeout(function(){
                             IMAGEHOV = null; f_l23( qim, 2000 );
                          },3000);
                    }
                    cam[ r ].onmouseout = function(e){
                       var qim = this.parentNode.firstChild.nextSibling;
                       if ( IMAGEHOV ) { clearTimeout( IMAGEHOV ); IMAGEHOV = null; }
                       else f_z24( qim, 2000 );
                    }
                    cam[ r ].onclick = function(e){
                       e.stopPropagation();
                       theIndex = this.parentNode.parentNode.parentNode.id;
                       theColumn = NINFDATA[1].qaimg[ theIndex ].q;

                       imagenum = 101; 
                       if ( NINFDATA[1].qaimg[theIndex].i ) imagenum = NINFDATA[1].qaimg[theIndex].i;
                       f_y152( inits, imagenum, theTable, theColumn, theIndex );
                    }
                 } break;
      case "ie": admName = document.getElementById( "dninp" );
                 admIeid = document.getElementById( "meinp" );
                 theTable  = admName.value, theColumn  = admIeid.value, theIndex  = "",
                 f_y152( inits, theColumn, theTable, theColumn, theIndex ); break;
   }
}
function f_y152( inits, imagenum, theTable, theColumn, theIndex ){
   var imholder, deletbtn, delemkup = "",
       defimage = HARDCODE.image + imagenum + "&r=" + Math.random() * 100;
   if ( imagenum != 101 )
      delemkup = "<button id='hochDeletbtn' class='notionary-delete'>" +
                    "<span class='fa fa-trash'></span>" + TRANSLAT.delek +
                 "</button>";
   f_x50("imageHoch",
         "<div   id='" + inits + "pre'></div>" +
         "<div   id='" + inits + "php' class='notionary-phpUpload'></div>" +
         delemkup,
      function(){
         imholder = document.getElementById( "imageHochZentralHold" );
         imholder.style.setProperty("background-image","url(" + defimage + ")","important");
         f_z24( document.getElementById( "imageHochZentralUser" ), 10, true );
         f_r155( inits, theTable, theColumn, theIndex, imholder );

         // DELETION LOGIC Below
         if ( deletbtn = document.getElementById( "hochDeletbtn" ) )
            deletbtn.onclick = function(){
                  f_y48( TRANSLAT.qudel, TRANSLAT.delek, TRANSLAT.deldn,
                     function(){},
                     function(){
                        seter("aaimage","","DELETE","imageID",imagenum,function(){
                           var avatar, hauptimg, camerikn;
                           switch ( inits ) {
                              case "av": seter("aaavatar","","DELETE","userID",USERINFO[0].uidno,function(){});
                                         avatar = document.getElementById( "avatarHolder" );
                                         avatar.style.setProperty("background-image","url(" + HARDCODE.image + 101 + ")","important"); break;
                              case "ni": seter("aanotion","imageID","NULL","notionID",NINFDATA[0].nidno,function(){});
                                         hauptimg = document.getElementById( "editHauptImg");
                                         hauptimg.setAttribute("src",HARDCODE.image + 101); break;
                              case "qi": // 1) Void the DB Notion question image entry, and update extant Notion
                                         seter( NINFDATA[0].nname, "imageID", "NULL", "question", theColumn, function(){} );
                                         NINFDATA[1].qaimg[ theIndex ].i = null;
                                         // 2) Visual feedback: image disappear from Editor & Camera Icon orange
                                         camerikn = document.getElementById( theIndex + "i" );
                                         camerikn.style.setProperty("color","#E78F08");
                                         camerikn.parentNode.removeChild( camerikn.nextSibling );
                                         document.getElementById( "imageHochZentralExit" ).onclick();
                                         break;
                              case 'ie': break;
                           }
                        });
                     }
                  );
            }


      },
      function(){ f_g86(); f_i87(); }
   );
}
function f_p153(inits){
   var ulres, rando = "&r=" + Math.random() * 100, errType,
       avhold, hauptimg, camerikn, theimage, iename, 
       listen, spkikn, xamtmp, overlay,
       idxvalue = document.querySelector('[name="index"]').value,
       mediaID, mediaName, imsrc = HARDCODE.image + "101", snsrc="1";
   overlay = document.getElementById( "modalOverlay" );
   f_n64("usrindex.php/?tun=uload").then(
      function( response ){
         if ( response ) { ulres = JSON.parse( response );
            if( ulres.status === 0) { mediaID = ulres.db_id; mediaName = ulres.name;
               // Of the two below one is always wrong but irrelevant
               imsrc = HARDCODE.image + mediaID + rando; snsrc = mediaID + rando;
               switch(inits){
                  case 'av': USERINFO[0].uimag = mediaID; USERBILD = imsrc;
                             //avuser = document.getElementById( "userAvatar" );
                             avhold = document.getElementById( "avatarHolder" );
                             //if ( avuser ) avuser.style.setProperty("background-image","url(" + USERBILD + ")","important");
                             if ( avhold ) avhold.style.setProperty("background-image","url(" + USERBILD + ")","important");
                             break;
                  case 'ei': NINFDATA[0].eanno = mediaID; break;
                  case 'ni': NINFDATA[0].nimag = mediaID;
                             hauptimg = document.getElementById( "editHauptImg" );
                             hauptimg.setAttribute("src",imsrc);
                             f_n64("usrindex.php/?tun=ercan&was=" + NINFDATA[0].nidno).then(
                                function( response ) { if ( response ) f_n47( response ); },
                                function( error ) { }
                             ); break;
                  case 'qi': // 1) Update the extant Notion
                             NINFDATA[1].qaimg[ idxvalue ].i = mediaID;
                             // 2) Visual feedback: image appear on Editor & Camera Icon blue
                             if ( camerikn = document.getElementById( idxvalue + "i" ) ) {
                                camerikn.style.setProperty( "color", "#4D90FE" );
                                theimage = document.createElement( "img" );
                                theimage.setAttribute( "class", "notionary-pictimag");
                                theimage.setAttribute( "src", imsrc );
                                camerikn.parentNode.insertBefore( theimage, camerikn.nextSibling );
                                f_l23( theimage );
                             }
                             break;
                  case 'qs': NINFDATA[1].qaimg[idxvalue].s = mediaID;
                             listen = document.getElementById( "qsListen" );
                             spkikn = document.getElementById( idxvalue + "s" );
                             xamtmp = document.getElementById( "examTemporaHolder" );
                             f_o149(listen,snsrc+"&r="+Math.random()*100,true);
                             f_z24(xamtmp,1000,false);
                             break;
                  case 'ie': iename = document.getElementById( "dninp" );
                             iename.value = mediaName;
                             break;
                  case 'se': f_e45("fa-check","green","1em"); break;
                  case 'pd': NINFDATA[0].dokum = mediaID; break;
               } f_e45("fa-check","#4D90FE","1em");
            } else { switch(ulres.status){
                        case '1': errType = TRANSLAT.badsz; break;
                        case '2': errType = TRANSLAT.badsz; break;
                        case '3': errType = TRANSLAT.incom; break;
                        case '4': errType = TRANSLAT.fnoul; break;
                        case '5': errType = TRANSLAT.notmp; break;
                        case '6': errType = TRANSLAT.notmp; break;
                        case '7': errType = TRANSLAT.notmp; break;
                        case '8': errType = TRANSLAT.choos; break;
                        default : errType = TRANSLAT.fnoul; break;
                   } f_l46(errType);
            }
         }
      },
      function ( error ) { f_n47( error ); }
   ).then(function( response ) { document.body.removeChild( overlay ); });
}
function f_v154( bytes ) {
   var i, sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if ( bytes == 0 ) return '0 Byte';
   i = parseInt( Math.floor( Math.log( bytes ) / Math.log( 1024 ) ) );
   return Math.round( bytes / Math.pow( 1024, i ), 2 ) + ' ' + sizes[i];
}
function f_r155( inits, theTable, theColumn, theIndex, prevue ){
   var MAXFS, fileData, x10ns={}, phpNode, formal, fakBtn, runBtn, fooBar;
   switch(inits){ // Prepare an allowed extns obj
      case 'cs': MAXFS = 30000; x10ns={"csv":1,"txt":1,"pdf":1,"doc":1,"docx":1,"rtf":1}; break;
      case 'av':case 'ab':case 'ad':case 'ei':case 'ni':case 'qi':case 'ie': MAXFS = 3000000;
         x10ns={"jpg":1,"JPG":1, "jpeg":1,"JPEG":1,"gif":1,"GIF":1, "png":1,"PNG":1,"svg":1,"SVG":1}; break;
      case 'pd': MAXFS = 2000000; x10ns={"pdf":1}; break;  // upload a PDF file
      case 'qs':case 'se': MAXFS = 1000000; x10ns={"mp3":1,"MP3":1,"wav":1,"WAV":1}; break;
   }
   phpNode = document.getElementById( inits + "php" );
   phpNode.innerHTML =
      "<div class='notionary-phpNameForm'>"+
        "<form id='theForm' sizno='" + MAXFS + "' action='" + HARDCODE.myurl + "usrindex.php' target='dummy' " +
             " enctype='multipart/form-data' method='post'>" +
           "<input type='hidden' name='MAX_FILE_SIZE' value='" + MAXFS + "'/>" +
           '<input type="hidden" name="notion"   value="' + theTable + '"/>' +
           '<input type="hidden" name="question" value="' + theColumn + '"/>' +
           "<input type='hidden' name='index'    value='" + theIndex + "'/>" +
           "<input type='hidden' name='tun'      value='fupld'/>" +
           "<input type='hidden' name='inits'    value='" + inits + "'/>" +
           "<button id='" + inits + "Fak'><span class='fa fa-folder'></span>" + TRANSLAT.choos + "</button>" +
           "<input  id='foo' class='notionary-hidden' type='file' name='foo'/>" +
           "<button id='" + inits + "Run'><span class='fa fa-upload'></span>" + TRANSLAT.uload + "</button>" +
        "</form>" +
      "</div>" +
      "<iframe name='dummy' style='width:0px;height:0px;display:none;'></iframe>";
   formal = document.getElementById( "theForm" );
   fooBar = document.getElementById( "foo" );
   fakBtn = document.getElementById( inits + "Fak" );
   runBtn = document.getElementById( inits + "Run" );
   fooBar.style.setProperty("z-index","9999","important");
   runBtn.setAttribute("disabled","disabled"); f_z24( runBtn,100,true );
   runBtn.style.setProperty("z-index","0","important");
   runBtn.onclick = function(e){
      f_o43("uploadingData");
      setTimeout( function(){
         if ( inits == "cs" ) f_q144();
         else f_p153(inits);
         f_k44("uploadingData");
      }, 3000 );
   }
   fooBar.onchange = function(e){
      var fname, exten, fsize, maxsz, ftype, fprev = new FileReader;
      fooBar.style.setProperty("z-index","0","important");
      // Below only useful for image uploads!!
      if ( inits == "av" || inits == "ab" || inits == "ad" || inits == "ei" ||
           inits == "ni" || inits == "qi" || inits == "ie" )
         fprev.onloadend = function(e){
            if ( prevue ) prevue.style.setProperty("background-image","url(" + fprev.result + ")","important");
         }

      if ( this.files[0] ) fprev.readAsDataURL( this.files[0] );
      fname = this.value;
      // IE does not support HTML5 FILE
      try{ fileData = this.files[0], fsize = this.files[0].size; ftype = this.files[0].type; }
      catch( e ){ fsize = 0; ftype = fname.split('.').pop(); }
      maxsz = formal.getAttribute("sizno"); exten = fname.split('.').pop();
      if ( fsize > maxsz ) f_n47( TRANSLAT.badsz + " [ Max: " + f_v154( maxsz ) + " ]" );
      if ( ( fsize < maxsz) && ( exten in x10ns ) ) { // Enable upload based on file size + type
         fakBtn.setAttribute("disabled","disabled");  f_z24( fakBtn,100,true );
         fakBtn.style.setProperty("width","0px","important");
         fakBtn.style.setProperty("height","0px","important");
         fooBar.style.setProperty("width","0px","important");
         fooBar.style.setProperty("height","0px","important");
         runBtn.removeAttribute("disabled"); f_l23( runBtn,1000 );
         runBtn.style.setProperty("z-index","9999","important");

         // Below only useful for image uploads!!
         if ( inits == "av" || inits == "ab" || inits == "ad" || inits == "ei" ||
              inits == "ni" || inits == "qi" || inits == "ie" )
            if ( prevue != "" ) {
               prevue.style.opacity = 1;
               prevue.style.filter = "alpha(opacity=100)";
            }
      }
   }
}
function f_x156(){
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
function f_a157(){
   var DEFCATEG = 20,                // Others
       DEFSPEAK = USERINFO[0].ulang; // Use the User's Language by default
   if ( !USERINFO[0].uname ) { f_n47( TRANSLAT.logfn ); return false; }
   NINFDATA = {};
   MOREDATA = f_y172( DEFCATEG, "", "", DEFSPEAK, "");
   MOREDATA = f_q171( MOREDATA );
   f_j177( "", MOREDATA, MOREDATA, "schaf");
}
function f_w158(nname){
   ISEXTANT = true;
   QAIMDATA = NINFDATA[1].qaimg;
   MOREDATA = f_y172( NINFDATA[0].catno, NINFDATA[0].nname, NINFDATA[0].ndesc, NINFDATA[0].tlang, QAIMDATA );
   MOREDATA = f_q171( MOREDATA );
   f_j177( NINFDATA[0].nname, MOREDATA, QAIMDATA, "ander" );
}
function f_q159(nodnm){
   var deschars;
   deschars = document.getElementById( "editDesczahl" );
   nodnm.onkeydown = function(e){ var sofar; f_g32(this);
      if ( this.value.match(TRANSLAT.nndef) || this.value.match(TRANSLAT.nddef)) nodnm.value = ""; 
      sofar = this.value.length + 1; f_n30(this);
      if ( this.id == "editDesctext" ) deschars.innerHTML = NDESCREG[3] - sofar;
   }
}


function f_r160(nname,ndesc,namedesc,bindCBK){
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
function f_q161(nname,bindCBK){
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
function f_w162(){
   var dokumbox, dokumgui;
   dokumbox = document.getElementById( "editDokumCbx" );
   dokumgui = document.getElementById( "editDokumGui" );

   if ( !dokumbox || !dokumgui ) return;

   handleDokum = function(){
      dokumgui.innerHTML = "<button id='editAmendPDF'>" +
                              "<span class='fa fa-file-pdf-o'></span>" + TRANSLAT.uload +
                           "</button>";
      document.getElementById( "editAmendPDF" ).onclick = function(e){
         f_x50("uploadPDF","<div class='notionary-phpUpload' id='pdphp'></div>",
            function(){ 
               f_z24( document.getElementById( "uploadPDFZentralUser" ), 10, true );
               f_r155("pd",NINFDATA[0].nname,"","","uploadPDFModalHold");
            },
            function(){ f_g86(); f_i87(); });
      }
   }

   if ( dokumbox.checked ) handleDokum();

   dokumbox.onchange = function(e){
      if ( this.checked ) handleDokum();
      else { dokumgui.innerHTML = "";
         if ( NINFDATA[0].dokum ) {
            seter("aapdf","","DELETE","pdfID",NINFDATA[0].dokum,function(){ 
               seter("aapdfid","","DELETE","notionID",NINFDATA[0].nidno,function(){
                  f_k44("seter"); NINFDATA[0].dokum = null; });
            });
         }
      }
   }
}
function f_f163(nname,bindCBK){
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
function f_e164(){
   var VIDEOURL = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/,
       DEFYTUBE ="YouTube URL ↵",
       videobox, videogui, ytubeurl;
   videobox = document.getElementById( "editVideoCbx" );
   videogui = document.getElementById( "editVideoGui" );

   if ( !videobox || !videogui ) return;

   handleVideo = function(){
      videogui.innerHTML = "<input id='editYTubeURL' value='" + (NINFDATA[0].video ? NINFDATA[0].video : DEFYTUBE) + "'>";
      f_l23( videogui,10,"inline-block" );

      ytubeurl = document.getElementById( "editYTubeURL" );
      ytubeurl.addEventListener("focus",function enfoque(){ 
         if ( this.value == DEFYTUBE ) this.value = "";        // clear default values
         this.removeEventListener("focus",enfoque, false);     // Prevent multiple firings
      },false);
      ytubeurl.onblur = function(e){ f_z19(this,13); }
      ytubeurl.onkeydown = function(e){ var typed, k = (e.keyCode ? e.keyCode : e.which); f_n30(this);
         if ( k == "13" || k == "9" ) {                        // process tab or enter keys only
            ytubeurl.onblur = null;                            // Prevent the Blur event being handled after hitting enter
            typed = this.value;                                // Video URL sanity
            if ( typed.issane( VIDEOURL ) && this.value != NINFDATA[0].video ) { //f_l31( this );
               seter("aavideo","video", this.value.replace('http:','https:'),"notionID",NINFDATA[0].nidno, function(){
                  f_e45("fa-check","#4D90FE","1em");
                  f_o43("geter");
                  f_65("usrindex.php","tun=geter&was=" + JSON.stringify({
                     "secol": "video", "vonta": "aavideo",
                     "wocol": "notionID", "valis": NINFDATA[0].nidno })
                  ).then( function(response) {
                        NINFDATA[0].video = response;
                        ytubeurl.innerHTML = NINFDATA[0].video;
                     },function(error) { f_n47( error ); }
                  ).then( function(){ f_k44("geter"); } );
               });
            } else 
               videogui.innerHTML = "<input id='editYTubeURL' value='" + (NINFDATA[0].video ? NINFDATA[0].video : DEFYTUBE) + "'>";
         }
      }
   }

   if ( videobox.checked )  handleVideo(); 

   videobox.onchange = function(){
      if ( this.checked ) handleVideo();
      else { f_z24(videogui);
         if ( NINFDATA[0].video ) seter("aavideo","","DELETE","notionID",NINFDATA[0].nidno,
               function(){ f_k44("seter"); NINFDATA[0].video = null; });
      }
   }
}
function f_b165(nname,bindCBK){
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
function f_b166(){
   var i, pictobox, pictogui, camerons, imagenes, questext;

   pictobox = document.getElementById( "editPictoCbx" );
   pictogui = document.getElementById( "editPictoGui" );
   camerons = document.getElementsByClassName("notionary-camarita");
   imagenes = document.getElementsByClassName("notionary-pictimag");
   questext = document.getElementsByClassName("notionary-pregunta");

   if ( !pictobox || !pictogui ) return;

   handlePicto = function(){
      pictogui.innerHTML = TRANSLAT.pikme;
      for ( i = 0; i < questext.length; i++ ) f_z24( questext[i], 100, false );
      for ( i = 0; i < imagenes.length; i++ ) f_l23( imagenes[i], 100 );
      for ( i = 0; i < camerons.length; i++ ) f_l23( camerons[i], 100 );
   }

   if ( pictobox.checked ) handlePicto();

   try { if ( NINFDATA[0].picto ) handlePicto();
         else for ( i = 0; i < camerons.length; i++ ) f_z24( camerons[i] , 100, false );
   } catch( err ){}

   pictobox.onchange = function(e){
      if ( this.checked ) handlePicto();
      else { pictogui.innerHTML = "";
         for ( i = 0; i < questext.length; i++ ) f_l23( questext[i], 100, "inline-block" );
         for ( i = 0; i < imagenes.length; i++ ) f_z24( imagenes[i], 100, false );
         for ( i = 0; i < camerons.length; i++ ) f_z24( camerons[i], 100, false );
      }
   }
}
function f_j167(nname,bindCBK){
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
function f_l168(){
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
            function(){ NINFDATA[0].piece = cette; f_k44("seter"); });
      }
      cardinal.onchange = function(e){ var cette = this.value;
         seter("aapart","cardinality",cette,"notionID",NINFDATA[0].nidno,
            function(){ NINFDATA[0].parts = cette; f_k44("seter"); });
      }
   }

   if ( compibox.checked )  handlePiece(); 

   compibox.onchange = function(e){
      if ( this.checked ) handlePiece();
      else { piecegui.innerHTML = "";
         seter("aapart","","DELETE","notionID",NINFDATA[0].nidno,
         function(){ NINFDATA[0].piece = null; NINFDATA[0].parts = null; f_k44("seter"); });
      }
   }
}
function f_o169(nname,which,optslist,opchosen,bindCBK){
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
function f_m170( deflingo ){
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
                           " src='"+ HARDCODE.image + f_i62( deflingo ) +
                        "'/>" +
                        "<div id='editLangmenu' class='notionary-tooltips'>" +
                           enoption + deoption + esoption + froption + 
                           itoption + ptoption + ruoption + huoption +
                        "</div>";

   flagclik = document.getElementById( "editLangflag" ); // Clickable to shide or show the Menu
   flagmenu = document.getElementById( "editLangmenu" ); // Container of Flag Menu HTML
   flagclik.onclick = function(e){ if ( flagmenu.style.display == "block" ) f_z24(flagmenu,10,true); else f_l23(flagmenu); }

   vanderas = document.getElementsByClassName( "notionary-toolitem" );
   for ( i = 0; i < vanderas.length; i++ )
      vanderas[i].onclick = function( e ){
         e.preventDefault();
         f_z24(flagmenu,10,true);
         document.getElementById( "editLangflag" ).setAttribute("src", HARDCODE.image + f_i62( this.getAttribute("language") ) );
         document.getElementById( "editLangflag" ).setAttribute("tgetlang",this.getAttribute("language") );
      }
}
function f_q171(qaiAR){
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

      if ( pictobox.checked ) f_z24( document.getElementById( THEINDEX + "q" ), 100, false);
      else f_z24( document.getElementById( THEINDEX + "i" ), 100, false);
      f_j173( qaiAR, THEINDEX++ );
      if ( ISEXTANT ) { f_n175(); f_y151("qi"); } // Bump THEINDEX before rebinding Media
      f_t174();
   }
   return(qaiAR);
}
function f_y172(categ,nname,ndesc,tlang,qandatxt){
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

   f_m170( tlang );

   if ( !qandatxt ) f_r155("cs","","","","");  // Manually Writing or will Upload

   document.getElementById( "editExitante" ).onclick = function(e){ ISEXTANT = false; f_g86(); f_i87(); }

   if ( imaginer ) document.getElementById( "editHauptImg" ).onclick = function(e){ f_y151("ni"); }
   f_r160(nname,ndesc,"name",function(){ 
      document.getElementById( "editNnameTxt" ).onkeydown = function(e){ f_g32(this);
         if ( this.value.match( TRANSLAT.nndef ) ) this.value = "";
      }
   });

   f_r160(nname,ndesc,"desc",function(){
      document.getElementById( "editNdescTxt" ).onkeydown = function(e){ f_g32(this);
         if ( this.value.match( TRANSLAT.nddef ) ) this.value = "";
         document.getElementById( "editNdescLen" ).innerHTML = NDESCREG[3] - this.value.length + 1;
      }
   });

   f_o169(nname,"sperq",[10,15,30,60,120],defqtime,function(){ });

   f_o169(nname,"katse",SERVINFO[0].katse,categ,function(){ });

   if ( ISEXTANT ) {
      f_q161(nname,f_w162);
      f_f163(nname,f_e164);
      f_j167(nname,f_l168);
      f_n175();
      f_y151("qi");
       
      deletion = document.getElementById( "editDeletion" );
      deletion.onclick = function(e){ 
         notindx  = NINFDATA[0].nidno;
         f_y48( TRANSLAT.nodel, TRANSLAT.delek, TRANSLAT.deldn,
            function() { },
            function() {
               f_o43("nodel");
               f_65("usrindex.php","tun=nodel&was=" + notindx ).then(
                  function( response ){ NINFDATA = {};
                     f_70( function(){ f_g86(); f_i87(); } );
                     f_k69( USERINFO[0].ulang, 0 );
                     f_k44("nodel");
                  },
                  function( error ) { f_n47( error ); }
               );
            }
         );
      }
       
   }
   f_b165(nname,f_b166);



   f_j173( qainhalt, 0 );
   f_t174();
   return(qainhalt);
}
function f_j173( qainhalt, highlite ){
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
      f_l41( this, "radTang" );
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
      f_y48( TRANSLAT.qudel, TRANSLAT.delek, TRANSLAT.deldn,
         function() { },
         function() { var myparent = cette.parentNode.parentNode.parentNode; 
            f_z24(myparent,1000,true); qainhalt[myparent.id].q = qainhalt[myparent.id].a = "";
         }
      );
   }

   caras = document.getElementsByClassName( "notionary-cardface" );
   for ( i = 0; i < caras.length; i++ )
      caras[i].onclick = function( e ){
         f_v26(this,"rotateY(180deg)");
         f_v26(this.parentNode.firstChild.nextSibling,"rotateY(0deg)");
      }

   backs = document.getElementsByClassName( "notionary-cardback" );
   for ( i = 0; i < backs.length; i++ )
      backs[i].onclick = function( e ){
         f_v26(this,"rotateY(180deg)");
         f_v26(this.parentNode.firstChild,"rotateY(0deg)");
      }

   // Prevent the flipping of cards by actioning card icons
   for ( i = 0; i < textares.length; i++ ) textares[i].onclick = function(e){ e.stopPropagation(); }
   for ( i = 0; i < tripdots.length; i++ ) tripdots[i].onclick = function(e){ e.stopPropagation(); }
}
function f_t174(){
   var xoipopup = document.getElementById( "editChoosing" ),
       tripdots = document.getElementsByClassName( "fa-ellipsis-h" );

   f_o43("mudoc");
   f_n64("?tun=mudoc&was=choiceAnswers").then(
      function(response){ xoipopup.innerHTML =  response; f_z24(xoipopup,100,true); },
      function( error ) { f_n47( error ); }
   ).then(function(){
      for ( i = 0; i < tripdots.length; i++ ) {
         tripdots[i].onmouseover = function( e ){
            if ( !CHOIXHOV ) CHOIXHOV = setTimeout(function(){ CHOIXHOV = null; f_l23( xoipopup,200,"block"); },1000);
         }
         tripdots[i].onmouseout = function( e ){
            if ( CHOIXHOV ){ clearTimeout( CHOIXHOV ); CHOIXHOV = null; } else f_z24( xoipopup,200,true);
         }
         tripdots[i].onclick = function( e ){ e.stopPropagation();  this.parentNode.firstChild.value = TRANSLAT.xosen; }
      }
   }).then(function(){ f_k44("mudoc"); });
}
function f_n175(){
   var r, opiid, speaker;
   for ( r = 0; r < THEINDEX; r++ ) {
      speaker = document.getElementById( r + "s" );
      speaker.onmouseover = function( e ){
         opiid = this.parentNode.parentNode.parentNode.id;
         if ( !SOUNDHOV ) SOUNDHOV = setTimeout(function(){ SOUNDHOV = null;
         if ( NINFDATA[1].qaimg[opiid].s ) f_a18( NINFDATA[1].qaimg[ opiid ].s + "&r=" + Math.random() * 100 ); },1000);
      }
      speaker.onmouseout = function( e ){ if ( SOUNDHOV ){ clearTimeout( SOUNDHOV ); SOUNDHOV = null; } }
      speaker.onclick = function( e ){
         e.stopPropagation();
         opiid = this.parentNode.parentNode.parentNode.id;
         f_x50("soundHoch", f_p146("qs") +
            "<span id='recordedIndex' monindex='" + opiid + "'></span>" +
            "<div id='qsphp' class='notionary-phpUpload'></div>",
            function(){
               f_z24( document.getElementById( "soundHochZentralUser" ), 10, true );
               f_g147("qs",NINFDATA[0].nname,NINFDATA[1].qaimg[opiid].q,NINFDATA[1].qaimg[opiid].s);
               f_r155("qs",NINFDATA[0].nname,NINFDATA[1].qaimg[opiid].q,opiid,"");
            },
            function(){ f_g86(); f_i87(); });
      }
      speaker.style.visibility = "visible";
   }
}
function f_h176(ncold,spold,npold,nnold,ndold,newAR,oldAR,tlold){
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
function f_j177(oldnn,newAR,oldAR,testtype){
   var edisendo, catsele, spqsele, catnumb, notname, notdesc;
   edisendo = document.getElementById( "editSubmiter" );
   edisendo.onclick = function(e){ 
      notname  = document.getElementById( "editNnameTxt" );
      notdesc  = document.getElementById( "editNdescTxt" );
      catsele  = document.getElementById( "editKatseSel" );   catnumb  = f_i103 ( catsele.value );
      spqsele  = document.getElementById( "editSperqSel" );

      f_t178( notname.value, catnumb, spqsele.value, notdesc.value, newAR, oldAR, BROWSLAN, testtype); 
   }
}
function f_t178(nncur,nccur,spcur,ndcur,newAR,oldAR,slang,testtype){
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
   if ( !nncur.sizeok( NNAMEREG[2], NNAMEREG[3] ) ){ f_l41(edit_NN,"radRojo"); f_n47( TRANSLAT.nname + " " + TRANSLAT.badsz ); return; }
   if ( !nncur.issane( NNAMEREG[0] ) ){ f_l41(edit_NN,"radRojo"); f_n47( TRANSLAT.nname + " " + TRANSLAT.notre ); return; }

   // Notion Description
   if ( ndcur.match( TRANSLAT.nddef ) ) { ndcur=""; edit_ND.value = ""; }
   if ( !ndcur.sizeok( NDESCREG[2], NDESCREG[3] ) ){ f_l41(edit_ND,"radRojo"); f_n47( TRANSLAT.ndesc + " " + TRANSLAT.badsz ); return; }
   if ( !ndcur.issane( NDESCREG[0]) ){ f_l41(edit_ND,"radRojo"); f_n47( TRANSLAT.ndesc + " : " + TRANSLAT.notre); return; }

   for ( i in newAR ){

      if ( typeof( newAR[i].q ) == 'undefined' ) newAR[i].q = ""; else newAR[i].q = newAR[i].q.trim();
      if ( typeof( newAR[i].a ) == 'undefined' ) newAR[i].a = ""; else newAR[i].a = newAR[i].a.trim();

      if ( ( newAR[i].q == "" ) && ( newAR[i].a == "" ) ) continue;
      else { if ( ( newAR[i].q != "" ) && ( newAR[i].a != "" ) ) sizeOfNewAR++;
         if ( !newAR[i].q.sizeok( 1, QANDAREG[3] ) ) {
            problemq = document.getElementById( i + "q" );
            f_n47(TRANSLAT.badsz); f_l41( problemq,"radRojo");
            problemq.parentNode.nextSibling.onclick(); return;        // in case it is flipped
         }
         if ( !newAR[i].a.sizeok( 1, QANDAREG[3] ) ) {
            problema = document.getElementById( i + "a" );
            f_n47(TRANSLAT.badsz); f_l41( problema,"radRojo");
            problema.parentNode.previousSibling.onclick(); return;    // in case it is flipped
         }
         if ( newAR[i].q ) { // check extant question sanity
            if ( !newAR[i].q.issane( QANDAREG[0] ) ) {
               problemq = document.getElementById( i + "q" );
               f_n47(TRANSLAT.notre); f_l41( problemq,"radRojo");
               problemq.parentNode.nextSibling.onclick(); return;     // in case it is flipped
            }
         }
         if ( newAR[i].a ) { // check extant answer sanity
            if ( !newAR[i].a.issane( QANDAREG[0] ) ) {
               problema = document.getElementById( i + "a" );
               f_n47(TRANSLAT.notre); f_l41( problema,"radRojo");
               problema.parentNode.previousSibling.onclick(); return; // in case it is flipped
            }
            // Extra check for answers to enforce a minimum number of Chosen Choices
            if ( newAR[i].a.toString().indexOf( CHOIXSEP ) > 0 ) {
               allAnswers = newAR[i].a.toString().split( CHOIXSEP );
               if ( allAnswers.length < CHOIXMIN || // We must have Five non-empty choices
                  !allAnswers[0].length || !allAnswers[1].length || !allAnswers[2].length ||
                  !allAnswers[3].length || !allAnswers[4].length ){
                     problema = document.getElementById( i + "a" );
                     f_n47(TRANSLAT.enuff); f_l41( problema,"radRojo");
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
                  f_n47(TRANSLAT.wiedr); f_l41( problema,"radRojo");
                  //f_l41( document.getElementById(j+"a"),"radRojo");
                  problema.parentNode.previousSibling.onclick(); return;
               }
            }
         }
      }
   }
   // Check if the Notion is too small
   if ( sizeOfNewAR < CARDSMIN ) { f_n47( TRANSLAT.small ); return; }
   if ( testtype == "schaf" ) nidno="";  // legacy code pre-superArrays
   if ( testtype == "ander" ) { // amending requires actual notion changes before amending
      if ( !f_h176( NINFDATA[0].catno, NINFDATA[0].sperq, NINFDATA[0].picto,
                             NINFDATA[0].nname, NINFDATA[0].ndesc,
                             newAR, oldAR, NINFDATA[0].tlang ) ) { f_g86(); f_i87(); return; }
      else nidno = NINFDATA[0].nidno;
   }
   f_o43(testtype);
   f_65("usrindex.php","tun=" + testtype + "&was=" + JSON.stringify({
         "nidno":nidno, "nncur":nncur.escapo(), "spcur":spcur,
         "nccur":nccur, "ndcur":ndcur.escapo(),
         "newAR":newAR, "oldAR":oldAR,
         "slang":slang, "tlang":tlang, "picto":picto })).then(
      function( response ){ NINFDATA = {};
         f_70( function(){ f_g86(); f_i87(); } );
         f_k69( USERINFO[0].ulang, 0 );
      },
      function( error ) { f_n47( error ); }
   ).then( function(){ f_k44(testtype); } );
}
function f_a179(){
   var i, j, k, psize="";
   if ( USERINFO[3] ) {
      for ( i = 0; i < USERINFO[3].probs.length; i++ ) // one object per tested notion
         for ( j in USERINFO[3].probs[i] ) // just the notion name -> serves as index
            for ( k = 0; k < USERINFO[3].probs[i][j].length; k++ ) // one per problem question
               if ( USERINFO[3].probs[i][j][k].prb != "" ) psize++;
   } return( psize );
}
function f_y180(){
   THEINDEX = TIMEOUTS = 0; QUESTIME = 30; KORREKTE = 0;
   var i = 0, w, x, y, z;
   if ( !USERINFO[3].probs.length ) { f_g86(); return; }
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

   f_m121( "probs", function(){
      f_z24( document.getElementById( "examWritings" ) );
      document.getElementById( "examExitante" ).onclick = function(e){ f_g86(); f_i87(); }
      f_y182();
   });
}
function f_x181(rottgrun){
   var gutPercent = ( 100 * KORREKTE ) / ( PENANCES * PROBZAHL ),
       gutbarein = document.getElementById( "examGutBarIn" ),
       gutcount  = document.getElementById( "examGutCount" );

   gutbarein.style.setProperty("width",gutPercent + "%");
   if ( gutPercent > 15 ) gutcount.innerHTML = KORREKTE + "&nbsp;/&nbsp;" + ( PENANCES * PROBZAHL );
}
function f_y182(){
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
   xoices = f_q129(
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
   if ( PROBLEMS[ THEINDEX ].pik ) f_z24(xamqtext,10,true); else f_l23(xamqtext,10);

   // Play the sound of a soundtion when available
   if ( PROBLEMS[THEINDEX].pik && PROBLEMS[THEINDEX].snd ) f_a18( PROBLEMS[THEINDEX].snd );
   xamxoice.innerHTML = buttonsMarkup;
   xoibtns = document.getElementsByClassName( "notionary-examwahl" );
   for ( i = 0; i < xoibtns.length; i++ ) xoibtns[i].onclick = function(e){
      if ( this.innerHTML == PROBLEMS[ THEINDEX ].sol ){ // Right Answer
         PROBLEMS[ THEINDEX ].weg--;
         KORREKTE++;
         f_x181("Grun");
         if ( PROBLEMS[ THEINDEX ].weg == 0 ) {          // Hurdles passed, excise index and handle next (no need to bump)
            f_65("usrindex.php","tun=prdel&was=" + JSON.stringify(
               { "prfid": PROBLEMS[ THEINDEX ].pid,
                 "pblem": PROBLEMS[ THEINDEX ].prb
               })
            );
            USERINFO[3].probs[ PROBLEMS[THEINDEX].eye ][ PROBLEMS[THEINDEX].nam ].splice( PROBLEMS[THEINDEX].kay, 1 ); // excise from USERINFO
            PROBLEMS.splice( THEINDEX, 1 ); // excise from PROBLEMS
         }
      } else {
         PROBLEMS[ THEINDEX ].weg++; f_x181("Rojo");
         if ( PROBLEMS[ THEINDEX ].snd )  f_a18( PROBLEMS[ THEINDEX ].snd );
      }
      clearInterval( ENERGIZE );
      THEINDEX = ( THEINDEX + 1 ).mod( PROBLEMS.length );
      if ( PROBLEMS.length > 0 )  f_y182(); else { f_g86(); f_i87(); }
   }

   xamqtext.innerHTML = PROBLEMS[ THEINDEX ].prb;
   if ( PROBLEMS[ THEINDEX ].pik && PROBLEMS[ THEINDEX ].img ) {
      imsrc = HARDCODE.image + PROBLEMS[ THEINDEX ].img;
      xampicto.innerHTML = "<img id='examImagenes' src='" + imsrc + "'>";
      f_l23(xampicto);
   } else f_z24(xampicto,10,true);
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
                 if ( DECILEFT <= 10 ) { TIMEOUTS++; THEINDEX++; f_y182(); }
                 if ( lifepcnt <= 50 ) {  deciseks.style.setProperty("background", "#E78F08" );
                    if ( lifepcnt <= 20 ) deciseks.style.setProperty("background", "#FF0000" );
                 } else                   deciseks.style.setProperty("background", "#2B7930" );
              },10);
   } else nentr();

}
/* Dummy place holder */
function f_v183(){
   var ONCEMORE = 60000,
       menuicon = document.getElementById( "rootMenuclik" ),
       menulist = document.getElementById( "rootMenulist" ),
       realarea = document.getElementById( "anonRealarea" ),
       useredit = document.getElementById( "rootUseredit" ),
       recorder = document.getElementById( "rootRecorder" ),
       activity = document.getElementById( "userActivity" );

   menuicon.onclick = function( e ) {
      if ( menulist.style.display == "block" )
         f_z24(menulist,10,true);
      else f_l23(menulist,100);
   }

   f_c195(function(){ 
      document.getElementById( "rootMenuclik" ).onclick();

      var realarea, pctProg, bumpBtn, counter = 0;
      realarea    = document.getElementById( "anonRealarea" );
      realarea.innerHTML = "<span    id='snapPercentProgress'></span>" +
                            "<button id='snapPercentBumper'><span class='fa fa-plus'></span>Bump</button>";
      pctProg     = document.getElementById( "snapPercentProgress" );
      bumpBtn     = document.getElementById( "snapPercentBumper" );
      bumpBtn.onclick = function(e){
         counter ++;
         snapPercent(pctProg,counter/10,"#aac627");
      }

      f_o43( "btest" );
      f_n64("admindex.php/?tun=btest").then(
         function( response ){
            udata = JSON.parse( response );
            realarea.innerHTML = JSON.stringify( udata );
         }, function( error ) { f_n47( error ); }
      ).then( function(){ f_k44( "btest" ); } );


   });
   f_w196( realarea );
   f_r197();
   f_c203();

   useredit.onclick = function(e) {                                                  // User Editing Facility
      var usermenu, usuarios, revsrats = "", dd, daysaway;
      f_o43("udata");
      document.getElementById( "rootMenuclik" ).onclick();
      f_n64("admindex.php/?tun=udata").then(
         function(response) {
            usuarios = JSON.parse( response );
            realarea.innerHTML = f_l184( usuarios )
            f_s185( usuarios );
            f_m186( usuarios );
            usermenu = document.getElementById( "admnSelector" );
            usermenu.onchange = function(){
               
               if ( usuarios[ this.value ].rg ) revsrats += "<span class='fa fa-star'></span>";
               if ( usuarios[ this.value ].rw ) revsrats += "<span class='fa fa-comment'></span>";
               dd = usuarios[ this.value ].la.split(/[- :]/);
               daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );

               document.getElementById( "admnTheimage" ).setAttribute( "src", HARDCODE.image + usuarios[ this.value ].av );
               document.getElementById( "admnTheuidno" ).innerHTML = usuarios[ this.value ].id + revsrats;
               document.getElementById( "admnTheuname" ).innerHTML = usuarios[ this.value ].un;
               document.getElementById( "admnThekname" ).innerHTML = usuarios[ this.value ].kn;
               document.getElementById( "admnThefname" ).innerHTML = usuarios[ this.value ].fn;
               document.getElementById( "admnTheemail" ).innerHTML = ( usuarios[ this.value ].em || "" );
               document.getElementById( "admnLogexano" ).innerHTML = "<span>Logg: "   + usuarios[ this.value ].sl + "</span>" +
                                                                     "<span>  Exam: " + usuarios[ this.value ].tt + "</span>" +
                                                                     "<span>  Owns: " + usuarios[ this.value ].na + "</span>";
               document.getElementById( "admnAusencia" ).innerHTML = "Absent: <span style='color:red'>" + daysaway + "</span>";
            }
         }, function( error ) { f_n47( error ); }
      ).then( function(){ f_k44("udata"); } );
   }

   recorder.onclick = f_p106;                                         // Allow Sound contributions

   ACTIVITY = setInterval( function(){                                                  // Keep track of live activity on the site
              f_n64("admindex.php/?tun=weran").then(
                 function( response ) { activity.innerHTML = response; },
                 function(  error  )  { f_n47( error ); }
              );
           }, ONCEMORE );

   f_t188();         f_k191();
   f_y190();         f_y202();
   f_z192(); f_t193();
}
function f_l184(userData){
   var i, revsrats = "", dd, daysaway, mu, userimag;

   if ( userData[0].rg ) revsrats += "<span class='fa fa-star'></span>";
   if ( userData[0].rw ) revsrats += "<span class='fa fa-comment'></span>";
   dd = userData[0].la.split(/[- :]/);
   daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );

   mu = "<div id='admnUcontrol'>" +
           "<select id='admnSelector'>";
               for ( i = 0; i < userData.length; i++ )
                  mu += "<option value='" + i + "'>" + userData[i].id + "</option>";
   mu +=   "</select>" +
           "<div class='notionary-userdata'>" +
              "<img id='admnTheimage' src='" + HARDCODE.image + userData[0].av + "' class='notionary-passbild'/>" +
              "<div id='admnTheuidno' class='notionary-usruidno'>" + userData[0].id + revsrats + "</div>" +
              "<div id='admnTheuname'>" + userData[0].un + "</div>" +
              "<div id='admnThekname'>" + userData[0].kn + "</div>" +
              "<div id='admnThefname'>" + userData[0].fn + "</div>" +
              "<div id='admnTheemail'>" + ( userData[0].em || "" ) + "</div>" +
              "<div id='admnLogexano'>" +
                  "<span>Logg: "   + userData[0].sl + "</span>" +
                  "<span>  Exam: " + userData[0].tt + "</span>" +
                  "<span>  Owns: " + userData[0].na + "</span>" +
              "</div>" +
              "<div id='admnAusencia'> Absent: <span style='color:red'>" + daysaway + "</span></div>" +
           "</div>" +
           "<div id='admnUserbtns'>" +
              "<button id='admnRenumber'><span class='fa fa-list-ol'></span>Renumber</button>" +
              "<button id='admnRelegate'><span class='fa fa-exchange'></span>Relegate</button>" +
              "<button id='admnDeletion'><span class='fa fa-trash'></span>Delete</button>" +
              "<div    id='admnDumyarea'></div>" +
           "</div>" +
        "</div>" +
        "<div id='admnUgallery'>";
   for ( i = 0; i < userData.length; i++ ) { dd = revsrats = "";
      userimag = HARDCODE.image + ( userData[i].av ? userData[i].av : "101" ) ;
      if ( userData[i].la ) dd = userData[i].la.split(/[- :]/);
      daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );
      if ( userData[i].rg ) revsrats += "<span class='fa fa-star'></span>";
      if ( userData[i].rw ) revsrats += "<span class='fa fa-comment'></span>";
      mu += "<div id='user_" + i + "' class='notionary-userdata'>" +
               "<img src='" + userimag + "' class='notionary-passbild'/>" +
               "<div class='notionary-usruidno'>" + userData[i].id + revsrats + "</div>" +
               "<div>" + ( userData[i].un || "" ) + "</div>" +
               "<div>" + ( userData[i].kn || "" ) + "</div>" +
               "<div>" + ( userData[i].fn || "" ) + "</div>" +
               "<div>" + ( userData[i].em || "" ) + "</div>" +
               "<div>" +
                  "<span>Logg: "   + userData[i].sl + "</span>" +
                  "<span>  Exam: " + userData[i].tt + "</span>" +
                  "<span>  Owns: " + userData[i].na + "</span>" +
               "</div>" +
               "<div> Absent: <span style='color:red'>" + daysaway + "</span></div>" +
            "</div>";
   }
   mu += "</div>";
   return( mu );
}
function f_s185(userData){
   var i, htmlarea, mainbutn, usermenu, usadores, renorrel, whattodo,
       leobject, renumber, relegate, sendtodb, nn_input, nn_stage;
   mainbutn = document.getElementById( "rootUseredit" );    usadores = document.getElementsByClassName("notionary-userdata");
   htmlarea = document.getElementById( "admnDumyarea" );    usermenu = document.getElementById( "admnSelector" );
   renumber = document.getElementById( "admnRenumber" );    relegate = document.getElementById( "admnRelegate" );
   
   renumber.onclick = relegate.onclick = function(){ leobject = this;
      switch ( this ) {
         case renumber : renorrel = "ID Reassignment"; whattodo = "newid"; json1 = "oldid";  json2 = "newid"; break
         case relegate : renorrel = "Data Relegation"; whattodo = "urele"; json1 = "donor";  json2 = "towho"; break
      }
      htmlarea.innerHTML = f_a56("nn","",true,"") +
            "<button id='userToolSubmit'>" +
               "<span class='fa fa-paper-plane'></span>" + TRANSLAT.savit +
            "</button>";
            nn_input  = document.getElementById( "nninp" ); nn_input.onfocus = f_c27;
            nn_stage  = document.getElementById( "nnstg" );
            sendtodb  = document.getElementById( "userToolSubmit" );
            nn_input.onkeyup = function(e){ var k = ( e.keyCode ? e.keyCode : e.which );
               if ( k == "13" || k == "9" ) { 
                  if ( this.value.issane( DIGITREG[0] ) ) { // only numeric input
                     nn_stage.style.width = nn_stage.style.height = "34px";
                     f_l41(nn_input,"radGrun");
                     f_l31(this);
                     f_l23( sendtodb,1000 );
                  }
               }
            }
            sendtodb.onclick = function(){ f_o43( whattodo );
               switch ( leobject ) {
                  case renumber : jason = JSON.stringify({"oldid" : userData[ usermenu.value ].id, "newid" : nn_input.value}); break
                  case relegate : jason = JSON.stringify({"donor" : userData[ usermenu.value ].id, "towho" : nn_input.value}); break
               }
               f_65("admindex.php","tun=" + whattodo + "&was=" + jason ).then(
                  function( response ){ 
                     if ( response ) f_n47( response );
                     else f_l46( renorrel + " OK!");
                     mainbutn.click(); f_k44( whattodo ); mainbutn.click();
                  }, function( error ) { f_n47( error ); }
               );
            }
            f_z24( sendtodb, 1000, true );
   }

   for ( i = 0; i < usadores.length; i++ )
      usadores[i].onclick = function( e ){ usermenu.value = this.id.substr( 5, this.id.length ); usermenu.onchange(); }

}
function f_m186(userData){
   var erase, mainbutn, usermenu, userdet;
   erase    = document.getElementById( "admnDeletion" );
   mainbutn  = document.getElementById( "rootUseredit" );
   usermenu  = document.getElementById( "admnSelector" );
   erase.onclick = function(){
      userdet  = document.getElementById( "user_" + usermenu.value );
      f_y48(userdet.innerHTML, TRANSLAT.delek, TRANSLAT.deldn,
         function(){},
         function(){
            f_n64("admindex.php/?tun=udele&was=" + userData[ usermenu.value ].id).then(
               function( response ){
                  if ( response ) { f_l46("Deletion succeeded!");
                     mainbutn.click();
                     mainbutn.click();
                  } else f_n47("Something went wrong");
               },
               function( error ) { f_n47( error ); }
            );
         }
      );
   }
}
function f_h187(XINFO,categ){
   var i, j, n = 0, retAR = new Array(), filter, filtro;
   filter = document.getElementById( "adminNotionFilter" );
   filtro = filter.value;
   for ( i = 0; i < XINFO[0].kitns.length; i++ ) // find where in obj this cat is
      if ( XINFO[0].kitns[i].hasOwnProperty(categ) ) index = i;
   for ( j = 0; j < XINFO[0].kitns[index][categ].length; j++ ) // walk thru contents of cat
      for ( y in XINFO[0].kitns[index][categ][j]) {         // y= nname, ndesc, ,...
         if ( filtro ) {
            if ( y == "nname" && XINFO[0].kitns[index][categ][j][y].toLowerCase().indexOf( filtro.toLowerCase() ) >= 0 )
               retAR[n++] = XINFO[0].kitns[index][categ][j][y];
         } else if ( y == "nname" ) retAR[n++]=XINFO[0].kitns[index][categ][j][y];
      }
   return( retAR );
}
function f_t188(){
   var SRCARRAY = TGTARRAY = new Array(), viewerNode, mediaCloner, k, s, t,
       sourceSel, scats, snots, sourceImg,
       targetSel, tcats, tnots, targetImg,
       qqShow, qaShow, aqShow, aaShow,
       controler, tastatuer, atellier;
   mediaCloner = document.getElementById( "rootMedclone" );
   viewerNode  = document.getElementById( "anonRealarea" );
   mediaCloner.onclick = function(){
      document.getElementById( "rootMenuclik" ).onclick();
      viewerNode.innerHTML =
         "<div id='adminCloneHeader'>" +
            "<div    id='adminCloneFeedback' class='notionary-feedback'></div>" +
            "<input  id='adminNotionFilter'/>" +
            "<div id='adminCloneSourceContainer'>" + f_z63("cloneSource",SERVINFO[0].langs,"en") +
               "<div id='sourceCategories'></div><select id='adminCloneSource'></select>" +
            "</div>" +
            "<div id='adminCloneTargetContainer'>" + f_z63("cloneTarget",SERVINFO[0].langs,"en") +
               "<div id='targetCategories'></div><select id='adminCloneTarget'></select>" +
            "</div>" +
         "</div>" +
         "<div id='adminCloneControls'></div>" +
         "<div id='adminCloneForeignKeyboard'></div>" +
         "<div id='adminCloneWorkArea'></div>";
      feedbaker = document.getElementById( "adminCloneFeedback" );
      filtrator = document.getElementById( "adminNotionFilter" );
      sourceSel = document.getElementById( "cloneSourceLanguageSelect" );
      sourceImg = document.getElementById( "cloneSourceLanguageImage" );
      sourceKts = document.getElementById( "sourceCategories" );
      sourceNts = document.getElementById( "adminCloneSource" );
      targetSel = document.getElementById( "cloneTargetLanguageSelect" );
      targetImg = document.getElementById( "cloneTargetLanguageImage" );
      targetKts = document.getElementById( "targetCategories" );
      targetNts = document.getElementById( "adminCloneTarget" );
      controler = document.getElementById( "adminCloneControls" );
      tastatuer = document.getElementById( "adminCloneForeignKeyboard" );
      atellier  = document.getElementById( "adminCloneWorkArea" );
      sourceSel.onchange = function(){ f_o43("sinfosrc");
         if ( f_i62( this.value ) )
            sourceImg.setAttribute("src", HARDCODE.image + f_i62( this.value ) );
         f_n64("?tun=sinfo&was=" + this.value ).then(
            function(response) { SRCARRAY = JSON.parse( response ); },
            function(error) { f_n47( error ); }
         ).then( function(){ scats = "";
            for ( k in SRCARRAY[0].katse ) scats += "<option value=" + SRCARRAY[0].katse[k] + ">" + katxy( SRCARRAY[0].katse[k] ) + "</option>";
            sourceKts.innerHTML = "<div><select id='cloneSourceCategory'>" + scats + "</select></div>";
            sourceCat = document.getElementById( "cloneSourceCategory" );
            sourceCat.onchange = function(){ sourceNts.innerHTML = "";
               snots = f_h187( SRCARRAY, this.value );  // Filter is used by this function
               for( s in snots ) sourceNts.innerHTML += "<option value='" + snots[s] + "'>" + snots[s] + "</option>";
            }; sourceCat.onchange(); f_k44("sinfosrc");
         });
      }; sourceSel.onchange();
      targetSel.onchange = function(){ f_o43("sinfotgt");
         if ( f_i62( this.value ) )
            targetImg.setAttribute("src", HARDCODE.image + f_i62( this.value ) );
         f_n64("?tun=sinfo&was=" + this.value ).then(
            function(response) { TGTARRAY = JSON.parse( response ); },
            function(error) { f_n47( error ); }
         ).then( function(){ tcats = "";
            for( k in TGTARRAY[0].katse ) tcats += "<option value=" + TGTARRAY[0].katse[k] + ">" + katxy( TGTARRAY[0].katse[k] ) + "</option>";
            targetKts.innerHTML = "<div><select id='cloneTargetCategory'>" + tcats + "</select></div>";
            targetCat = document.getElementById( "cloneTargetCategory" );  // Filter is used by this function
            targetCat.onchange = function(){ targetNts.innerHTML = "";
               tnots = f_h187( TGTARRAY, this.value );
               for ( t in tnots ) targetNts.innerHTML += "<option value='" + tnots[t] + "'>" + tnots[t] + "</option>";
            }; targetCat.onchange(); f_k44("sinfotgt");
         });
      }; targetSel.onchange();
      filtrator.onchange = function(e) { sourceCat.onchange(); targetCat.onchange(); }
      sourceNts.onchange = targetNts.onchange = function(){
         atellier.innerHTML = "";
         var i, media, simgs = 0, ssnds = 0,
             qqiso = 0, qaiso = 0, aqiso = 0, aaiso = 0,
             sname, sdata, ssize, socol, sq = new Array(), sa = new Array(),
             tname, tdata, tsize, tacol, tq = new Array(), ta = new Array(),
             clinputs, medklon, tracking;
             sname = sourceNts.value; tname = targetNts.value;
            f_o43("ninfoclone");
            f_n64("?tun=ninfo&was=" + sname).then( function(response) { sdata = JSON.parse( response );
               f_n64("?tun=ninfo&was=" + tname).then( function(response) { tdata = JSON.parse( response );
                     ssize = sdata[1].qaimg.length; tsize = tdata[1].qaimg.length;
                  if ( ssize != tsize )
                     f_x39(feedbaker,"<markee> Incongruent Notions </markee>","radRojo");
                  else { // prepare Control Area Markup based on menu selections
                     f_x39(feedbaker,"<markee> Notion sizes match! </markee>","radGrun");
                     for ( i = 0; i < ssize; i++ ) { // count available media + sort Q&A for comparing
                        if ( sdata[1].qaimg[i].i ) simgs++; // Source Image count
                        if ( sdata[1].qaimg[i].s ) ssnds++; // Source Sound count
                        sq[i] = sdata[1].qaimg[i].q; sa[i] = sdata[1].qaimg[i].a; // Source q + a
                        tq[i] = tdata[1].qaimg[i].q; ta[i] = tdata[1].qaimg[i].a; // Target q + a
                     }
                     sq.sort(); sa.sort(); tq.sort(); ta.sort(); // sort Q & A and compare
                     for ( i = 0; i < ssize; i++ ) { // determine match prospects
                        if ( sq[i] == tq[i] ) qqiso++; if ( sq[i] == ta[i] ) qaiso++;
                        if ( sa[i] == tq[i] ) aqiso++; if ( sa[i] == ta[i] ) aaiso++;
                     }
                  }
                  controler.innerHTML = f_h189(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize);
                  qqShow  = document.getElementById( "qqsho" ); qaShow  = document.getElementById( "qasho" );
                  aqShow  = document.getElementById( "aqsho" ); aaShow  = document.getElementById( "aasho" );
                  qqShow.onclick = qaShow.onclick = aqShow.onclick = aaShow.onclick = function(){
                     var isize = 50, istyl = "", soraw, taraw, soval, taval,
                         sqora = this.id.substr(0,1), tqora = this.id.substr(1,1),
                         dm = "<div id='adminCloneFBContainer'></div>" +
                              "<div id='adminCloneFBTracker' class='notionary-tracking'>s0</div>" +
                              "<h4>"+ decodeURIComponent( sourceNts.value ) + " [ " +sqora + " ] ⇐⇒ " +
                                      decodeURIComponent( targetNts.value ) + " [ " +tqora + " ]</h4>";
                     sourceNts.onchange(); targetNts.onchange();
                     sqora == "q" ? soraw = sq : soraw = sa ; tqora == "q" ? taraw = tq : taraw = ta ;
                     for ( i = 0 ; i < ssize; i++ ) { // get this stuff sorted
                        soval = soraw[i]; taval = taraw[i];
                        if ( soval != taval ) istyl = " style=\'color:red;\' ";
                        else istyl = "";  // Show different ones as red
                        dm += "<div>" + 
                           "<input id='s" + i + "' class='notionary-cloninput' " + " size='" + isize + "' " + istyl + ' value="' + soval + '">' +
                           "<input id='t" + i + "' class='notionary-cloninput' " + " size='" + isize + "' " + istyl + ' value="' + taval + '">' +
                           "</div>";
                     }
                     atellier.innerHTML = dm;
                     tracking  = document.getElementById( "adminCloneFBTracker" );
                     clinputs = document.getElementsByClassName("notionary-cloninput");
                     for ( i = 0; i < clinputs.length; i++ ) {
                        clinputs[i].onfocus = function(e){ tracking.innerHTML = this.id; }
                        clinputs[i].onkeydown = function(e){
                           var notnx, nname, colux, cname, itemx, olval, k=(e.keyCode ? e.keyCode : e.which);
                           if ( this.id.substr(0,1) == "s" ) { nname = sname; colux = sqora;
                              sqora == "q" ? notnx = sq : notnx = sa;
                           } else { nname = tname; colux = tqora;
                              tqora == "q" ? notnx = tq : notnx = ta;
                           }
                           colux == "q" ? cname = "question" : cname = "answer";
                           itemx = this.id.substr(1,this.id.length - 1);
                           if ( ( k == "13" || k == "9" ) && ( notnx[itemx] != this.value ) ){
                              olval = notnx[itemx]; notnx[itemx] = this.value; // update local copy
                              seter(decodeURIComponent(nname),cname,this.value,cname,olval, function(){ f_k44("seter"); });
                              f_l41( this, "radBlau");
                           }
                        }
                        clinputs[i].onchange = function(e){ f_z19(this,13); }
                     }
                 }
                 medklon = document.getElementsByClassName( "notionary-cloning-tool" );
                 for ( i = 0; i < medklon.length; i++ )
                    medklon[i].onclick = function( e ){
                       this.id.substr(0,1) ==   "q" ? socol = "question" : socol = "answer";
                       this.id.substr(1,1) ==   "q" ? tacol = "question" : tacol = "answer";
                       this.id.substr(2,3) == "img" ? media="imageID"  : media="soundID";
                       f_65("admindex.php","tun=klmed&was=" + JSON.stringify({
                          "sonid":  sdata[0].nidno, "tanid":  tdata[0].nidno,
                          "socol":  socol, "tacol":  tacol,  "media": media
                       })).then(
                          function( response ){
                             if ( response ) f_n47( response );
                             f_k44("klmed");
                          },function( error ) { f_n47( error ); }
                       );
                    }
               }, function(error) { f_n47( error ); });
            }).then(function(){ f_k44("ninfoclone"); }); // outer GET
      } // sourceNts and targetNts
   } // media cloner
}
function f_h189(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize){
   var markup = "";
   markup += " Source : " + simgs + " Images + " + ssnds + " Sounds <br/><br/>";
   markup += "<div><button id='qqsho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.qkopf + " -- " + TRANSLAT.qkopf + " :" + qqiso + "/" + ssize + "&nbsp;&nbsp;";
   if( qqiso == ssize ) {
      if ( simgs )
         markup += "<button id='qqimg' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='qqsnd' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='qasho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.qkopf + " -- " + TRANSLAT.akopf + " :" + qaiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( qaiso == ssize ) {
      if ( simgs )
         markup += "<button id='qaimg' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='qasnd' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='aqsho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.akopf + " -- " + TRANSLAT.qkopf + " :" + aqiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( aqiso == ssize ) {
      if ( simgs )
         markup += "<button id='aqimg' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='aqsnd' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='aasho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.akopf + " -- " + TRANSLAT.akopf + " :" + aaiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( aaiso == ssize ) {
      if ( simgs )
         markup += "<button id='aaimg' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='aasnd' class='notionary-cloning-tool'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   return( markup );
}
function f_y190(){
   var KEEPLIST = 300,
       spurgeBtn, realarea;
   spurgeBtn = document.getElementById( "rootSoundprg" );
   realarea  = document.getElementById( "anonRealarea" );
   spurgeBtn.onclick = function(){
         var i, j, k, l, sndAR, nsnAR, noise;
      document.getElementById( "rootMenuclik" ).onclick();
      f_o43("allss");
      f_n64("admindex.php/?tun=allss").then(
         function(response) { sones = JSON.parse( response );
            sones = JSON.parse( response );
            sndAR = sones[0].sones;
            realarea.innerHTML = "<br/>Total sounds to process:&nbsp;" + sndAR.length+
                                 "<br/>Notions to process:&nbsp;" + sones.length;
            realarea.style.setProperty("font-size","1.5em");
            // handle the notions sounds
            for ( i = 1; i < sones.length; i++ ) // [0] singleton: totals
               for ( k in sones[i] ) {
                  nsnAR = sones[i][k];    // [1] - [N] each of the notions
                  for ( j = 0; j < nsnAR.length; j++ ) // walk thru all sounds protecting the
                     for ( l = KEEPLIST; l < sndAR.length; l++ ) // notion hits from deletion
                        if ( nsnAR[j] == sndAR[l].sndid ) {
                           sndAR.splice(l,1); // by splicing from sndAR
                        }
            }
            realarea.innerHTML += "<br/>There are " + sndAR.length + " sounds left";
            for ( i = KEEPLIST; i < sndAR.length; i++ ) { // generate images to click-delete
               realarea.innerHTML += "<span title='" + sndAR[i].sndid + "' class='fa fa-trash'></span>";
               noise = document.getElementsByClassName( "fa-trash" );
               for ( j = 0; j < noise.length; j++ )
                  noise[j].onclick = function( e ){
                     s2del = this.getAttribute("title");
                     seter("aasound","","DELETE","soundID",s2del, function(){ f_k44("seter"); });
                     f_z24(this,1000,true);
                  }
            }
         },
         function(error) { f_n47( error ); }
      ).then( function(){ f_k44("allss"); } );
   }
}
function f_k191(){
   var ipurgBtn, realarea, deleti;
   ipurgBtn = document.getElementById( "rootImageprg" );
   realarea = document.getElementById( "anonRealarea" );
   ipurgBtn.onclick = function(e){ var KEEPLIST = 300, d, i, j, k, l, imgAR, ntnAR, avaAR, nisAR, mundo;
         document.getElementById( "rootMenuclik" ).onclick();
         f_o43("pimag");
         f_n64("admindex.php/?tun=pimag").then(function( response ){
            imges = JSON.parse( response );
            imgAR = imges[0].imids;  // all images in aaimage table
            ntnAR = imges[0].ntnis;  // all distinct notion images in aanotion table
            avaAR = imges[0].avais;  // all distinct avatar images in aaavatar table
            realarea.innerHTML = "<br/>Total images to process:&nbsp;&nbsp;"  + imgAR.length +
                                 "<br/>Notion images to process:&nbsp;&nbsp;" + ntnAR.length +
                                 "<br/>Avatar images to process:&nbsp;&nbsp;" + avaAR.length +
                                 "<br/>Notions to process:&nbsp;&nbsp;&nbsp;" + imges.length;

            // Find index of the last SACROSANKT, beyond which all mundanes purgeable
            for ( i = 0; i < imgAR.length; i++ ) {
               if ( imgAR[i] > KEEPLIST ) {
                  mundo = i;
                  break;
               }
            }

            // Now start pruning from the large "ALL images" array imgAR as follows
            // Prune any Notion Images as found in aanotion
            for ( i = 0; i < ntnAR.length; i++ ) // discard mundane imgs in notions set
               for ( j = mundo; j < imgAR.length; j++)
                  if ( ntnAR[i] == imgAR[j] ) imgAR.splice(j,1);

            // Prune any Avatar Images as found in aaavatar
            for ( i = 0; i < avaAR.length; i++) // discard mundane images in avatars set
               for ( j = mundo; j < imgAR.length; j++ )
                  if ( avaAR[i] == imgAR[j] ) imgAR.splice(j,1);

            // Prune any Notion Question Images by walking thru each Notion imges[i] <<-- i is notionID BTW
            for ( i = 1; i < imges.length; i++ )
               for ( k in imges[i] ){
                  nisAR = imges[i][k]; // Build an array of images [k] from this Notion
                  for ( j = 0; j < nisAR.length; j++ ) // discard mundane images in Q&A set
                     for ( l = mundo; l < imgAR.length; l++ )
                        if ( nisAR[j] == imgAR[l] ) imgAR.splice(l,1);
               }

            // By now, imgAR[] should solely contain whatever images remain unassigned -- ready to delete
            realarea.innerHTML += "<br/>There are " + imgAR.length + " sacrosankt images left";
            for ( i = mundo + 1; i < imgAR.length; i++ ) // generate images to click-delete
               realarea.innerHTML += "<span class='notionary-deleteable fa fa-trash' title='" + imgAR[i] + "'></span>";
            deleti = document.getElementsByClassName( "notionary-deleteable" );
            for ( d = 0; d < deleti.length; d++ ) deleti[d].onclick = function( e ){ leobject = this;
                  seter("aaimage","","DELETE","imageID",leobject.getAttribute("title"),
                        function(){ f_k44("seter"); f_z24(leobject,1000,true); });
               }
         }, function(error) { f_n47( error ); }
      ).then(function(){ f_k44("pimag"); });
   }
}
function f_z192(){
   var staticBtn, realarea, radio1, radio2, radio3, radio4, mapAddress, mapArea, zoomFactor = 5;
   staticBtn  = document.getElementById( "rootGmapstat" );
   realarea   = document.getElementById( "anonRealarea" );
   staticBtn.onclick = function(){
      realarea.innerHTML = 
         "<div id='adminGoogleMapsTool'>" +
            "<div id='radio'>" +
               "<input type='radio' id='radio1' name='radio'><label for='radio1'>Zoom 4</label>" +
               "<input type='radio' id='radio2' name='radio' checked='checked'><label for='radio2'>Zoom 5</label>" +
               "<input type='radio' id='radio3' name='radio'><label for='radio3'>Zoom 6</label>" +
               "<input type='radio' id='radio4' name='radio'><label for='radio4'>Zoom 7</label>" +
            "</div>" +
            "<div id='adminMapArea'></div>" +
            "<input id='adminMapAddress' class='notionary-edit-qaInput' value='Berlin'>" +
         "</div>";
      mapAddress = document.getElementById( "adminMapAddress" );
      mapArea    = document.getElementById( "adminMapArea" );
      radio1     = document.getElementById( "radio1" );
      radio2     = document.getElementById( "radio2" );
      radio3     = document.getElementById( "radio3" );
      radio4     = document.getElementById( "radio4" );
      radio1.onclick = function(e) { zoomFactor = 4; mapAddress.onchange(); }
      radio2.onclick = function(e) { zoomFactor = 5; mapAddress.onchange(); }
      radio3.onclick = function(e) { zoomFactor = 6; mapAddress.onchange(); }
      radio4.onclick = function(e) { zoomFactor = 7; mapAddress.onchange(); }
      mapAddress.onchange = function(e) { // hardcode non SSL URL
         var address = mapAddress.value,
             gmapurl = "https://maps.googleapis.com/maps/api/staticmap?center=",
             gmaparg = "&zoom=" + zoomFactor + "&format=jpg&size=700x432" +
                       "&maptype=terrain&language=" + USERINFO[0].ulang +
                       "&style=feature:all|" +
                              "element:labels.text|" +
                              "visibility:off" +
                       "&style=feature:road|" +
                              "element:geometry|" +
                              "visibility:off" +
                       "&style=feature:landscape|" +
                              "element:geometry.fill|" +
                              "color:0x627AAC" +    // Notionary standard background color!!!!!
                       "&style=feature:administrative.country|" +
                              "element:geometry.stroke|" +
                              "color:0xFFFFFF|weight:6" +
                       "&style=feature:administrative.province|" +
                              "element:geometry.stroke|" +
                              "color:0x000000|weight:6|visibility:on" +
                       "&style=feature:administrative.country|" +
                              "element:labels.text|" +
                              "color:0xFFFFFF|weight:1|visibility:on" +
                        // Notionary image marker!!!!!
                       "&markers=icon:https://notionary.com?tun=ibyid%26was=102|" + address +
                       "&sensor=false";
         mapArea.innerHTML = "<img src='" + gmapurl + address + gmaparg + "'/>";
      }
   }
}
function f_t193(){
   var GMPASSRC = "https://maps.googleapis.com/maps/api/js",
       GMAPSKEY = "AIzaSyDKPLdr0SOYenVMquLNFUHcmeNtddL38-A", // Loads Google Maps API Assynchronously and with a callback
       GMAPSURI = GMPASSRC + "?key=" + GMAPSKEY + "&sensor=false&callback=f_q194",
       gmapiScript   = document.createElement("script"),
       dynamicBtn;
       gmapiScript.type = "text/javascript";
       gmapiScript.src  = GMAPSURI;
   dynamicBtn = document.getElementById( "rootGmapdyna" );
   dynamicBtn.onclick = function(e) { document.body.appendChild(gmapiScript); }
}
function f_q194(){
   var realarea, geoEncode, geocoder, mapOptions, styles, styledMap, map;
   realarea   = document.getElementById( "anonRealarea" );
   realarea.innerHTML = "<div id='adminGoogleMapsTool'>" +
                           "<div id='adminMapArea'></div>" +
                           "<input id='adminMapAddress' value='Berlin'>" +
                           "<button id='geoEncode'>Encode</button>" +
                        "</div>";
   geoEncode  = document.getElementById( "geoEncode" );
   geoEncode.onclick = function(){
      var address = document.getElementById("adminMapAddress").value;
      geocoder.geocode( { 'address': address}, function(results, status) {
         if (status == google.maps.GeocoderStatus.OK) {
           map.setCenter(results[0].geometry.location);
         } else alert("Geocode ERROR: " + status);
      });
   }
   styles = [{ "elementType":"labels.text",
         "stylers": [{ "visibility":"off" }]},
       { "featureType": "administrative.country",
         "elementType": "geometry.stroke",
         "stylers": [ { "weight": 8 },
                      { "color": "#666666" },
                      { "visibility": "on" }
                     ]},
       { "featureType": "administrative.country",
         "elementType": "labels.text",
         "stylers": [ { "weight": 1 },
                      { "color": "#627AAC" },
                      { "visibility": "on" }
                     ]},
      ];
  styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});
  geocoder = new google.maps.Geocoder();
  mapOptions = { center: new google.maps.LatLng(-34.397, 150.644),
           panControl: true,
           zoomControl: true,
           zoomControlOptions: {
               style: google.maps.ZoomControlStyle.SMALL
             },
           mapTypeControl: true,
           mapTypeControlOptions: {
               style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
             },
           scaleControl: true,
           streetViewControl: true,
           overviewMapControl: true,
           disableDoubleClickZoom: true,
           //disableDefaultUI: true,  This disables the controls
           mapTypeControlOptions: {
              mapTypeIds: [google.maps.MapTypeId.TERRAIN, 'map_style']
              },
           zoom: 6 };
  map=new google.maps.Map( document.getElementById("adminMapArea"), mapOptions);
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
}
function f_c195( cback ){
   var betaButton = document.getElementById( "rootBetatest" );
   betaButton.onclick = cback;
}
function f_w196(target_id){
   dbugbtn = document.getElementById( "rootDebugger" );
   dbugbtn.onclick = function(){
      document.getElementById( "rootMenuclik" ).onclick();
      f_o43("debug");
         f_n64("admindex.php/?tun=debug").then(
            function( response ) {
               target_id.innerHTML = response;
            }, function( error ) { }
         ).then ( function(){ f_k44("debug"); } );
   }
}
function f_r197(){
   var decache = document.getElementById( "rootDecacher" );
   decache.onclick = function(){ f_o43("xcach");
      document.getElementById( "rootMenuclik" ).onclick();
      f_65("admindex.php","tun=xcach").then(
         function(response){ f_k44("xcach"); },
         function( error ) { f_n47(error); }
      );
   }
}
function f_l198(e,cette,Obj){
   var medid, media, instr, dn_input, editor,
       k = ( e.keyCode ? e.keyCode : e.which );
   instr  = document.getElementById( "mediaEditInstruction" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "rootEditbutn" );
   if ( k == "13" || k == "9" ) { // only handle keydown "Enter" or "Tab"
      if ( cette.value.issane( DIGITREG[0] ) ) { // only numeric IDs
         //f_h40(instr,"","black");
         f_n30.apply(cette,[cette,dn_input]);
         medid = parseInt( cette.value );
         media = f_g199(cette.value,Obj);
         if ( media != -1 ) {
            dn_input.value = Obj[media].nom;
            editor.setAttribute("title",medid);
         } else dn_input.value = "";
      } else { f_h40(instr,TRANSLAT.notre,"red");
         f_l41( cette ,"radRojo");
         dn_input.value = "";
      }
   }
}
function f_g199( medid, Obj ){ for ( i = 0; i < Obj.length; i++ ) if ( Obj[i].idx == medid ) return (i); return(-1); }
function f_f200(Obj,gnode,startIdx,gsize,medium){
   var i, grenze, meinpu, dn_input, editor, morep, gmarkup = "", galembas;
   meinpu = document.getElementById( "meinp" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "rootEditbutn" );
   morep  = document.getElementById( "loadMorePages" );
   grenze = parseInt( startIdx + gsize );
   if ( grenze > Obj.length ) grenze = Obj.length;
   if ( startIdx >= Obj.length ) { f_r38(morep,"radBlau",true); return; }
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
         meinpu.value = this.getAttribute("title"); f_z19(meinpu,13);
         dn_input.value = Obj[f_g199(this.getAttribute("title"),Obj)].nom;
         editor.setAttribute("title",this.getAttribute("title"));
      }
   }
}
function f_z201( node, Obj, defsiz, medium){
   var DATASIZE = 500,                        // Unlink from f_f200 before modularizing
       ppage, pages, morep, galembas, htreq;
   node.innerHTML =
      "<div     class='notionary-navigator'>" + TRANSLAT.pages +
         "<span class='notionary-pageindex'> 1 </span>" +
         "<span class='notionary-pageindex'> 2 </span>" +
         "<span class='notionary-pageindex'> 3 </span>" +
         "<span class='notionary-pageindex'> 4 </span>" +
         "<span class='notionary-pageindex'> 5 </span>" +
         "<span id='loadMorePages' class='notionary-clickable-text'>" + TRANSLAT.mload + "</span>" +
         f_e57("pp",["25","50","100"],defsiz,false) +
      "</div>";
   if ( medium == "image" ) htreq = "idata"; else htreq = "sdata";
   ppage  = document.getElementById( "ppsel" );
   pages  = document.getElementsByClassName( "notionary-pageindex" );
   morep  = document.getElementById( "loadMorePages" );
   galembas = document.getElementById( "rootGalerias" );
   ppage.onchange  = function(e) { f_f200(Obj,galembas,0,this.value,medium); }
   morep.onclick   = function(e) { f_o43("morep");
      f_n64("admindex.php/?tun=" + htreq + "&was=" +
         JSON.stringify({"fromi":parseInt(Obj[Obj.length-1].idx),"xmany":DATASIZE})
      ).then(function( response ){
         if ( response ) Obj.push.apply( Obj, JSON.parse( response ) );
      }, function ( error ) { f_n47( error ); }).then(function(){ f_k44("morep"); });
   }
   for ( i = 0; i < pages.length; i++ ) {
      pages[i].onclick = function(e) { var cette = this;
         for ( i = 0; i < pages.length; i++ ) f_l41(pages[i],"radWeis");
         setTimeout(function(){ f_l41(cette,"radBlau"); } ,500);
         f_f200(Obj,galembas, parseInt(ppage.value) * ( parseInt(this.innerHTML ) - 1 ),parseInt(ppage.value),medium);
      }
   }
}
function f_y202(){
   var DATASIZE = 500,
       seditBtn  = document.getElementById( "rootSoundchg" );
   seditBtn.onclick = function(){
      var CODESTR = HARDCODE.grava,
          workarea, sonolist, me_input, dn_input, editsono, galembas, navgator;
      workarea = document.getElementById( "anonRealarea" );
      workarea.innerHTML = f_a56("me","1",true,"") + f_a56("dn","",true,"") +
         "<button id='rootEditbutn'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='rootGalerias'></div>" +
         "<div id='rootNavigate' class='notionary-navigator'></div>";
      document.getElementById( "rootMenuclik" ).onclick();
      f_o43("sdata");
      f_n64("admindex.php/?tun=sdata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) sonolist = JSON.parse( response );
         me_input = document.getElementById( "meinp" );           dn_input = document.getElementById( "dninp" );
         editsono = document.getElementById( "rootEditbutn" );    galembas = document.getElementById( "rootGalerias" );
         navgator = document.getElementById( "rootNavigate" );
         f_f200( sonolist, galembas, 0, 100, "sound");  f_z201( navgator, sonolist, 100, "sound");
         editsono.onclick = function(e){ var snsrc = this.getAttribute("title");
            f_x50("soundEditor",
               f_p146("se") + "<div id='sephp' class='notionary-phpUpload'></div>",
               function(){
                  f_z24( document.getElementById( "soundEditorZentralUser" ), 10, true );
                  f_g147("se",CODESTR,snsrc,snsrc);
                  f_r155("se","",snsrc,"","");
               },
               function(){ f_g86(); f_i87(); }
            );
         }
         me_input.onfocus = f_c27;
         me_input.onkeydown = function(e) { f_l198(e,this,sonolist); }
         dn_input.onchange = function(e) {
            seter("aasound","name",this.value,"soundID",me_input.value,function(){ f_l41(dn_input,"radGrun"); });
         }
      }, function(error) { f_n47( error ); }).then( function(){ f_k44("sdata"); } );
  
   }
}
function f_c203(){
   var DATASIZE = 500, ieditBtn = document.getElementById( "rootImagechg" );
   ieditBtn.onclick = function(){
      var workarea, imagenes, me_input, dn_input, editimag, galembas, navgator, previews;
      workarea = document.getElementById( "anonRealarea" );
      workarea.innerHTML = f_a56("me","1",true,"") + f_a56("dn","",true,"") +
         "<button id='rootEditbutn'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='rootGalerias'></div>" + 
         "<div id='rootNavigate' class='notionary-navigator'></div>" +
         "<div id='rootPreviews'></div>";
      document.getElementById( "rootMenuclik" ).onclick();
      f_o43("idata");
      f_n64("admindex.php/?tun=idata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) imagenes = JSON.parse( response ); 
         me_input = document.getElementById( "meinp" );             dn_input = document.getElementById( "dninp" );
         editimag = document.getElementById( "rootEditbutn" );      galembas = document.getElementById( "rootGalerias" );
         navgator = document.getElementById( "rootNavigate" );      previews = document.getElementById( "rootPreviews" );
         f_f200( imagenes, galembas, 0, 100, "image");    f_z201( navgator, imagenes, 100, "image");
         editimag.onclick  = function(e) { f_y151("ie"); }
         me_input.onfocus  = f_c27;
         me_input.onkeydown = function(e){ var k=(e.keyCode ? e.keyCode : e.which);
            f_l198( e, this, imagenes);
            if ( k == "13" ) previews.innerHTML = "<img width=40% src='" + HARDCODE.image + me_input.value + "'>";
         }
         dn_input.onchange = function(e) {
            seter("aaimage","name",this.value,"imageID",me_input.value,function(){ f_l41(dn_input,"radGrun"); });
         }
     }, function( error ){ f_n47(error); }).then(function(){ f_k44("idata"); });  // The get
   } 
}
