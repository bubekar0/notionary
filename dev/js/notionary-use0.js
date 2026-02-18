function showProfileFlags(){
   DEBUGGER?console.log("[showProfileFlags]"):0;
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
   langhtml.innerHTML = "<img id='profLangflag' src='"+ HARDCODE.image + languageToImage( USERINFO[0].ulang ) + "'/>" + 
      "<div id='profLangmenu' class='notionary-tooltips'>" + enopt + deopt + esopt + fropt + itopt + ptopt + ruopt + huopt + "</div>";

   flagclik = document.getElementById( "profLangflag" ); // Clickable to shide or show the Menu
   flagmenu = document.getElementById( "profLangmenu" ); // Container of Flag Menu HTML
   flagclik.onclick = function(e){ if ( flagmenu.style.display == "block" ) ausblenden(flagmenu,10,true); else einblenden(flagmenu); }

   vanderas = document.getElementsByClassName( "notionary-toolitem" );
   for ( i = 0; i < vanderas.length; i++ )
      vanderas[i].onclick = function( e ){
         e.preventDefault();
         ausblenden(flagmenu,10,true);
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
         if ( neulingo ) jasonSINFO( USERINFO[0].ulang, function(){
                            jasonXLATE( USERINFO[0].ulang, function(){ landingPage(); loadSuperNotions(); showSupers(); });
                         });
   }
}
function changePreference(inits,enable){
   DEBUGGER?console.log("[changePreference]"):0;
   var tafel;
   switch(inits){ // update local USERINFO Superarray to obviate refresh
      case "au": tafel="aanosnd"; USERINFO[0].nosnd = enable; break;
      case "ms": tafel="aajamsg"; USERINFO[0].msges = enable; break;
   }
   httpost("usrindex.php","tun=prefs&was=" + JSON.stringify({"tafel":tafel,"value":enable})).then(
      function( response ){ if ( response ) clickNotiz( response ); },
      function( error ) { clickNotiz( error ); }
   );
}
function showAvatar(elementID,clickCBK){
   DEBUGGER?console.log("[showAvatar]"):0;
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
      httpget(ijson,"Access-Control-Allow-Origin",HARDCODE.myurl).then(
         function( response ) { gpjson = JSON.parse( response );
            USERBILD  = gpjson.entry.gphoto$thumbnail.$t;
            avatarElement.style.setProperty("background-image","url(" + USERBILD + ")","important");
            avatarElement.onclick = function(e){ handleImageUploads("av"); }
         },
         function( error ) { clickNotiz( error); }
      );
   }
   */
   if ( USERBILD != "" ) avatarElement.style.setProperty("background-image","url(" + USERBILD + ")","important");
   avatarElement.onclick = clickCBK;
}
function showProfilePopup(){
   DEBUGGER?console.log("[showProfilePopup]"):0;
   var soundsno, soundsja, emailsno, emailsja, nickname, nickajax, nickchek, fullname,
       username, userajax, userchek, mailname, mailajax, mailchek,
       password, passchek, clavedos, clavchek, advisory, saverbtn,
       knsan = fnsan = pwsan = false,
       kndif = fndif = pwdif = undif = emdif = false,
       kn_ok = un_ok = em_ok = true; // Stronger check Logic evaluated IFF Actual input
   zentraller("profile",
      "<div id='avatarHolder'></div>" +
      "<div id='profLanghtml'></div>" +
      markupOffOnRadio("sx",[TRANSLAT.nopes,TRANSLAT.yeses],!USERINFO[0].nosnd) +
      markupOffOnRadio("ex",[TRANSLAT.nopes,TRANSLAT.yeses],USERINFO[0].msges) +
      markupSmartInput("kn",USERINFO[0].kname,true,"") + markupSmartInput("fn",USERINFO[0].fname,true,"") +
      markupSmartInput("un",USERINFO[0].uname,true,"") + markupSmartInput("em",USERINFO[0].email,true,"") +
      markupSmartInput("pw","********",true,"")        + markupSmartInput("p2","********",true,"") +
      "<button id='saverKnopf'>" + TRANSLAT.savit + "</button>",
     function(){ // Binding Callback()
         showProfileFlags();
         showAvatar("avatarHolder",function(){ handleImageUploads("av"); });
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
         if ( offOnVal( "sx" ) ) soundsja.setAttribute("disabled","true"); else soundsno.setAttribute("disabled","true");
         if ( offOnVal( "ex" ) ) emailsja.setAttribute("disabled","true"); else emailsno.setAttribute("disabled","true");
         soundsno.onclick = function(e){ PLAYABLE = false;
                               changePreference("au",true); timedNotiz(TRANSLAT.pfcok);
                               soundsno.setAttribute("disabled","true"); soundsja.removeAttribute("disabled"); }
         soundsja.onclick = function(e){ PLAYABLE = true;
                               changePreference("au",false); timedNotiz(TRANSLAT.pfcok);
                               soundsja.setAttribute("disabled","true"); soundsno.removeAttribute("disabled"); }
         emailsno.onclick = function(e){ changePreference("ms",false); timedNotiz(TRANSLAT.pfcok);
                               emailsno.setAttribute("disabled","true"); emailsja.removeAttribute("disabled"); }
         emailsja.onclick = function(e){ changePreference("ms",true); timedNotiz(TRANSLAT.pfcok);
                               emailsja.setAttribute("disabled","true"); emailsno.removeAttribute("disabled"); }

         // Regular Users can't choose E-mail while Social Network Users can't choose Username nor Password
         if ( sanitized( USERINFO[0].uname, EMAILREG ) ) ausblenden(mailname.parentNode,10,true);
         else turnOff.apply(this,[ username.parentNode, password.parentNode ]);

         turnOff.apply(this,[ username.parentNode.firstChild, mailname.parentNode.firstChild,
                              password.parentNode.firstChild, clavedos.parentNode.firstChild,
                              welcomer, clavedos ]);

         nickname.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.kntxt); }
         nickname.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.kntxt); }
         fullname.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.fntxt); }
         fullname.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.fntxt); }
         username.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.untxt); }
         username.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.untxt); }
         mailname.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.emtxt); }
         mailname.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.emtxt); }
         password.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.pwtxt); this.setAttribute("type","password"); }
         password.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.pwtxt); }
         clavedos.onfocus = function(e) { refocusSmartInput(this,TRANSLAT.p2txt); this.setAttribute("type","password"); }
         clavedos.onblur  = function(e) { unfocusSmartInput(this,TRANSLAT.p2txt); }

         // Make them all visible and prevent SMARTFON keyboard clutter
         nickname.focus(); fullname.focus(); username.focus(); mailname.focus(); password.focus();
         setTimeout( function(){ password.blur(); },100);
         //fullname.blur(); username.blur(); mailname.blur(); password.blur(); nickname.blur();

         // Handle onkey{up|down} for Full Name and Nickname
         sanekeys( fullname, NAMESREG, advisory, function(){ fnsan = true; });
         sanekeys( nickname, NAMESREG, advisory, function(){ knsan = true;
            nickajax.style.visibility = "visible";     // Ahow ajax mgif while checking
            httpget("usrindex.php/?tun=taken&was=" + nickname.value ).then(
               function( response ) {
                  if ( !response ) { kn_ok = true; einblenden(nickchek,100); }
                  else { kn_ok = false; ausblenden(nickchek,10,true);
                     instruct(advisory,TRANSLAT.notmp,"red");
                  }
               },
               function( error ) { clickNotiz ( error ); }
            ).then(function(){ nickajax.style.visibility = "hidden"; });
         });

         // Handle onkey{up|down} for User Name (Regular Users) and Mail Name (Social Network Users)
         username.onkeyup   = mailname.onkeyup = killMetas;
         username.onkeydown = mailname.onkeydown = function(e) {
            var cette = this, k = ( event.keyCode ? event.keyCode : event.which );
            if ( cette == username ) { mychk = USERINFO[0].uname; myajx = userajax; mystg = userchek; }
            else                     { mychk = USERINFO[0].email; myajx = mailajax; mystg = mailchek; }
            ausblenden(mystg,10,true);
            if ( k == "13" || k == "9" )
               if ( sanitized( cette.value, EMAILREG ) )   // Sanity Check
                  if ( cette.value != mychk ) {    // Availability Check -- HTTP_Req IFF diff && sane
                     myajx.style.visibility = "visible";
                     httpget("?tun=known&was=" + cette.value ).then(
                        function( response ) {
                           if ( !response ) { einblenden(mystg,100);
                              cette == username ? un_ok = true : em_ok = true;
                           } else { instruct(advisory,TRANSLAT.taken,"red");
                              cette == username ? un_ok = false : em_ok = false;
                              //cette.id.substr(0,2) == "un" ? un_ok = false : em_ok = false;
                           }
                        }, function( error ) { clickNotiz( error ); }
                     ).then(function(){ myajx.style.visibility = "hidden"; });
                  }
         }

         // Handle Password Input
         password.onkeydown = function(e) { var k = (e.keyCode ? e.keyCode : e.which);
            if ( k == "13" || k == "9" )
               if ( sanitized( password.value, PWORDREG ) ) {
                  instruct(advisory,TRANSLAT.p2txt,"black");
                  einblenden(clavedos.parentNode,10,"inline-block");
                  turnOn.apply(this,[passchek, clavedos]);
                  clavedos.focus();
               } else { password.value = "********";
                  instruct(advisory,TRANSLAT.pwbad,"red");
                  turnOff.apply(this,[passchek, clavedos.parentNode]);
               }
         }

         // Handle Password Confirmation
         clavedos.onkeydown = function(e) { var k = (e.keyCode ? e.keyCode : e.which);
            if ( k == "13" || k == "9" ) {
               if ( password.value == clavedos.value ) { instruct(advisory,"","black");
                  turnOn.apply(this,[passchek, clavchek]);
               } else  { clavedos.value = TRANSLAT.p2txt; instruct(advisory,TRANSLAT.pmiss,"red"); }
            }
         }

         // Process all inputs en-masse 
         saverbtn.onclick = function(){ // Handle special inputs first EM/- PW
            if ( ( nickname.value != USERINFO[0].kname ) && ( nickname.value || USERINFO[0].kname ) ) kndif = true;

            if ( ( fullname.value != USERINFO[0].fname ) && ( fullname.value || USERINFO[0].fname ) ) fndif = true;

            if (   username.value != USERINFO[0].uname )                                           undif = true;

            if (   mailname.value == TRANSLAT.emtxt ) mailname.value ="";
            if (   mailname.value != USERINFO[0].email && sanitized( mailname.value, EMAILREG ) )     emdif = true;

            if (   password.value != "********" ) {
               if ( !clavedos.value || clavedos.value == "********" ) fireKey(password,13);
               if (  clavedos.value && ( password.value == clavedos.value ) )                   pwdif = true;
            }

            if ( fullname.value.length >= NAMESREG[2] &&
                 fullname.value.length <= NAMESREG[3] && NAMESREG[1].test(fullname.value) )           fnsan = true;

            if ( !password.value ||
                 ( sanitized( password.value, PWORDREG ) && password.value == clavedos.value ) )   pwsan = true;

            if (  un_ok && em_ok && kn_ok && pwsan && fnsan && ( undif || emdif || kndif || pwdif || fndif ) ) { onNAJAX("pfupd");
               httpost("usrindex.php","tun=pfupd&was=" + JSON.stringify(
                  { "kname": nickname.value, "fname": fullname.value,
                    "uname": username.value, "email": mailname.value, "pword": password.value
                  })).then(function(response){
                     if ( response ) clickNotiz( response );
                     else {
                        if ( undif || emdif ) clickNotiz(TRANSLAT.emchk);
                        else timedNotiz(TRANSLAT.pfcok);
                        jasonUINFO();
                     }
                  }, function( error ){ clickNotiz( error ); }
               ).then(function(){ offNAJAX("pfupd"); });
            }
         }
   }, function(){ landingPage(); showSupers(); } );
}
function csvCallback(){
   DEBUGGER?console.log("[csvCallback]"):0;
   var DEFCATEG = 20,
       DEFSPEAK = "en",
       QANDATXT = {},
       category = DEFCATEG,
       language = DEFSPEAK;

   if ( document.getElementById( "editKatseSel" ) )
      category = categoryID( document.getElementById( "editKatseSel" ).value );

   if ( document.getElementById( "editLangflag" ) )
      language = document.getElementById( "editLangflag" ).getAttribute("tgetlang")

   onNAJAX("txget");
   httpget("usrindex.php/?tun=txget").then(
      function( response ){                                        // JSONless call
         if ( response ) { QANDATXT = JSON.parse( response );
            if ( ( QANDATXT.length == 10 ) &&                      // Check if the fail over Notion was returned
                 ( QANDATXT[0].q == TRANSLAT.qkopf + "1" ) &&
                 ( QANDATXT[9].a == TRANSLAT.akopf + "10" ) )
                    clickNotiz( TRANSLAT.fnoul );
            for ( i = 0; i < QANDATXT.length; i++ ) {              // Failsafe clean up of Server garbage
               if ( !QANDATXT[i].q ) QANDATXT[i].q = "";
               if ( !QANDATXT[i].a ) QANDATXT[i].a = "";
            }
            MOREDATA = showNotionContents( category, "", "", language, QANDATXT );
            MOREDATA = showAddOneMoreButton( MOREDATA );
            showSubmitButton( "", MOREDATA, MOREDATA, "schaf" );
         } else clickNotiz( TRANSLAT.fnoul );
      },
      function( error ) { clickNotiz( error ); }
   ).then(function(){ offNAJAX("txget"); });
}
function showUserProgress(){
   DEBUGGER?console.log("[showUserProgress]"):0;
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

   if ( countProblemsInUINFO() ) {
      trophies.innerHTML += "<div id='userProblems' class='notionary-trophies' title='" + TRANSLAT.repas + "'>" +
                               "<span class='fa fa-thumbs-o-down'></span>" +
                               "<div class='notionary-counters'>" + countProblemsInUINFO() + "</div>" +
                            "</div>";
      document.getElementById( "userProblems" ).onclick = function(e) { window.location.href = HARDCODE.myurl + "?tun=probs"; }
   }

}
