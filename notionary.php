<?php
$_CONFIG = require __DIR__ . '/config.php';
$_DEV = ( (isset($_CONFIG['APP_ENV']) ? $_CONFIG['APP_ENV'] : 'prod') === 'local' );
ini_set('display_errors', $_DEV ? '1' : '0');
ini_set('display_startup_errors', $_DEV ? '1' : '0');
ini_set('log_errors', '1');
error_reporting(E_ALL & ~E_DEPRECATED);

session_start();
if (!isset($_SESSION['uname'])) { $_SESSION['uname'] = 'owner@notionary'; }
if(!ob_start("ob_gzhandler")) ob_start();
date_default_timezone_set($_CONFIG['TIMEZONE']);

require_once "php/utiles.php";
require_once "php/dbutil.php";
require_once "php/asynch.php";
require_once "php/oauth2.php";
require_once "php/global.php";
require_once "php/tools.php";
require_once "php/math.php";

function asone($q,$personal){
   $NOIMGID = 101;
   static $ownerCache = array();      // memoize owner-name lookups (single-user: all the same)
   static $myuid = null;              // resolve current user's id once per request
   static $partMap = null;            // notionID -> supernotion membership (one query per request)
   static $formulaSet = null;         // set of notionIDs that are formula (math) notions
   if ( $partMap === null ) {
      $partMap = array();
      $pq = sql("select notionID, part, cardinality from aapart");
      if ( $pq ) while ( $pr = mysqli_fetch_assoc($pq) )
         if ( !isset($partMap[$pr['notionID']]) ) $partMap[$pr['notionID']] = $pr;
      $formulaSet = array();
      $fq = sql("select distinct notionID from aaformula");
      if ( $fq ) while ( $fr = mysqli_fetch_assoc($fq) ) $formulaSet[$fr['notionID']] = true;
   }
   if ( mysqli_num_rows($q) == 0 ) return(false);
   while( $r = mysqli_fetch_assoc($q) ) {
      $nidno = $r['notionID'];
      $n = mysqli_fetch_assoc(
            sql("select notion, description, userID, imageID, category, slang
                 from aanotion where notionID='$nidno'"));
      $nname = $n['notion']; $ndesc=$n['description']; $ownid=$n['userID'];
      $nimag = $n['imageID']; $catno=$n['category']; $slang=$n['slang'];
      $cq = sql("select count(*) as c from `$nname`");
      if ( !$cq ) { syslog(LOG_ERR,"$_SERVER[REMOTE_ADDR] asone Zombie Alert $nname($nidno)"); continue; }
      $cc = mysqli_fetch_assoc($cq); $nsize = $cc['c'];
      if ( !isset($ownerCache[$ownid]) ) $ownerCache[$ownid] = anone($ownid);
      $owner = $ownerCache[$ownid];
      // Inert in this text-only single-user build: ratings, reviews, pictions,
      // pdf, video, avatars and cross-user champion records.
      $rated=""; $revus=""; $picto=false;
      $forja = isset($formulaSet[$nidno]);
      $piece = isset($partMap[$nidno]['part'])        ? $partMap[$nidno]['part']        : "";
      $parts = isset($partMap[$nidno]['cardinality']) ? $partMap[$nidno]['cardinality'] : "";
      $dokum=""; $video=""; $ownav=$NOIMGID; $chav1=$NOIMGID; $chav2=$NOIMGID; $chav3=$NOIMGID;
      $scor1=""; $scor2=""; $scor3=""; $time1=""; $time2=""; $time3="";
      $chmp1=""; $chmp2=""; $chmp3=""; $epoc1=""; $epoc2=""; $epoc3="";
      if ( $personal && isset($_SESSION['uname']) ) {
         if ( $myuid === null ) $myuid = holen("userID","aauser","user",$_SESSION['uname']);
         $mall = nmall($myuid,$nidno);
         $mysc1=$mall['mysc1']; $mybt1=$mall['mybt1'];
         $mysc2=$mall['mysc2']; $mybt2=$mall['mybt2'];
         $mysc3=$mall['mysc3']; $mybt3=$mall['mybt3'];
      } else {
         $mysc1=NULL; $mybt1=NULL; $mysc2=NULL; $mybt2=NULL; $mysc3=NULL; $mybt3=NULL;
      }
      $retAR[]=array(
         "nidno" => $nidno, "nname" => $nname, "ndesc" => $ndesc, "nimag" => $nimag,
         "catno" => $catno, "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
         "piece" => $piece, "parts" => $parts, "picto" => $picto, "forja" => $forja,
         "dokum" => $dokum, "video" => $video, "chav1" => $chav1, "chav2" => $chav2, "chav3" => $chav3,
         "mysc1" => $mysc1, "mybt1" => $mybt1, "mysc2" => $mysc2, "mybt2" => $mybt2, "mysc3" => $mysc3, "mybt3" => $mybt3,
         "scor1" => $scor1, "time1" => $time1, "chmp1" => $chmp1, "epoc1" => $epoc1,
         "scor2" => $scor2, "time2" => $time2, "chmp2" => $chmp2, "epoc2" => $epoc2,
         "scor3" => $scor3, "time3" => $time3, "chmp3" => $chmp3, "epoc3" => $epoc3,
         "owner" => $owner, "ownid" => $ownid, "ownav" => $ownav, "slang" => $slang
      );
   }
   return( isset($retAR) ? $retAR : false );
}
function dopdf($nidxy){
   openlog("dopdf",LOG_NDELAY,LOG_LOCAL2);
   $QA_MAX_CHARS = 36;
   $QA_HEIGHT = 3.5;
   if(!is_numeric($nidno=mysqli_real_escape_string(lsql(),$nidxy))) rjekt();
   $nname = holen("notion","aanotion","notionID",$nidno);
   if ( empty($nname) ) return;
   define('TFPDF_INSTALLDIR', 'lib/tfpdf');
   include(TFPDF_INSTALLDIR.'/tfpdf.php');
   syslog(LOG_NOTICE,"$_SERVER[REMOTE_ADDR] ($nidxy)");
   class PDF extends tFPDF {
      function Header(){
         $this->SetY(0);
         $this->SetTextColor(0,0,0);
         $this->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
         $this->SetFont('DejaVu','',26);
         $this->Cell(70,15,"notionary",0,'L');
         $this->SetTextColor(98,122,172);
         $this->SetFont('DejaVu','',16);
         $this->Cell(10);
         $this->Cell(0,15,$this->title,2,0,'R');
         $this->Ln(20);
      }
      function Footer(){
         $XLATE_CRITE = xlate("crite",$_SESSION['slang']);
         $this->SetY(-20);
         $this->SetTextColor(0,0,0);
         $this->SetFont('Arial','I',10);
         $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
         $this->SetY(-10);
         $this->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
         $this->SetFont('DejaVu','',10);
         $this->Cell(0,13,$XLATE_CRITE,0,0,'C');
      }
   }
   $pdf = new PDF('P','mm','Letter');
   $pdf->SetTitle($nname);
   $pdf->AliasNbPages();
   $pdf->AddPage();
   $pdf->SetFillColor(235,235,235);
   $pdf->AddFont('DejaVu','','DejaVuSansCondensed-Bold.ttf',true);
   $pdf->SetFont('DejaVu','',10);
      $q=sql("select question, answer from `$nname`");
      $fillme = 1;
      while($r=mysqli_fetch_assoc($q)){
         $question = $r['question']; $answer = getGoodChoice($r['answer']);
         $qaLength = strlen($question."     ".$answer);
         if($qaLength < 2*$QA_MAX_CHARS){
            $pdf->SetTextColor(255,0,0);
            $pdf->Cell(100,$QA_HEIGHT,$question,0,0,'R',$fillme%2);
            $pdf->SetTextColor(231,143,8);
            $pdf->SetFontSize(15);
            $pdf->Cell(10,$QA_HEIGHT,"  ➡  ",0,0,'C',$fillme%2);
            $pdf->SetFontSize(10);
            $pdf->SetTextColor(0,100,0);
            $pdf->Cell(100,$QA_HEIGHT,$answer,0,1,'',$fillme%2);
         } else {
            $pdf->SetTextColor(221,75,57);
            $pdf->MultiCell(0,$QA_HEIGHT,$question,0,'C',$fillme%2);
            $pdf->SetTextColor(231,143,8);
            $pdf->SetFontSize(10);
            $pdf->SetTextColor(0,100,0);
            $pdf->MultiCell(0,$QA_HEIGHT,$answer,0,'C',$fillme%2);
         }
         $fillme++;
      }
   $pdf->Output();
   closelog();
}
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
   foreach($katAR as $k){ unset($kitAR);
      $q=sql("select notionID from aanotion where category='$k' order by notion");
      if(mysqli_num_rows($q)!=0){
         $kitARA = asone(sql("select notionID from aanotion where category='$k' and slang='$_REQUEST[was]' order by notion"),false);
         $ktnAR[]=array($k => $kitARA);
      }
   }
   $retAR[]=array("langs"=>$lanAR, "studs"=>$stuAR, "techs"=>$tecAR, "katse"=>$katAR, "kitns"=>$ktnAR);
   $popAR = asone( sql(
               "select * from
                   (select notionID, count(notionID) as c from aaperfid group by notionID order by c desc limit 0, $PILE) as x
                inner join aanotion as n on n.notionID=x.notionID
               where n.slang='$_SESSION[slang]'"),false);
   $retAR[]=array("npops" => $popAR);
   $q=sql("select * from aaparam");
   while($r=mysqli_fetch_assoc($q)) $parAR[]=array($r['kodex'] => $r['value']);
   $retAR[]=array("param" => $parAR);
   $q = sql("select * from aasuper where slang='$_REQUEST[was]'");
   while( $r = mysqli_fetch_assoc( $q ) ){
      $owner=anone($r['userID']); $ownav=holen("imageID","aaavatar","userID","$r[userID]");
      $supAR[] = array("supid" => $r['superID'], "owner" => $owner, "ownav" => $ownav,
                       "sname" => $r['supernotion'], "sdesc" => $r['description'], "snots" => $r['notions']);
   }
   $retAR[] = array("supers" => $supAR);
   return( $retAR );
}
function ninf0(){
   $nname = $_REQUEST['was'];
   $ntabl = $nname;
   $nncol = mysqli_real_escape_string(lsql(),$nname);
   $r = mysqli_fetch_assoc( sql("select notionID, notion from `aanotion` where notion='$nncol'"));
   if(!$r) { header('HTTP/1.1 500 Query String Error'); exit(); }
   $nidno = $r['notionID']; $ntabl=$r['notion']; $nname=$r['notion'];
   $query = mysqli_fetch_assoc(sql("select * from aanotion where notionID=$nidno"));
   $multi = mysqli_fetch_assoc(sql("select aanotion.notionID, aasperq.sperq, aapart.part, aapart.cardinality, aapdfid.pdfID, aavideo.video from aanotion left join aasperq on aasperq.notionID = aanotion.notionID left join aapart on aapart.notionID = aanotion.notionID left join aapdfid on aapdfid.notionID = aanotion.notionID left join aavideo on aavideo.notionID = aanotion.notionID where aanotion.notionID=$nidno"));
   $nsize = mysqli_num_rows(sql("select question from `$ntabl`"));
   $nall  = nrall($nidno);
   $chav1 = holen("imageID","aaavatar","userID","$nall[ch1id]");
   $chav2 = holen("imageID","aaavatar","userID","$nall[ch2id]");
   $chav3 = holen("imageID","aaavatar","userID","$nall[ch3id]");
   $t = mysqli_fetch_array( sql("select avg(rating) as arate from aarating where notionID='$nidno'"));
   $rated = $t['arate'];
   $revus = "";
   $wq = sql("select userID, review from aareview where notionID='$nidno'");
   while($w=mysqli_fetch_assoc($wq)){ $rever=anone($w['userID']); $revus.="$rever-->>$w[review]￭"; }
   konto("notionID","aapiction","notionID","$nidno") ? $picto=true : $picto=false;
   konto("notionID","aaformula","notionID","$nidno") ? $forja=true : $forja=false;
   $ownid=holen("userID","aanotion","notionID","$nidno");
   $owner=anone($ownid);
   $ownav=holen("imageID","aaavatar","userID","$ownid");
   if(isset($_SESSION['uname'])){
      $mall=nmall(holen("userID","aauser","user",$_SESSION['uname']),$nidno);
      $retAR[]=array(
         "nidno" => $nidno, "nname" => $nname, "ndesc" => $query['description'], "nimag" => $query['imageID'],
         "catno" => $query['category'], "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
         "piece" => $multi['cardinality'], "parts" => $multi['part'], "dokum" => $multi['pdfID'], "video" => $multi['video'],
         "sperq" => $multi['sperq'], "slang" => $query['slang'], "tlang" => $query['tlang'], "ownid" => $ownid,
         "picto" => $picto, "forja" => $forja, "owner" => $owner, "ownav" => $ownav,
         "mysc1" => $mall['mysc1'], "mybt1" => $mall['mybt1'], "mysc2" => $mall['mysc2'], "mybt2" => $mall['mybt2'],
         "mysc3" => $mall['mysc3'], "mybt3" => $mall['mybt3'],
         "scor1" => $nall['scor1'], "time1" => $nall['time1'], "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'], "chav1" => $chav1,
         "scor2" => $nall['scor2'], "time2" => $nall['time2'], "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'], "chav2" => $chav2,
         "scor3" => $nall['scor3'], "time3" => $nall['time3'], "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'], "chav3" => $chav3
      );
   } else {
      $retAR[]=array(
         "nidno" => $nidno, "nname" => $nname, "ndesc" => $query['description'], "nimag" => $query['imageID'],
         "catno" => $query['category'], "nsize" => $nsize, "rated" => $rated, "revus" => $revus,
         "piece" => $multi['cardinality'], "parts" => $multi['part'], "dokum" => $multi['pdfID'], "video" => $multi['video'],
         "sperq" => $multi['sperq'], "slang" => $query['slang'], "tlang" => $query['tlang'], "ownid" => $ownid,
         "picto" => $picto, "forja" => $forja, "owner" => $owner, "ownav" => $ownav,
         "mysc1" => NULL, "mybt1" => NULL, "mysc2" => NULL, "mybt2" => NULL, "mysc3" => NULL, "mybt3" => NULL,
         "scor1" => $nall['scor1'], "time1" => $nall['time1'], "chmp1" => $nall['chmp1'], "epoc1" => $nall['epoc1'], "chav1" => $chav1,
         "scor2" => $nall['scor2'], "time2" => $nall['time2'], "chmp2" => $nall['chmp2'], "epoc2" => $nall['epoc2'], "chav2" => $chav2,
         "scor3" => $nall['scor3'], "time3" => $nall['time3'], "chmp3" => $nall['chmp3'], "epoc3" => $nall['epoc3'], "chav3" => $chav3
      );
   }
   $felde=" question, answer ";
   $qi=sql("show columns from `$ntabl` like 'imageID'"); $ri=mysqli_num_rows($qi)?TRUE:FALSE;
   $qs=sql("show columns from `$ntabl` like 'soundID'"); $rs=mysqli_num_rows($qs)?TRUE:FALSE;
   if($ri) $felde.=", imageID "; if($rs) $felde.=", soundID ";
   $q=sql("select $felde from `$ntabl`");
   while($r=mysqli_fetch_assoc($q)){
      if($ri) $imgid=$r['imageID']; else $imgid="";
      if($rs) $sndid=$r['soundID']; else $sndid="";
      $qaimg[]=array("q"=>$r['question'],"a"=>$r['answer'],"i"=>$imgid,"s"=>$sndid);
   }
   if($forja) $qaimg=formx($nidno);
   $retAR[]=array("qaimg" => $qaimg);
   return( $retAR );
}
function ninfo(){
   $urarg = parse_url($_SERVER['REQUEST_URI']);
   if ( strlen( $urarg['query'] ) < 19 || substr( $urarg['query'], 0, 14 ) != "tun=ninfo&was=" ) rjekt();
   $nname = $_REQUEST['was'];
   $nncol = mysqli_real_escape_string(lsql(),$nname);
   $nidno = holen("notionID","aanotion","notion",$nncol);
   if ( isset( $_SESSION['uname'] ) ) { $track = uidno(); } else $track = $_SERVER['REMOTE_ADDR'];
   fcach( "cache/_notionary_NINFO_".$nidno."_".$track."_cache.php", "604800", "ninfo" );
}
function linf0(){
   $q = sql("select kodex, $_REQUEST[was] from aaglobe order by kodex");
   while( $r = mysqli_fetch_assoc( $q ) ) $tmpAR[] = array( $r['kodex'] => $r[$_REQUEST['was']] );
   return( $tmpAR );
}
function uinf0(){
   $PILE = 50; $NOIMGID = 101;
   $uname = $_SESSION['uname']; $uimag = $NOIMGID;
   $uidno = uidno(); if ( empty($uidno) ) { echo ""; exit; }
   $multi = mysqli_fetch_assoc(sql("select aauser.ulang, aaemail.email, aakname.kname, aafname.fname, aaavatar.imageID from aauser left join aaemail on aaemail.userID = aauser.userID left join aakname on aakname.userID = aauser.userID left join aafname on aafname.userID = aauser.userID left join aaavatar on aaavatar.userID = aauser.userID where aauser.userID=$uidno"));
   konto("userID","aanosnd","userID","$uidno") ? $nosnd = true : $nosnd = false;
   konto("userID","aajamsg","userID","$uidno") ? $msges = true : $msges = false;
   $kenne = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='1'") );
   $wrote = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='2'") );
   $meist = mysqli_num_rows( sql("select distinct notionID from `aaperfid` where userID='$uidno' and ptype='3'") );
   $retAR[] = array(
      "uname" => $uname, "uidno" => $uidno, "email" => $multi['email'], "ulang" => $multi['ulang'],
      "kenne" => $kenne, "wrote" => $wrote, "meist" => $meist,
      "fbusr" => NULL, "twusr" => NULL, "gpusr" => NULL,
      "kname" => $multi['kname'], "fname" => $multi['fname'],
      "nosnd" => $nosnd, "msges" => $msges, "uimag" => $multi['imageID']
   );
   $rcnAR = asone(sql("select notionID, max(dtime) as date from aaperfid where userID='$uidno' group by notionID order by date desc limit 0, $PILE"),true);
   if ( $rcnAR ) $retAR[] = array("rcent" => $rcnAR);
   else $retAR[] = array(""=>"");
   $meiAR = asone(sql("select notionID, notion from aanotion where userID='$uidno' order by notion"),true);
   if ( $meiAR ) $retAR[] = array("meine" => $meiAR);
   else $retAR[]=array(""=>"");
   $q = sql("select perfID, notionID, ptype from aaperfid where userID='$uidno'");
   while($r=mysqli_fetch_assoc($q)){ unset($probs);
      $nname = holen("notion","aanotion","notionID",$r['notionID']);
      if ( empty( $nname ) ) {
         sql("delete from aaperfid where perfID='$r[perfID]'");
         sql("delete from aaprobs where perfID='$r[perfID]'");
         continue;
      } else {
         $nimag = holen("imageID","aanotion","notionID",$r['notionID']);
         $p = sql("select probs from aaprobs where perfID='$r[perfID]'");
         konto("notionID","aapiction","notionID","$r[notionID]") ? $picto=true : $picto=false;
         while ( $t = mysqli_fetch_assoc($p) ){
            $qi = sql("show columns from `$nname` like 'imageID'"); $visual = mysqli_num_rows($qi)?TRUE:FALSE;
            $qs = sql("show columns from `$nname` like 'soundID'"); $sonora = mysqli_num_rows($qs)?TRUE:FALSE;
            $felde = " question, answer "; if($visual) $felde.=", imageID "; if($sonora) $felde.=", soundID ";
            $raw_prob = $t['probs'];
            $net_prob = scapo($t['probs']);
            $s = mysqli_fetch_array(sql("select $felde from `$nname` where question='$net_prob'"));
            if ( empty($s['question']) ){
               sql("delete from aaprobs where perfID='$r[perfID]' and probs='$raw_prob'");
            } else {
               unset($d); unset($k); unset($dec);
               $d=sql("select answer from `$nname` where question!='$net_prob' order by rand() limit 4");
               while($k=mysqli_fetch_array($d)) $dec[]=getGoodChoice($k['answer']);
               isset($s['imageID']) ? $theImage=$s['imageID'] : $theImage=NULL;
               isset($s['soundID']) ? $theSound=$s['soundID'] : $theSound=NULL;
               $probs[] = array( "pid" => $r['perfID'], "nim" => $nimag,
                               "prb" => $raw_prob, "sol" => $s['answer'],
                               "img" => $theImage, "snd" => $theSound,
                               "pik" => $picto, "dec" => $dec);
            }
         }
         unset($s);
         if ( isset($probs) ) $prfAR[] = array($nname => $probs);
      }
   }
   if ( !isset( $prfAR ) ) $prfAR = "";
   $retAR[] = array("probs" => $prfAR);
   return( $retAR );
}
function busca($urist){
   $WORD_MIN_LEN = 3;
   $notns = NULL;
   $s = mysqli_real_escape_string(lsql(),$urist);
   $q = "select notionID from aanotion where notion='$s' ";
   if ( mysqli_num_rows( sql( $q ) ) == 1 ) {
      nocach("text/html",json_encode(array("notns" => asone(sql($q),true)))); return;}
   $q = "select notionID from aanotion where notionID=0";
   foreach( explode(" ",$s) as $word)
      if ( strlen( $word ) > $WORD_MIN_LEN ) $q .= " or description like '%$word%' or LOWER(notion) like '%$word%'";
   $notns = asone(sql($q),true);
   nocach("text/html",json_encode(array("notns" => $notns)));
}
function mixqa($getar){
   $jason=json_decode(stripslashes($getar),true);
   $nlist=$jason['nlist'];
   $nncol=mysqli_real_escape_string(lsql(),$nlist[0]);
   $nidno=holen("notionID","aanotion","notion",$nncol);
   konto("notionID","aaformula","notionID","$nidno") ? $forja=true : $forja=false;
   if($forja) {
      foreach($nlist as $n) {
         $nncol=mysqli_real_escape_string(lsql(),$n);
         $nidno=holen("notionID","aanotion","notion",$nncol);
         $forma=formx($nidno);
         foreach ($forma as $f) $qaimg[]=array("q"=>$f['q'],"a"=>$f['a'],"i"=>$f['i'],"s"=>$f['s']);
      }
   } else {
      foreach($nlist as $n){
         $felde=" question, answer ";
         $qi=sql("show columns from `$n` like 'imageID'"); $ri=mysqli_num_rows($qi)?TRUE:FALSE;
         $qs=sql("show columns from `$n` like 'soundID'"); $rs=mysqli_num_rows($qs)?TRUE:FALSE;
         if($ri) $felde.=", imageID "; if($rs) $felde.=", soundID ";
         $q=sql("select $felde from `$n`");
         while($r=mysqli_fetch_assoc($q)){
            if($ri) $imgid=$r['imageID']; else $imgid="";
            if($rs) $sndid=$r['soundID']; else $sndid="";
            $qaimg[]=array("q"=>$r['question'],"a"=>$r['answer'],"i"=>$imgid,"s"=>$sndid);
         }
      }
   }
   echo json_encode($qaimg);
}
iazik();

$tun = isset($_REQUEST['tun']) ? $_REQUEST['tun'] : '';

if ( $tun === 'mylan' ) { echo $_SESSION['slang']; exit; }

$ssmkp_routes = array('guide','learn','trial','write','adept','lista','probs','suche','amend');
if ( in_array($tun, $ssmkp_routes) ) { ssmkp(); exit; }

$was = isset($_REQUEST['was']) ? $_REQUEST['was'] : null;

if     ( $tun === 'dopdf' ) { dopdf($was); }
elseif ( $tun === 'cacha' ) { cacha($was); }
elseif ( $tun === 'mudoc' ) { mudoc($was); }
elseif ( $tun === 'ninfo' ) { ninfo(); }
elseif ( $tun === 'mixqa' ) { mixqa($was); }
elseif ( $tun === 'busca' ) { busca($was); }
elseif ( $tun === 'sinfo' ) { sinfo($was); }
elseif ( $tun === 'uinfo' ) { uinfo(); }
elseif ( $tun === 'linfo' ) { linfo($was); }
else                        { porta(); }
?>
