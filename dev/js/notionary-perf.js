function concludeTest(testtype,right,score,dauer,probs){
   DEBUGGER?console.log("[concludeTest]"):0;
   var s, performance, xamrestitle, xamresoffer,
       temporaNode, panelaZwote,
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
            temporaNode = document.getElementById( "perfTemporaHolder" );
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
      // FB.ui share stub — Facebook SDK removed; no-op.
   });
}
