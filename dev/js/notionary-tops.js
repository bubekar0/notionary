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
