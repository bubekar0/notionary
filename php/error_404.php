<?php
session_start();
require_once "utiles.php";
require_once "cssphp.php";
require_once "dbutil.php";
require_once "tools.php";

iazik();
$XLATE_ER404 = xlate("er404",$_SESSION['slang']);
$MYURL = param("myurl");
$ER404_DOC=<<<END_OF_ER404
      <!DOCTYPE html>
         <html>
            <head>
            <meta charset='UTF-8'>
            <meta http-equiv="refresh" content="5;url=$MYURL" />
            <style type='text/css'>
               body { $bodyStyle }
               #errorMessage { position:fixed; width:80%; top:50%; left:50%; transform:translate(-50%,-50%);
                               font:normal normal 900 4em/1.2 Futura, Calibri, sans-serif,monospace; }
               #rotatingPencil { width:25vh; height:25vh; }
            </style>
            </head>
            <body>
               <div id='errorMessage'> $XLATE_ER404 </div>
            </body>
         </html>
END_OF_ER404;
echo $ER404_DOC;
?>
