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
