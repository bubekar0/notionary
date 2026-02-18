// SOUNDS
function markupRecorder(inits){
   DEBUGGER?console.log("[markupRecorder]"):0;
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
function bindRecorder(inits,nname,frage,currs){
   DEBUGGER?console.log("[bindRecorder]"):0;
   onNAJAX("recorder");
   loadJS("js/recorder.js").then(function(){
      loadJS("js/recorderWorker.js").then(function(){
         bindRecorderGuts(inits,nname,frage,currs);
      });
   }).then( function(){ offNAJAX("recorder"); });
}
function bindRecorderGuts(inits,nname,frage,currs){
   DEBUGGER?console.log("[bindRecorderGuts]"):0;
   var CODESTR = HARDCODE.grava,
       recorder, stopper, audio, spinner, recobtn, stopbtn, donebtn, listen;
   audio   = document.getElementById( inits + "Audio");
   spinner = document.getElementById( inits + "Spiner");
   recobtn = document.getElementById( inits + "Record");
   stopbtn = document.getElementById( inits + "Stop");
   donebtn = document.getElementById( inits + "Done");
   listen  = document.getElementById( inits + "Listen");
   ausblenden( donebtn , 2000, false);
   window.URL = window.URL || window.webkitURL;
   navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia ||
                            navigator.mozGetUserMedia || navigator.msGetUserMedia;
   recobtn.onclick = function(){
      ausblenden( donebtn, 2000, false); einblenden( spinner, 2000);
      stopbtn.onclick = function(){ // click bind IFF "RECORD" clicked
         clearTimeout(stopper); recorder.stop();
         recorder.exportWAV(function(stream){ // get blob sound data base64
            var reader = new FileReader();
            audio.src = window.URL.createObjectURL(stream);
            reader.onload = function(event){ // The spinner suffices onNAJAX("qsupd");
               httpost("usrindex.php","tun=qsupd&was=" +
                  JSON.stringify({"nname":nname, "frage":frage, "data":event.target.result })
               ).then(
                  function( response ) {
                     if (  response  ) {
                        sonido = JSON.parse( response );
                        sndid  = sonido.sndid; sname = sonido.name;
                        bindNodeToSound(listen,sndid + "&r=" + Math.random() * 100,false);
                        einblenden( donebtn, 2000);
                        // Admin Sound Editor (CODESTR) - Otherwise must be naryEdit | naryExam (Pause|Contrib)
                        if ( nname != CODESTR ) updateNotionEditor(inits,nname,frage,sndid);
                     } 
                     ausblenden( spinner, 2000, false);
                  },
                  function( error ){ clickNotiz( error ); }
               ); // Spinner suffices.then(function(){ offNAJAX("qsupd"); });
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
         },function(){ timedNotiz("HTML4 Error"); });
      } else timedNotiz("HTML4 Error");
   }
   listen.style.visibility = "hidden";
   if ( currs ) bindNodeToSound(listen,currs + "&r=" + Math.random() * 100,false);
   ausblenden( spinner, 2000, false);
}
function bindNodeToSound(node,soundID,playNow){
   DEBUGGER?console.log("[bindNodeToSound]"):0;
   if ( playNow ) playByID( soundID );
   node.onclick = function(){ playByID( soundID ); };
   node.style.visibility = "visible";
}
function updateNotionEditor(inits,nname,frage,sndid){
   DEBUGGER?console.log("[updateNotionEditor]"):0;
   // Called by bindRecorder: User via naryEdit||naryExam-Pause(Works) or Sound Contributions
   // Designed to fail (the main IF) for Sound Contrib
   var idxvalue, recidx, listen, snaped;
   listen = document.getElementById( inits + "Listen");
   recidx = document.getElementById( "recordedIndex" );
   if ( recidx ) idxvalue  = recidx.getAttribute("monindex"); // Fails for Voice Contribution
   if ( idxvalue ) { NINFDATA[1].qaimg[idxvalue].s = sndid;
      snaped = document.getElementById( idxvalue + "s" );
      if ( listen ) bindNodeToSound(listen,sndid + "&r=" + Math.random() * 100,true);
   }
}

// IMAGES
function handleImageUploads(inits){
   DEBUGGER?console.log("[handleImageUploads]"):0;
   var theTable, theColumn, theIndex, hauptimg, imagenum, admName, admIeid, r, cam = new Array();
   switch(inits){
      case "av": theTable  = "",   theColumn = "",   theIndex = "";
                 USERINFO[0].uimag ? imagenum = USERINFO[0].uimag : imagenum = 101 ;
                 imageUploader( inits, imagenum, theTable, theColumn, theIndex ); break;
      case "ni": theTable = NINFDATA[0].nname,   theColumn = "",   theIndex = "";
                 hauptimg = document.getElementById( "editHauptImg" );
                 imagenum = hauptimg.getAttribute("notimage") ? hauptimg.getAttribute("notimage") : 101;
                 imageUploader( inits, imagenum, theTable, theColumn, theIndex ); break;
      case "qi": theTable = NINFDATA[0].nname;
                 console.log("handleImageUploads -> THEINDEX : " + THEINDEX );
                 for( r = 0; r < THEINDEX; r++ ) { 
                    cam[ r ] = document.getElementById( r + "i" );
                    cam[ r ].setAttribute( "title" , TRANSLAT.qitxt );
                    cam[ r ].onmouseover = function(e){
                       var qim = this.parentNode.firstChild.nextSibling;
                       if ( !IMAGEHOV ) IMAGEHOV = setTimeout(function(){
                             IMAGEHOV = null; einblenden( qim, 2000 );
                          },3000);
                    }
                    cam[ r ].onmouseout = function(e){
                       var qim = this.parentNode.firstChild.nextSibling;
                       if ( IMAGEHOV ) { clearTimeout( IMAGEHOV ); IMAGEHOV = null; }
                       else ausblenden( qim, 2000 );
                    }
                    cam[ r ].onclick = function(e){
                       e.stopPropagation();
                       theIndex = this.parentNode.parentNode.parentNode.id;
                       theColumn = NINFDATA[1].qaimg[ theIndex ].q;

                       imagenum = 101; 
                       if ( NINFDATA[1].qaimg[theIndex].i ) imagenum = NINFDATA[1].qaimg[theIndex].i;
                       imageUploader( inits, imagenum, theTable, theColumn, theIndex );
                    }
                 } break;
      case "ie": admName = document.getElementById( "dninp" );
                 admIeid = document.getElementById( "meinp" );
                 theTable  = admName.value, theColumn  = admIeid.value, theIndex  = "",
                 imageUploader( inits, theColumn, theTable, theColumn, theIndex ); break;
   }
}
function imageUploader( inits, imagenum, theTable, theColumn, theIndex ){
   DEBUGGER?console.log("[imageUploader]"):0;
   var imholder, deletbtn, delemkup = "",
       defimage = HARDCODE.image + imagenum + "&r=" + Math.random() * 100;
   if ( imagenum != 101 )
      delemkup = "<button id='hochDeletbtn' class='notionary-delete'>" +
                    "<span class='fa fa-trash'></span>" + TRANSLAT.delek +
                 "</button>";
   zentraller("imageHoch",
         "<div   id='" + inits + "pre'></div>" +
         "<div   id='" + inits + "php' class='notionary-phpUpload'></div>" +
         delemkup,
      function(){
         imholder = document.getElementById( "imageHochZentralHold" );
         imholder.style.setProperty("background-image","url(" + defimage + ")","important");
         ausblenden( document.getElementById( "imageHochZentralUser" ), 10, true );
         bindUploader( inits, theTable, theColumn, theIndex, imholder );

         // DELETION LOGIC Below
         if ( deletbtn = document.getElementById( "hochDeletbtn" ) )
            deletbtn.onclick = function(){
                  confoNotiz( TRANSLAT.qudel, TRANSLAT.delek, TRANSLAT.deldn,
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
      function(){ landingPage(); showSupers(); }
   );
}
function mediaResolve(inits){
   var ulres, rando = "&r=" + Math.random() * 100, errType,
       avhold, hauptimg, camerikn, theimage, iename, 
       listen, spkikn, xamtmp, overlay,
       idxvalue = document.querySelector('[name="index"]').value,
       mediaID, mediaName, imsrc = HARDCODE.image + "101", snsrc="1";
   overlay = document.getElementById( "modalOverlay" );
   httpget("usrindex.php/?tun=uload").then(
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
                             httpget("usrindex.php/?tun=ercan&was=" + NINFDATA[0].nidno).then(
                                function( response ) { if ( response ) clickNotiz( response ); },
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
                                einblenden( theimage );
                             }
                             break;
                  case 'qs': NINFDATA[1].qaimg[idxvalue].s = mediaID;
                             listen = document.getElementById( "qsListen" );
                             spkikn = document.getElementById( idxvalue + "s" );
                             xamtmp = document.getElementById( "examTemporaHolder" );
                             bindNodeToSound(listen,snsrc+"&r="+Math.random()*100,true);
                             ausblenden(xamtmp,1000,false);
                             break;
                  case 'ie': iename = document.getElementById( "dninp" );
                             iename.value = mediaName;
                             break;
                  case 'se': popupFAI("fa-check","green","1em"); break;
                  case 'pd': NINFDATA[0].dokum = mediaID; break;
               } popupFAI("fa-check","#4D90FE","1em");
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
                   } timedNotiz(errType);
            }
         }
      },
      function ( error ) { clickNotiz( error ); }
   ).then(function( response ) { document.body.removeChild( overlay ); });
}
function bytesToSize( bytes ) {
   DEBUGGER?console.log("[bytesToSize]"):0;
   var i, sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if ( bytes == 0 ) return '0 Byte';
   i = parseInt( Math.floor( Math.log( bytes ) / Math.log( 1024 ) ) );
   return Math.round( bytes / Math.pow( 1024, i ), 2 ) + ' ' + sizes[i];
}
function bindUploader( inits, theTable, theColumn, theIndex, prevue ){
   DEBUGGER?console.log("[bindUploader]"):0;
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
   runBtn.setAttribute("disabled","disabled"); ausblenden( runBtn,100,true );
   runBtn.style.setProperty("z-index","0","important");
   runBtn.onclick = function(e){
      onNAJAX("uploadingData");
      setTimeout( function(){
         if ( inits == "cs" ) csvCallback();
         else mediaResolve(inits);
         offNAJAX("uploadingData");
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
      if ( fsize > maxsz ) clickNotiz( TRANSLAT.badsz + " [ Max: " + bytesToSize( maxsz ) + " ]" );
      if ( ( fsize < maxsz) && ( exten in x10ns ) ) { // Enable upload based on file size + type
         fakBtn.setAttribute("disabled","disabled");  ausblenden( fakBtn,100,true );
         fakBtn.style.setProperty("width","0px","important");
         fakBtn.style.setProperty("height","0px","important");
         fooBar.style.setProperty("width","0px","important");
         fooBar.style.setProperty("height","0px","important");
         runBtn.removeAttribute("disabled"); einblenden( runBtn,1000 );
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
