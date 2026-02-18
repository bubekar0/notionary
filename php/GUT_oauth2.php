<?php
require_once "dbutil.php";
require_once "global.php";
function login($getar){ //  authenticate client request
   $jason = json_decode(stripslashes($getar),true);
   $uname = mysqli_real_escape_string(lsql(),$jason['uname']);
   $dbpas = mysqli_fetch_assoc( sql("select password from aauser where user='$uname'") );
   if ( password_verify( mysqli_real_escape_string(lsql(),$jason['pword']),$dbpas['password']) ) {
      $_SESSION['uname'] = $uname;
      slang(uidno()); qkupd(); tstmp(); spure();
      mailx("$_SESSION[uname] ($_SERVER[REMOTE_ADDR])","",param("admin"));
      print(true);
   }
}
function logof(){ foreach($_SESSION as $varbl => $value) unset($_SESSION[$varbl]); session_unset(); session_destroy(); }
function legal(){ if(!isset($_SESSION['uname'])){ logof(); header("Location: index.php"); exit; } }
function outen(){ sql("delete from aatwo55 where user='$_SESSION[uname]'"); session_unset(); session_destroy(); }
function tstmp(){ $u = uidno(); sql("insert into aalogin (userID,login,ipadr) values ('$u',NOW(),'$_SERVER[REMOTE_ADDR]')"); }
function spure(){ $u = uidno(); sql("update aalast set last=NOW() where userID=$u"); }
function isusr(){ if ( isset( $_SESSION['uname'] ) ) { echo "true"; exit; } }
function isadm(){ if ( isset( $_SESSION['uname'] ) ) { $u=uidno(); if(konto("userID","aaadmin","userID","$u")) { echo "true"; exit; } } }
function admin(){ $u = uidno(); if(!konto("userID","aaadmin","userID","$u")){ logof(); header("Location: index.php"); exit; } }
function anone($uidno){ // anonimize a user name before passing to client side
   $NICKI_MAXLEN = 16;
   if ( $nicki = holen("kname","aakname","userID","$uidno")) return($nicki);
   $pedro = holen("user","aauser","userID","$uidno"); // reveiwer data (protect)
   $nicki = explode('@',$pedro)[0];
   if ( substr($nicki,0,3)=="FB-" ) $nicki = "FB-user " . substr($nicki,3,4) . "... ";
   if ( substr($nicki,0,3)=="TW-" ) $nicki = "TW-user " . substr($nicki,3,4) . "... ";
   if ( substr($nicki,0,3)=="GP-" ) $nicki = "GP-user " . substr($nicki,3,4) . "... ";
   if ( strlen($nicki) > $NICKI_MAXLEN) $nicki = substr($nicki,0,$NICKI_MAXLEN).'..';
   return($nicki);
}
function updel($table,$column,$value){  // INSIDER: Update a Table or delete its entry
   $uidno = uidno();
   if ( $value ) {
      if (konto($column,$table,"userID",$uidno))
         sql("update $table set $column='$value' where userID='$uidno'");
      else sql("insert into $table (userID,$column) values('$uidno','$value')");
   } else if(konto("$column","$table","userID","$uidno"))
         sql("delete from $table where userID='$uidno'");
}
function pfupd($getar){ // AJAX: update user profile(names) -> Can't use seter
   global $hardBlue, $softRed;
   $PARAM_MYURL = param("myurl");
   list($_UREQ, $_IGNO, $_CKUS, $_EREQ, $_CKEM, $_EVER) = pglot( ["_UREQ","_IGNO","_CKUS","_EREQ","_CKEM","_EVER"]);
   $jason = json_decode(stripslashes($getar),true);
   ercau(); // erase the user's cache files
   $kname = $jason['kname']; $fname = $jason['fname'];
   $uname = $jason['uname']; $email = $jason['email'];
   $pword = $jason['pword']; $uidno = uidno();

   updel("aakname","kname",$kname);
   updel("aafname","fname",$fname);

   if ( !empty( $pword ) && ( $pword != "********" ) ) { $newpwd = password_hash($pword,PASSWORD_DEFAULT);
      sql("update aauser set password='$newpwd' where userID='$uidno'");
   }


   if ($uname && ($uname!=$_SESSION['uname'])){  // verify via email
      $rcode  = md5(uniqid(rand())) . md5(uniqid(rand())) . md5(uniqid(rand()))
              . md5(uniqid(rand())) . md5(uniqid(rand()));
      if (!konto("code","aaconfo","user","$uname"))
         $saved = sql("insert into aaconfo(user,code) values('$uname','$rcode')");
      else $saved = sql("update aaconfo set code='$rcode' where user='$uname'");
      $messg = $_UREQ . $_IGNO
             . "<a href='" . $PARAM_MYURL . "/usrindex.php?sntqo="
             . obfus() . "&tun=chusr&was=${rcode}"
             . "&wer=" . urlencode($_SESSION["uname"]) . "'>"
             . $_CKUS . "</a>";
      mailx($_EVER,$messg,$uname);
   }
   if ( $email && !konto("email","aaemail","userID","$uidno") ||
        $email !=  holen("email","aaemail","userID","$uidno")){   // verify via email
      $rcode = md5(uniqid(rand())) . md5(uniqid(rand())) . md5(uniqid(rand()))
             . md5(uniqid(rand())) . md5(uniqid(rand()));
      if (!konto("code","aaconfo","user","$email"))
         $saved = sql("insert into aaconfo(user,code) values('$email','$rcode')");
      else $saved = sql("update aaconfo set code='$rcode' where user='$email'");
      $messg = $_EREQ . $_IGNO
             . "<a href='" . $PARAM_MYURL . "/usrindex.php?sntqo="
             . obfus() . "&tun=chema&was=${rcode}"
             . "&wer=" . urlencode($_SESSION["uname"]) . "'>"
             . $_CKEM . "</a>";
      mailx($_EVER,$messg,$email);
   }
}
function vrify($getar){ // AJAX: verify Email(3 reasons): i4got, crack, exist
   /* Send email code rather than clickable link if the form needs further
      procesing as in gamesbroker warenkorb. Other requests get clickable link.
      This is because the users favorite browser may differ from the launching one.
      A user has provided us with an Email which we need to verify before proceeding
      to change his forgotten password (i4got), or to create an account (crack), or
      verify that it exists (exist)
   */
   $PARAM_MYURL = param("myurl");
   list($_PREQ, $_CKPW, $_AREQ, $_CKAC, $_VREQ, $_CKVR, $_CODE, $_IGNO, $_EVER) = pglot(
       ["_PREQ","_CKPW","_AREQ","_CKAC","_VREQ","_CKVR","_CODE","_IGNO","_EVER"]);
   $jason = json_decode(stripslashes($getar),true);
   $quien = mysqli_real_escape_string(lsql(),$jason['quien']); // originator (i4got,crack,exist)
   $pword = password_hash($jason['pword'],PASSWORD_DEFAULT);        // new pword "i4got" or "crack"
   $razon = mysqli_real_escape_string(lsql(),$jason['razon']); // reason to verify: i4got, crack, exist
   $rcode = md5(uniqid(rand())) . md5(uniqid(rand()))
          . md5(uniqid(rand())) . md5(uniqid(rand())) . md5(uniqid(rand()));
   $clink = "<a href='" . $PARAM_MYURL . "?sntqo=" 
          . obfus() . "&tun=${razon}&was=${rcode}'>";
   $_SESSION['vcode'] = substr(md5(uniqid(rand())),0,8);                        // Use for verification codes with forms waiting

   if ( ( $razon != "exist" ) ){ // Make code and razon entries in DB(i4got|crack), but not for (exist) "vcode"
      if ( !konto("code","aaconfo","user","$quien"))
         sql("insert into aaconfo(user,password,code) values('$quien','$pword','$rcode')");
      else sql("update aaconfo set code='$rcode',password='$pword' where user='$quien'");
   }
   switch( $razon ) {
      case "i4got": $messg = $_PREQ . $_IGNO . $clink . $_CKPW . "</a>";    break;
      case "crack": $messg = $_AREQ . $_IGNO . $clink . $_CKAC . "</a>";    break;
      case "exist": $messg = $_VREQ . $_IGNO . $_CODE . $_SESSION['vcode']; break;
      default: rjekt(); break; // only the above cases are allowed for verification
   }
   mailx($_EVER,$messg,$quien);
}
function i4got($xcode){ // GET: directly from an email link <a href='..
   $PARAM_MYURL = param("myurl");
   $rcode = mysqli_real_escape_string(lsql(),$xcode);
   $q = sql("select user,password from aaconfo where code='$rcode'");
   if ( mysqli_num_rows($q) == 1 ) { $r = mysqli_fetch_assoc($q);
      sql("update aauser set password='$r[password]' where user='$r[user]'");
      sql("delete from aaconfo where code='$rcode'");
      header("Location: ".$PARAM_MYURL."?n=okdok");
      return;
   }
   header("Location: ".$PARAM_MYURL);
}
function crack($xcode){ // GET: directly from an email link <a href='..
   $PARAM_MYURL = param("myurl");
   $rcode=mysqli_real_escape_string(lsql(),$xcode);
   $q=sql("select user,password from aaconfo where code='$rcode'");
   if(mysqli_num_rows($q)==1){ $r=mysqli_fetch_assoc($q);
      $ulink=isql("insert into aauser (userID,user,createDate,password,ulang)
                  values('','$r[user]',NOW(),'$r[password]','$_SESSION[slang]')");
      $uidno=mysqli_insert_id($ulink);
      sql("insert into aalast (userID,last) values('$uidno',NOW())");
      sql("delete from aaconfo where code='$rcode'");
      header("Location: ".$PARAM_MYURL."?n=okdok");
      return;
   }
   header("Location: ".$PARAM_MYURL);
}
/*
function exist($xcode){ // GET: directly from an email link <a href='..
   $PARAM_MYURL = param("myurl");
   $rcode = mysqli_real_escape_string(lsql(),$xcode);
   $q = sql("select user,password from aaconfo where code='$rcode'");
   if ( mysqli_num_rows($q) == 1 ) { $r = mysqli_fetch_assoc($q);
      sql("delete from aaconfo where code='$rcode'");
      //setcookie("emok",true,time()+60*60*24*30,'/');  
      setcookie("emok",true,time()+20,'/'); // Cookie will be true for the next 20 seconds
      header("Location: ".$PARAM_MYURL."?n=okdok");
      return;
   }
   header("Location: ".$PARAM_MYURL);
}
*/
function oauth(){ // AJAX: create GP|TW|FB account IFF Agreement and no extant account
   $PARAM_MYURL = param("myurl");
   // Here we should have some sort of limbo account so set $_SESSION['uname'] from twbak|gwbak
   // typing ?tun=oauth at browser address not enuff
   if ( $_SESSION['fbusr'] ) $_SESSION['uname'] = "FB-" . $_SESSION['fbusr'];
   if ( $_SESSION['gpusr'] ) $_SESSION['uname'] = "GP-" . $_SESSION['gpusr'];
   if ( $_SESSION['twusr'] ) $_SESSION['uname'] = "TW-" . $_SESSION['twusr'];

   if(!isset($_SESSION['uname'])) { header("Location: $PARAM_MYURL"); exit; }// we must know who you are
   if(!konto("userID","aauser","user","$_SESSION[uname]") ){ // Create account IFF non-extant
      $ulink=isql("insert into aauser (userID,user,createDate,password,ulang)
                   values('','$_SESSION[uname]',NOW(),'','$_SESSION[slang]')");
      $uidno=mysqli_insert_id($ulink);
      sql("insert into aalast (userID,last) values('$uidno',NOW())");
   } // typing ?tun=oauth at browser address not enuff => back to site
   header("Location: $PARAM_MYURL");
}
function known($eadrs){ //  email known? registered or  Net user email
   $email=mysqli_real_escape_string(lsql(),$eadrs);
   if(konto("userID","aauser","user","$email"))   { echo $email; exit; }
   if(konto("userID","aaemail","email","$email")) { echo $email; exit; }
}
function nuser($eadrs){ //  is this email a registered Notionary user?
   $email=mysqli_real_escape_string(lsql(),$eadrs);
   if(konto("userID","aauser","user","$email")) { echo $email; exit; }
}
function taken($nomen){ //  Nickname known? or part of a known email?
   $nicki=mysqli_real_escape_string(lsql(),$nomen);
   $myuid=holen("userID","aauser","user",$_SESSION['uname']);
   // if there is a so nicknamed user exit here
   if(konto("userID","aakname","kname","$nicki")) { echo $nicki; exit; }
   // check if a user other than myself has this as his account prefix
   $exusr=mysqli_fetch_assoc(
          sql("select userID from aauser where user like '%$nicki@%' COLLATE utf8_bin"));
   if(!empty($exusr) && $exusr!=$myuid) { echo $nicki; exit; }
   // check if a user other than myself has this as his email prefix
   $exema=mysqli_fetch_assoc(
          sql("select userID from aaemail where email like '%$nicki@%' COLLATE utf8_bin"));
   if(!empty($exema) && $exema!=$myuid) { echo $nicki; exit; }
}
function chusr($xcode,$xuser){ // GET: <a href='..  Reg-users can change login name
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
function chema($xcode,$xtwit){ // GET: <a href='..  Net users change email
   $PARAM_MYURL = param("myurl");
   $rcode=mysqli_real_escape_string(lsql(),$xcode);
   $twitr=mysqli_real_escape_string(lsql(),$xtwit);
   if ( $newem = holen("user","aaconfo","code","$rcode") ) { // aaconfo[user] is email here!!
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
