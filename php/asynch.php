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

   $q=sql("pragma table_info(aaglobe)");
   while($r=db_fetch_assoc($q)) if(strlen($r['name'])==2) $lanAR[]=$r['name'];
   if(!in_array($lan2L,$lanAR)) exit; // ask for non-extant lang exits
   fcach( "cache/_notionary_LINFO_{$lan2L}_cache.php", "31536000", "linfo"  );
}
function uinfo(){ // [0]=generic, [1]=recent, [2]=meine, [3]=repaso
   openlog("uinfo",LOG_NDELAY,LOG_LOCAL2);
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // Reject other than ?tun=uinfo
   if ( strlen($urarg['query']) != 9 || substr($urarg['query'],0,9) != "tun=uinfo") rjekt();
 
   fcach( "cache/_notionary_UINFO_".uidno()."_cache.php", "86400", "uinfo"  );
   closelog();
}

?>
