<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();   // if browser doesn't gzip, normal
date_default_timezone_set('Europe/Berlin');
require_once "utiles.php";
require_once "dbutil.php";
require_once "oauth2.php";
require_once "upload.php";

function parseNone(){ // For when all else fails
   $qhead=speak("qkopf","","","");
   $ahead=speak("akopf","","","");
   for($i=1;$i<11;$i++) $retAR[]=array( "q"=>"$qhead$i", "a"=>"$ahead$i" );
   return json_encode($retAR);
}
function parsePlain($txtDoc){
   $QANDA_MIN  = 10;
   $lines=file($txtDoc,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES);
   foreach($lines as $num => $line){ $parts=explode(',',$line);
      if( strpos($line, chr(0x2C)) ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
         );
      }
   }
   if( count($retAR) < $QANDA_MIN ) return parseNone();
   else return json_encode($retAR);
}
function rtf_isPlainText($s) {
    $arrfailAt = array("*", "fonttbl", "colortbl", "datastore", "themedata");
    for ($i = 0; $i < count($arrfailAt); $i++)
        if (!empty($s[$arrfailAt[$i]])) return false;
    return true;
}
function parseRTF($filename){ // extract the text contents of a RTF
   //http://webcheatsheet.com/php/reading_the_clean_text_from_rtf.php
   $text = file_get_contents($filename);
   if (!strlen($text)) return "";
   $document = ""; $stack = array(); $j = -1;
   for ($i = 0, $len = strlen($text); $i < $len; $i++) { $c = $text[$i];
      switch ($c) { // the most important key word backslash
         case "\\": $nc = $text[$i + 1];
            if ($nc == '\\' && rtf_isPlainText($stack[$j])) $document .= '\\';
            elseif ($nc == '~' && rtf_isPlainText($stack[$j])) $document .= ' ';
            elseif ($nc == '_' && rtf_isPlainText($stack[$j])) $document .= '-';
            elseif ($nc == '*') $stack[$j]["*"] = true;
            elseif ($nc == "'") { $hex = substr($text, $i + 2, 2);
               if (rtf_isPlainText($stack[$j]))
                  $document .= html_entity_decode("&#".hexdec($hex).";");
               $i += 2;
            } elseif ($nc >= 'a' && $nc <= 'z' || $nc >= 'A' && $nc <= 'Z') {
               $word = ""; $param = null;
               for ($k = $i + 1, $m = 0; $k < strlen($text); $k++, $m++) {
                  $nc = $text[$k];
                  if ($nc >= 'a' && $nc <= 'z' || $nc >= 'A' && $nc <= 'Z') {
                     if (empty($param)) $word .= $nc; else break;
                  } elseif ($nc >= '0' && $nc <= '9') $param .= $nc;
                  elseif ($nc == '-') {
                     if (empty($param)) $param .= $nc; else break;
                  } else break;
               }
               $i += $m - 1; $toText = "";
               switch (strtolower($word)) {
                  case "u":
                     $toText .= html_entity_decode("&#x".dechex($param).";");
                     $ucDelta = @$stack[$j]["uc"];
                     if ($ucDelta > 0) $i += $ucDelta;
                     break;
                  case "par":case "page":case "column":case "line":case "lbr":
                     $toText.="\n"; break;
                  case "emspace":case "enspace":case "qmspace":
                  case "tab":case "chdate":case "chdpl":case "chdpa":
                  case "chtime":case "emdash":case "endash":case "bullet":
                  case "lquote":case "rquote":case "ldblquote":case "rdblquote":
                     $toText.=" "; break;
                  default:
                     $stack[$j][strtolower($word)] = empty($param) ? true : $param;
                     break;
               }
               if (rtf_isPlainText($stack[$j])) $document .= $toText;
            }
            $i++;
            break;
         case "{": array_push($stack, $stack[$j++]); break;
         case "}": array_pop($stack); $j--; break; // Skip “trash”.
         case '\0': case '\r': case '\f': case '\n': break; // Add other data if required.
         default: if (rtf_isPlainText($stack[$j])) $document .= $c; break;
      }
   } // Now the second loop processes the cleaned lines one at a time
   $lines = explode(chr(0x0D),$document);
   foreach($lines as $thisline) { $parts=explode(',',$thisline);
      if( strpos($thisline, chr(0x2C)) ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
         );
      }
   }
   if(count($retAR)==1) return parseNone();
   else return json_encode($retAR);
}
function parsePDF($pdfDoc){ // extract the text contents of a PDF
   $TEMPORA    = "${MY_HOME}tmp/";
   $PDFTOTEXT  = "/usr/bin/pdftotext";
   $QANDA_MIN  = 10;
   $newtx=$TEMPORA."pdfToText-".uniqid(rand()).".txt";
   exec("$PDFTOTEXT $pdfDoc $newtx");
   $lines=file($newtx,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES);
   foreach($lines as $num => $line){ $parts=explode(',',$line);
      if( strpos($line, chr(0x2C)) ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/','',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/','',nunft($parts['1']))
         );
      }
   }
   unlink($newtx);
   if( count($retAR) < $QANDA_MIN ) return parseNone();
   else return json_encode($retAR);
}
function parseWord($userDoc){ // extract text contents of a .doc Word document
   //http://stackoverflow.com/questions/188452/reading-writing-a-ms-word-file-in-php
   // Last mod: 10-mar-14 misses top line due to garbled+0x00 input before first record
   $QANDA_MIN  = 10;
   $STRING_MAX = 200;
   $fileHandle = fopen($userDoc, "r");
   $line = @fread($fileHandle, filesize($userDoc));
   $lines = explode(chr(0x0D),$line);
   foreach($lines as $thisline) {
       if( (strpos($thisline, chr(0x00))===FALSE) &&
           (strlen(nunft($thisline)) > 0) &&
           (strlen(nunft($thisline)) < $STRING_MAX)) {
          // line with text -- but is it Q , A ? (check for single comma)
          if( strpos($thisline, chr(0x2C)) ) { // found at least one comma
             $parts=explode(',',utf8_encode($thisline));
             // examine for last file lines GARBAGE paaterns to eliminate
             $c29cpos = strpos($parts['1'],hex2bin('c29c'));     // GARB , c29c
             $c2b4pos = strpos($parts['0'],hex2bin('c2b469c2')); // c2b469c2 , GARB
             $c297pos = strpos($parts['0'],hex2bin('2463c297')); // 2463c297 , GARB
             $c2adpos = strpos($parts['0'],hex2bin('c2adc3b2')); // c2adc3b2 , GARB
             if( ($c29cpos===FALSE) && ($c2b4pos===FALSE) &&
                 ($c297pos===FALSE) && ($c2adpos===FALSE) ){
                $retAR[]=array(
                   "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
                   "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
                );
             }
          }
       }
   }
   if( count($retAR) < $QANDA_MIN ) return parseNone();
   else return json_encode($retAR);
}
function parseZip($filename){ // extract text of a .docx file (really a Zip XML file)
// http://www.blogs.zeenor.com/it/read-ms-word-docx-ms-word-2007-file-document-using-php.html
   $QANDA_MIN  = 10;
   $striped_content = ''; $content = '';
   if(!$filename || !file_exists($filename)) return false;
   $zip = zip_open($filename);
   if (!$zip || is_numeric($zip)) return false;
   // First loop cleans file into a set of text lines to loop thru later
   while ($zip_entry = zip_read($zip)) {
      if (zip_entry_open($zip, $zip_entry) == FALSE) continue;
      if (zip_entry_name($zip_entry) != "word/document.xml") continue;
      $content .= zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));
      zip_entry_close($zip_entry);
   }
   $content = str_replace('</w:r></w:p></w:tc><w:tc>'," ",$content);
   $content = str_replace('</w:r></w:p>',"\r\n",$content);
   $striped_content = strip_tags($content);
   // Now the second loop processes the cleaned lines one at a time
   $lines = explode(chr(0x0D),$striped_content);
   foreach($lines as $thisline) { $parts=explode(',',$thisline);
      if( strpos($thisline,chr(0x2C)) ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
         );
      }
   }
   if( count($retAR) < $QANDA_MIN ) return parseNone();
   else return json_encode($retAR);
}
function txget(){if(isset($_SESSION['csvJSON'])) echo $_SESSION['csvJSON'];} // 
if(isset($_REQUEST['tun'])) $tun=$_REQUEST['tun']; else $tun="";
switch($tun){ 
   case 'txget':
   //case 'fupld': case 'qiupd':case 'niupd':case 'ieupd': case 'qsupd':case 'uload':
   legal(); // ABOVE FOR USERS, REST OPEN 
   if(!isset($_REQUEST['was'])) eval($tun."();"); else eval($tun."(\$_REQUEST['was']);"); break;
}
?>

