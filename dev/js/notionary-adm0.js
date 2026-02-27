/* Dummy place holder */
function bindAdminTools(){
   DEBUGGER?console.log("[bindAdminTools]"):0;
   var ONCEMORE = 60000,
       menuicon = document.getElementById( "rootMenuclik" ),
       menulist = document.getElementById( "rootMenulist" ),
       realarea = document.getElementById( "anonRealarea" ),
       useredit = document.getElementById( "rootUseredit" ),
       recorder = document.getElementById( "rootRecorder" ),
       activity = document.getElementById( "userActivity" );

   menuicon.onclick = function( e ) {
      if ( menulist.style.display == "block" )
         ausblenden(menulist,10,true);
      else einblenden(menulist,100);
   }

   bindBetaTest(function(){ 
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

      onNAJAX( "btest" );
      httpget("admindex.php/?tun=btest").then(
         function( response ){
            udata = JSON.parse( response );
            realarea.innerHTML = JSON.stringify( udata );
         }, function( error ) { clickNotiz( error ); }
      ).then( function(){ offNAJAX( "btest" ); } );


   });
   bindDebugger( realarea );
   bindClearCache();
   bindImageEditor();

   useredit.onclick = function(e) {                                                  // User Editing Facility
      var usermenu, usuarios, revsrats = "", dd, daysaway;
      onNAJAX("udata");
      document.getElementById( "rootMenuclik" ).onclick();
      httpget("admindex.php/?tun=udata").then(
         function(response) {
            usuarios = JSON.parse( response );
            realarea.innerHTML = markupUserGallery( usuarios )
            bindUserTools( usuarios );
            bindUserDeleteButton( usuarios );
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
         }, function( error ) { clickNotiz( error ); }
      ).then( function(){ offNAJAX("udata"); } );
   }

   recorder.onclick = showSoundContribution;                                         // Allow Sound contributions

   ACTIVITY = setInterval( function(){                                                  // Keep track of live activity on the site
              httpget("admindex.php/?tun=weran").then(
                 function( response ) { activity.innerHTML = response; },
                 function(  error  )  { clickNotiz( error ); }
              );
           }, ONCEMORE );

   bindMediaCloner();         bindImagePurger();
   bindSoundPurger();         bindSoundEditor();
   bindGoogleStaticMapsAPI(); bindGoogleDynamicMapsAPI();
}
function markupUserGallery(userData){
   DEBUGGER?console.log("[markupUserGallery]"):0;
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
function bindUserTools(userData){
   DEBUGGER?console.log("[bindUserTools]"):0;
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
      htmlarea.innerHTML = markupSmartInput("nn","",true,"") +
            "<button id='userToolSubmit'>" +
               "<span class='fa fa-paper-plane'></span>" + TRANSLAT.savit +
            "</button>";
            nn_input  = document.getElementById( "nninp" ); nn_input.onfocus = wakeClean;
            nn_stage  = document.getElementById( "nnstg" );
            sendtodb  = document.getElementById( "userToolSubmit" );
            nn_input.onkeyup = function(e){ var k = ( e.keyCode ? e.keyCode : e.which );
               if ( k == "13" || k == "9" ) { 
                  if ( this.value.issane( DIGITREG[0] ) ) { // only numeric input
                     nn_stage.style.width = nn_stage.style.height = "34px";
                     colorById(nn_input,"radGrun");
                     deactivateInput(this);
                     einblenden( sendtodb,1000 );
                  }
               }
            }
            sendtodb.onclick = function(){ onNAJAX( whattodo );
               switch ( leobject ) {
                  case renumber : jason = JSON.stringify({"oldid" : userData[ usermenu.value ].id, "newid" : nn_input.value}); break
                  case relegate : jason = JSON.stringify({"donor" : userData[ usermenu.value ].id, "towho" : nn_input.value}); break
               }
               httpost("admindex.php","tun=" + whattodo + "&was=" + jason ).then(
                  function( response ){ 
                     if ( response ) clickNotiz( response );
                     else timedNotiz( renorrel + " OK!");
                     mainbutn.click(); offNAJAX( whattodo ); mainbutn.click();
                  }, function( error ) { clickNotiz( error ); }
               );
            }
            ausblenden( sendtodb, 1000, true );
   }

   for ( i = 0; i < usadores.length; i++ )
      usadores[i].onclick = function( e ){ usermenu.value = this.id.substr( 5, this.id.length ); usermenu.onchange(); }

}
function bindUserDeleteButton(userData){
   DEBUGGER?console.log("[bindUserDeleteButton]"):0;
   var erase, mainbutn, usermenu, userdet;
   erase    = document.getElementById( "admnDeletion" );
   mainbutn  = document.getElementById( "rootUseredit" );
   usermenu  = document.getElementById( "admnSelector" );
   erase.onclick = function(){
      userdet  = document.getElementById( "user_" + usermenu.value );
      confoNotiz(userdet.innerHTML, TRANSLAT.delek, TRANSLAT.deldn,
         function(){},
         function(){
            httpget("admindex.php/?tun=udele&was=" + userData[ usermenu.value ].id).then(
               function( response ){
                  if ( response ) { timedNotiz("Deletion succeeded!");
                     mainbutn.click();
                     mainbutn.click();
                  } else clickNotiz("Something went wrong");
               },
               function( error ) { clickNotiz( error ); }
            );
         }
      );
   }
}
function getNotionsInArrayByCategory(XINFO,categ){
   DEBUGGER?console.log("[getNotionsInArrayByCategory]"):0;
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
function bindMediaCloner(){
   DEBUGGER?console.log("[bindMediaCloner]"):0;
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
            "<div id='adminCloneSourceContainer'>" + markupLanguagesDropdown("cloneSource",SERVINFO[0].langs,"en") +
               "<div id='sourceCategories'></div><select id='adminCloneSource'></select>" +
            "</div>" +
            "<div id='adminCloneTargetContainer'>" + markupLanguagesDropdown("cloneTarget",SERVINFO[0].langs,"en") +
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
      sourceSel.onchange = function(){ onNAJAX("sinfosrc");
         if ( languageToImage( this.value ) )
            sourceImg.setAttribute("src", HARDCODE.image + languageToImage( this.value ) );
         httpget("?tun=sinfo&was=" + this.value ).then(
            function(response) { SRCARRAY = JSON.parse( response ); },
            function(error) { clickNotiz( error ); }
         ).then( function(){ scats = "";
            for ( k in SRCARRAY[0].katse ) scats += "<option value=" + SRCARRAY[0].katse[k] + ">" + katxy( SRCARRAY[0].katse[k] ) + "</option>";
            sourceKts.innerHTML = "<div><select id='cloneSourceCategory'>" + scats + "</select></div>";
            sourceCat = document.getElementById( "cloneSourceCategory" );
            sourceCat.onchange = function(){ sourceNts.innerHTML = "";
               snots = getNotionsInArrayByCategory( SRCARRAY, this.value );  // Filter is used by this function
               for( s in snots ) sourceNts.innerHTML += "<option value='" + snots[s] + "'>" + snots[s] + "</option>";
            }; sourceCat.onchange(); offNAJAX("sinfosrc");
         });
      }; sourceSel.onchange();
      targetSel.onchange = function(){ onNAJAX("sinfotgt");
         if ( languageToImage( this.value ) )
            targetImg.setAttribute("src", HARDCODE.image + languageToImage( this.value ) );
         httpget("?tun=sinfo&was=" + this.value ).then(
            function(response) { TGTARRAY = JSON.parse( response ); },
            function(error) { clickNotiz( error ); }
         ).then( function(){ tcats = "";
            for( k in TGTARRAY[0].katse ) tcats += "<option value=" + TGTARRAY[0].katse[k] + ">" + katxy( TGTARRAY[0].katse[k] ) + "</option>";
            targetKts.innerHTML = "<div><select id='cloneTargetCategory'>" + tcats + "</select></div>";
            targetCat = document.getElementById( "cloneTargetCategory" );  // Filter is used by this function
            targetCat.onchange = function(){ targetNts.innerHTML = "";
               tnots = getNotionsInArrayByCategory( TGTARRAY, this.value );
               for ( t in tnots ) targetNts.innerHTML += "<option value='" + tnots[t] + "'>" + tnots[t] + "</option>";
            }; targetCat.onchange(); offNAJAX("sinfotgt");
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
            onNAJAX("ninfoclone");
            httpget("?tun=ninfo&was=" + sname).then( function(response) { sdata = JSON.parse( response );
               httpget("?tun=ninfo&was=" + tname).then( function(response) { tdata = JSON.parse( response );
                     ssize = sdata[1].qaimg.length; tsize = tdata[1].qaimg.length;
                  if ( ssize != tsize )
                     announce(feedbaker,"<markee> Incongruent Notions </markee>","radRojo");
                  else { // prepare Control Area Markup based on menu selections
                     announce(feedbaker,"<markee> Notion sizes match! </markee>","radGrun");
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
                  controler.innerHTML = adminClonerGutsMarkup(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize);
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
                              seter(decodeURIComponent(nname),cname,this.value,cname,olval, function(){ offNAJAX("seter"); });
                              colorById( this, "radBlau");
                           }
                        }
                        clinputs[i].onchange = function(e){ fireKey(this,13); }
                     }
                 }
                 medklon = document.getElementsByClassName( "notionary-cloning-tool" );
                 for ( i = 0; i < medklon.length; i++ )
                    medklon[i].onclick = function( e ){
                       this.id.substr(0,1) ==   "q" ? socol = "question" : socol = "answer";
                       this.id.substr(1,1) ==   "q" ? tacol = "question" : tacol = "answer";
                       this.id.substr(2,3) == "img" ? media="imageID"  : media="soundID";
                       httpost("admindex.php","tun=klmed&was=" + JSON.stringify({
                          "sonid":  sdata[0].nidno, "tanid":  tdata[0].nidno,
                          "socol":  socol, "tacol":  tacol,  "media": media
                       })).then(
                          function( response ){
                             if ( response ) clickNotiz( response );
                             offNAJAX("klmed");
                          },function( error ) { clickNotiz( error ); }
                       );
                    }
               }, function(error) { clickNotiz( error ); });
            }).then(function(){ offNAJAX("ninfoclone"); }); // outer GET
      } // sourceNts and targetNts
   } // media cloner
}
function adminClonerGutsMarkup(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize){
   DEBUGGER?console.log("[adminClonerGutsMarkup]"):0;
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
function bindSoundPurger(){
   DEBUGGER?console.log("[bindSoundPurger]"):0;
   var KEEPLIST = 300,
       spurgeBtn, realarea;
   spurgeBtn = document.getElementById( "rootSoundprg" );
   realarea  = document.getElementById( "anonRealarea" );
   spurgeBtn.onclick = function(){
         var i, j, k, l, sndAR, nsnAR, noise;
      document.getElementById( "rootMenuclik" ).onclick();
      onNAJAX("allss");
      httpget("admindex.php/?tun=allss").then(
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
                     seter("aasound","","DELETE","soundID",s2del, function(){ offNAJAX("seter"); });
                     ausblenden(this,1000,true);
                  }
            }
         },
         function(error) { clickNotiz( error ); }
      ).then( function(){ offNAJAX("allss"); } );
   }
}
function bindImagePurger(){
   DEBUGGER?console.log("[bindImagePurger]"):0;
   var ipurgBtn, realarea, deleti;
   ipurgBtn = document.getElementById( "rootImageprg" );
   realarea = document.getElementById( "anonRealarea" );
   ipurgBtn.onclick = function(e){ var KEEPLIST = 300, d, i, j, k, l, imgAR, ntnAR, avaAR, nisAR, mundo;
         document.getElementById( "rootMenuclik" ).onclick();
         onNAJAX("pimag");
         httpget("admindex.php/?tun=pimag").then(function( response ){
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
                        function(){ offNAJAX("seter"); ausblenden(leobject,1000,true); });
               }
         }, function(error) { clickNotiz( error ); }
      ).then(function(){ offNAJAX("pimag"); });
   }
}
function bindGoogleStaticMapsAPI(){
   DEBUGGER?console.log("[bindGoogleStaticMapsAPI]"):0;
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
function bindGoogleDynamicMapsAPI(){
   DEBUGGER?console.log("[bindGoogleDynamicMapsAPI]"):0;
   var GMPASSRC = "https://maps.googleapis.com/maps/api/js",
       GMAPSKEY = "AIzaSyDKPLdr0SOYenVMquLNFUHcmeNtddL38-A", // Loads Google Maps API Assynchronously and with a callback
       GMAPSURI = GMPASSRC + "?key=" + GMAPSKEY + "&sensor=false&callback=runGoogleDynamicMapsAPI",
       gmapiScript   = document.createElement("script"),
       dynamicBtn;
       gmapiScript.type = "text/javascript";
       gmapiScript.src  = GMAPSURI;
   dynamicBtn = document.getElementById( "rootGmapdyna" );
   dynamicBtn.onclick = function(e) { document.body.appendChild(gmapiScript); }
}
function runGoogleDynamicMapsAPI(){
   DEBUGGER?console.log("[runGoogleDynamicMapsAPI]"):0;
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
