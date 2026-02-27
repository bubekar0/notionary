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
   LOGGEDIN = true;
   ROOTUSER = true;
   loadJS("js/" + HARDCODE.mynom + "-user-min.js?version=VERSION_TRACKER").then(function(){
      usrCssLink = document.createElement( "link" );
      usrCssLink.rel  = "stylesheet"; usrCssLink.type = "text/css";
      usrCssLink.href = "css/" + HARDCODE.mynom + "-user-min.php?version=VERSION_TRACKER";
      document.head.appendChild( usrCssLink );
   }).then(function(){
      loadJS("js/" + HARDCODE.mynom + "-admn-min.js?version=VERSION_TRACKER").then(function(){
         admCssLink = document.createElement( "link" );
         admCssLink.rel  = "stylesheet"; admCssLink.type = "text/css";
         admCssLink.href = "css/" + HARDCODE.mynom + "-admn-min.php?version=VERSION_TRACKER";
         document.head.appendChild( admCssLink );
      }).then(cback);
   });
}
function fbookButton(){ return ""; }
function gplusButton(){ return ""; }
function tweetButton(){ return ""; }
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
   // Stubbed — no logout in single-user mode
}
