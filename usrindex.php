<?php
$_CONFIG = require __DIR__ . '/config.php';
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set($_CONFIG['TIMEZONE']);
require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/oauth2.php";
require_once "php/upload.php";
require_once "php/global.php";
require_once "php/tools.php";


function parseNone(){ // For when all else fails
   $qhead = speak("qkopf","","","");
   $ahead = speak("akopf","","","");
   for( $i = 1; $i < 11; $i++ ) $retAR[] = array( "q" => "$qhead$i", "a" => "$ahead$i" );
   return json_encode($retAR);
}
function parsePlain($txtDoc){
   $QANDA_MIN  = 10;
   $lines = file( $txtDoc, FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES);
   foreach($lines as $num => $line){ $parts = explode('-->>',$line);
      if ( strpos($line, "-->>") ) { // process only Q&A lines (have comma)
         $retAR[] = array(
            "q" => preg_replace( '/\s+/', ' ', nunft( $parts['0'] ) ),
            "a" => preg_replace( '/\s+/', ' ', nunft( $parts['1'] ) )
         );
      }
   }
   if ( count($retAR) < $QANDA_MIN ) return parseNone();
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
   if ( !strlen( $text ) ) return "";
   $document = ""; $stack = array(); $j = -1;
   for ( $i = 0, $len = strlen($text); $i < $len; $i++) { $c = $text[$i];
      switch ($c) { // the most important key word backslash
         case "\\": $nc = $text[$i + 1];
            if     ( $nc == '\\' && rtf_isPlainText( $stack[ $j ] ) ) $document .= '\\';
            elseif ( $nc == '~' && rtf_isPlainText( $stack[ $j ] ) ) $document .= ' ';
            elseif ( $nc == '_' && rtf_isPlainText( $stack[ $j ] ) ) $document .= '-';
            elseif ( $nc == '*') $stack[$j]["*"] = true;
            elseif ( $nc == "'") { $hex = substr($text, $i + 2, 2);
               if ( rtf_isPlainText( $stack[ $j ] ) )
                  $document .= html_entity_decode("&#".hexdec($hex).";");
               $i += 2;
            } elseif ($nc >= 'a' && $nc <= 'z' || $nc >= 'A' && $nc <= 'Z') {
               $word = ""; $param = null;
               for ($k = $i + 1, $m = 0; $k < strlen($text); $k++, $m++) {
                  $nc = $text[$k];
                  if ( $nc >= 'a' && $nc <= 'z' || $nc >= 'A' && $nc <= 'Z') {
                     if ( empty( $param ) ) $word .= $nc; else break;
                  } elseif ( $nc >= '0' && $nc <= '9') $param .= $nc;
                  elseif ( $nc == '-') {
                     if ( empty( $param ) ) $param .= $nc; else break;
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
   $lines = explode( chr(0x0D), $document );
   //foreach( $lines as $thisline) { $parts = explode(',', $thisline);
      //if( strpos($thisline, chr(0x2C)) ) { // process only Q&A lines (have comma)
   foreach( $lines as $thisline) { $parts = explode('-->>', $thisline);
      if ( strpos( $thisline, "-->>" ) ) { // process only Q&A lines (have comma)
         $retAR[] = array(
            "q" => preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a" => preg_replace('/\s+/',' ',nunft($parts['1']))
         );
      }
   }
   if ( count( $retAR ) == 1 ) return parseNone();
   else return json_encode($retAR);
}
function parsePDF($pdfDoc){ // extract the text contents of a PDF
   //$TEMPORA    = "/home/notionary/tmp/";
   $TEMPORA    = "/tmp/";
   $PDFTOTEXT  = "/usr/bin/pdftotext";
   $QANDA_MIN  = 10;
   $newtx=$TEMPORA."pdfToText-".uniqid(rand()).".txt";
   exec("$PDFTOTEXT $pdfDoc $newtx");
   $lines=file($newtx,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES);
   //foreach($lines as $num => $line){ $parts=explode(',',$line);
      //if( strpos($line, chr(0x2C)) ) { // process only Q&A lines (have comma)
   foreach($lines as $num => $line){ $parts=explode('-->>',$line);
      if( strpos($line, "-->>") ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
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
          //if( strpos($thisline, chr(0x2C)) ) { // found at least one comma
          if( strpos($thisline, "-->>") ) { // found at least one comma
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
   //foreach($lines as $thisline) { $parts=explode(',',$thisline);
      //if( strpos($thisline,chr(0x2C)) ) { // process only Q&A lines (have comma)
   foreach($lines as $thisline) { $parts=explode('-->>',$thisline);
      if( strpos($thisline,"-->>") ) { // process only Q&A lines (have comma)
         $retAR[]=array(
            "q"=>preg_replace('/\s+/',' ',nunft($parts['0'])),
            "a"=>preg_replace('/\s+/',' ',nunft($parts['1']))
         );
      }
   }
   if( count($retAR) < $QANDA_MIN ) return parseNone();
   else return json_encode($retAR);
}
function prefs($getar){ // AJAX: update user preferences -> emails, pics, sounds
   $jason = json_decode(stripslashes($getar),true);
   $tafel = $jason['tafel']; $enabl = $jason['value'];
   $uidno = uidno(); ercau(); // erase the user's cache files
   $schon = konto("userID","$tafel","userID","$uidno"); // already unsuscribed messages
   if (  $enabl && !$schon ) sql("insert into $tafel (userID) values('$uidno')");
   if ( !$enabl &&  $schon ) sql("delete from $tafel where userID='$uidno'");
}
function nodel( $nidno ) {
   // Ensure the User owns the Notion before deleting!
   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files
   $query = mysqli_fetch_assoc( sql( "select userID, notion from aanotion where notionID='$nidno'" ) );
   if ( $query['userID'] == $uidno ) {
      $ntabl = $query['notion'];
      sql("delete from aanotion where notionID='$nidno'");
      sql("delete from aaformula where notionID='$nidno'");
      sql("delete from aapart where notionID='$nidno'");
      sql("delete from aapdfid where notionID='$nidno'");
      sql("delete from aaperfid where notionID='$nidno'");
      sql("delete from aapiction where notionID='$nidno'");
      sql("delete from aarating where notionID='$nidno'");
      sql("delete from aareview where notionID='$nidno'");
      sql("delete from aasperq where notionID='$nidno'");
      sql("delete from aavideo where notionID='$nidno'");
      sql("drop table `$ntabl`");
   }
}
function schaf( $getar ) { // AJAX: create a notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nncurTable  = rawurldecode(utf8_decode($jason['nncur'])); // NO  \
   $nncurColumn = mysqli_real_escape_string(lsql(),$nncurTable);     // YES \
   $nccur = utf8_decode( $jason['nccur'] );
   $ndcur = mysqli_real_escape_string(lsql(),rawurldecode( utf8_decode($jason['ndcur'])));
   $slang = $jason['slang'];   $tlang = $jason['tlang'];
   $picto = $jason['picto'];   $spcur = $jason['spcur'];
   $newAR = $jason['newAR'];

   if ( konto("notionID","aanotion","notion","$nncurColumn") ) { echo speak("inuse","","",""); return( false ); }

   $uidno = uidno();           ercau(); ercas(); // erase the user's and system's cache files

   // Enter into aanotion
   sql( "insert into aanotion ( userID, notion, slang, tlang, category, description)
         values ('$uidno','$nncurColumn','$slang','$tlang','$nccur',  '$ndcur')" );
   $r = mysqli_fetch_assoc(
      sql( "select AUTO_INCREMENT from information_schema.tables where table_schema='notionary_db' and table_name='aanotion'" ) );
   $nidno = $r['AUTO_INCREMENT'] - 1;

   if ( $picto ) sql( "insert into aapiction (notionID) values('$nidno')" ); // Enter into aapiction

   if ( $spcur != "30" ) sql( "insert into aasperq (notionID, sperq) values('$nidno','$spcur')" ); // Enter into aasperq

   // Create Notion table. XXXXXXXX Get rid of Image from now on
   sql( "create table `$nncurTable` (
        question char(100) NOT NULL PRIMARY KEY,
        answer   char(100) NOT NULL,
        imageID int(24)
       ) engine = MyISAM default charset = utf8 collate utf8_bin" );

   foreach( $newAR as $b ) { // populate notion with array of concepts.
      $bq = trim( mysqli_real_escape_string(lsql(),$b['q']) );  // allow apostrophes
      $ba = trim( mysqli_real_escape_string(lsql(),$b['a']) );  // allow apostrophes
      if ( !empty( $bq ) && !empty( $ba ) )
         sql( "insert into `$nncurTable` (question,answer) values('$bq','$ba')" );
   }
}
function ander( $getar ){ // AJAX: change an extant notion
   $jason = json_decode( stripslashes( $getar ), true );
   $nname = $jason['nncur'];       $ndcur = $jason['ndcur'];
   $nccur = $jason['nccur'];       $spcur = $jason['spcur'];
   $slang = $jason['slang'];       $tlang = $jason['tlang'];       $picto = $jason['picto'];
   $nidno = $jason['nidno'];       $newAR = $jason['newAR'];       $oldAR = $jason['oldAR'];

   $query = mysqli_fetch_assoc( sql( "select * from aanotion where notionID = $nidno" ) );
   $nnold = $query['notion'];      $ndold = $query['description']; $ncold = $query['category'];
   $oldsl = $query['slang'];       $oldtl = $query['tlang'];

   $spold = sql( "select sperq from aasperq where notionID = '$nidno'" );

   // Purge NHTML + cfiles + SINFO ( metainfo:'aanotion' may have changed ) + UINFO (My Notions)
   $nnurl = "/home/notionary/".$oldsl."/".$ncold."/".$nnold.".html";
   if ( file_exists( $nnurl ) ) unlink($nnurl);
   ercan($nidno); ercas(); ercau();

   // check if any meta info changed: {nname|ndesc|ncat|slang|tlang|picto}
   if ( $nnold != $nname ){
      if ( konto("notionID","aanotion","notion","$nname") &&
          strtolower( $nnold ) != strtolower( $nname ) ){ // prevent collision + allow recapitalizing
         echo speak("inuse","","","");
         return(false);
      }
      sql("rename table `$nnold` to `$nname` ");
      sql("update aanotion set notion='$nname' where notionID='$nidno'");
   }
   if ( $ndold != $ndcur ) sql( "update aanotion set description='$ndcur' where notionID='$nidno'" );
   if ( $ncold != $nccur ) sql( "update aanotion set category='$nccur' where notionID='$nidno'" );
   if ( $oldsl != $slang ) sql( "update aanotion set slang='$slang' where notionID='$nidno'" );
   if ( $oldtl != $tlang ) sql( "update aanotion set tlang='$tlang' where notionID='$nidno'" );

   if ( $spold != $spcur ) sql( "update aasperq set sperq='$spcur' where notionID='$nidno'" );

   konto("notionID","aapiction","notionID","$nidno") ? $ispik = true : $ispik = false;
   if (  $picto && !$ispik ) sql( "insert into aapiction (notionID) values('$nidno')" );
   if ( !$picto &&  $ispik ) sql( "delete from aapiction where notionID='$nidno'" );

   $felde = " question, answer ";           // minimum set of fields to select
   $qi = sql( "show columns from `$nname` like 'imageID'" );
   $ri = mysqli_num_rows( $qi ) ? TRUE : FALSE;
   if ( $ri ) $felde .= ", imageID ";

   $qs = sql("show columns from `$nname` like 'soundID'");
   $rs = mysqli_num_rows( $qs ) ? TRUE : FALSE;
   if ( $rs ) $felde .= ", soundID ";

   // Walk through the old table saving any Media
   $q = sql("select $felde from `$nname`");
   while ( $r = mysqli_fetch_assoc( $q ) ){
      if ( $ri ) $imgid = $r['imageID']; else $imgid = NULL;
      if ( $rs ) $sndid = $r['soundID']; else $sndid = NULL;
      if ( $ri || $rs )
         $media[] = array(
                       "q" => $r['question'],
                       "i" => $imgid,
                       "s" => $sndid
                    );
   }

   // Truncate and repopulate entire table rather than 1-by-1
   sql( "truncate table `$nname`" );
   foreach( $newAR as $b ){ // Start collecting the Questions and Answers from newAR[] received
      $bq = trim( mysqli_real_escape_string( lsql(),$b['q']) );  // Question allow apostrophes
      $ba = trim( mysqli_real_escape_string( lsql(),$b['a']) );  // Answer   allow apostrophes
      unset( $bi ); unset( $bs );  // Clear running Image and Sound for this table entry
      if ( !empty( $media ) )
         foreach( $media as $m )   // Conserve media if Question is a match (including apostrophes)
            if ( trim( mysqli_real_escape_string( lsql(),$m['q']) ) == $bq ) {
               $bi = $m['i'];
               $bs = $m['s'];
            }

      // Now repopulate the table with new entries and saved media (if any)
      if ( empty( $bq ) || empty( $ba ) ) continue; // Either Q or A missing -->> Drop entry even if media lost
      if ( isset( $bi ) && isset( $bs ))            // Have both Image as well as Sound
         sql( "insert into `$nname` (question,answer,imageID,soundID) values('$bq','$ba','$bi','$bs')" );
      else if ( isset( $bi ) && !isset( $bs ) )     // Have Q&A and image but no sound
         sql( "insert into `$nname` (question,answer,imageID) values('$bq','$ba','$bi')" );
      else if ( isset( $bs ) && !isset( $bi ) )     // Have Q&A and sound but no image
         sql( "insert into `$nname` (question,answer,soundID) values('$bq','$ba','$bs')" );
      else sql( "insert into `$nname` (question,answer) values('$bq','$ba')" ); // Just have Q&A
   }
}
function prdel($getar){ // AJAX: delete overcome problems
   $jason = json_decode($getar,true);
   $prfid = $jason['prfid']; $pblem = scapo($jason['pblem']);
   sql("delete from aaprobs where perfID='$prfid' and probs='$pblem'");
   ercau();
}

if ( isset( $_REQUEST['tun'] ) ) $tun = $_REQUEST['tun']; else $tun = "";
switch ( $tun ) {
   case 'ercau':ercau(); break; // In case nimag changed or such
   case 'ercan':ercan($_REQUEST['was']); break; // In case nimag changed or such
   // REQUIRE LOGIN BUT NOT SITE-DRIVEN
   case 'schaf':case 'ander':case 'nodel':case 'prdel': // NOTIONS
   case 'slang':case 'prefs': // USERS
   case 'geter':case 'getme':case 'seter':
   case 'fupld':case 'uload':
         legal();
         if ( !isset( $_REQUEST['was'] ) ) eval($tun."();");
         else eval($tun."(\$_REQUEST['was']);"); break;
}
?>
