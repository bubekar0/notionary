<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();   // if browser doesn't gzip, normal
date_default_timezone_set('Europe/Berlin');
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/asynch.php";
require_once "php/oauth2.php";

$_SESSION["blang"]="de";
if( array_key_exists('HTTP_ACCEPT_LANGUAGE', $_SERVER) ) $alhed=explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
if(isset($alhed)) $_SESSION["blang"]=substr($alhed[0],0,2);
switch($_SESSION["blang"]){
   case 'en':case 'de':case 'es':case 'fr': $_SESSION["slang"]=$_SESSION["blang"]; break;
   default: $_SESSION["blang"]="de"; $_SESSION["slang"]="de"; break;
}

function sinf0(){
   $q=sql("show columns in aaglobe like '__'");
   while($r=mysqli_fetch_assoc($q)) $lanAR[]=$r['Field'];
   // [0] prepare the generic system data -- first dimension
   $retAR[]=array("langs"=>$lanAR);
   $retAR[]=array(""=>""); // <<-- ENFORCE HERE so "param" always works as [2]
   // [2] prepare the system parameters -- second dimension
   $q=sql("select * from aaparam");
   while($r=mysqli_fetch_assoc($q)) $parAR[]=array($r['kodex'] => $r['value']);
   $retAR[]=array("param" => $parAR);    // second dimmension [2]
   return( $retAR );  // HTML of response. All else is MySQL infefficient code
}
function linf0(){
   $q=sql("select kodex, $_REQUEST[was] from aaglobe order by kodex");
   while($r=mysqli_fetch_assoc($q)) $tmpAR[]=array($r['kodex'] => $r[$_REQUEST['was']]);
   return( $tmpAR );
}
function uinf0(){
   $NOIMGID = 99;
   $uname = $_SESSION['uname']; $uimag = $NOIMGID;
   $uidno = uidno();
   $email = holen("email","aaemail","userID","$uidno");
   $ulang = holen("ulang","aauser","userID","$uidno");
   $uimag = holen("imageID","aaavatar","userID","$uidno");
   // [0] prepare the generic info -- first dimension
   isset($_SESSION['fbusr']) ? $fbusr=$_SESSION['fbusr'] : $fbusr=NULL;
   isset($_SESSION['twusr']) ? $twusr=$_SESSION['twusr'] : $twusr=NULL;
   isset($_SESSION['gpusr']) ? $gpusr=$_SESSION['gpusr'] : $gpusr=NULL;
   $retAR[]=array(
      "uname" => $uname, "uimag" => $uimag,
      "uidno" => $uidno, "email" => $email, "ulang" => $ulang,
      "fbusr" => $fbusr, "twusr" => $twusr, "gpusr" => $gpusr
   );
   return( $retAR );
}
if(isset($_REQUEST['tun'])) $tun=$_REQUEST['tun']; else $tun="";
switch($tun){
   // NO AUTHENTICATION
   case 'mylan': echo $_SESSION['slang']; break;
   case 'isusr':case 'login':case 'vrify':case 'i4got':case 'crack':case 'oauth':case 'known':case 'nuser':
   case 'sinfo':case 'uinfo':case 'linfo':case 'ibyid':case 'sbyid':case 'pbyid':
        if ( !isset($_REQUEST['was']) ) eval($tun."();");
        else eval($tun."(\$_REQUEST['was']);"); break;
   default: porta(); break;
}
?>
