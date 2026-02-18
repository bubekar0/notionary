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
