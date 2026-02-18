<?php
session_start();
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set('Europe/Berlin');

require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/asynch.php";
require_once "php/oauth2.php";
require_once "php/global.php";
require_once "php/tools.php";        // Because of smail()
require_once "php/math.php";         // Because of formx()

// Google APP SDK : https://console.developers.google.com/apis/credentials?project=api-project-181082067736&folder=&organizationId=
require_once "lib/google-api-php-client/src/Google_Client.php";
require_once "lib/google-api-php-client/src/contrib/Google_Oauth2Service.php";
require_once "lib/google-api-php-client/src/contrib/Google_PlusService.php";
// Twitter APP SDK : https://apps.twitter.com/app/4371651/show
require_once "lib/twitteroauth.php";
// Facebook APP SDK : https://developers.facebook.com/apps/130238993833214/dashboard/
require_once 'lib/facebook-sdk-v5/autoload.php';
use Facebook\FacebookSession;
use Facebook\FacebookRequest;
use Facebook\FacebookRedirectLoginHelper;
use Facebook\GraphUser;
use Facebook\FacebookResponse;
use Facebook\FacebookSDKException;
use Facebook\FacebookRequestException;
use Facebook\FacebookAuthorizationException;
use Facebook\GraphObject;
use Facebook\Entities\AccessToken;
use Facebook\HttpClients\FacebookCurlHttpClient;
use Facebook\HttpClients\FacebookHttpable;

