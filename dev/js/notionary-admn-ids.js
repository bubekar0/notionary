/* Dummy place holder */
function f_v183(){
   var ONCEMORE = 60000,
       menuicon = document.getElementById( "i_i57" ),
       menulist = document.getElementById( "i_y56" ),
       realarea = document.getElementById( "i_y138" ),
       useredit = document.getElementById( "i_d50" ),
       recorder = document.getElementById( "i_j53" ),
       activity = document.getElementById( "i_x49" );

   menuicon.onclick = function( e ) {
      if ( menulist.style.display == "block" )
         f_z24(menulist,10,true);
      else f_l23(menulist,100);
   }

   f_c195(function(){ 
      document.getElementById( "i_i57" ).onclick();

      var realarea, pctProg, bumpBtn, counter = 0;
      realarea    = document.getElementById( "i_y138" );
      realarea.innerHTML = "<span    id='i_e5'></span>" +
                            "<button id='i_h16'><span class='fa fa-plus'></span>Bump</button>";
      pctProg     = document.getElementById( "i_e5" );
      bumpBtn     = document.getElementById( "i_h16" );
      bumpBtn.onclick = function(e){
         counter ++;
         snapPercent(pctProg,counter/10,"#aac627");
      }

      f_o43( "btest" );
      f_n64("admindex.php/?tun=btest").then(
         function( response ){
            udata = JSON.parse( response );
            realarea.innerHTML = JSON.stringify( udata );
         }, function( error ) { f_n47( error ); }
      ).then( function(){ f_k44( "btest" ); } );


   });
   f_w196( realarea );
   f_r197();
   f_c203();

   useredit.onclick = function(e) {                                                  // User Editing Facility
      var usermenu, usuarios, revsrats = "", dd, daysaway;
      f_o43("udata");
      document.getElementById( "i_i57" ).onclick();
      f_n64("admindex.php/?tun=udata").then(
         function(response) {
            usuarios = JSON.parse( response );
            realarea.innerHTML = f_l184( usuarios )
            f_s185( usuarios );
            f_m186( usuarios );
            usermenu = document.getElementById( "i_b153" );
            usermenu.onchange = function(){
               
               if ( usuarios[ this.value ].rg ) revsrats += "<span class='fa fa-star'></span>";
               if ( usuarios[ this.value ].rw ) revsrats += "<span class='fa fa-comment'></span>";
               dd = usuarios[ this.value ].la.split(/[- :]/);
               daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );

               document.getElementById( "i_r150" ).setAttribute( "src", HARDCODE.image + usuarios[ this.value ].av );
               document.getElementById( "i_k148" ).innerHTML = usuarios[ this.value ].id + revsrats;
               document.getElementById( "i_b147" ).innerHTML = usuarios[ this.value ].un;
               document.getElementById( "i_l149" ).innerHTML = usuarios[ this.value ].kn;
               document.getElementById( "i_c151" ).innerHTML = usuarios[ this.value ].fn;
               document.getElementById( "i_v152" ).innerHTML = ( usuarios[ this.value ].em || "" );
               document.getElementById( "i_e156" ).innerHTML = "<span>Logg: "   + usuarios[ this.value ].sl + "</span>" +
                                                                     "<span>  Exam: " + usuarios[ this.value ].tt + "</span>" +
                                                                     "<span>  Owns: " + usuarios[ this.value ].na + "</span>";
               document.getElementById( "i_i159" ).innerHTML = "Absent: <span style='color:red'>" + daysaway + "</span>";
            }
         }, function( error ) { f_n47( error ); }
      ).then( function(){ f_k44("udata"); } );
   }

   recorder.onclick = f_p106;                                         // Allow Sound contributions

   ACTIVITY = setInterval( function(){                                                  // Keep track of live activity on the site
              f_n64("admindex.php/?tun=weran").then(
                 function( response ) { activity.innerHTML = response; },
                 function(  error  )  { f_n47( error ); }
              );
           }, ONCEMORE );

   f_t188();         f_k191();
   f_y190();         f_y202();
   f_z192(); f_t193();
}
function f_l184(userData){
   var i, revsrats = "", dd, daysaway, mu, userimag;

   if ( userData[0].rg ) revsrats += "<span class='fa fa-star'></span>";
   if ( userData[0].rw ) revsrats += "<span class='fa fa-comment'></span>";
   dd = userData[0].la.split(/[- :]/);
   daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );

   mu = "<div id='i_k146'>" +
           "<select id='i_b153'>";
               for ( i = 0; i < userData.length; i++ )
                  mu += "<option value='" + i + "'>" + userData[i].id + "</option>";
   mu +=   "</select>" +
           "<div class='c_k18'>" +
              "<img id='i_r150' src='" + HARDCODE.image + userData[0].av + "' class='c_f35'/>" +
              "<div id='i_k148' class='c_o17'>" + userData[0].id + revsrats + "</div>" +
              "<div id='i_b147'>" + userData[0].un + "</div>" +
              "<div id='i_l149'>" + userData[0].kn + "</div>" +
              "<div id='i_c151'>" + userData[0].fn + "</div>" +
              "<div id='i_v152'>" + ( userData[0].em || "" ) + "</div>" +
              "<div id='i_e156'>" +
                  "<span>Logg: "   + userData[0].sl + "</span>" +
                  "<span>  Exam: " + userData[0].tt + "</span>" +
                  "<span>  Owns: " + userData[0].na + "</span>" +
              "</div>" +
              "<div id='i_i159'> Absent: <span style='color:red'>" + daysaway + "</span></div>" +
           "</div>" +
           "<div id='i_k144'>" +
              "<button id='i_o154'><span class='fa fa-list-ol'></span>Renumber</button>" +
              "<button id='i_k155'><span class='fa fa-exchange'></span>Relegate</button>" +
              "<button id='i_r158'><span class='fa fa-trash'></span>Delete</button>" +
              "<div    id='i_d157'></div>" +
           "</div>" +
        "</div>" +
        "<div id='i_e145'>";
   for ( i = 0; i < userData.length; i++ ) { dd = revsrats = "";
      userimag = HARDCODE.image + ( userData[i].av ? userData[i].av : "101" ) ;
      if ( userData[i].la ) dd = userData[i].la.split(/[- :]/);
      daysaway = Math.floor( ( new Date() - new Date( dd[0], dd[1]-1, dd[2], dd[3], dd[4], dd[5] ) ) / ( 1000 * 60 * 60 * 24 ) );
      if ( userData[i].rg ) revsrats += "<span class='fa fa-star'></span>";
      if ( userData[i].rw ) revsrats += "<span class='fa fa-comment'></span>";
      mu += "<div id='user_" + i + "' class='c_k18'>" +
               "<img src='" + userimag + "' class='c_f35'/>" +
               "<div class='c_o17'>" + userData[i].id + revsrats + "</div>" +
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
function f_s185(userData){
   var i, htmlarea, mainbutn, usermenu, usadores, renorrel, whattodo,
       leobject, renumber, relegate, sendtodb, nn_input, nn_stage;
   mainbutn = document.getElementById( "i_d50" );    usadores = document.getElementsByClassName("c_k18");
   htmlarea = document.getElementById( "i_d157" );    usermenu = document.getElementById( "i_b153" );
   renumber = document.getElementById( "i_o154" );    relegate = document.getElementById( "i_k155" );
   
   renumber.onclick = relegate.onclick = function(){ leobject = this;
      switch ( this ) {
         case renumber : renorrel = "ID Reassignment"; whattodo = "newid"; json1 = "oldid";  json2 = "newid"; break
         case relegate : renorrel = "Data Relegation"; whattodo = "urele"; json1 = "donor";  json2 = "towho"; break
      }
      htmlarea.innerHTML = f_a56("nn","",true,"") +
            "<button id='i_b26'>" +
               "<span class='fa fa-paper-plane'></span>" + TRANSLAT.savit +
            "</button>";
            nn_input  = document.getElementById( "nninp" ); nn_input.onfocus = f_c27;
            nn_stage  = document.getElementById( "nnstg" );
            sendtodb  = document.getElementById( "i_b26" );
            nn_input.onkeyup = function(e){ var k = ( e.keyCode ? e.keyCode : e.which );
               if ( k == "13" || k == "9" ) { 
                  if ( this.value.issane( DIGITREG[0] ) ) { // only numeric input
                     nn_stage.style.width = nn_stage.style.height = "34px";
                     f_l41(nn_input,"radGrun");
                     f_l31(this);
                     f_l23( sendtodb,1000 );
                  }
               }
            }
            sendtodb.onclick = function(){ f_o43( whattodo );
               switch ( leobject ) {
                  case renumber : jason = JSON.stringify({"oldid" : userData[ usermenu.value ].id, "newid" : nn_input.value}); break
                  case relegate : jason = JSON.stringify({"donor" : userData[ usermenu.value ].id, "towho" : nn_input.value}); break
               }
               f_65("admindex.php","tun=" + whattodo + "&was=" + jason ).then(
                  function( response ){ 
                     if ( response ) f_n47( response );
                     else f_l46( renorrel + " OK!");
                     mainbutn.click(); f_k44( whattodo ); mainbutn.click();
                  }, function( error ) { f_n47( error ); }
               );
            }
            f_z24( sendtodb, 1000, true );
   }

   for ( i = 0; i < usadores.length; i++ )
      usadores[i].onclick = function( e ){ usermenu.value = this.id.substr( 5, this.id.length ); usermenu.onchange(); }

}
function f_m186(userData){
   var erase, mainbutn, usermenu, userdet;
   erase    = document.getElementById( "i_r158" );
   mainbutn  = document.getElementById( "i_d50" );
   usermenu  = document.getElementById( "i_b153" );
   erase.onclick = function(){
      userdet  = document.getElementById( "user_" + usermenu.value );
      f_y48(userdet.innerHTML, TRANSLAT.delek, TRANSLAT.deldn,
         function(){},
         function(){
            f_n64("admindex.php/?tun=udele&was=" + userData[ usermenu.value ].id).then(
               function( response ){
                  if ( response ) { f_l46("Deletion succeeded!");
                     mainbutn.click();
                     mainbutn.click();
                  } else f_n47("Something went wrong");
               },
               function( error ) { f_n47( error ); }
            );
         }
      );
   }
}
function f_h187(XINFO,categ){
   var i, j, n = 0, retAR = new Array(), filter, filtro;
   filter = document.getElementById( "i_s19" );
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
function f_t188(){
   var SRCARRAY = TGTARRAY = new Array(), viewerNode, mediaCloner, k, s, t,
       sourceSel, scats, snots, sourceImg,
       targetSel, tcats, tnots, targetImg,
       qqShow, qaShow, aqShow, aaShow,
       controler, tastatuer, atellier;
   mediaCloner = document.getElementById( "i_o58" );
   viewerNode  = document.getElementById( "i_y138" );
   mediaCloner.onclick = function(){
      document.getElementById( "i_i57" ).onclick();
      viewerNode.innerHTML =
         "<div id='i_p23'>" +
            "<div    id='i_f13' class='c_z52'></div>" +
            "<input  id='i_s19'/>" +
            "<div id='i_f2'>" + f_z63("cloneSource",SERVINFO[0].langs,"en") +
               "<div id='i_f22'></div><select id='adminCloneSource'></select>" +
            "</div>" +
            "<div id='i_w1'>" + f_z63("cloneTarget",SERVINFO[0].langs,"en") +
               "<div id='i_n21'></div><select id='adminCloneTarget'></select>" +
            "</div>" +
         "</div>" +
         "<div id='i_h14'></div>" +
         "<div id='i_w3'></div>" +
         "<div id='i_a12'></div>";
      feedbaker = document.getElementById( "i_f13" );
      filtrator = document.getElementById( "i_s19" );
      sourceSel = document.getElementById( "cloneSourceLanguageSelect" );
      sourceImg = document.getElementById( "cloneSourceLanguageImage" );
      sourceKts = document.getElementById( "i_f22" );
      sourceNts = document.getElementById( "adminCloneSource" );
      targetSel = document.getElementById( "cloneTargetLanguageSelect" );
      targetImg = document.getElementById( "cloneTargetLanguageImage" );
      targetKts = document.getElementById( "i_n21" );
      targetNts = document.getElementById( "adminCloneTarget" );
      controler = document.getElementById( "i_h14" );
      tastatuer = document.getElementById( "i_w3" );
      atellier  = document.getElementById( "i_a12" );
      sourceSel.onchange = function(){ f_o43("sinfosrc");
         if ( f_i62( this.value ) )
            sourceImg.setAttribute("src", HARDCODE.image + f_i62( this.value ) );
         f_n64("?tun=sinfo&was=" + this.value ).then(
            function(response) { SRCARRAY = JSON.parse( response ); },
            function(error) { f_n47( error ); }
         ).then( function(){ scats = "";
            for ( k in SRCARRAY[0].katse ) scats += "<option value=" + SRCARRAY[0].katse[k] + ">" + katxy( SRCARRAY[0].katse[k] ) + "</option>";
            sourceKts.innerHTML = "<div><select id='i_p9'>" + scats + "</select></div>";
            sourceCat = document.getElementById( "i_p9" );
            sourceCat.onchange = function(){ sourceNts.innerHTML = "";
               snots = f_h187( SRCARRAY, this.value );  // Filter is used by this function
               for( s in snots ) sourceNts.innerHTML += "<option value='" + snots[s] + "'>" + snots[s] + "</option>";
            }; sourceCat.onchange(); f_k44("sinfosrc");
         });
      }; sourceSel.onchange();
      targetSel.onchange = function(){ f_o43("sinfotgt");
         if ( f_i62( this.value ) )
            targetImg.setAttribute("src", HARDCODE.image + f_i62( this.value ) );
         f_n64("?tun=sinfo&was=" + this.value ).then(
            function(response) { TGTARRAY = JSON.parse( response ); },
            function(error) { f_n47( error ); }
         ).then( function(){ tcats = "";
            for( k in TGTARRAY[0].katse ) tcats += "<option value=" + TGTARRAY[0].katse[k] + ">" + katxy( TGTARRAY[0].katse[k] ) + "</option>";
            targetKts.innerHTML = "<div><select id='i_m8'>" + tcats + "</select></div>";
            targetCat = document.getElementById( "i_m8" );  // Filter is used by this function
            targetCat.onchange = function(){ targetNts.innerHTML = "";
               tnots = f_h187( TGTARRAY, this.value );
               for ( t in tnots ) targetNts.innerHTML += "<option value='" + tnots[t] + "'>" + tnots[t] + "</option>";
            }; targetCat.onchange(); f_k44("sinfotgt");
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
            f_o43("ninfoclone");
            f_n64("?tun=ninfo&was=" + sname).then( function(response) { sdata = JSON.parse( response );
               f_n64("?tun=ninfo&was=" + tname).then( function(response) { tdata = JSON.parse( response );
                     ssize = sdata[1].qaimg.length; tsize = tdata[1].qaimg.length;
                  if ( ssize != tsize )
                     f_x39(feedbaker,"<markee> Incongruent Notions </markee>","radRojo");
                  else { // prepare Control Area Markup based on menu selections
                     f_x39(feedbaker,"<markee> Notion sizes match! </markee>","radGrun");
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
                  controler.innerHTML = f_h189(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize);
                  qqShow  = document.getElementById( "qqsho" ); qaShow  = document.getElementById( "qasho" );
                  aqShow  = document.getElementById( "aqsho" ); aaShow  = document.getElementById( "aasho" );
                  qqShow.onclick = qaShow.onclick = aqShow.onclick = aaShow.onclick = function(){
                     var isize = 50, istyl = "", soraw, taraw, soval, taval,
                         sqora = this.id.substr(0,1), tqora = this.id.substr(1,1),
                         dm = "<div id='i_a4'></div>" +
                              "<div id='i_x11' class='c_d21'>s0</div>" +
                              "<h4>"+ decodeURIComponent( sourceNts.value ) + " [ " +sqora + " ] ⇐⇒ " +
                                      decodeURIComponent( targetNts.value ) + " [ " +tqora + " ]</h4>";
                     sourceNts.onchange(); targetNts.onchange();
                     sqora == "q" ? soraw = sq : soraw = sa ; tqora == "q" ? taraw = tq : taraw = ta ;
                     for ( i = 0 ; i < ssize; i++ ) { // get this stuff sorted
                        soval = soraw[i]; taval = taraw[i];
                        if ( soval != taval ) istyl = " style=\'color:red;\' ";
                        else istyl = "";  // Show different ones as red
                        dm += "<div>" + 
                           "<input id='s" + i + "' class='c_a15' " + " size='" + isize + "' " + istyl + ' value="' + soval + '">' +
                           "<input id='t" + i + "' class='c_a15' " + " size='" + isize + "' " + istyl + ' value="' + taval + '">' +
                           "</div>";
                     }
                     atellier.innerHTML = dm;
                     tracking  = document.getElementById( "i_x11" );
                     clinputs = document.getElementsByClassName("c_a15");
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
                              seter(decodeURIComponent(nname),cname,this.value,cname,olval, function(){ f_k44("seter"); });
                              f_l41( this, "radBlau");
                           }
                        }
                        clinputs[i].onchange = function(e){ f_z19(this,13); }
                     }
                 }
                 medklon = document.getElementsByClassName( "c_b3" );
                 for ( i = 0; i < medklon.length; i++ )
                    medklon[i].onclick = function( e ){
                       this.id.substr(0,1) ==   "q" ? socol = "question" : socol = "answer";
                       this.id.substr(1,1) ==   "q" ? tacol = "question" : tacol = "answer";
                       this.id.substr(2,3) == "img" ? media="imageID"  : media="soundID";
                       f_65("admindex.php","tun=klmed&was=" + JSON.stringify({
                          "sonid":  sdata[0].nidno, "tanid":  tdata[0].nidno,
                          "socol":  socol, "tacol":  tacol,  "media": media
                       })).then(
                          function( response ){
                             if ( response ) f_n47( response );
                             f_k44("klmed");
                          },function( error ) { f_n47( error ); }
                       );
                    }
               }, function(error) { f_n47( error ); });
            }).then(function(){ f_k44("ninfoclone"); }); // outer GET
      } // sourceNts and targetNts
   } // media cloner
}
function f_h189(simgs,ssnds,qqiso,qaiso,aqiso,aaiso,ssize){
   var markup = "";
   markup += " Source : " + simgs + " Images + " + ssnds + " Sounds <br/><br/>";
   markup += "<div><button id='qqsho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.qkopf + " -- " + TRANSLAT.qkopf + " :" + qqiso + "/" + ssize + "&nbsp;&nbsp;";
   if( qqiso == ssize ) {
      if ( simgs )
         markup += "<button id='qqimg' class='c_b3'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='qqsnd' class='c_b3'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='qasho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.qkopf + " -- " + TRANSLAT.akopf + " :" + qaiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( qaiso == ssize ) {
      if ( simgs )
         markup += "<button id='qaimg' class='c_b3'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='qasnd' class='c_b3'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='aqsho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.akopf + " -- " + TRANSLAT.qkopf + " :" + aqiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( aqiso == ssize ) {
      if ( simgs )
         markup += "<button id='aqimg' class='c_b3'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='aqsnd' class='c_b3'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   markup += "<div><button id='aasho'>" + "<span class='fa fa-search'></span>" + TRANSLAT.pview + "</button>" +
          TRANSLAT.akopf + " -- " + TRANSLAT.akopf + " :" + aaiso + "/" + ssize + "&nbsp;&nbsp;";
   if ( aaiso == ssize ) {
      if ( simgs )
         markup += "<button id='aaimg' class='c_b3'>" +
                      "<span class='fa fa-picture-o'></span>Clone Images" +
                   "</button>";
      if ( ssnds )
         markup += "<button id='aasnd' class='c_b3'>" +
                      "<span class='fa fa-file-audio-o'></span>Clone Sounds" +
                   "</button>";
      markup += "</div>";
   } else markup += "</div>";
   return( markup );
}
function f_y190(){
   var KEEPLIST = 300,
       spurgeBtn, realarea;
   spurgeBtn = document.getElementById( "i_q51" );
   realarea  = document.getElementById( "i_y138" );
   spurgeBtn.onclick = function(){
         var i, j, k, l, sndAR, nsnAR, noise;
      document.getElementById( "i_i57" ).onclick();
      f_o43("allss");
      f_n64("admindex.php/?tun=allss").then(
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
                     seter("aasound","","DELETE","soundID",s2del, function(){ f_k44("seter"); });
                     f_z24(this,1000,true);
                  }
            }
         },
         function(error) { f_n47( error ); }
      ).then( function(){ f_k44("allss"); } );
   }
}
function f_k191(){
   var ipurgBtn, realarea, deleti;
   ipurgBtn = document.getElementById( "i_k59" );
   realarea = document.getElementById( "i_y138" );
   ipurgBtn.onclick = function(e){ var KEEPLIST = 300, d, i, j, k, l, imgAR, ntnAR, avaAR, nisAR, mundo;
         document.getElementById( "i_i57" ).onclick();
         f_o43("pimag");
         f_n64("admindex.php/?tun=pimag").then(function( response ){
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
               realarea.innerHTML += "<span class='c_r6 fa fa-trash' title='" + imgAR[i] + "'></span>";
            deleti = document.getElementsByClassName( "c_r6" );
            for ( d = 0; d < deleti.length; d++ ) deleti[d].onclick = function( e ){ leobject = this;
                  seter("aaimage","","DELETE","imageID",leobject.getAttribute("title"),
                        function(){ f_k44("seter"); f_z24(leobject,1000,true); });
               }
         }, function(error) { f_n47( error ); }
      ).then(function(){ f_k44("pimag"); });
   }
}
function f_z192(){
   var staticBtn, realarea, radio1, radio2, radio3, radio4, mapAddress, mapArea, zoomFactor = 5;
   staticBtn  = document.getElementById( "i_i61" );
   realarea   = document.getElementById( "i_y138" );
   staticBtn.onclick = function(){
      realarea.innerHTML = 
         "<div id='i_e10'>" +
            "<div id='radio'>" +
               "<input type='radio' id='radio1' name='radio'><label for='radio1'>Zoom 4</label>" +
               "<input type='radio' id='radio2' name='radio' checked='checked'><label for='radio2'>Zoom 5</label>" +
               "<input type='radio' id='radio3' name='radio'><label for='radio3'>Zoom 6</label>" +
               "<input type='radio' id='radio4' name='radio'><label for='radio4'>Zoom 7</label>" +
            "</div>" +
            "<div id='i_g160'></div>" +
            "<input id='i_o25' class='c_k2' value='Berlin'>" +
         "</div>";
      mapAddress = document.getElementById( "i_o25" );
      mapArea    = document.getElementById( "i_g160" );
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
function f_t193(){
   var GMPASSRC = "https://maps.googleapis.com/maps/api/js",
       GMAPSKEY = "AIzaSyDKPLdr0SOYenVMquLNFUHcmeNtddL38-A", // Loads Google Maps API Assynchronously and with a callback
       GMAPSURI = GMPASSRC + "?key=" + GMAPSKEY + "&sensor=false&callback=f_q194",
       gmapiScript   = document.createElement("script"),
       dynamicBtn;
       gmapiScript.type = "text/javascript";
       gmapiScript.src  = GMAPSURI;
   dynamicBtn = document.getElementById( "i_62" );
   dynamicBtn.onclick = function(e) { document.body.appendChild(gmapiScript); }
}
function f_q194(){
   var realarea, i_p176, geocoder, mapOptions, styles, styledMap, map;
   realarea   = document.getElementById( "i_y138" );
   realarea.innerHTML = "<div id='i_e10'>" +
                           "<div id='i_g160'></div>" +
                           "<input id='i_o25' value='Berlin'>" +
                           "<button id='i_p176'>Encode</button>" +
                        "</div>";
   i_p176  = document.getElementById( "i_p176" );
   i_p176.onclick = function(){
      var address = document.getElementById("i_o25").value;
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
  map=new google.maps.Map( document.getElementById("i_g160"), mapOptions);
  map.mapTypes.set('map_style', styledMap);
  map.setMapTypeId('map_style');
}
function f_c195( cback ){
   var betaButton = document.getElementById( "i_m67" );
   betaButton.onclick = cback;
}
function f_w196(target_id){
   dbugbtn = document.getElementById( "i_h66" );
   dbugbtn.onclick = function(){
      document.getElementById( "i_i57" ).onclick();
      f_o43("debug");
         f_n64("admindex.php/?tun=debug").then(
            function( response ) {
               target_id.innerHTML = response;
            }, function( error ) { }
         ).then ( function(){ f_k44("debug"); } );
   }
}
function f_r197(){
   var decache = document.getElementById( "i_j65" );
   decache.onclick = function(){ f_o43("xcach");
      document.getElementById( "i_i57" ).onclick();
      f_65("admindex.php","tun=xcach").then(
         function(response){ f_k44("xcach"); },
         function( error ) { f_n47(error); }
      );
   }
}
function f_l198(e,cette,Obj){
   var medid, media, instr, dn_input, editor,
       k = ( e.keyCode ? e.keyCode : e.which );
   instr  = document.getElementById( "mediaEditInstruction" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "i_i64" );
   if ( k == "13" || k == "9" ) { // only handle keydown "Enter" or "Tab"
      if ( cette.value.issane( DIGITREG[0] ) ) { // only numeric IDs
         //f_h40(instr,"","black");
         f_n30.apply(cette,[cette,dn_input]);
         medid = parseInt( cette.value );
         media = f_g199(cette.value,Obj);
         if ( media != -1 ) {
            dn_input.value = Obj[media].nom;
            editor.setAttribute("title",medid);
         } else dn_input.value = "";
      } else { f_h40(instr,TRANSLAT.notre,"red");
         f_l41( cette ,"radRojo");
         dn_input.value = "";
      }
   }
}
function f_g199( medid, Obj ){ for ( i = 0; i < Obj.length; i++ ) if ( Obj[i].idx == medid ) return (i); return(-1); }
function f_f200(Obj,gnode,startIdx,gsize,medium){
   var i, grenze, meinpu, dn_input, editor, morep, gmarkup = "", galembas;
   meinpu = document.getElementById( "meinp" );
   dn_input = document.getElementById( "dninp" );
   editor = document.getElementById( "i_i64" );
   morep  = document.getElementById( "i_h35" );
   grenze = parseInt( startIdx + gsize );
   if ( grenze > Obj.length ) grenze = Obj.length;
   if ( startIdx >= Obj.length ) { f_r38(morep,"radBlau",true); return; }
   for ( i = startIdx; i < grenze; i++ ) {
      if ( medium == "image" ) {
         if ( Obj[i].idx ) 
              gmarkup += "<img  class='c_l80' title='" + Obj[i].idx + "' src='" + HARDCODE.image + Obj[i].idx + "'/>";
         else gmarkup += "<img  class='c_l80'                            src='" + HARDCODE.image + "101" + "'/>";
      } else  gmarkup += "<span class='c_l80 fa fa-headphones' title='" + Obj[i].idx + "'></span>";
   }
   gnode.innerHTML = gmarkup;
   galembas = document.getElementsByClassName("c_l80");
   for ( i = 0; i < galembas.length; i++ ) {
      galembas[i].onclick = function(e) {
         meinpu.value = this.getAttribute("title"); f_z19(meinpu,13);
         dn_input.value = Obj[f_g199(this.getAttribute("title"),Obj)].nom;
         editor.setAttribute("title",this.getAttribute("title"));
      }
   }
}
function f_z201( node, Obj, defsiz, medium){
   var DATASIZE = 500,                        // Unlink from f_f200 before modularizing
       ppage, pages, morep, galembas, htreq;
   node.innerHTML =
      "<div     class='c_v13'>" + TRANSLAT.pages +
         "<span class='c_m11'> 1 </span>" +
         "<span class='c_m11'> 2 </span>" +
         "<span class='c_m11'> 3 </span>" +
         "<span class='c_m11'> 4 </span>" +
         "<span class='c_m11'> 5 </span>" +
         "<span id='i_h35' class='c_j1'>" + TRANSLAT.mload + "</span>" +
         f_e57("pp",["25","50","100"],defsiz,false) +
      "</div>";
   if ( medium == "image" ) htreq = "idata"; else htreq = "sdata";
   ppage  = document.getElementById( "ppsel" );
   pages  = document.getElementsByClassName( "c_m11" );
   morep  = document.getElementById( "i_h35" );
   galembas = document.getElementById( "i_a63" );
   ppage.onchange  = function(e) { f_f200(Obj,galembas,0,this.value,medium); }
   morep.onclick   = function(e) { f_o43("morep");
      f_n64("admindex.php/?tun=" + htreq + "&was=" +
         JSON.stringify({"fromi":parseInt(Obj[Obj.length-1].idx),"xmany":DATASIZE})
      ).then(function( response ){
         if ( response ) Obj.push.apply( Obj, JSON.parse( response ) );
      }, function ( error ) { f_n47( error ); }).then(function(){ f_k44("morep"); });
   }
   for ( i = 0; i < pages.length; i++ ) {
      pages[i].onclick = function(e) { var cette = this;
         for ( i = 0; i < pages.length; i++ ) f_l41(pages[i],"radWeis");
         setTimeout(function(){ f_l41(cette,"radBlau"); } ,500);
         f_f200(Obj,galembas, parseInt(ppage.value) * ( parseInt(this.innerHTML ) - 1 ),parseInt(ppage.value),medium);
      }
   }
}
function f_y202(){
   var DATASIZE = 500,
       seditBtn  = document.getElementById( "i_j52" );
   seditBtn.onclick = function(){
      var CODESTR = HARDCODE.grava,
          workarea, sonolist, me_input, dn_input, editsono, galembas, navgator;
      workarea = document.getElementById( "i_y138" );
      workarea.innerHTML = f_a56("me","1",true,"") + f_a56("dn","",true,"") +
         "<button id='i_i64'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='i_a63'></div>" +
         "<div id='i_k55' class='c_v13'></div>";
      document.getElementById( "i_i57" ).onclick();
      f_o43("sdata");
      f_n64("admindex.php/?tun=sdata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) sonolist = JSON.parse( response );
         me_input = document.getElementById( "meinp" );           dn_input = document.getElementById( "dninp" );
         editsono = document.getElementById( "i_i64" );    galembas = document.getElementById( "i_a63" );
         navgator = document.getElementById( "i_k55" );
         f_f200( sonolist, galembas, 0, 100, "sound");  f_z201( navgator, sonolist, 100, "sound");
         editsono.onclick = function(e){ var snsrc = this.getAttribute("title");
            f_x50("soundEditor",
               f_p146("se") + "<div id='sephp' class='c_t10'></div>",
               function(){
                  f_z24( document.getElementById( "soundEditorZentralUser" ), 10, true );
                  f_g147("se",CODESTR,snsrc,snsrc);
                  f_r155("se","",snsrc,"","");
               },
               function(){ f_g86(); f_i87(); }
            );
         }
         me_input.onfocus = f_c27;
         me_input.onkeydown = function(e) { f_l198(e,this,sonolist); }
         dn_input.onchange = function(e) {
            seter("aasound","name",this.value,"soundID",me_input.value,function(){ f_l41(dn_input,"radGrun"); });
         }
      }, function(error) { f_n47( error ); }).then( function(){ f_k44("sdata"); } );
  
   }
}
function f_c203(){
   var DATASIZE = 500, ieditBtn = document.getElementById( "i_t60" );
   ieditBtn.onclick = function(){
      var workarea, imagenes, me_input, dn_input, editimag, galembas, navgator, previews;
      workarea = document.getElementById( "i_y138" );
      workarea.innerHTML = f_a56("me","1",true,"") + f_a56("dn","",true,"") +
         "<button id='i_i64'>" +
            "<span class='fa fa-pencil'></span>" + TRANSLAT.amend +
         "</button>" +
         "<div id='i_a63'></div>" + 
         "<div id='i_k55' class='c_v13'></div>" +
         "<div id='i_g54'></div>";
      document.getElementById( "i_i57" ).onclick();
      f_o43("idata");
      f_n64("admindex.php/?tun=idata&was=" + JSON.stringify({"fromi":0,"xmany":DATASIZE})).then(function( response ){
         if ( response ) imagenes = JSON.parse( response ); 
         me_input = document.getElementById( "meinp" );             dn_input = document.getElementById( "dninp" );
         editimag = document.getElementById( "i_i64" );      galembas = document.getElementById( "i_a63" );
         navgator = document.getElementById( "i_k55" );      previews = document.getElementById( "i_g54" );
         f_f200( imagenes, galembas, 0, 100, "image");    f_z201( navgator, imagenes, 100, "image");
         editimag.onclick  = function(e) { f_y151("ie"); }
         me_input.onfocus  = f_c27;
         me_input.onkeydown = function(e){ var k=(e.keyCode ? e.keyCode : e.which);
            f_l198( e, this, imagenes);
            if ( k == "13" ) previews.innerHTML = "<img width=40% src='" + HARDCODE.image + me_input.value + "'>";
         }
         dn_input.onchange = function(e) {
            seter("aaimage","name",this.value,"imageID",me_input.value,function(){ f_l41(dn_input,"radGrun"); });
         }
     }, function( error ){ f_n47(error); }).then(function(){ f_k44("idata"); });  // The get
   } 
}
