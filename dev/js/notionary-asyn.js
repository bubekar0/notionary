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
   // Stubbed — no social SDKs in single-user mode
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
function jasonSINFO(lan2L,cback,bust){
   DEBUGGER?console.log("[jasonSINFO]"):0;
   var url = "?tun=sinfo&was=" + lan2L;
   httpget( url, bust?"Cache-Control":0, bust?"no-cache":0 ).then(
      function(response) { SERVINFO = JSON.parse( response );
         for ( i = 0; i < SERVINFO[2].param.length; i++ )
            for (x in SERVINFO[2].param[i]) HARDCODE[x] = SERVINFO[2].param[i][x];
         // Override env-specific values with browser-derived URLs so the app
         // works on any host without touching the database.
         var _base = window.location.origin + "/";
         HARDCODE.myurl = _base;
         HARDCODE.image = _base + "?tun=ibyid&was=";
         HARDCODE.sound = _base + "?tun=sbyid&was=";
      },
      function( error ) { clickNotiz( error ); }
   ).then( cback );
}
function jasonUINFO(cback,bust){
   DEBUGGER?console.log("[jasonUINFO]"):0;
   var url = "?tun=uinfo";
   httpget( url, bust?"Cache-Control":0, bust?"no-cache":0 ).then(
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
   LOGGEDIN = true; ROOTUSER = false;
   cback();
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

