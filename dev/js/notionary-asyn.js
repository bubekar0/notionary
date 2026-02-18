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
