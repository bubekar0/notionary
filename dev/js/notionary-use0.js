function showUserProgress(){
   DEBUGGER?console.log("[showUserProgress]"):0;
   var trophies = document.getElementById( "userTrophies" );



   if ( countProblemsInUINFO() ) {
      trophies.innerHTML += "<div id='userProblems' class='notionary-trophies' title='" + TRANSLAT.repas + "'>" +
                               "<span class='fa fa-thumbs-o-down'></span>" +
                               "<div class='notionary-counters'>" + countProblemsInUINFO() + "</div>" +
                            "</div>";
      document.getElementById( "userProblems" ).onclick = function(e) { window.location.href = HARDCODE.myurl + "?tun=probs"; }
   }

}
