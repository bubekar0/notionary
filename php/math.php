<?php
function formx($nidno){ // Internal Function to generate a Q&A list for a Formulation
   $kacQA=30;  // How many Question, Answer pairs to return
   $opstr=array("+","−","×","÷");
   $opval=array("+","-","*","/");
   $frasl="</sup>&frasl;<sub>";
   switch($nidno){
      case 14: case 68: case 237: case 244: case 258: case 265: case 1428:// Mult Chall  I:  1-12
      case 23: case 69: case 238: case 245: case 259: case 266: case 1431:// Mult Chall II: 11-19
         $minimo =  2; $maximo = 12;
         if($nidno==23 || $nidno==69 || $nidno==238 || $nidno==245 || $nidno==259 || $nidno==266 || $nidno==1431) 
            { $minimo = 12; $maximo = 19; }// Mult Chall II: 11-19
         for($i=0;$i<$kacQA;$i++){ $a = rand($minimo,$maximo); $b = rand($minimo,$maximo);
            $qaSet[]=array("q"=>$a." × ".$b,"a"=> strval( $a*$b ),"i"=>"","s"=>"");
         }; break;
      case 929:case 181:case 241:case 248:case 262:case 269: case 1434: // Negative Numbers
         $minimo = -20; $maximo = 20;
         for($i=0;$i<$kacQA;$i++){
            $a = rand($minimo,$maximo); $b = rand($minimo,$maximo);
            if($a==0) $a =1; if($b==0) $b=1;
            switch($opstr[rand(0,3)]){
               case "+": $qstr = $a." + ".$b; $astr = ($a)+($b); break;
               case "−": $qstr = $a." − ".$b; $astr = ($a)-($b); break;
               case "×": $qstr = $a." × ".$b; $astr = ($a)*($b); break;
               case "÷": $qstr = $a." ÷ ".$b; $astr = ($a)/($b); break;
            } $qaSet[]=array("q"=>$qstr,"a"=>strval(round($astr,2)),"i"=>"","s"=>"");
         }; break;
      case 930:case 182:case 242:case 249:case 263:case 270: case 1435:  // Percentages: Three types of questions are possible
                           $Q1_TXT="% of ";  $Q2_TXT=" is what percentage of ";
         if($nidno==182) { $Q1_TXT="% de ";  $Q2_TXT=" est quel pourcent de "; } // French text 
         if($nidno==242) { $Q1_TXT="% von "; $Q2_TXT=" ist wie viel Prozent von "; } // Deutsch text 
         if($nidno==249) { $Q1_TXT="% de ";  $Q2_TXT=" es que porcentaje de "; } // Spanish text 
         if($nidno==263) { $Q1_TXT="% de ";  $Q2_TXT=" è che percentuale de "; } // Italian text 
         if($nidno==270) { $Q1_TXT="% de ";  $Q2_TXT=" é qual a percentagem  "; } // Italian text 
         if($nidno==1435){ $Q1_TXT="% от ";  $Q2_TXT=" является то, что процент от  "; } // Russian text 
         for($i=0;$i<$kacQA;$i++){ // Get two random multiples of 2 or 3 or 5
            $x=rand(1,20)*rand(2,5); $y=rand(1,20)*rand(2,5);
            if($x>$y) { $t=$x; $x=$y; $y=$t; }  // Swap them to avoid 10000%s
            switch(rand(1,3)){
               case 1: $qstr = $x.$Q1_TXT.$y;       $astr = round(($x*$y)/100,2); break;
               case 2: $qstr = $x.$Q2_TXT.$y;       $astr = round(100*($x/$y),2)."%"; break;
               case 3: $qstr = $x." = ".$y.$Q1_TXT; $astr = round(100*($x/$y),2); break;
            } $qaSet[]=array("q"=>$qstr,"a"=>strval($astr),"i"=>"","s"=>"");
         }; break;
      case 931:case 236:case 243:case 250:case 264:case 271: case 1436:  // GCD and LCM type of questions
         $GCDSTR="GCD"; $LCMSTR="LCM";
         if($nidno==236) { $GCDSTR="PGCD"; $LCMSTR="PPCM"; } // French abbreviations of GCD & LCM
         if($nidno==243) { $GCDSTR="ggT";  $LCMSTR="kgV"; }  // Deutsch abbreviations of GCD & LCM
         if($nidno==250 || $nidno==264) { $GCDSTR="MCD";  $LCMSTR="mcm"; }  // ES + IT of GCD & LCM
         if($nidno==271) { $GCDSTR="MCD";  $LCMSTR="mmc"; }  // PT abbreviations of GCD & LCM
         if($nidno==1436){ $GCDSTR="НОД";  $LCMSTR="НОК"; }  // RU abbreviations of GCD & LCM
         for($i=0;$i<$kacQA;$i++){ // Get three random multiples of 2 or 3 or 4 or 5
            $a=rand(1,5)*rand(2,5); $b=rand(1,5)*rand(2,5); $c=rand(1,5)*rand(2,5);
            switch(rand(1,2)){
               case 1: $qstr = "${GCDSTR}(".$a.",".$b.",".$c.")";  $astr = gcd(gcd($a,$b),$c); break;
               case 2: $qstr = "${LCMSTR}(".$a.",".$b.",".$c.")";  $astr = lcm(lcm($a,$b),$c); break;
            } $qaSet[]=array("q"=>$qstr,"a"=>strval($astr),"i"=>"","s"=>"");
         }; break;
      case 928:case 179:case 239:case 246:case 260:case 267: case 1432:  // Frac Arith I
         $minimo = 2; $maximo = 20;
         for($i=0;$i<$kacQA;$i++){
            $a = rand($minimo,$maximo); $b = rand($minimo,$maximo);
            $c = rand($minimo,$maximo); $d = rand($minimo,$maximo);
            switch($opstr[rand(0,3)]){
               case "+": $qstr = "( <sup>".$a.$frasl.$b."</sub> )  +  ( <sup>".$c.$frasl.$d."</sub> )";
                         $frac = array("numerator" => ($a*$d+$b*$c), "denominator" => ($b*$d)); break;
               case "−": $qstr = "( <sup>".$a.$frasl.$b."</sub> )  −  ( <sup>".$c.$frasl.$d."</sub> )";
                         $frac = array("numerator" => ($a*$d-$b*$c), "denominator" => ($b*$d)); break;
               case "×": $qstr = "( <sup>".$a.$frasl.$b."</sub> )  ×  ( <sup>".$c.$frasl.$d."</sub> )";
                         $frac = array("numerator" => ($a*$c), "denominator" => ($b*$d)); break;
               case "÷": $qstr = "( <sup>".$a.$frasl.$b."</sub> )  ÷  ( <sup>".$c.$frasl.$d."</sub> )";
                         $frac = array("numerator" => ($a*$d), "denominator" => ($b*$c)); break;
            } $qaSet[]=array("q"=>$qstr,"a"=>simpler($frac),"i"=>"","s"=>"");
         }; break;
      case 933:case 180:case 240:case 247:case 261:case 268: case 1433:  // Frac Arith II
         $minimo = 2; $maximo = 12; 
         for($i=0;$i<$kacQA;$i++){
            // Easier to work with a,b,... for the literal string variables
            $a = rand($minimo,$maximo); $b = rand($minimo,$maximo);
            $c = rand($minimo,$maximo); $d = rand($minimo,$maximo);
            $e = rand($minimo,$maximo); $f = rand($minimo,$maximo);
            // Need to work with fraction structures for the fractional functions
            $f1['numerator'] = $a; $f1['denominator'] = $b;
            $f2['numerator'] = $c; $f2['denominator'] = $d;
            $f3['numerator'] = $e; $f3['denominator'] = $f;
            $op1 = $opstr[rand(0,3)]; $op2 = $opstr[rand(0,3)]; // 0 = +,  1 = -,  2 = *,  3 = /
            switch($op1){
               case "+": switch($op2){
                            case "+": $ans = fraplus(fraplus($f1,$f2),$f3);  break;
                            case "−": $ans = framinus(fraplus($f1,$f2),$f3); break;
                            case "×": $ans = fraplus(framulti($f2,$f3),$f1); break;
                            case "÷": $ans = fraplus(fradiv($f2,$f3),$f1);   break;
                         } break;
               case "−": switch($op2){
                            case "+": $ans = fraplus(framinus($f1,$f2),$f3);  break;
                            case "−": $ans = framinus(framinus($f1,$f2),$f3); break;
                            case "×": $ans = framinus($f1,framulti($f2,$f3)); break;
                            case "÷": $ans = framinus($f1,fradiv($f2,$f3));   break;
                         } break;
               case "×": switch($op2){
                            case "+": $ans = fraplus(framulti($f1,$f2),$f3);  break;
                            case "−": $ans = framinus(framulti($f1,$f2),$f3); break;
                            case "×": $ans = framulti(framulti($f1,$f2),$f3); break;
                            case "÷": $ans = fradiv(framulti($f1,$f2),$f3);   break;
                         } break;
               case "÷": switch($op2){
                            case "+": $ans = fraplus(fradiv($f1,$f2),$f3);  break;
                            case "−": $ans = framinus(fradiv($f1,$f2),$f3); break;
                            case "×": $ans = framulti(fradiv($f1,$f2),$f3); break;
                            case "÷": $ans = fradiv(fradiv($f1,$f2),$f3);   break;
                         } break;
            }
            $qstr = "( <sup>".  $a.$frasl.$b.  "</sub> )  ".$op1."  ( <sup>".  $c.$frasl.$d.
                    "</sub> )  ".$op2."  ( <sup>".  $e.$frasl.$f.  "</sub> )";
            $qaSet[]=array("q"=>$qstr,"a"=>simpler($ans),"i"=>"","s"=>"");
         }; break;
   }
   return($qaSet);
}
function fraplus($frac1,$frac2){
   $result['numerator'] = $frac1['numerator']*$frac2['denominator'] +
                          $frac2['numerator']*$frac1['denominator'];
   $result['denominator'] = $frac1['denominator']*$frac2['denominator'];
   return(proper($result));
}
function framinus($frac1,$frac2){
   $result['numerator'] = $frac1['numerator']*$frac2['denominator'] -
                          $frac2['numerator']*$frac1['denominator'];
   $result['denominator'] = $frac1['denominator']*$frac2['denominator'];
   return(proper($result));
}
function framulti($frac1,$frac2){
   $result['numerator'] = $frac1['numerator']*$frac2['numerator'];
   $result['denominator'] = $frac1['denominator']*$frac2['denominator'];
   return(proper($result));
}
function fradiv($frac1,$frac2){
   $result['numerator'] = $frac1['numerator']*$frac2['denominator'];
   $result['denominator'] = $frac1['denominator']*$frac2['numerator'];
   return(proper($result));
}
function proper($fraction){ // Return a proper fraction
   $num = $fraction['numerator'];
   $den = $fraction['denominator'];
   $gcd = gcd($num,$den);
   $fraction['numerator']=$num/$gcd;
   $fraction['denominator']=$den/$gcd;
   return($fraction);
}
function simpler($fraction){ // Return a simplified fraction STRING
   $frasl='</sup>&frasl;<sub>';
   if($fraction['numerator']==$fraction['denominator']) return("1");
   $newfrac = proper($fraction);
   $newnum = $newfrac['numerator'];
   $newden = $newfrac['denominator'];
   // We have either 0, proper or mixed
   if($newnum==0) return($newnum);
   // Fix the proper negative denominator problem
   if( $newnum>0 && $newden<0 ) { $newnum*=-1; $newden*=-1; }
   if(abs($newnum)<abs($newden)) return("<sup>".$newnum.$frasl.$newden."</sub>");
   // Here we must have a mixed fraction
   if ( ($newnum*$newden) < 0 ) $whole = ceil($newnum/$newden);
   else $whole = floor($newnum/$newden);
   $part  = $newnum%$newden;
   if($part==0) return($whole);
   if($whole==0) return("<sup>".$part.$frasl.$newden."</sub>");
   else return($whole."<sup>".abs($part).$frasl.$newden."</sub>"); // $part sometimes <0
}
function lcm($m, $n) { // Least Common Multiple, Note: LCM(a,b,c,d)=LCM(LCM(LCM(a,b),c),d)
    if ($m == 0 || $n == 0) return 0;
    $r = ($m * $n) / gcd($m, $n);
    return abs($r);
}
function gcd($a, $b) { // Greatest Common Divosor
    while ($b != 0) { $t = $b; $b = $a % $b; $a = $t; }
    return $a;
}
?>
