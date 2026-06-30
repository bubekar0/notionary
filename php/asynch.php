<?php
function fcach( $datum, $tsecs, $tripa ) { // Single-user box: no server-side caching -- always generate live
   header_remove("Expires"); header_remove("Pragma"); // drop PHP session-limiter anti-cache headers so the browser may cache
   if ( $tripa == 'ninfo' ) header("Cache-Control: no-store, max-age=0"); // a notion's own content/scores stay live
   else header("Cache-Control: private, max-age=60");                     // catalog/user/lang cached for fast navigation
   header("Content-type: text/html");
   switch ( $tripa ) {
      case 'sinfo': echo json_encode( sinf0() ); break;
      case 'linfo': echo json_encode( linf0() ); break;
      case 'uinfo': echo json_encode( uinf0() ); break;
      case 'ninfo': echo json_encode( ninf0() ); break;
   }
}
function sinfo($lan2L){ //  system [0]=generic, [1]=pops, [2]=params
   // Do this implicitly by language so as to keep structure encapsulated
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // HTTP Reject other than ?tun=sinfo
   if(strlen($urarg['query'])!=16 || substr($urarg['query'],0,14)!="tun=sinfo&was=") rjekt();
   fcach( "cache/_notionary_SINFO_{$lan2L}_cache.php", "604800", "sinfo" );
}
function linfo($lan2L){ //  load a language into system -- doubly cached
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // Reject other than ?tun=linfo&was=XX
   if(strlen($urarg['query'])!=16 || substr($urarg['query'],0,14)!="tun=linfo&was=") rjekt();

   $q=sql("show columns in aaglobe like '__'");
   while($r=mysqli_fetch_assoc($q)) $lanAR[]=$r['Field'];
   if(!in_array($lan2L,$lanAR)) exit; // ask for non-extant lang exits
   fcach( "cache/_notionary_LINFO_{$lan2L}_cache.php", "31536000", "linfo"  );
}
function qkupd(){
   openlog("qkupd",LOG_NDELAY,LOG_LOCAL2);
   $QK255_LANGE = 40;
   if ( !empty($_COOKIE['rememberme']) && $_COOKIE['rememberme'] == "true" ) {
      syslog(LOG_ERR,"QKUPD: FOUND rememberme COOKIE SET TO true");
      if ( !empty($_COOKIE['two55']) ) {
         $qk255 = explode(':',$_COOKIE['two55']); $qkusr = $qk255[0]; $qkval = $qk255[1];
         syslog(LOG_ERR,"QKUPD: FOUND two55 COOKIE: " . $qkval );
         if ( ( $qkusr == $_SESSION['uname']) && strlen($qkval) == $QK255_LANGE ) {
            syslog(LOG_ERR,"QKUPD: UPDATING two55 COOKIE");
            if (konto("two55","aatwo55","user","$qkusr"))
              sql("update aatwo55 set two55='$qkval' where user='$qkusr'");
            else sql("insert into aatwo55 (user, two55) values('$qkusr','$qkval')");
         } // User name missmatch or bad length value
      } // Empty Cookie
   } // Doesn't want to be remembered
   closelog();
}
function uinfo(){ // [0]=generic, [1]=recent, [2]=meine, [3]=repaso
   openlog("uinfo",LOG_NDELAY,LOG_LOCAL2);
   $QK255_LANGE = 40;
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // Reject other than ?tun=uinfo
   if ( strlen($urarg['query']) != 9 || substr($urarg['query'],0,9) != "tun=uinfo") rjekt();
 
   // If we don't know who this guy is, attempt to Autolog
   if ( empty($_SESSION['uname']) ) { // See if user wanted to be Autologged in
      syslog(LOG_ERR,"UINFO: Checking for autolog -- user unknown");
      if ( !empty($_COOKIE['rememberme']) && $_COOKIE['rememberme'] == "true" ) {
         syslog(LOG_ERR,"UINFO: FOUND rememberme COOKIE SET TO true");
         if ( !empty($_COOKIE['two55']) ) {
            $qk255 = explode(':',$_COOKIE['two55']); $qkusr = $qk255[0]; $qkval = $qk255[1];
            syslog(LOG_ERR,"UINFO: FOUND two55 COOKIE: $qkval");
            if ( strlen($qkval) == $QK255_LANGE ) {
               syslog(LOG_ERR,"UINFO: PROPER LENGTH " . $qkval);
               syslog(LOG_ERR,"UINFO: COMPARE TO DB ENTRY: " . holen("two55","aatwo55","user","$qkusr") );
               if ( $qkval == holen("two55","aatwo55","user","$qkusr") ) {
                  syslog(LOG_ERR, "UINFO: AUTOLOGGING" );
                  slang(holen("userID","aauser","user",$qkusr) );
                  $_SESSION['uname'] = $qkusr; tstmp(); spure(); // AUTOLOGIN SUCCESS
               } else { echo ""; syslog(LOG_ERR, "UINFO: MISMATCH" ); exit; } // Cookie missmatch with 'aatwo55'
            } else { echo ""; syslog(LOG_ERR, "UINFO: IMPROPER LENGTH" ); exit; } // Cookie two55 not valid length
         } else { echo ""; syslog(LOG_ERR, "UINFO: NO two55 COOKIE" ); exit; } // Cookie two55 not set
      } else { echo ""; syslog(LOG_ERR, "UINFO: NO rememberme COOKIE" ); exit; } // Does not want to be remembered
   }
   qkupd(); // Here we know who this guy is because a Session is live or just got Autologged in
   fcach( "cache/_notionary_UINFO_".uidno()."_cache.php", "86400", "uinfo"  );
   closelog();
}

?>
