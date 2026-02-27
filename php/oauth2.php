<?php
require_once "dbutil.php";
require_once "global.php";
function logof(){ foreach($_SESSION as $varbl => $value) unset($_SESSION[$varbl]); session_unset(); session_destroy(); }
function legal(){ if(!isset($_SESSION['uname'])){ logof(); header("Location: index.php"); exit; } }
function outen(){ session_unset(); session_destroy(); }
function isusr(){ if ( isset( $_SESSION['uname'] ) ) { echo "true"; exit; } }
function isadm(){ if ( isset( $_SESSION['uname'] ) ) { $u=uidno(); if(konto("userID","aaadmin","userID","$u")) { echo "true"; exit; } } }
function admin(){ $u = uidno(); if(!konto("userID","aaadmin","userID","$u")){ logof(); header("Location: index.php"); exit; } }
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
function pfupd($getar){
   $jason = json_decode(stripslashes($getar),true);
   ercau();
   $kname = $jason['kname']; $fname = $jason['fname'];
   $uname = $jason['uname']; $email = $jason['email'];
   $pword = $jason['pword']; $uidno = uidno();

   updel("aakname","kname",$kname);
   updel("aafname","fname",$fname);

   if ( !empty( $pword ) && ( $pword != "********" ) ) { $newpwd = password_hash($pword,PASSWORD_DEFAULT);
      sql("update aauser set password='$newpwd' where userID='$uidno'");
   }

   if ($uname && ($uname!=$_SESSION['uname'])){
      $_SESSION['uname'] = $uname;
      sql("update aauser set user='$uname' where userID='$uidno'");
   }
   if ( $email ) {
      if ( !konto("email","aaemail","userID","$uidno") )
         sql("insert into aaemail (userID,email) values('$uidno','$email')");
      else if ( $email != holen("email","aaemail","userID","$uidno") )
         sql("update aaemail set email='$email' where userID='$uidno'");
   }
}
function known($eadrs){
   $email=mysqli_real_escape_string(lsql(),$eadrs);
   if(konto("userID","aauser","user","$email"))   { echo $email; exit; }
   if(konto("userID","aaemail","email","$email")) { echo $email; exit; }
}
function nuser($eadrs){
   $email=mysqli_real_escape_string(lsql(),$eadrs);
   if(konto("userID","aauser","user","$email")) { echo $email; exit; }
}
function taken($nomen){
   $nicki=mysqli_real_escape_string(lsql(),$nomen);
   $myuid=holen("userID","aauser","user",$_SESSION['uname']);
   if(konto("userID","aakname","kname","$nicki")) { echo $nicki; exit; }
   $exusr=mysqli_fetch_assoc(
          sql("select userID from aauser where user like '%$nicki@%' COLLATE utf8_bin"));
   if(!empty($exusr) && $exusr!=$myuid) { echo $nicki; exit; }
   $exema=mysqli_fetch_assoc(
          sql("select userID from aaemail where email like '%$nicki@%' COLLATE utf8_bin"));
   if(!empty($exema) && $exema!=$myuid) { echo $nicki; exit; }
}
function chusr($xcode,$xuser){
   $PARAM_MYURL = param("myurl");
   $rcode = mysqli_real_escape_string(lsql(),$xcode);
   $oldun = mysqli_real_escape_string(lsql(),$xuser);
   if ( $newun = holen("user","aaconfo","code","$rcode") ) {
      ercau();
      sql("update aauser set user='$newun' where user='$oldun'");
      sql("delete from aaconfo where code='$rcode'");
      header("Location: ".$PARAM_MYURL."?n=okdok");
      return;
   }
   header("Location: ".$PARAM_MYURL);
}
function chema($xcode,$xtwit){
   $PARAM_MYURL = param("myurl");
   $rcode=mysqli_real_escape_string(lsql(),$xcode);
   $twitr=mysqli_real_escape_string(lsql(),$xtwit);
   if ( $newem = holen("user","aaconfo","code","$rcode") ) {
      $uidno = holen("userID","aauser","user",$twitr);
      ercau();
      if ( !konto("email","aaemail","userID","$uidno") )
         sql("insert into aaemail (userID,email) values('$uidno','$newem')");
      else sql("update aaemail set email='$newem' where userID='$uidno'");
      sql("delete from aaconfo where code='$rcode'");
      header("Location: ".$PARAM_MYURL."?n=okdok");
      return;
   }
   header("Location: ".$PARAM_MYURL);
}

?>
