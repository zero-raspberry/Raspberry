#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);

my ($hz,$miao1,$miao2,$num,$locate,$digital1,$digital2,$digital3,$digital4,$i,$shi1,$shi2,$fen1,$fen2);
$digital1=RPi::Pin->new(13);
$digital2=RPi::Pin->new(17);
$digital3=RPi::Pin->new(27);
$digital4=RPi::Pin->new(22);

my $pina=RPi::Pin->new(19);
my $pinb=RPi::Pin->new(26);
my $pinc=RPi::Pin->new(23);
my $pind=RPi::Pin->new(24);
my $pine=RPi::Pin->new(25);
my $pinf=RPi::Pin->new(12);
my $ping=RPi::Pin->new(16);
my $pindp=RPi::Pin->new(20);
my $button=RPi::Pin->new(18); 

        $i=0;
while($i<2){ 
        $i++;
        print"times:$i\n";
       
        $digital1-> mode(OUTPUT);
        $digital1->write(HIGH);
        $digital2-> mode(OUTPUT);
        $digital2->write(HIGH);
        $digital3-> mode(OUTPUT);
        $digital3->write(HIGH);
        $digital4-> mode(OUTPUT);
        $digital4->write(HIGH);
        sleep(1);
    
        $digital1-> mode(INPUT);
        $digital1->write(LOW);
        $digital2-> mode(INPUT);
        $digital2->write(LOW);
        $digital3-> mode(INPUT);
        $digital3->write(LOW);
        $digital4-> mode(INPUT);
        $digital4->write(LOW);
        sleep(1);
}
=pod
print "Enter num:\n";
chomp($num=<>);
print "Enter locate:\n";
chomp($locate=<>);
&pin;
&digital;
=cut

sub pin{
if($num==0){
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(LOW);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(HIGH);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==1){
         $pina->mode(OUTPUT);
         $pina->write(HIGH); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(HIGH);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(HIGH);
         $ping->mode(OUTPUT);
         $ping->write(HIGH);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==2){
         $pina->mode(OUTPUT);
         $pina->write(LOW);
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(HIGH);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(LOW);
         $pinf->mode(OUTPUT);
         $pinf->write(HIGH);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==3){ 
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(HIGH);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==4){ 
         $pina->mode(OUTPUT);
         $pina->write(HIGH); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(HIGH);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==5){ 
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(HIGH);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==6){ 
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(HIGH);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(LOW);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==7){
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(HIGH);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(HIGH);
         $ping->mode(OUTPUT);
         $ping->write(HIGH);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==8){
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(LOW);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}elsif($num==9){
         $pina->mode(OUTPUT);
         $pina->write(LOW); 
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);
         $pind->mode(OUTPUT);
         $pind->write(LOW);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(LOW);
         $ping->mode(OUTPUT);
         $ping->write(LOW);
         $pindp->mode(OUTPUT);
         $pindp->write(HIGH);
}else{
         $pina->mode(OUTPUT);
         $pina->write(HIGH); 
         $pinb->mode(OUTPUT);
         $pinb->write(HIGH);
         $pinc->mode(OUTPUT);
         $pinc->write(HIGH);
         $pind->mode(OUTPUT);
         $pind->write(HIGH);
         $pine->mode(OUTPUT);
         $pine->write(HIGH);
         $pinf->mode(OUTPUT);
         $pinf->write(HIGH);
         $ping->mode(OUTPUT);
         $ping->write(HIGH);
         $pindp->mode(OUTPUT);
         $pindp->write(LOW);
}
}

sub pin_off{
         $pina->mode(INPUT);
         $pina->write(LOW); 
         $pinb->mode(INPUT);
         $pinb->write(LOW);
         $pinc->mode(INPUT);
         $pinc->write(LOW);
         $pind->mode(INPUT);
         $pind->write(LOW);
         $pine->mode(INPUT);
         $pine->write(LOW);
         $pinf->mode(INPUT);
         $pinf->write(LOW);
         $ping->mode(INPUT);
         $ping->write(LOW);
         $pindp->mode(INPUT);
         $pindp->write(LOW);
}

sub digital{
if($locate==1){
         $digital1->mode(OUTPUT);
         $digital1->write(HIGH);
         $digital2->mode(INPUT);
         $digital2->write(LOW);
         $digital3->mode(INPUT);
         $digital3->write(LOW);
         $digital4->mode(INPUT);
         $digital4->write(LOW);
}elsif($locate==2){
         $digital1->mode(INPUT);
         $digital1->write(LOW);
         $digital2->mode(OUTPUT);
         $digital2->write(HIGH);
         $digital3->mode(INPUT);
         $digital3->write(LOW);
         $digital4->mode(INPUT);
         $digital4->write(LOW);
	         $pina->mode(OUTPUT);
	         $pina->write(HIGH); 
	         $pinb->mode(OUTPUT);
	         $pinb->write(HIGH);
	         $pinc->mode(OUTPUT);
	         $pinc->write(HIGH);
	         $pind->mode(OUTPUT);
	         $pind->write(HIGH);
	         $pine->mode(OUTPUT);
	         $pine->write(HIGH);
	         $pinf->mode(OUTPUT);
	         $pinf->write(HIGH);
	         $ping->mode(OUTPUT);
	         $ping->write(HIGH);
	         $pindp->mode(OUTPUT);
	         $pindp->write(LOW);
}elsif($locate==3){
         $digital1->mode(INPUT);
         $digital1->write(LOW);
         $digital2->mode(INPUT);
         $digital2->write(LOW);
         $digital3->mode(OUTPUT);
         $digital3->write(HIGH);
         $digital4->mode(INPUT);
         $digital4->write(LOW);
}elsif($locate==4){
         $digital1->mode(INPUT);
         $digital1->write(LOW);
         $digital2->mode(INPUT);
         $digital2->write(LOW);
         $digital3->mode(INPUT);
         $digital3->write(LOW);
         $digital4->mode(OUTPUT);
         $digital4->write(HIGH);
}
}


while(1){
        my $time=localtime; #Mon Jul  3 23:28:28 2017
        print "$time\n";
        if($time=~/\w*\s\w*\s\d*\s(\d)(\d):(\d)(\d):(\d)(\d)/){
        print "$1$2:$3$4:$5$6\n";  
         $shi1=$1;
         $shi2=$2;
         $fen1=$3;
         $fen2=$4;
         $miao1=$5;
         $miao2=$6;
        print"_________________\n";
        print"$shi1$shi2:$fen1$fen2";
        print "\n\n";
        print"+++++++++++\n";
$hz=3000; 
usleep($hz);
&pin_off; 
$locate=1;
$num=$fen1;
&digital;
&pin;
usleep($hz);
&pin_off;
$locate=2;
$num=$fen2;
&digital;
&pin;
usleep($hz);
&pin_off;
$locate=3;
$num=$miao1;
&digital;
&pin;
usleep($hz);
&pin_off;
$locate=4;
$num=$miao2;
&digital;
&pin;
        }
}


=pod  #分别显示1234验证用；
while(1){
	$locate=1;
	$num=1;
	&digital;
	&pin;
	usleep($hz);
	&pin_off;
	$locate=2;
	$num=2;
	&digital;
	&pin;
	usleep($hz);
	&pin_off;
	$locate=3;
	$num=3;
	&digital;
	&pin;
	usleep($hz);
	&pin_off;
	$locate=4;
	$num=4;
	&digital;
	&pin;
	usleep($hz);
	$hz=6500;
}
=cut
