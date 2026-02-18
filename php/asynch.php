<?php
function fcach( $datum, $tsecs, $tripa ) { // Avoid sending file if client has a non modified version(ETag)
   // ACHTUNG: max-age=0 ist wichtig für 'outen' ricchtig zu funktionieren
   // set global sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
   $ETAGS_CACHE = "private, must-revalidate, max-age=10, pre-check=10";
   if( file_exists( $datum ) ) { // file exists? use inode+size+mtime for an ETag
      $fs = stat( $datum );
      $inszt = sprintf('"%x-%x-%s"',
                      $fs['ino'],
                      $fs['size'],
                      base_convert(str_pad($fs['mtime'],16,"0"),10,16));
      // immediately stale (10 secs) so it reqs server and gets 304
      header("ETag: '".md5($inszt)."'");
      header("Cache-Control: ".$ETAGS_CACHE);
      header("Content-type: text/html");
      header("Pragma: private");
      // If the client has same version, return 304
      if( isset( $_SERVER['HTTP_IF_NONE_MATCH'] ) ) {
         if( str_replace("'","",
               stripslashes($_SERVER['HTTP_IF_NONE_MATCH'])) == md5($inszt)) {
            header('HTTP/1.1 304 Not Modified');
            exit();
         }
      }
   } // Here client file missing or outdated, Avoid producing if fresh(tsecs) cache file exists.
   if( file_exists( $datum ) && time() - $tsecs < filemtime( $datum ) ){ include( $datum ); exit; }
   switch ( $tripa ) {
      case 'sinfo': $output = json_encode( sinf0() ); break;
      case 'linfo': $output = json_encode( linf0() ); break;
      case 'uinfo': $output = json_encode( uinf0() ); break;
      case 'ninfo': $output = json_encode( ninf0() ); break;
   }
   ob_start(); // otherwise render and capture the MySQL generated Markup
      echo $output; $fp=fopen( $datum,'w' ); fwrite($fp,ob_get_contents()); fclose($fp);
   ob_end_flush(); // write stdout to cache + client
}
function sinfo($lan2L){ //  system [0]=generic, [1]=pops, [2]=params
   // Do this implicitly by language so as to keep structure encapsulated
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // HTTP Reject other than ?tun=sinfo
   if(strlen($urarg['query'])!=16 || substr($urarg['query'],0,14)!="tun=sinfo&was=") rjekt();
   fcach( "cache/_notionary_SINFO_${lan2L}_cache.php", "604800", "sinfo" );
}
function linfo($lan2L){ //  load a language into system -- doubly cached
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // Reject other than ?tun=linfo&was=XX
   if(strlen($urarg['query'])!=16 || substr($urarg['query'],0,14)!="tun=linfo&was=") rjekt();

   $q=sql("show columns in aaglobe like '__'");
   while($r=mysqli_fetch_assoc($q)) $lanAR[]=$r['Field'];
   if(!in_array($lan2L,$lanAR)) exit; // ask for non-extant lang exits
   fcach( "cache/_notionary_LINFO_${lan2L}_cache.php", "31536000", "linfo"  );
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
