function bindRatingsButtons(){
   DEBUGGER?console.log("[bindRatingsButtons]"):0;
   var i, ratings, theRating, ratsHolder;
   ratsHolder = document.getElementById( "perfNotionRating" );
   ratings = document.getElementsByClassName( "notionary-ratings" );
   for ( i = 0; i < ratings.length; i++ )
      ratings[i].onclick = function( e ){
         this.setAttribute("disabled","true");
         this.classList.remove("notionary-opaque");
         theRating = this.getAttribute("title");
         onNAJAX("raupd");
         httpost("usrindex.php","tun=raupd&was=" + JSON.stringify(
            { "nidno": NINFDATA[0].nidno,
              "rated": theRating
            })
         ).then( function( response ) {
               if ( response ) clickNotiz( response );
               else { popupFAI("fa-check","#4D90FE","1em"); ausblenden(ratsHolder,1000,false); }
            }, function( error ) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("raupd"); } );
      }
}
function bindShareByMailButton(){
   DEBUGGER?console.log("[bindShareByMailButton]"):0;
   var msend, whoto, whstg, temporaNode, my_OFF, my_FB;
   msend = document.getElementById( "mail2" );
   if ( msend ) msend.onclick = function(){
      temporaNode = document.getElementById( "perfTemporaHolder" );
      temporaNode.innerHTML = "<span  class='notionary-exbutton fa fa-times'></span>"+
                              "<div   class='notionary-feedback'></div>" +
                              markupSmartInput("sh",TRANSLAT.emtxt,true,"");
      einblenden( temporaNode, 1000);
      my_OFF = temporaNode.firstChild; my_OFF.onclick = function(e){ ausblenden(temporaNode,1000,false); }
      my_FB  = my_OFF.nextSibling;    announce(my_FB,msend.getAttribute("title"),"radTang");
      whoto = document.getElementById( "shinp" ); whstg = document.getElementById( "shstg" );
      whoto.onfocus = function(e){ this.value = ""; activateInput( this ); }
      whoto.onkeydown = function(e){ k =  (e.keyCode ? e.keyCode : e.which );
         clearInput( this );
         if ( k == "13" || k == "9" ){
            if ( sanitized( this.value, EMAILREG ) ) {
               colorById( this,"radGrun");
               deactivateInput( this );
               shstg.style.width = shstg.style.height = "34px";
               onNAJAX("mail2");
               httpost("usrindex.php","tun=mail2&was=" + JSON.stringify({
                        "whoto": this.value, "prfid": msend.getAttribute("prfid") })).then(
                     function( response ){ },
                     function( error ){ announce(my_FB,error,"radRojo"); }
                  ).then(function(){ ausblenden(temporaNode,1000,false); offNAJAX("mail2"); });
            } else { announce(my_FB,TRANSLAT.eapls,"radRojo"); colorById( this,"radRojo"); }
         }
      }
      whoto.style.visibility = "visible";
   }
}
function concludeTest(testtype,right,score,dauer,probs){
   DEBUGGER?console.log("[concludeTest]"):0;
   var s, performance, xamrestitle, xamresoffer,
       reviewerBtn, temporaNode, commentBox, panelaZwote,
       cette, playables, testsTaken1, holdsTest1,
       testsTaken2, holdsTest2, testsTaken3, holdsTest3;
   httpget("usrindex.php/?tun=ercau");
   onNAJAX("doneTest");
   httpost("php/doneTest.php","pdata=" + JSON.stringify(
      { "nidno": NINFDATA[0].nidno, "ttype": testtype, "right": right,
        "score": score, "dauer": dauer, "probs": probs })).then(function( response ){
         if ( response ){ document.body.innerHTML = response;
            performance = document.getElementById( "perfArea" );
            xamrestitle = document.getElementById( "prfid" );
            xamresoffer = document.getElementById( "offff" );
            reviewerBtn = document.getElementById( "reviewStandaloneButton" );
            temporaNode = document.getElementById( "perfTemporaHolder" );
            commentBox  = document.getElementById( "perfCommentBox" );
            panelaZwote = document.getElementById( "perfPanela2" );

            xamrestitle.setAttribute("class","notionary-feedback");
            xamresoffer.classList.add("class","notionary-exbutton");
            xamresoffer.onclick = function(e) { landingPage(); showSupers(); }

            if ( LOGGEDIN && !SMARTFON ) {
               holdsTest1  = document.getElementById( "ones" );
                             if ( holdsTest1 ) testsTaken1 = holdsTest1.getAttribute("count1");
               holdsTest2  = document.getElementById( "twos" );
                             if ( holdsTest2 ) testsTaken2 = holdsTest2.getAttribute("count2");
               holdsTest3  = document.getElementById( "tris" );
                             if ( holdsTest3 ) testsTaken3 = holdsTest3.getAttribute("count3");
            }
            switch( testtype ) {
               case 'trial': popupFAI("fa-shield", "#4D90FE", "2em"); break;
               case 'write': popupFAI("fa-trophy", "#2B7930","2em"); break;
               case 'adept': popupFAI("fa-star",   "#E78F08","2em"); break;
            }
            jasonNINFO( NINFDATA[0].nname, function(){ // Update NINFDATA with this test
               jasonUINFO( function(){ // Update USERINFO with this test
                  if ( LOGGEDIN ) {
                     if ( reviewerBtn ) { onNAJAX("getme");
                        httpget("usrindex.php/?tun=getme&was=" + JSON.stringify(
                           { "secol": "review",
                             "vonta": "aareview",
                             "wocol": "notionID",
                             "valis":  NINFDATA[0].nidno
                           })
                        ).then(
                           function( response ){ var my_FB, defText, holder, texter;
                              defText = TRANSLAT.kmdef;
                              if ( response ) defText = response;
                              commentBox.innerHTML = markupComment("perfReview",8,40,defText);
                              holder = document.getElementById( "perfReviewCommentHolder" );
                              texter = document.getElementById( "perfReviewCommentTextarea" );
                              my_FB  = document.getElementById( "perfReviewCommentFeedback" );
                              announce(my_FB,TRANSLAT.kmnts,"radTang");
                              ausblenden(holder,1000,true);
                              bindComment("perfReview",TRANSLAT.kmdef,10,100,/[^§(){}%$*+!"`\\\^]/,reviewerBtn,"",
                                 function(){}, function(){}, function(){ onNAJAX("reupd");
                                    httpost("usrindex.php","tun=reupd&was=" + JSON.stringify(
                                       { "nidno": NINFDATA[0].nidno,
                                         "rview": texter.value
                                       })
                                    ).then( function(response) {
                                          if ( response ) clickNotiz( response );
                                          else { popupFAI("fa-check","#4D90FE","1em"); ausblenden(holder,1000,true); }
                                       }, function( error ) { clickNotiz( error ); }
                                    ).then( function(){ offNAJAX("reupd"); } );
                                 });
                           },
                           function( error ){ clickNotiz( error ); }
                        ).then(function(){ offNAJAX("getme"); });
                     }
                     bindRatingsButtons(); bindShareByMailButton();
                  }
                  if ( s = isInSuperNotions( NINFDATA[0].nidno ) ) showSuperNotion(s,panelaZwote);
                  playables = document.getElementsByClassName( "playme" );
                  for ( i = 0; i < playables.length; i++ ) {
                     playables[i].onmouseover = function( e ){ cette = this;
                        if ( !SOUNDHOV ) SOUNDHOV = setTimeout(function(){ SOUNDHOV = null;
                              playByID( cette.getAttribute("sndid") ); },1000);
                     }
                     playables[i].onmouseout = function( e ){ cette = this;
                        if ( SOUNDHOV ){ clearTimeout( SOUNDHOV ); SOUNDHOV = null; }
                     }
                  }

               });
            });
         }
      },function( error ){ clickNotiz( error ); }
   ).then(function(){ offNAJAX("doneTest");
      var nimag, nlink;
      nimag = NINFDATA[0].nimag ? NINFDATA[0].nimag : "101";
      nlink = HARDCODE.myurl + "?tun=trial&amp;was=" + NINFDATA[0].nname.escapo();
      FB.ui({
          method:         "feed",
          app_id:         "'" + HARDCODE.fapid + "'",
          link:           nlink,
          picture:        HARDCODE.image + nimag,
          description:    score + "% " + convertSecondsToTime(dauer) + TRANSLAT.using,
          caption:        "'[ " + NINFDATA[0].nname + " ] " + NINFDATA[0].ndesc + "'" },
          function(response) {
             if (response && !response.error_message) console.log('Posting completed.');
             else console.log('Error while posting.');
          }
      );
   });
}
