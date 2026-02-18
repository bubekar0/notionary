<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();   // if browser doesn't gzip, normal
date_default_timezone_set('Europe/Berlin');
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/oauth2.php";

if(isset($_REQUEST['tun'])) $tun=$_REQUEST['tun']; else $tun="";
switch($tun){
   case 'debug':case 'idata':case 'xcach':
      admin();
      if(!isset($_REQUEST['was'])) eval($tun."();");
      else eval($tun."(\$_REQUEST['was']);"); break;
}
?>
