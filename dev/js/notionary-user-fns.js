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
