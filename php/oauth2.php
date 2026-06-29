<?php
require_once "dbutil.php";
require_once "global.php";
// Social SDK stubs — Facebook, Twitter, Google+ SDKs removed.
function fbfrm(){ return ""; }
function twfrm(){ return ""; }
function gpfrm(){ return ""; }
function flang(){ return ""; }
function glang(){ return ""; }
function tstmp(){ $u = uidno(); sql("insert into aalogin (userID,login,ipadr) values ('$u',NOW(),'$_SERVER[REMOTE_ADDR]')"); }
function spure(){ $u = uidno(); sql("update aalast set last=NOW() where userID=$u"); }
function logof(){ foreach($_SESSION as $varbl => $value) unset($_SESSION[$varbl]); session_unset(); session_destroy(); }
function legal(){ if(!isset($_SESSION['uname'])){ header('HTTP/1.1 403 Forbidden'); exit; } }
function anone($uidno){ // anonimize a user name before passing to client side
   $NICKI_MAXLEN = 16;
   if ( $nicki = holen("kname","aakname","userID","$uidno")) return($nicki);
   $pedro = holen("user","aauser","userID","$uidno");
   $nicki = explode('@',$pedro)[0];
   if ( strlen($nicki) > $NICKI_MAXLEN) $nicki = substr($nicki,0,$NICKI_MAXLEN).'..';
   return($nicki);
}
function updel($table,$column,$value){
   $uidno = uidno();
   if ( $value ) {
      if (konto($column,$table,"userID",$uidno))
         sql("update $table set $column='$value' where userID='$uidno'");
      else sql("insert into $table (userID,$column) values('$uidno','$value')");
   } else if(konto("$column","$table","userID","$uidno"))
         sql("delete from $table where userID='$uidno'");
}
?>
