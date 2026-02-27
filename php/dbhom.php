<?php
session_start();
require_once "utiles.php";
require_once "cssphp.php";
require_once "dbutil.php";
require_once "tools.php";

iazik();
$XLATE_DBHOM = xlate("dbhom",$_SESSION['slang']);
$MYURL = param("myurl");
ob_start();
papel($softBlau,"#FFFFFF","40px","7%");
$bodyStyle = ob_get_contents();
ob_end_clean();
$DBHOM_DOC=<<<END_OF_DBHOM
      <!DOCTYPE html>
         <html>
            <head>
            <meta charset='UTF-8'>
            <meta http-equiv="refresh" content="5;url=$MYURL" />
            <style type='text/css'>
               body { $bodyStyle }
               #dbhomMessage { position:fixed; width:80%; top:50%; left:50%; transform:translate(-50%,-50%);
                               font:normal normal 900 4em/1.2 Futura, Calibri, sans-serif,monospace; }
               #rotatingPencil { width:25vh; height:25vh; }
            </style>
            </head>
            <body>
               <img id='rotatingPencil' src='$MYURL?tun=ibyid&was=149'>
               <div id='dbhomMessage'> $XLATE_DBHOM </div>
            </body>
         </html>
END_OF_DBHOM;
echo $DBHOM_DOC;
?>
