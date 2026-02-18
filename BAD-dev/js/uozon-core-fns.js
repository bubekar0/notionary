var CANTO, CONTACTS={};
/*
window.onresize = function(){ // Resize Exam with Browser
   var bottxt, txtcon, fntsiz;
   bottxt = document.getElementById( "bottomText" );
   txtcon = document.getElementById( "textContainer" );
   if ( MOBILE ) fntsiz = 18;
   else fntsiz = Math.min(35,parseInt( parseFloat( 0.13  * parseInt( txtcon.offsetWidth - 200 ) ) )/4);
   if ( bottxt ) bottxt.style.setProperty("font-size",fntsiz + "px");
}
*/
function nentr(){
   DEBUG?console.log("[nentr]"):0;
   onNAJAX("000");
   httpget("?tun=mylan").then(function( response ){ BLANG = response; })
    .then(function(){
      jasonSINFO(BLANG,function(){
         jasonUINFO(function(){
           loadUserAdminSources(function(){
              jasonXLATE(BLANG,f_g2);
              offNAJAX("000");
           });
         });
      });
   });
}
function f_g2(){
   DEBUG?console.log("[f_g2]"):0;
   var i, menuHeaders, thisContents, currentDisplay, ulogo, logo2show;
   document.body.innerHTML = "<img id='uozonLogo' src='" + PARAM.image + "1'/>";
/*
   logo2show = "Web Design";
   document.body.innerHTML =
      "<img id='uozonLogo' src='" + PARAM.image + "1'/>" +
      "<span id='websiteLogo'>" + logo2show + "</span>" +
         "<div id='adminUtilities'></div>" +
      "<div id='textContainer' class='animated zoomIn'>" + 
         f_i3() + f_t4() + f_m5() +
      "</div>" +
      "<div id='noview'>" +
         "<span>" + XLATE.rotat + "</span>" +
         "<img src='" + PARAM.image + "1'/>" +
      "</div>" +
      "<div id='fuss'><span class='crite'>" + XLATE.crite + "</span></div>";

      // Start Menu Contents hidden
      menuInhalts = document.getElementsByClassName( "uozon-menu-contents" );
      for ( i = 0; i < menuInhalts.length; i++ ) { ausblenden(menuInhalts[i],10,true); }

      // Show contents upon clicking the Menu Bar Header
      menuHeaders = document.getElementsByClassName( "uozon-menu-header" );
      for ( i = 0; i < menuHeaders.length; i++ ) {
         menuHeaders[i].onclick = function( e ){ // Header Click ==>> Toggle Contetns
            thisContents = this.firstChild.nextSibling;
            currentDisplay = thisContents.style.display;
            // Hide All Contents First
            for ( i = 0; i < menuInhalts.length; i++ ) { ausblenden(menuInhalts[i],100,true); }

            // Now toggle the clicked one
            if ( currentDisplay == "none" ) setTimeout(function(){einblenden(thisContents,1000);},500);
         }
      f_o6(); f_f7();   f_g8(); f_k9(); f_o10();
      f_y11(); f_p12(); f_j13(); f_h14();   f_m15();
      f_e16(); f_q17(); f_w18(); f_19();  f_x20(); f_q21();
   }
*/
   loadJS( PARAM.athis );
}
function f_i3(){
   DEBUG?console.log("[f_i3]"):0;
   return("<ul id='menuBar'>" +
            "<li class='uozon-menu-header'>" + // MenuHeader
               "<a><span class='fa fa-bars'></span>&nbsp;&nbsp;&nbsp;Web Software</a>" +
               "<ul class='uozon-menu-contents'>" + // Contents
                  "<li><a id='html5css3'>HTML5 & CSS3</a></li>" +
                  "<li><a id='ajax'>AJAX</a></li>" +
                  "<li><a id='responsive'>" + XLATE.adapt + "</a></li>" +
                  "<li><a id='yui'>Mini-Code</a></li>" +
                  "<li><a id='cextras'>Extras</a></li>" +
               "</ul>" +
            "</li>" +
            "<li class='uozon-menu-header'>" +
               "<a><span class='fa fa-bars'></span>&nbsp;&nbsp;&nbsp;Host Server</a>" +
               "<ul class='uozon-menu-contents'>" +
                  "<li><a id='linux'>Linux</a></li>" +
                  "<li><a id='apache'>Apache</a></li>" +
                  "<li><a id='mysql'>MySQL</a></li>" +
                  "<li><a id='php'>PHP</a></li>" +
                  "<li><a id='sextras'>Extras</a></li>" +
               "</ul>" +
            "</li>" +
            "<li class='uozon-menu-header'>" +
               "<a><span class='fa fa-bars'></span>&nbsp;&nbsp;&nbsp;" + XLATE.mbar3 + "</a>" +
               "<ul class='uozon-menu-contents'>" +
                  "<li><a id='fbook'>Facebook</a></li>" +
                  "<li><a id='gplus'>Google +</a></li>" +
                  "<li><a id='tweet'>Twitter</a></li>" +
                  "<li><a id='pint'>Pinterest</a></li>" +
                  "<li><a id='utube'>YouTube</a></li>" +
                  "<li><a id='nextras'>Extras</a></li>" +
               "</ul>" +
            "</li>" +
         "</ul>" );
}
function f_t4(){
   DEBUG?console.log("[f_t4]"):0;
   var mu = "<div id='mainArea' class='cssSlideshow'> ";
   for ( i = 30; i < 40; i++ ) mu += "<figure> <img src='" + PARAM.image + i + "'/> </figure> ";
   mu += "</div>";
   mu += "<br style='clear:both'>";
   return(mu);
}
function f_m5(){
   DEBUG?console.log("[f_m5]"):0;
   return("<ul id='bottomText'>" +
            "<li>" + XLATE.built + "</li>" +
            "<li>" + XLATE.opens + "</li>" +
            "<li>" + XLATE.respo + "</li>" +
            "<li>" + XLATE.https + "</li>" +
            "<li>" + XLATE.hosts + "</li>" +
            "<li>" + XLATE.media + "</li>" +
                  "<span class='fa fa-facebook'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-twitter'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-google-plus'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-youtube'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-skype'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-linkedin'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-instagram'></span>&nbsp;&nbsp;" +
            "</li>" +
            "<li>" + XLATE.trafk + "</li>" +
                  "<span class='fa fa-google'></span>&nbsp;&nbsp;" +
                  "<span class='fa fa-windows'></span>&nbsp;&nbsp;" +
            "</li>" +
         "</ul>" +
         "<br style='clear:both'>");
}
function f_o6(){
   DEBUG?console.log("[f_o6]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "html5css3" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> HTML5 </h1>" +
      "<div class='uozon-smalltext'>" +
         "<img src='" + PARAM.image + "40' style='height:100px;width:60%'><br/>" + XLATE.html5 +
         "<a target='_blank' href='http://html5doctor.com/'>" + XLATE.rmore + "</a><br/><br/>" +
         "<img src='" + PARAM.image + "29' style='height:100px;width:60%'><br/>" + XLATE.csss3 +
         "<a target='_blank' href='http://www.css3.info/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.oursi + " HTML5 & CSS3 </span>" +
      "</div>";
   }
}
function f_f7(){
   DEBUG?console.log("[f_f7]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "ajax" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Assynchronous Javascript </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.async + "<span class='nazur'>" + XLATE.oursi + " AJAX </span><br/>" +
         "<img src='" + PARAM.image + "44'>" +
      "</div>";
   }
}
function f_g8(){
   DEBUG?console.log("[f_g8]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "responsive" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1>" + XLATE.adapt + "</h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.reweb + "<span class='nazur'>" + XLATE.oursi + XLATE.adapt + "</span><br/>" +
         "<img src='" + PARAM.image + "45'>" +
      "</div>";
   }
}
function f_k9(){
   DEBUG?console.log("[f_k9]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "yui" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Minification & Obfuscation</h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.minif +
         "<a target='_blank' href='http://yui.github.io/yuicompressor/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.oursi + " Mini-Code </span><br/>" +
         "<img src='" + PARAM.image + "46'>" +
      "</div>";
   }
}
function f_o10(){
   DEBUG?console.log("[f_o10]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "cextras" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Client Extras </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.cextr + "<br/>" +XLATE.gfont + "<br/>" +
         "<span style='color:red;font-family:Roboto Slab'>Font </span>" +
         "<span style='color:green;font-family:Passion One;font-size:1.5em;'>Font </span>" +
         "<span style='color:blue;font-family:Bangers;font-size:1.5em;'>Font </span>" +
         "<span style='color:white;font-family:Architects Daughter;font-size:1.5em;'>Font </span>" +
         "<span style='color:orange;font-family:Orbitron;font-size:1.5em;'>Font </span>" +
         "<a target='_blank' href='https://fonts.google.com/'>" + XLATE.rmore + "</a><br/>" + XLATE.asome +
         "<a target='_blank' href='http://fontawesome.io/'>" + XLATE.rmore + "</a><br/>" +
         "<i style='color:red'    class='fa fa-spinner fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>" +
         "<i style='color:green'  class='fa fa-circle-o-notch fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>" +
         "<i style='color:blue'   class='fa fa-refresh fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>" +
         "<i style='color:white'  class='fa fa-cog fa-spin fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>" +
         "<i style='color:orange' class='fa fa-spinner fa-pulse fa-3x fa-fw'></i> <span class='sr-only'>Loading...</span>" +
      "</div>";
   }
}
function f_y11(){
   DEBUG?console.log("[f_y11]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "linux" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Linux OS Server </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.linux +
         "<a target='_blank' href='http://www.ubuntu.com/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.ourse + " Ubuntu 16.04 LTS </span><br/>" +
         "<img src='" + PARAM.image + "47'>" +
      "</div>";
   }
}
function f_p12(){
   DEBUG?console.log("[f_p12]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "apache" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Apache HTTP Server </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.apach +
         "<a target='_blank' href='http://www.apache.org/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.ourse + " Apache 2.4.18 </span><br/>" +
         "<img src='" + PARAM.image + "48'>" +
      "</div>";
   }
}
function f_j13(){
   DEBUG?console.log("[f_j13]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "mysql" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> MySQL Database </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.mysql +
         "<a target='_blank' href='https://www.mysql.com/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.ourse + " MySQL 5.7.12 </span><br/>" +
         "<img src='" + PARAM.image + "49'>" +
      "</div>";
   }
}
function f_h14(){
   DEBUG?console.log("[f_h14]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "php" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> PHP Server Software </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.phprl +
         "<a target='_blank' href='http://php.net/'>" + XLATE.rmore + "</a><br/>" +
         "<span class='nazur'>" + XLATE.ourse + " PHP 7.0.15 </span><br/>" +
         "<img src='" + PARAM.image + "50'>" +
      "</div>";
   }
}
function f_m15(){
   DEBUG?console.log("[f_m15]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "sextras" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Server Extras </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.sextr +
         "<a target='_blank' href='http://www.lacie.com/'>" + XLATE.rmore + "</a><br/>" +
         "<img src='" + PARAM.image + "51'>" +
      "</div>";
   }
}
function f_e16(){
   DEBUG?console.log("[f_e16]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "fbook" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Facebook </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.fbook +
         "<a target='_blank' href='https://www.facebook.com/uozon/'>" + XLATE.sexam + "</a><br/>" +
         fbookButton("netbtn","like",getLocale(),PARAM.myurl,false,"") +
         fbookButton("netbtn","share",getLocale(),PARAM.myurl,true,"") +
      "</div>";
   }
}
function f_q17(){
   DEBUG?console.log("[f_q17]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "gplus" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Google Plus </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.gplus +
         "<a target='_blank' href='https://plus.google.com/+Uozon'>" + XLATE.sexam + "</a><br/>" +
         gplusButton("netbtn","plus1",PARAM.myurl,false) +
         gplusButton("netbtn","share","//plus.google.com/u/0/112286784767270675904",true) +
         gplusButton("netbtn","folge","//plus.google.com/u/0/112286784767270675904",false)  +
      "</div>";
      gLangLoader("https://apis.google.com/js/platform.js",getGlocale());
   }
}
function f_w18(){
   DEBUG?console.log("[f_w18]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "tweet" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Twitter </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.twitt +
         "<a target='_blank' href='https://twitter.com/uozoncom'>" + XLATE.sexam + "</a><br/>" +
         tweetButton("netbtn","tweet",getGlocale(),PARAM.myurl,XLATE.check,"") +
         tweetButton("netbtn","folge",getGlocale(),"uozoncom","","")  +
      "</div>";
   }
}
function f_19(){
   DEBUG?console.log("[f_19]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "pint" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Pinterest </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.pinte +
         "<a data-pin-do='buttonBookmark' data-pin-tall='true' data-pin-save='true' href='https://www.pinterest.com/pin/create/button/'></a>" +
         "<div class='netbtn'>" +
            "<a data-pin-do='buttonFollow' href='https://www.pinterest.com/uozon9072/'>uozon9072</a>" +
         "</div>" +
      "</div>";
      loadJS("//assets.pinterest.com/js/pinit.js");
   }
}
function f_x20(){
   DEBUG?console.log("[f_x20]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "utube" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> YouTube </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.utube +
         "<a target='_blank' href='https://www.youtube.com/channel/UConE_1jsXGZkNCRT8-YKZYg'>" + XLATE.sexam + "</a><br/>" +
         "<div class='netbtn'>" +
            '<div class="g-ytsubscribe" data-channelid="UConE_1jsXGZkNCRT8-YKZYg" ' +
               ' data-layout="default" data-count="default" data-onytevent="onYtEvent">' +
            '</div>' +
         "</div>" +
      "</div>";
      loadJS("https://apis.google.com/js/platform.js");
   }
}
function f_q21(){
   DEBUG?console.log("[f_q21]"):0;
   var marea = document.getElementById( "mainArea" ),
       thisOption = document.getElementById( "nextras" );
   thisOption.onclick = function(e){
      marea.innerHTML = "<h1> Network Extras </h1>" +
      "<div class='uozon-smalltext'>" +
         XLATE.nextr +
         "<a target='_blank' href='http://www.addthis.com/'>" + XLATE.rmore + "</a><br/>" +
         "<img src='" + PARAM.image + "52' style='width:60%;height:100px'><br/>" + XLATE.ifttt +
         "<a target='_blank' href='https://ifttt.com/'>" + XLATE.rmore + "</a><br/>" +
         "<img src='" + PARAM.image + "53' style='width:60%;height:100px'>" +
      "</div>";
   }
}