function asone($q,$personal){ // collect summary info array for a set of notionIDs
   $NOIMGID = 101;
   openlog("asone",LOG_NDELAY,LOG_LOCAL2);
   if (mysqli_num_rows($q) == 0 ) return(false);
   else while( $r = mysqli_fetch_assoc($q) ) { // We walk thru all found Notions
      // But be ready to bail out if one non-extant!!
      $ownav = $NOIMGID; $chmav=$NOIMGID;
      $nidno = $r['notionID'];
      $n = mysqli_fetch_assoc(
            sql("select notion, description, userID, imageID, category, slang
                 from aanotion where notionID='$nidno'"));
      if ( !isset($n['notion']) ) continue; // Avoid Zombie Notions
      $nname = $n['notion']; $ndesc=$n['description']; $ownid=$n['userID'];
      $nimag = $n['imageID']; $catno=$n['category']; $slang=$n['slang'];
      $extant = sql("select question from `$nname`");
      if ($extant) $nsize=mysqli_num_rows($extant);
      else {
         syslog(LOG_ERR,"$_SERVER[REMOTE_ADDR] UINFO Zombie Alert $nname($nidno)");
         return(false);
      }
      $t=mysqli_fetch_array(sql("select avg(rating) as arate from aarating
                                 where notionID='$nidno'"));
      $rated=$t['arate'];
      $revus="";
      $wq=sql("select userID, review from aareview where notionID='$nidno'");
      while($w=mysqli_fetch_assoc($wq)){
         $rever=anone($w['userID']); // reveiwer data (protect)
         $revus.="$rever-->>$w[review]￭";
      }
      $p=mysqli_fetch_assoc(
            sql("select part, cardinality from aapart where notionID='$nidno'"));
      $piece=$p['part']; $parts=$p['cardinality'];
      konto("notionID","aapiction","notionID","$nidno") ? $picto=true : $picto=false;
      konto("notionID","aaformula","notionID","$nidno") ? $forja=true : $forja=false;
      $dokum=holen("pdfID","aapdfid","notionID","$nidno");
      $video=holen("video","aavideo","notionID","$nidno");
      $nall =nrall($nidno);                /*** Notion Records ***/
      $owner=anone($ownid);
      $ownav=holen("imageID","aaavatar","userID","$ownid");
      $chav1=holen("imageID","aaavatar","userID","$nall[ch1id]");
      $chav2=holen("imageID","aaavatar","userID","$nall[ch2id]");
      $chav3=holen("imageID","aaavatar","userID","$nall[ch3id]");

      // UINFO stuff: Personal records for Notions are not desirable at SINFO nor Outsiders because
      // of the caching nature of this ONE file.. avoid individual turds
      if( $personal && isset($_SESSION['uname']) ){ /*** Personal Records ***/
         $mall=nmall(holen("userID","aauser","user",$_SESSION['uname']),$nidno);
         $retAR[]=array(
            "nidno" => $nidno, "nname" => $nname, "ndesc" => $ndesc, "nimag" => $nimag,
            "catno" => $catno, "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
            "piece" => $piece, "parts" => $parts, "picto" => $picto, "forja" => $forja,
            "dokum" => $dokum, "video" => $video, "chav1" => $chav1, "chav2" => $chav2,
            "chav3" => $chav3,
            "mysc1" => $mall['mysc1'], "mybt1" => $mall['mybt1'],
            "mysc2" => $mall['mysc2'], "mybt2" => $mall['mybt2'],
            "mysc3" => $mall['mysc3'], "mybt3" => $mall['mybt3'],
            "scor1" => $nall['scor1'], "time1" => $nall['time1'],
            "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'],
            "scor2" => $nall['scor2'], "time2" => $nall['time2'],
            "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'],
            "scor3" => $nall['scor3'], "time3" => $nall['time3'],
            "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'],
            "owner" => $owner, "ownid" => $ownid, "ownav" => $ownav, "slang" => $slang
         );
      } else { // Non personal Notions info (for SINFO) and Outsiders
         $retAR[]=array(
            "nidno" => $nidno, "nname" => $nname, "ndesc" => $ndesc, "nimag" => $nimag,
            "catno" => $catno, "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
            "piece" => $piece, "parts" => $parts, "picto" => $picto, "forja" => $forja,
            "dokum" => $dokum, "video" => $video, "chav1" => $chav1, "chav2" => $chav2,
            "chav3" => $chav3,
            "mysc1" => NULL, "mybt1" => NULL,
            "mysc2" => NULL, "mybt2" => NULL,
            "mysc3" => NULL, "mybt3" => NULL,
            "scor1" => $nall['scor1'], "time1" => $nall['time1'],
            "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'],
            "scor2" => $nall['scor2'], "time2" => $nall['time2'],
            "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'],
            "scor3" => $nall['scor3'], "time3" => $nall['time3'],
            "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'],
            "owner" => $owner, "ownid" => $ownid, "ownav" => $ownav, "slang" => $slang
         );
      }
   }
   closelog();
   return($retAR);
}
function dopdf($nidxy){ // GET: <iframe src=.. See Tutotials at http://www.fpdf.org/
   openlog("dopdf",LOG_NDELAY,LOG_LOCAL2);
   $PARAM_MYURL = param("myurl");
   $QA_MAX_CHARS = 36;  // To decide if multi line printing of a QA pair
   $TXT_PG_TOP = 15;  $IMG_PG_TOP = 30; $QA_HEIGHT = 3.5; // Height of a line of text
   $IMG_WIDTH  = 50;  $IMG_HEIGHT = 30; $IMG_BUMP  = 40;
   if(!is_numeric($nidno=mysqli_real_escape_string(lsql(),$nidxy))) rjekt();
   $nname = holen("notion","aanotion","notionID",$nidno);
   if ( empty($nname) ) return;  // This should throw a 403 or similar
   konto("notionID","aapiction","notionID","$nidno") ? $picto=true : $picto=false;
   define('TFPDF_INSTALLDIR', 'lib/tfpdf'); // tFPDF Fonts -->> Handle UTF 
   include(TFPDF_INSTALLDIR.'/tfpdf.php');
   $qi     = sql("show columns from `$nname` like 'imageID'");
   $visual = mysqli_num_rows($qi)?TRUE:FALSE;
   $qs     = sql("show columns from `$nname` like 'soundID'");
   $sonora = mysqli_num_rows($qs)?TRUE:FALSE;
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] ($nidxy)");
   class PDF extends tFPDF {
      function Header(){ // Page header
         $PARAM_IMAGE = param("image");
         $this->SetY(0); // Position at 0mm from top
         $this->SetTextColor(0,0,0);
         $this->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
         $this->SetFont('DejaVu','',26); // Family, Style(''=Regular,'B'=bold,'I'=italic,'U'=underline), Size (pts)
         $this->Cell(70,15,"notionary",0,'L'); // A normal page has 21cm width. ( w, h, txt, border, moveTo, align )
         $this->SetTextColor(98,122,172); // #627AAC
         $this->SetFont('DejaVu','',16);
         $this->Cell(10); // Move 1cm to the right
         $this->Cell(0,15,$this->title,2,0,'R'); // w 0=up to right margin, h, txt, border, moveTo, align
         $this->Ln(20); // Line break
      }
      function Footer(){ // Page footer
         $XLATE_CRITE = xlate("crite",$_SESSION['slang']);
         $this->SetY(-20); // Position at 2cm from bottom
         $this->SetTextColor(0,0,0);
         $this->SetFont('Arial','I',10); // Arial italic 10
         $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C'); // Page number
         $this->SetY(-10);
         $this->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
         $this->SetFont('DejaVu','',10); // Italic + Bold
         $this->Cell(0,13,$XLATE_CRITE,0,0,'C');
      }
   }
   $pdf = new PDF('P','mm','Letter');
   $pdf->SetTitle($nname);
   $pdf->AliasNbPages();
   $pdf->AddPage();
   $pdf->SetFillColor(235,235,235); // Soft Gray Background alternated for easy reading
   $pdf->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
   $pdf->SetFont('DejaVu','',10);
   if($picto){ // KLUDGE: FPDF gets image type from URI rather than headers!!
      $felde=" question "; if($visual) $felde.=", imageID "; if($sonora) $felde.=", soundID ";
      $q=sql("select $felde from `$nname`");
      $picts=1;  // Pseudo index parity + cardinality control jumps to next row + page
      $fpdfImageYPos=$IMG_PG_TOP;    $pdf->SetY($TXT_PG_TOP);
      while($r=mysqli_fetch_assoc($q)){ // each row may have diff img type
         $slink="";
         if($visual && $r['imageID'])  $imgid=$r['imageID']; else $imgid=100;   // Pictions NULL images ?
         if($sonora && $r['soundID'])  $sndid=$r['soundID']; else $sndid=false; // Pictions NULL sounds ?
         $ilong=holen("type","aaimage","imageID","$imgid");  // has "image/" prefix
         if(empty($ilong)){ $imgid=100; $ilong="image/gif";} // may have been purged
         // If image is Owl and we have sound, it is best to put on a speaker
         if($imgid==100 && $sndid) $imgid = 130;
         $itype=substr($ilong,6,strlen($ilong)-6);  // type ext: gif, png, jpg, jpeg
         $istrg=$PARAM_MYURL."?tun=ibyid&was=".$imgid."#.".$itype; // type HACK
         if($sndid) $slink=$PARAM_MYURL."?tun=sbyid&was=".$sndid; // Try this link on Soundtions
         if($picts%2) // Odd images on the left, leave 10 (1cm) for text
            $pdf->Image($istrg,0,$fpdfImageYPos+10,$IMG_WIDTH,$IMG_HEIGHT,'',$slink);
         else { // Even on right and go down an Image height amount
            $pdf->Image($istrg,120,$fpdfImageYPos+10,$IMG_WIDTH,$IMG_HEIGHT,'',$slink);
            $fpdfImageYPos+=$IMG_BUMP;
         }
         $pdf->SetTextColor(252,127,3);  // #FC7F03
         // Odd left + move right; Even right + nl;   special chars may non-display
         if($picts%2) $pdf->Cell(120,$IMG_BUMP,getGoodChoice($r['question']),0,0,'L');
         else $pdf->Cell(120,$IMG_BUMP,getGoodChoice($r['question']),0,1,'L');
         if( $picts && !($picts % 12 ) ){ // every 12 picts add page and reset Y
            $pdf->AddPage();
            $fpdfImageYPos=$IMG_PG_TOP;
            $pdf->SetY($TXT_PG_TOP);
         } $picts++;
      }
   } else {
      $q=sql("select question, answer from `$nname`");
      $fillme = 1; // Pseudo index whose parity determines to fill or not
      while($r=mysqli_fetch_assoc($q)){ // Clean answer from possible XOICES_SEPARATOR
         $question = $r['question']; $answer = getGoodChoice($r['answer']);
         $qaLength = strlen($question."     ".$answer); // Leave room in middle for arrow
         if($qaLength < 2*$QA_MAX_CHARS){ // Single line printing
            $pdf->SetTextColor(255,0,0);
            $pdf->Cell(100,$QA_HEIGHT,$question,0,0,'R',$fillme%2);
            $pdf->SetTextColor(231,143,8);
            $pdf->SetFontSize(15);  // This just for the separator arrow
            $pdf->Cell(10,$QA_HEIGHT,"  ➡  ",0,0,'C',$fillme%2);
            $pdf->SetFontSize(10);
            $pdf->SetTextColor(0,100,0);
            $pdf->Cell(100,$QA_HEIGHT,$answer,0,1,'',$fillme%2);
         } else { // Multi Line printing here 
            $pdf->SetTextColor(221,75,57);
            $pdf->MultiCell(0,$QA_HEIGHT,$question,0,'C',$fillme%2);
            $pdf->SetTextColor(231,143,8);
            $pdf->SetFontSize(10);
            $pdf->SetTextColor(0,100,0);
            $pdf->MultiCell(0,$QA_HEIGHT,$answer,0,'C',$fillme%2);
         }
         $fillme++;
      }
   }
   $pdf->Output();
   closelog();
}
          /*******************************************************************
          *                         SUPER ARRAYS                             *
          ********************************************************************/
function sinf0(){ $PILE = 40;
   $q=sql("show columns in aaglobe like '__'");
   while($r=mysqli_fetch_assoc($q)) $lanAR[]=$r['Field'];
   $q=sql("select distinct category from aanotion where slang='$_REQUEST[was]' order by category");
      while($r=mysqli_fetch_assoc($q)) $katAR[]=$r['category'];
   $q=sql("select userID, count(userID) as stars from `aaperfid` group by userID order by stars desc limit 0,3");
   while($r=mysqli_fetch_assoc($q)){
      $ownav=holen("imageID","aaavatar","userID","$r[userID]");
      $befat=explode('@',holen("user","aauser","userID","$r[userID]"));
      $stuAR[]=array("stdnt"=>$befat[0],"stars"=>$r['stars'],"stdav"=>$ownav);
   }
   $q=sql("select userID, count(userID) as stars from `aanotion` group by userID order by stars desc limit 0,3");
   while($r=mysqli_fetch_assoc($q)){
      $ownav=holen("imageID","aaavatar","userID","$r[userID]");
      $befat=explode('@',holen("user","aauser","userID","$r[userID]"));
      $tecAR[]=array("techi"=>$befat[0], "stars"=>$r['stars'], "stdav"=>$ownav);
   }
   foreach($katAR as $k){ unset($kitAR); // send all notions for all cats lang
      $q=sql("select notionID from aanotion where category='$k' order by notion");
      if(mysqli_num_rows($q)!=0){
         $kitARA = asone(
                      sql(
                         "select notionID from aanotion where category='$k' and slang='$_REQUEST[was]' order by notion"),
                         false);
         $ktnAR[]=array($k => $kitARA);
      }
   }
   // [0] prepare the generic system data -- first dimension
   $retAR[]=array("langs"=>$lanAR, "studs"=>$stuAR, "techs"=>$tecAR, "katse"=>$katAR, "kitns"=>$ktnAR);

   // [1] get the popular notions of the given lang summary -- second dimension
   $popAR = asone( sql(
               "select * from 
                   (select notionID, count(notionID) as c
                       from aaperfid
                       group by notionID
                       order by c desc
                       limit 0, $PILE
                   ) as x 
                inner join aanotion as n
                on n.notionID=x.notionID
               where n.slang='$_SESSION[slang]'"),
            false); 
   $retAR[]=array("npops" => $popAR);    // second dimmension [1]

   // [2] prepare the system parameters -- third dimension
   $q=sql("select * from aaparam");
   while($r=mysqli_fetch_assoc($q)) $parAR[]=array($r['kodex'] => $r['value']);
   $retAR[]=array("param" => $parAR);    // third dimmension [2]

   // [3] prepare the supernotions -- fourth dimension
   $q = sql("select * from aasuper where slang='$_REQUEST[was]'");
   while( $r = mysqli_fetch_assoc( $q ) ){
      $owner=anone($r['userID']); $ownav=holen("imageID","aaavatar","userID","$r[userID]");
      $supAR[] = array("supid" => $r['superID'],     "owner" => $owner,            "ownav" => $ownav,        
                       "sname" => $r['supernotion'], "sdesc" => $r['description'], "snots" => $r['notions']);
   }
   $retAR[] = array("supers" => $supAR);
   return( $retAR );
}
function ninf0(){ // [0] = generic + myScores + Records, [1] = qai //, [3] = myPerformance
   $nname = $_REQUEST['was'];
   $ntabl = $nname;                            // use as Table name without  \'
   $nncol = mysqli_real_escape_string(lsql(),$nname);  // use as Column content with \' WHY NOT MYSQLI

   $r = mysqli_fetch_assoc( sql("select notionID, notion from `aanotion` where notion='$nncol'"));
   // Need fail with error thrown so narySession:nentr() degrades to a search from n=bad string
   if(!$r) { header('HTTP/1.1 500 Query String Error'); exit(); }
   // Get the correct spelling as it may have come jumbled
   $nidno = $r['notionID']; $ntabl=$r['notion']; $nname=$r['notion'];
   $query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
   $multi = mysqli_fetch_assoc(
      sql("select aanotion.notionID,
              aasperq.sperq,
              aapart.part,
              aapart.cardinality,
              aapdfid.pdfID,
              aavideo.video from aanotion
              left join aasperq  on aasperq.notionID = aanotion.notionID
              left join aapart   on aapart.notionID  = aanotion.notionID
              left join aapdfid  on aapdfid.notionID = aanotion.notionID
              left join aavideo  on aavideo.notionID = aanotion.notionID
              where aanotion.notionID=$nidno"));
   $nsize = mysqli_num_rows(sql("select question from `$ntabl`"));
   $nall  = nrall($nidno);      // notion score records
   $chav1 = holen("imageID","aaavatar","userID","$nall[ch1id]");
   $chav2 = holen("imageID","aaavatar","userID","$nall[ch2id]");
   $chav3 = holen("imageID","aaavatar","userID","$nall[ch3id]");
   $t = mysqli_fetch_array( sql("select avg(rating) as arate from aarating where notionID='$nidno'"));
   $rated = $t['arate'];
   $revus = "";
   $wq = sql("select userID, review from aareview where notionID='$nidno'");
   while($w=mysqli_fetch_assoc($wq)){
      $rever  = anone($w['userID']); // reveiwer data (protect)
      $revus .= "$rever-->>$w[review]￭";
   }
   konto("notionID","aapiction","notionID","$nidno") ? $picto=true : $picto=false;
   konto("notionID","aaformula","notionID","$nidno") ? $forja=true : $forja=false;
   $ownid=holen("userID","aanotion","notionID","$nidno");
   $owner=anone($ownid);
   $ownav=holen("imageID","aaavatar","userID","$ownid");
   // [0] generic Notion data  plus records (personal + notion wide)
   if(isset($_SESSION['uname'])){ // personal records
      $mall=nmall(holen("userID","aauser","user",$_SESSION['uname']),$nidno);
      $retAR[]=array(
         "nidno" => $nidno, "nname" => $nname, "ndesc" => $query['description'], "nimag" => $query['imageID'],
         "catno" => $query['category'], "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
         "piece" => $multi['cardinality'], "parts" => $multi['part'], "dokum" => $multi['pdfID'], "video" => $multi['video'],
         "sperq" => $multi['sperq'], "slang" => $query['slang'], "tlang" => $query['tlang'], "ownid" => $ownid,
         "picto" => $picto, "forja" => $forja, "owner" => $owner, "ownav" => $ownav,
         "mysc1" => $mall['mysc1'], "mybt1" => $mall['mybt1'],
         "mysc2" => $mall['mysc2'], "mybt2" => $mall['mybt2'],
         "mysc3" => $mall['mysc3'], "mybt3" => $mall['mybt3'],
         "scor1" => $nall['scor1'], "time1" => $nall['time1'],
         "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'], "chav1" => $chav1,
         "scor2" => $nall['scor2'], "time2" => $nall['time2'],
         "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'], "chav2" => $chav2,
         "scor3" => $nall['scor3'], "time3" => $nall['time3'],
         "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'], "chav3" => $chav3
      );
   } else {
      $retAR[]=array(
         "nidno" => $nidno, "nname" => $nname, "ndesc" => $query['description'], "nimag" => $query['imageID'],
         "catno" => $query['category'], "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
         "piece" => $multi['cardinality'], "parts" => $multi['part'], "dokum" => $multi['pdfID'], "video" => $multi['video'],
         "sperq" => $multi['sperq'], "slang" => $query['slang'], "tlang" => $query['tlang'], "ownid" => $ownid,
         "picto" => $picto, "forja" => $forja, "owner" => $owner, "ownav" => $ownav,
         "mysc1" => NULL, "mybt1" => NULL,
         "mysc2" => NULL, "mybt2" => NULL,
         "mysc3" => NULL, "mybt3" => NULL,
         "scor1" => $nall['scor1'], "time1" => $nall['time1'],
         "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'], "chav1" => $chav1,
         "scor2" => $nall['scor2'], "time2" => $nall['time2'],
         "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'], "chav2" => $chav2,
         "scor3" => $nall['scor3'], "time3" => $nall['time3'],
         "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'], "chav3" => $chav3
      );
   }
   // [1] prepare QAI data(utf8) -- third dimension
   $felde=" question, answer ";           // minimum set of fields to select
   $qi=sql("show columns from `$ntabl` like 'imageID'");
   $ri=mysqli_num_rows($qi)?TRUE:FALSE;
   $qs=sql("show columns from `$ntabl` like 'soundID'");
   $rs=mysqli_num_rows($qs)?TRUE:FALSE;
   if($ri) $felde.=", imageID "; if($rs) $felde.=", soundID ";
   $q=sql("select $felde from `$ntabl`");
   while($r=mysqli_fetch_assoc($q)){
      if($ri) $imgid=$r['imageID']; else $imgid="";
      if($rs) $sndid=$r['soundID']; else $sndid="";
      $qaimg[]=array("q"=>$r['question'],"a"=>$r['answer'],"i"=>$imgid,"s"=>$sndid);
   }
   if($forja) $qaimg=formx($nidno); // Populate Q&A for a Formulation
   $retAR[]=array("qaimg" => $qaimg);
   return( $retAR );
}
function ninfo(){
   $urarg = parse_url($_SERVER['REQUEST_URI']);  // Reject other than ?tun=ninfo&was=XXXXX....
   if ( strlen( $urarg['query'] ) < 19 || substr( $urarg['query'], 0, 14 ) != "tun=ninfo&was=" ) rjekt();
   $nname = $_REQUEST['was'];
   $nncol = mysqli_real_escape_string(lsql(),$nname);  // use as Column content with \' WHY NOT MYSQLI
   $nidno = holen("notionID","aanotion","notion",$nncol);
   if ( isset( $_SESSION['uname'] ) ) { $track = uidno(); } else $track = $_SERVER['REMOTE_ADDR'];
   fcach( "cache/_notionary_NINFO_".$nidno."_".$track."_cache.php", "604800", "ninfo"  );
}
function linf0(){
   $q = sql("select kodex, $_REQUEST[was] from aaglobe order by kodex");
   while( $r = mysqli_fetch_assoc( $q ) ) $tmpAR[] = array( $r['kodex'] => $r[$_REQUEST['was']] );
   return( $tmpAR );
}
function uinf0(){
   $PILE = 50;
   $NOIMGID = 101;
   $uname = $_SESSION['uname']; $uimag = $NOIMGID;
   $uidno = uidno(); if ( empty($uidno) ) { echo ""; exit; }
   $multi = mysqli_fetch_assoc(
      sql("select aauser.ulang, aaemail.email, aakname.kname, aafname.fname, aaavatar.imageID from aauser
              left join aaemail  on aaemail.userID  = aauser.userID
              left join aakname  on aakname.userID  = aauser.userID
              left join aafname  on aafname.userID  = aauser.userID
              left join aaavatar on aaavatar.userID = aauser.userID
              where aauser.userID=$uidno"));
   konto("userID","aanosnd","userID","$uidno") ? $nosnd = true : $nosnd = false;
   konto("userID","aajamsg","userID","$uidno") ? $msges = true : $msges = false;
   $kenne = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='1'") );
   $wrote = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='2'") );
   $meist = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='3'") );
   // [0] prepare the generic info -- first dimension
   isset( $_SESSION['fbusr'] ) ? $fbusr = $_SESSION['fbusr'] : $fbusr = NULL;
   // Note, we used twitter's ID to get UINFO[0].uname, and now twitter's name to get UINFO[0].twusr for AVATAR extraction
   isset( $_SESSION['twava'] ) ? $twusr = $_SESSION['twava'] : $twusr = NULL;
   isset( $_SESSION['gpusr'] ) ? $gpusr = $_SESSION['gpusr'] : $gpusr = NULL;
   $retAR[] = array(
      "uname" => $uname, "uidno" => $uidno, "email" => $multi['email'], "ulang" => $multi['ulang'],
      "kenne" => $kenne, "wrote" => $wrote, "meist" => $meist,
      "fbusr" => $fbusr, "twusr" => $twusr, "gpusr" => $gpusr,
      "kname" => $multi['kname'], "fname" => $multi['fname'], 
      "nosnd" => $nosnd, "msges" => $msges, "uimag" => $multi['imageID']
   );

   // [1] prepare the recent notions tested by user -- second dimension(FORCED!!)
   $rcnAR = asone(
      sql("select notionID, max(dtime) as date from aaperfid
              where userID='$uidno'
              group by notionID
              order by date desc
              limit 0, $PILE"
      ),true
   );
   if ( $rcnAR ) $retAR[] = array("rcent" => $rcnAR); // BY FORCE!! if necessary
   else $retAR[] = array(""=>""); // <<-- ENFORCE HERE so "meine" always works as [2]

   // [2] prepare the user created notions -- second dimension(FORCED!!)
   $meiAR = asone(sql("select notionID, notion from aanotion where userID='$uidno' order by notion"),true);
   if ( $meiAR ) $retAR[] = array("meine" => $meiAR); // BY FORCE!! if necessary
   else $retAR[]=array(""=>""); // <<-- ENFORCE HERE so "review" always works as [3]

   // [3] prepare the user notion/question probs for purging by review
   $q = sql("select perfID, notionID, ptype from aaperfid where userID='$uidno'");

   while($r=mysqli_fetch_assoc($q)){ unset($probs); // walk thru all Tests of this user
      if ( empty( $nname = holen("notion","aanotion","notionID",$r['notionID'])) ) { // Delete zombies
         sql("delete from aaperfid where perfID='$r[perfID]'");
         sql("delete from aaprobs where perfID='$r[perfID]'");
         continue;
      } else { // Find out if test has pending problems
         $nimag = holen("imageID","aanotion","notionID",$r['notionID']);
         $p = sql("select probs from aaprobs where perfID='$r[perfID]'");
         konto("notionID","aapiction","notionID","$r[notionID]") ? $picto=true : $picto=false;
         while ( $t = mysqli_fetch_assoc($p) ){ // get all probs of a test(perfID)
            $qi = sql("show columns from `$nname` like 'imageID'");
            $visual = mysqli_num_rows($qi)?TRUE:FALSE;
            $qs = sql("show columns from `$nname` like 'soundID'");
            $sonora = mysqli_num_rows($qs)?TRUE:FALSE;
            $felde = " question, answer "; if($visual) $felde.=", imageID "; if($sonora) $felde.=", soundID ";
            $raw_prob = $t['probs'];  // if apostrophes: keep the raw unescaped for passing to client
            $net_prob = scapo($t['probs']); // and clean it for querying the 'aaprobs' table
            $s = mysqli_fetch_array(sql("select $felde from `$nname` where question='$net_prob'"));
            if ( empty($s['question']) ){ // Q&A may have changed since Testing ==>> Forgive
               sql("delete from aaprobs where perfID='$r[perfID]' and probs='$raw_prob'");
            } else { // Clear and get decoys even if choiced! -- Let Repaso at client handle decoys from raw_prob
               unset($d); unset($k); unset($dec); // $d(SQL) $k(Fetch) $dec(Array)
               $d=sql("select answer from `$nname` where question!='$net_prob' order by rand() limit 4");
               while($k=mysqli_fetch_array($d)) $dec[]=getGoodChoice($k['answer']);
               // Avoid complaints about possible non extant images/sounds
               isset($s['imageID']) ? $theImage=$s['imageID'] : $theImage=NULL;
               isset($s['soundID']) ? $theSound=$s['soundID'] : $theSound=NULL;
               $probs[] = array( "pid" => $r['perfID'], "nim" => $nimag,
                               "prb" => $raw_prob, "sol" => $s['answer'],
                               "img" => $theImage, "snd" => $theSound,
                               "pik" => $picto,    "dec" => $dec);
            }
         }
         unset($s); // clear the sound
         if ( isset($probs) ) $prfAR[] = array($nname => $probs);
      }
   }
   if ( !isset( $prfAR ) ) $prfAR = "";
   $retAR[] = array("probs" => $prfAR);
   return( $retAR );
}
function busca($urist){ //  send summary data of notion search results
   $WORD_MIN_LEN = 3; // Avoid meaningless searches matching 2 or 3 trailing chars
   $notns = NULL;
   $s = mysqli_real_escape_string(lsql(),$urist);
   $q = "select notionID from aanotion where notion='$s' ";
   if ( mysqli_num_rows( sql( $q ) ) == 1 ) { 
      ccach("text/html",json_encode(array("notns" => asone(sql($q),true)))); return;}

   // We don't have a proper notion name, deal with non fluff string
   $q = "select notionID from aanotion where notionID=0"; // handle assymetry of ORing
   foreach( explode(" ",$s) as $word) // Collating captures non case sensitives
      if ( strlen( $word ) > $WORD_MIN_LEN ) $q .= " or description like '%$word%' or LOWER(notion) like '%$word%'";
   $notns = asone(sql($q),true);

   ccach("text/html",json_encode(array("notns" => $notns))); 
}
function mixqa($getar){ //  get multiple notions Q&A array
   $jason=json_decode(stripslashes($getar),true);
   $nlist=$jason['nlist'];

   // See if we are mixing Formulations, then prepare QAI data(utf8)
   $nncol=mysqli_real_escape_string(lsql(),$nlist[0]); // Use the nname as a col for search
   $nidno=holen("notionID","aanotion","notion",$nncol); // Need to see if Formulation
   konto("notionID","aaformula","notionID","$nidno") ? $forja=true : $forja=false;
   if($forja) { // One forja then all forja
      foreach($nlist as $n) {
         $nncol=mysqli_real_escape_string(lsql(),$n); // Use the nname as a col for search
         $nidno=holen("notionID","aanotion","notion",$nncol);
         $forma=formx($nidno);
         foreach ($forma as $f) // this array must be flat for all F so reread 1-by-1
            $qaimg[]=array("q"=>$f['q'],"a"=>$f['a'],"i"=>$f['i'],"s"=>$f['s']);
      }
   } else {
      foreach($nlist as $n){
         $felde=" question, answer ";       // minimum set of fields to select
         $qi=sql("show columns from `$n` like 'imageID'");
         $ri=mysqli_num_rows($qi)?TRUE:FALSE;
         $qs=sql("show columns from `$n` like 'soundID'");
         $rs=mysqli_num_rows($qs)?TRUE:FALSE;
         if($ri) $felde.=", imageID ";
         if($rs) $felde.=", soundID ";
         $q=sql("select $felde from `$n`");
         while($r=mysqli_fetch_assoc($q)){
            if($ri) $imgid=$r['imageID']; else $imgid="";
            if($rs) $sndid=$r['soundID']; else $sndid="";
               $qaimg[]=array(
                  "q"=>$r['question'], "a"=>$r['answer'],
                  "i"=>$imgid, "s"=>$sndid);
         }
      }
   }
   echo json_encode($qaimg);
}
          /*********************************************************************
          *               AUTHENTICATION + REGISTRATION                        *
          **********************************************************************/
function logfb(){ // First Pass to generate login link
   $PARAM_MYURL = param("myurl");
   $PARAM_FAPID = param("fapid");
   $PARAM_FPAGE = param("fpage");
   $FBOOK_SKRET = "2f07129a6efb778b026392e0cc9d6ec8";

   // Initialize the Facebook SDK
   FacebookSession::setDefaultApplication($PARAM_FAPID, $FBOOK_SKRET);
   $fbook = new Facebook\Facebook([ 'app_id' => "$PARAM_FAPID", 'app_secret' => "$FBOOK_SKRET", 'default_graph_version' => 'v2.5', ]);
   $helper = $fbook->getRedirectLoginHelper();
   $permissions = ['email']; // Optional permissions
   $loginUrl = $helper->getLoginUrl("https://notionary.com/?tun=fbbak", $permissions);
   header('Location:' . $loginUrl);
}
function fbbak(){ // Second Pass callback to generate access token and graph pbject
   $PARAM_MYURL = param("myurl");
   $PARAM_FAPID = param("fapid");
   $PARAM_FPAGE = param("fpage");
   $FBOOK_SKRET = "2f07129a6efb778b026392e0cc9d6ec8";
   $fbook = new Facebook\Facebook([ 'app_id' => "$PARAM_FAPID", 'app_secret' => "$FBOOK_SKRET", 'default_graph_version' => 'v2.5', ]);
   $helper = $fbook->getRedirectLoginHelper();
   // Get Access Token
   try { $accessToken = $helper->getAccessToken(); }
   catch(Facebook\Exceptions\FacebookResponseException $e) { echo 'Graph error: ' . $e->getMessage(); exit; }
   catch(Facebook\Exceptions\FacebookSDKException $e) { echo 'SDK error: ' . $e->getMessage(); exit; }
   if ( !isset($accessToken) ) { // If by this point you have no accessToken ==>> EXIT
     if ( $helper->getError() ) { // Try to extract Error information if available
       header('Location: error_404.php');
     } else { header('HTTP/1.0 400 Bad Request'); echo 'Bad request'; }
     exit;
   }

   // At this point you do have an accessToken !! CONGRATS!!!!!
   $oAuth2Client = $fbook->getOAuth2Client(); // OAuth 2.0 manages accessTokens
   $tokenMetadata = $oAuth2Client->debugToken($accessToken);
   //echo '<h3>Token Metadata</h3>'; var_dump($tokenMetadata);

   $tokenMetadata->validateAppId("$PARAM_FAPID"); $tokenMetadata->validateExpiration(); // Validation
   // Exchange token for longer lived one
   if ( !$accessToken->isLongLived() ) { // Exchanges a short-lived access token for a long-lived one
     try { $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken); }
     catch (Facebook\Exceptions\FacebookSDKException $e) {
       echo "<p>Error with long-lived token: " . $helper->getMessage() . "</p>\n\n"; exit;
     } echo '<h3>Long-lived</h3>'; var_dump($accessToken->getValue());
   } // $_SESSION['fbtok'] = (string) $accessToken;

   // Use Token to get $response then Graph Object
   try { $response = $fbook->get('/me?fields=id,name,email,first_name,middle_name,last_name,locale',"$accessToken"); }
   catch(Facebook\Exceptions\FacebookResponseException $e) { echo 'Graph error: ' . $e->getMessage(); exit; }
   catch(Facebook\Exceptions\FacebookSDKException $e) { echo 'SDK error: ' . $e->getMessage(); exit; }
  
   if( $grobj = $response->getGraphObject() ) { // Set limbo acc so oauth can create permaccount
      $_SESSION['fbusr'] = $grobj->getProperty('id');
      // If this is an established user log him in, otherwise ask him to agree to terms
      if( konto( "userID","aauser","user","FB-" . $_SESSION['fbusr'] ) ) { $messg = "";
         $_SESSION['uname'] = "FB-" . $_SESSION['fbusr'];
         if( !empty( $grobj->getProperty('locale') ) ) $_SESSION['slang'] = substr($grobj->getProperty('locale'),0,2);
         $uidno = uidno();  // collect new data if any
         if( !empty( $em = $grobj->getProperty('email') ) ){
            if( !konto("email","aaemail","userID","$uidno") ) // get email
               sql("insert into aaemail (userID,email) values('$uidno','$em')");
            else sql("update aaemail set email='$em' where userID='$uidno'");
            $messg .= "Email  : ".$em."<br/>\r\n"; }
         if( !empty( $fn = $grobj->getProperty('first_name') ) ){
            if( !konto("fname","aafname","userID","$uidno") ) // get fname
               sql("insert into aafname (userID,fname) values('$uidno','$fn')");
            else sql("update aafname set fname='$fn' where userID='$uidno'");
            $messg .= "First  : ".$fn."<br/>\r\n"; }
         $sujet=$_SESSION['uname']."(".$_SERVER['REMOTE_ADDR'].")";
         mailx($sujet,$messg,param("admin")); tstmp();
         header("Location: $PARAM_MYURL");
      //} else header("Location: $PARAM_MYURL?sntqo=".obfus()."&u=".$_SESSION["uname"]."&t=".obfus()); // ?t => ?n=terms
      } else header("Location: $PARAM_MYURL?sntqo=".obfus()."&u=FB-".$_SESSION["fbusr"]."&t=".obfus()); // ?t => ?n=terms
   } else {  header("Location: $PARAM_MYURL"); exit; } // Exit gracefully
}
function fbweg(){ // GET Facebook deauthorize URL
   $MY_ARRAYS  = array('_SERVER','_SESSION','_REQUEST','_POST','_GET');
   $messg="";
   foreach($MY_ARRAYS as $g){
      $messg.= '<br/><br/>$'.$g."<br/>";
      eval("foreach($".$g.' as $x=>$y)
      $messg.= $x.":[".$y."]<br/> ";');
   }
   mailx("FB-deauthorized",$messg,param("admin"));
}
function loggg(){ // WINDOW.LOCATION: GP login -> https://code.google.com/apis/console/
   $PARAM_MYURL = param("myurl");
   $GOOGLE_CLNTID  = "181082067736.apps.googleusercontent.com";
   $GOOGLE_CLNSEC  = "_48gwXTvB6sQzgwFdiYPSHd1";
   $GOOGLE_DEVKEY  = "AIzaSyDKPLdr0SOYenVMquLNFUHcmeNtddL38-A";
   $client = new Google_Client();   // Send user for approval get a 'auth_token'
   $client->setApplicationName("notionary");
   $client->setClientId($GOOGLE_CLNTID);
   $client->setClientSecret($GOOGLE_CLNSEC);
   $client->setRedirectUri($PARAM_MYURL.'?tun=ggbak'); // hardcoded at g+
   $client->setDeveloperKey($GOOGLE_DEVKEY);
   $client->setApprovalPrompt('auto'); // prevent annoying request for Offline access
   $client->setScopes(array('https://www.googleapis.com/auth/plus.me',
                            'https://www.googleapis.com/auth/userinfo.email',
                            'https://www.googleapis.com/auth/userinfo.profile'));
   $_SESSION['auth_token'] = $client->authenticate();
}
function ggbak(){ // with approval exchange auth_token/code for access_token -> user info
   $PARAM_MYURL = param("myurl");
   $GOOGLE_CLNTID  = "181082067736.apps.googleusercontent.com";
   $GOOGLE_CLNSEC  = "_48gwXTvB6sQzgwFdiYPSHd1";
   $GOOGLE_DEVKEY  = "AIzaSyDKPLdr0SOYenVMquLNFUHcmeNtddL38-A";
   $client = new Google_Client();
   $client->setApplicationName("notionary");
   $client->setClientId($GOOGLE_CLNTID);
   $client->setClientSecret($GOOGLE_CLNSEC);
   $client->setRedirectUri($PARAM_MYURL.'?tun=ggbak'); // hardcoded at g+
   $client->setDeveloperKey($GOOGLE_DEVKEY);
   $client->setScopes(array('https://www.googleapis.com/auth/plus.me',
                            'https://www.googleapis.com/auth/userinfo.email',
                            'https://www.googleapis.com/auth/userinfo.profile'));
   $oauth2 = new Google_Oauth2Service($client); // Here we get email but no language :(
   if (isset($_GET['code'])) { // here the user has already been authed
      $client->authenticate($_GET['code']);
      $_SESSION['access_token'] = $client->getAccessToken();
      $client->setAccessToken($_SESSION['access_token']);
      if ($client->getAccessToken()) { $gppfl = $oauth2->userinfo; // Set limbo account so oauth can create permaccount
         $_SESSION['gpusr']=$gppfl->get()['id'];

         // parse the user name
         $gname=$gppfl->get()['name']; $fname = $gname; //$parts=explode(' ',$gname); $fname=$parts[0];
         //if(!empty($parts[2])){ $lname=$parts[2]; $mname=$parts[1];}
         //else if(!empty($parts[1])) $lname=$parts[1];

         // If this is an established user log him in, otherwise ask him to agree to terms
         if( konto( "userID","aauser","user","GP-" . $_SESSION['gpusr'] ) ){ $messg="";
            $_SESSION['uname'] = "GP-" . $_SESSION['gpusr'];
            if(!empty($gppfl->get()['locale'])) $_SESSION['slang']=$gppfl->get()['locale'];
            $uidno = uidno();
            if(!empty( $email = $gppfl->get()['email'] )){// $email=$gppfl->get()['email'];
               if( !konto("email","aaemail","userID","$uidno") )
                  sql("insert into aaemail (userID,email) values('$uidno','$email')");
               else sql("update aaemail set email='$email' where userID='$uidno'");
               $messg.="Email  : ".$email."<br/>\r\n"; }
            if(!empty($fname)){
               if( !konto("fname","aafname","userID","$uidno") )
                  sql("insert into aafname (userID,fname) values('$uidno','$fname')");
               else sql("update aafname set fname='$fname' where userID='$uidno'");
               $messg.="First  : ".$fname."<br/>\r\n"; }
            $sujet=$_SESSION['uname'] ."(".$_SERVER['REMOTE_ADDR'].")";
            mailx($sujet,$messg,param("admin")); tstmp();
            header("Location: ".$PARAM_MYURL);
         //} else header("Location: $PARAM_MYURL?sntqo=" .obfus()."&u=".$_SESSION["uname"]."&t=" .obfus());  // &t => term of use
         } else header("Location: $PARAM_MYURL?sntqo=" .obfus()."&u=GP-".$_SESSION["gpusr"]."&t=" .obfus());  // &t => term of use
      } else $authUrl = $client->createAuthUrl();
   } else header('Location: https://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF']);
}
function logtw(){ // WINDOW.LOCATION: -> https://dev.twitter.com/apps
   $PARAM_MYURL = param("myurl");
   $TWIT_COKEY = "eUiZ8BmfttWbzpgY94dbA";
   $TWIT_COSEC = "IDYZXDU5J8C7hJascckkDON9O09dFDsFNmQYHkM";
   //Get twitter credentials -> use later for more permanent token acquisition
   $oauth=new TwitterOAuth($TWIT_COKEY,$TWIT_COSEC);
   $retok=$oauth->getRequestToken($PARAM_MYURL.'?tun=twbak');
   $_SESSION['twtok'] = $retok['oauth_token'];
   $_SESSION['twtos'] = $retok['oauth_token_secret'];
   // Send user to Twitter for approval if the above request succeeded
   if($oauth->http_code==200)
      header('Location: '.$oauth->getAuthorizeURL($retok['oauth_token'],FALSE));
   else header('Location: '.$PARAM_MYURL); // Back to nary (something failed)
}
function twbak(){ // HTTP: from twitter as callback after approval (or decline)
   $PARAM_MYURL = param("myurl");
   $TWIT_COKEY = "eUiZ8BmfttWbzpgY94dbA";
   $TWIT_COSEC = "IDYZXDU5J8C7hJascckkDON9O09dFDsFNmQYHkM";
   if(!empty($_GET['oauth_verifier']) && !empty($_SESSION['twtok']) && !empty($_SESSION['twtos'])){  
      // get a permanent token, with two new parameters we got in "logtw"
      $perma = new TwitterOAuth($TWIT_COKEY,$TWIT_COSEC,$_SESSION['twtok'], $_SESSION['twtos']);  
      $_SESSION['perto'] = $perma->getAccessToken($_GET['oauth_verifier']); 
      if($perma->http_code == 200){ $twinf=$perma->get('account/verify_credentials'); // Set limbo account so oauth can create permaccount
         $_SESSION['twusr'] = $twinf->id;

      echo '<h3>User Credentials</h3>';
      var_dump($twinf);
         // If this is an established user log him in, otherwise ask him to agree to terms
         if( konto( "userID","aauser","user","TW-" . $_SESSION['twusr'] ) ){ $messg="";
            $_SESSION['uname'] = "TW-" . $_SESSION['twusr'];
            if(!empty($twinf->lang)) $_SESSION['slang']=$twinf->lang;
            $uidno=uidno();
            if ( !empty( $twinf->name ) ) {
               if ( !konto("fname","aafname","userID","$uidno") )
                  sql("insert into aafname (userID,fname) values('$uidno','$twinf->name')");
               else sql("update aafname set fname='$twinf->name' where userID='$uidno'");
               $messg.="Twitter Name  : ".$twinf->name."<br/>\r\n"; }
            $sujet = $_SESSION['uname'] ."(".$_SERVER['REMOTE_ADDR'].")";
            mailx($sujet,$messg,param("admin")); tstmp();
            $_SESSION['twava'] = $twinf->profile_image_url; // Special case of avatar for js/profile.js:markupAvatar()
            //$_SESSION['twava']=$twinf->name; // This should be the name, from which we can get the image via:
                                               // https://twitter.com/THENAMEHERE/profile_image?size=original
            header('Location: '.$PARAM_MYURL);
         //} else header("Location: $PARAM_MYURL?sntqo=" .obfus()."&u=".$_SESSION["uname"]."&t=" .obfus());  // &t => term of use
         } else header("Location: $PARAM_MYURL?sntqo=" .obfus()."&u=TW-".$_SESSION["twusr"]."&t=" .obfus());  // &t => term of use
      } else header('Location: '.$PARAM_MYURL.'?tun=logtw'); // !=200 -> back to start
   } else header('Location: '.$PARAM_MYURL);              // no token -> back to nary
}

iazik();

if ( isset( $_REQUEST['tun'] ) ) $tun = $_REQUEST['tun']; else $tun = "";

switch ( $tun ) { 
   case 'mylan': echo $_SESSION['slang']; break;

   // -->> SERVER SIDE MARKUP : rentr()
   case 'terms':case 'prvcy':case 'guide':case 'cooks':case 'imprs':
   case 'learn':case 'trial':case 'write':case 'adept':
   case 'micro':case 'lista':case 'lesen':case 'watch':
   case 'probs':case 'suche':case 'amend':
         ssmkp(); break;
   // -->> JSONs FOR SERVER SIDE MARKUP
   case 'busca':

   // -->> NOTIONARY Routines
   case 'dopdf':case 'cacha':case 'mudoc':case 'ninfo':case 'mixqa':
   case 'logfb':case 'fbbak':case 'fbweg':case 'logtw':case 'twbak':case 'loggg':case 'ggbak':
   case 'isusr':case 'login':case 'vrify':case 'i4got':case 'crack':case 'oauth':case 'known':case 'nuser':
   case 'sinfo':case 'uinfo':case 'linfo':case 'ibyid':case 'sbyid':case 'pbyid':
         if ( !isset( $_REQUEST['was'] ) ) eval($tun."();");
         else eval($tun."(\$_REQUEST['was']);"); break;


   // -->> MAIN ENTRY POINT : nentr()
   default: porta(); break;
}
?>
