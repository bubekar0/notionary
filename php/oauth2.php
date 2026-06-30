<?php
require_once "dbutil.php";
require_once "global.php";
function tstmp(){ $u = uidno(); sql("insert into aalogin (userID,login,ipadr) values ('$u',NOW(),'$_SERVER[REMOTE_ADDR]')"); }
function spure(){ $u = uidno(); sql("update aalast set last=NOW() where userID=$u"); }
function legal(){ if(!isset($_SESSION['uname'])){ header('HTTP/1.1 403 Forbidden'); exit; } }
function anone($uidno){ // anonimize a user name before passing to client side
   $NICKI_MAXLEN = 16;
   if ( $nicki = holen("kname","aakname","userID","$uidno")) return($nicki);
   $pedro = holen("user","aauser","userID","$uidno");
   $nicki = explode('@',$pedro)[0];
   if ( strlen($nicki) > $NICKI_MAXLEN) $nicki = substr($nicki,0,$NICKI_MAXLEN).'..';
   return($nicki);
}
?>
