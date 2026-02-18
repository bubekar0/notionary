function markupIdempotentButtons(){
   DEBUGGER?console.log("[markupIdempotentButtons]"):0;
   return("<div class='notionary-idempotent'>" +
      "<button id='mix1b'>" +
         "<span class='fa fa-mouse-pointer'></span>" +
         "<span class='fa fa-mouse-pointer'></span>" +
         TRANSLAT.trial +
      "</button>" +
      "<button id='mix2b'>" +
         "<span class='fa fa-pencil'></span>" +
         "<span class='fa fa-pencil'></span>" +
         TRANSLAT.write +
      "</button>" +
      "<span id='displayMixedCounter'></span>" +
   "</div>");
}
function superSchreiber(supid){
   DEBUGGER?console.log("[superSchreiber]"):0;
   var i, creimg, sidx;
   creimg = HARDCODE.image + "101";
   for ( i = 0; i < SERVINFO[3].supers.length; i++ )
      if ( SERVINFO[3].supers[i].supid == supid ) sidx = i;
   if ( SERVINFO[3].supers[sidx].ownav ) creimg = HARDCODE.image + SERVINFO[3].supers[sidx].ownav;
   return( SERVINFO[3].supers[sidx].sname + 
      "<div class='notionary-creavatar'>" + TRANSLAT.creby +
            SERVINFO[3].supers[sidx].owner.kurzen( OWNERMAX ) +
         "<img src='" + creimg + "'/>" +
      "</div>" +
      "<span class='notionary-call2act'>" + SERVINFO[3].supers[sidx].sdesc + "</span>");
}
function ninfoSchreiber(nobj){
   DEBUGGER?console.log("[ninfoSchreiber]"):0;
   // A decent looking summary info about the Notion as a tooltip on Accordion
   var imag0, pacar = champ = myone = mytwo = mytre = myall ="";
   if(nobj.piece)
      pacar = "<div class='notionary-groupie'>" +
                 "<span class='bnero'>" + TRANSLAT.teile +
                         nobj.piece + "&nbsp;" + TRANSLAT.outof + nobj.parts +
                 "</span>" +
              "</div>";
   nobj.ownav ? imag0 = HARDCODE.image + nobj.ownav : imag0 = HARDCODE.image + "101";
   if ( nobj.mysc1 ) myone = "<br/>[➊]✔" + nobj.mysc1 + "%(" + convertSecondsToTime(nobj.mybt1) + ")<br/>";
   if ( nobj.mysc2 ) mytwo = "[➋]✍" + nobj.mysc2 + "%(" + convertSecondsToTime( nobj.mybt2 ) + ")<br/>";
   if ( nobj.mysc3 ) mytre = "[❸]☜" + nobj.mysc3 + "%(" + convertSecondsToTime( nobj.mybt3 ) + ")<br/>";
   if ( myone + mytwo + mytre != "" ) // Don't render scores unless thre is at least one
      myall = "<div class='notionary-myscores'>" +
                 "<span class='bnero'>" + TRANSLAT.perfo + "</span>" +
                  myone + mytwo + mytre +
              "</div>";
   if (nobj.chmp1 ) // Don't render Champion info unles there is one
      champ = "<div class='notionary-champion'>"+
                 "<span class='bnero'>"  + TRANSLAT.rekor + "</span>" +
                 "<span class='bnero'>[" + nobj.chmp1.kurzen( CHAMPMAX ) + "]</span> " +
                 "<span class='bnero'>"  + nobj.scor1 +
                        "%(" + convertSecondsToTime(nobj.time1) + ")" +
                 "</span>" +
              "</div>";
   return(nobj.nname + "<div class='notionary-creavatar'>" +
             "<span class='nnero'>" + TRANSLAT.creby + "</span>" +
             nobj.owner.kurzen( OWNERMAX ) + 
             "<img src='"+ imag0+"'/>"+
          "</div>" +
          pacar + myall +
          "<span class='notionary-call2act'>" + nobj.ndesc + "</span>" +
          formatGenericReviews(nobj.revus));
}
function formatGenericReviews(reviews){
   DEBUGGER?console.log("[formatGenericReviews]"):0
   // Markup the passed Reviews in a standard form
   var i, rvstr = "<div>", huwat, revAR = new Array();
   revAR = reviews.split( "￭" );
   if ( revAR.length > 1 ) rvstr += "<span class='nhony'>" + TRANSLAT.revus + "</span><br/>";
   for ( i = 0; i < revAR.length-1; i++ ) {
      huwat = revAR[i].split( "-->>" );
      rvstr += "<span class='sazur'>" + huwat[0].kurzen( REVUEMAX ) + ": </span><br/>"+
               "<span class='sgrun'>" + huwat[1] + "</span><br/>";
   }
   rvstr += "</div>";
   return( rvstr );
}
function computeLearnedPercent(keyAR,title,trailer){
   DEBUGGER?console.log("[computeLearnedPercent]"):0;
   var x, progress, totalProgress = 0;
   for( x=0; x < keyAR.length; x++ ){
      progress = 0; 
      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc1") ) progress = 0.33;
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc2") ) progress = 0.66;
         if( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc3") ) progress = 1.00;
      } catch(err){};
      totalProgress += progress;
   }
   if( totalProgress > 0 ) return(" " + Math.round(100*totalProgress/keyAR.length) +"% "); else return("");
}
function markupNotionsSummary(keyAR,titular,trailer){
   DEBUGGER?console.log("[markupNotionsSummary]"):0;
   // Source used to be one of : (found|meine|npops|rcent|nrels)
   var mu = mobMU = "", x, autor, title, sterne, nenco, nquot, nisrc; 
   mu += markupIdempotentButtons() + "<h2>" + titular + "</h2>";
   for ( x=0; x < keyAR.length; x++ ) {
      percnt = "<div class='notionary-prozent'></div>";
      keyAR[x].nimag ? nisrc = HARDCODE.image + keyAR[x].nimag : nisrc = HARDCODE.image + "101";
      nquot = keyAR[x].nname.sauber();  // good enough for HTML markup

      try { // For user records see UNIFO[1]; other cached files are empty or unreliable
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc1") )
            percnt="<div class='notionary-prozent'> 33%" + TRANSLAT.compl + "</div>";
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc2") )
            percnt="<div class='notionary-prozent'> 66%" + TRANSLAT.compl + "</div>";
         if ( getFromUINFO1( "nidno", keyAR[x].nidno, "mysc3") )
            percnt="<div class='notionary-prozent'>100%" + TRANSLAT.compl + "</div>";
      } catch(err){};

      sterne = "";
      for ( i = 1; i <= parseInt(keyAR[x].rated); i++ ) sterne += "<span class='fa fa-star'></span>";
      sterne = '<div class="notionary-ratings">' + sterne + '</div>';
      title = "[" + nquot + "] " + keyAR[x].ndesc.sauber();
      if ( ( keyAR[x].ownid == USERINFO[0].uidno ) || ( USERINFO[0].uidno == "1" ) ) autor = true;
      else autor = false;
      nenco = encodeURIComponent( HARDCODE.myurl + "?tun=trial&was=" + keyAR[x].nname );

      mu += '<div class="notionary-plainnotion" title="' + title +'" rname="' + nquot + '"'+
                  " picto='" + keyAR[x].picto + "' " +
                  " forja='" + keyAR[x].forja + "'>" +
               "<input type='checkbox' " +
                  " class='notionary-checkbox' title='" + TRANSLAT.multi + "' "+
                  ' nname="' + nquot + '"/>'+
               "<div class='notionary-notioname'>" + nquot + "</div>" +
                  "<img class='notionary-thumbnail' src='" + nisrc + "'/>" +
                  "<div class='notionary-howmany'>" + TRANSLAT.total + keyAR[x].nsize + "</div>" +
                  sterne  + percnt ;

           if ( keyAR[x].chmp1 ) mu +=
                    "<div class='notionary-topscore'>" +
                       "<span>"  + TRANSLAT.rekor + "</span>" +
                       "<span>[" + keyAR[x].chmp1.kurzen( CHAMPMAX ) + "]</span> " +
                       "<span>"  + keyAR[x].scor1 +
                              "%(" + convertSecondsToTime(keyAR[x].time1) + ")" +
                       "</span>" +
                    "</div>";


      mu += "</div>";

   }
   return( mu + trailer );
}
function bindNotionDisplayWidgets(){
   DEBUGGER?console.log("[bindNotionDisplayWidgets]"):0;
   var MULTIMAX = 5,
       i, kernNode, mixnum,
       lapices, likables, notpads,/* zeroes, singles, couples, troikas,*/ chekers,
       nopictos, noformos, japictos, jaformos;

   document.body.scrollTop = document.documentElement.scrollTop = 0;

   kernNode = document.getElementById( "anonRealarea" );            
   mix1id   = document.getElementById( "mix1b" );           mix1id ? mix1id.style.visibility = "hidden" : 0;
   mix2id   = document.getElementById( "mix2b" );           mix2id ? mix2id.style.visibility = "hidden" : 0;
   mixnum   = document.getElementById( "displayMixedCounter" );


   lapices = document.getElementsByClassName("notionary-plainnotion");
   for ( i = 0; i < lapices.length; i++ )
      lapices[i].onclick = function( e ){ 
         window.location.href = HARDCODE.myurl + "?tun=trial&was=" + this.getAttribute("rname");
      }

   likables = document.getElementsByClassName( "notionary-likeable" );
   for ( i = 0; i < likables.length; i++ ) likables[i].onmouseover = function( e ){
      if ( this.alreadyHovered == null ) { // Hover once (catch event once via dummy variable Hack )
         this.innerHTML = 
            fbookButton("flike","like", getLocale(), this.getAttribute("nurl"),true,"width:120px;height:21px;") +
            tweetButton("tlike","tweet",getGlocale(),this.getAttribute("nurl"),
                        TRANSLAT.using.escapo() + " ☞  " + this.getAttribute("nurl"),"width:115px;height:21px;");
            //gplusButton("glike","plus1",this.getAttribute("nurl"),true);
         FB.XFBML.parse();   // Looks like hidden fblik and twitt btns aren't rendered unless reparsed by FFox
         gLangLoader("https://apis.google.com/js/platform.js",getGlocale());
         this.alreadyHovered = true;
      }
   }

   notpads = document.getElementsByClassName( "notpad" );
   for ( i = 0; i < notpads.length; i++ )
      notpads[i].onclick = function( e ){
            window.location.href = HARDCODE.myurl + "?tun=trial&was=" + this.getAttribute("nname");
                           }
   chekers = document.getElementsByClassName( "notionary-checkbox" );


   for ( i = 0; i < chekers.length; i++ ) {
      nopictos = document.querySelectorAll('[picto="false"]'); noformos = document.querySelectorAll('[forja="false"]');
      japictos = document.querySelectorAll('[picto="true"]');  jaformos = document.querySelectorAll('[forja="true"]');
      chekers[i].onclick = function(e) { e.stopPropagation();
         var nindx;
         if ( this.checked ) { // checking adds to list
            WAHLLIST[ SELECTED++ ] = this.getAttribute("nname"); mixnum.innerHTML = SELECTED;
            if ( SELECTED > MULTIMAX ) // enforce Max mix
               for ( i = 0; i < chekers.length; i++ ) if ( !chekers[i].checked ) chekers[i].style.visibility = "hidden";
         } else {  // must be removing notion form the list then
            nindx = WAHLLIST.indexOf( this.getAttribute("nname") ); WAHLLIST.splice( nindx, 1 );   SELECTED--;
            if ( SELECTED != 0 ) mixnum.innerHTML = SELECTED; else mixnum.innerHTML = "";
            if ( SELECTED <= MULTIMAX ) for ( i = 0; i < chekers.length; i++ ) chekers[i].style.visibility = "visible";
         }
         // Show multi-buttons when you have at least a pair of ticked checkboxes
         if ( SELECTED > 1 ) { 
            mix1id.style.visibility = "visible"; blinkNode(mix1id,"radBlau", true);
            mix2id.style.visibility = "visible"; blinkNode(mix2id,"radBlau", true);
         } else { mix1id.style.visibility = "hidden";  mix2id.style.visibility = "hidden"; }
         if ( SELECTED == 1 ) { // Ensure no Notion/Piction/Formulation mixing
            // If a Piction is picked first, eliminate all non - piction choices
            if ( this.parentNode.parentNode.getAttribute("picto") == "true" ) // just pictions
               for ( i = 0; i < nopictos.length; i++ )   nopictos[i].style.display = "none";
            else if ( this.parentNode.parentNode.getAttribute("forja") == "true" ) // just formulations
               for ( i = 0; i < noformos.length; i++ )   noformos[i].style.display = "none";
            else { // just notions
               for ( i = 0; i < japictos.length; i++ )   japictos[i].style.display = "none";
               for ( i = 0; i < jaformos.length; i++ )   jaformos[i].style.display = "none";
            }
         }
      }
   }

   // Between ninfo and mixqa You must choose to put one in the other or else you wont
   // know which ends up first and where to put rest of dependent code (go4it)
   // We have a nice wrapper for 'ninfo' so use it -->> jasonNINFO()
   if ( mix1id ) mix1id.onclick = function(){ onNAJAX("mixqa");
      jasonNINFO( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         httpget("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if ( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix1b" );
               }
            },
            function(error) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("mixqa"); } );
      });
   }
   if ( mix2id ) mix2id.onclick = function(){ onNAJAX("mixqa");
      jasonNINFO( WAHLLIST[0], function(){ // After successfull load of NINFDATA go for VIELDATA
         httpget("?tun=mixqa&was=" + JSON.stringify({"nlist":WAHLLIST}) ).then(
            function(response) {
               if( response ) { VIELDATA = JSON.parse(response);
                  go4it( NINFDATA[0].nname, "mix2b" );
               }
            },
            function(error) { clickNotiz( error ); }
         ).then( function(){ offNAJAX("mixqa"); } );
      });
   }
}
