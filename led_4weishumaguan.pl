#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);
#定义4个数码管；
my ($hz,$miao1,$miao2,$num,$locate,$digital1,$digital2,$digital3,$digital4,$i,$shi1,$shi2,$fen1,$fen2);
$digital1=RPi::Pin->new(13);
$digital2=RPi::Pin->new(17);
$digital3=RPi::Pin->new(27);
$digital4=RPi::Pin->new(22);
#定义8个共阴pin和1个按钮pin；
my $pina=RPi::Pin->new(19);
my $pinb=RPi::Pin->new(26);
my $pinc=RPi::Pin->new(23);
my $pind=RPi::Pin->new(24);
my $pine=RPi::Pin->new(25);
my $pinf=RPi::Pin->new(12);
my $ping=RPi::Pin->new(16);
my $pindp=RPi::Pin->new(20);
my $button=RPi::Pin->new(18); #按钮，切换显示时间和日期；

#初始化，闪灯3次后熄灭；
        $i=0;
while($i<1){  #正常修改为3
        $i++;
        print"times:$i\n";
        #将正极拉高，显示1s；
        $digital1-> mode(OUTPUT);
        $digital1->write(HIGH);
        $digital2-> mode(OUTPUT);
        $digital2->write(HIGH);
        $digital3-> mode(OUTPUT);
        $digital3->write(HIGH);
        $digital4-> mode(OUTPUT);
        $digital4->write(HIGH);
        sleep(1);
        #将正极拉低，关掉显示；
        $digital1-> mode(OUTPUT);
        $digital1->write(LOW);
        $digital2-> mode(OUTPUT);
        $digital2->write(LOW);
        $digital3-> mode(OUTPUT);
        $digital3->write(LOW);
        $digital4-> mode(OUTPUT);
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
#以上worked；
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
}elsif($num==1){#b,c,
         $pina->mode(OUTPUT);
         $pina->write(HIGH); #开
         $pinb->mode(OUTPUT);
         $pinb->write(LOW);
         $pinc->mode(OUTPUT);
         $pinc->write(LOW);#关
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
}elsif($num==3){ #
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
}elsif($num==4){ #
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
}elsif($num==5){ #
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

#定义1-4号的规则；（用$locate分别表示第1，2，3，4位数码管阳极）？？？需要考虑两个同时调用
sub digital{
if($locate==1){
         $digital1->mode(OUTPUT);
         $digital1->write(HIGH);
         $digital2->mode(OUTPUT);
         $digital2->write(LOW);
         $digital3->mode(OUTPUT);
         $digital3->write(LOW);
         $digital4->mode(OUTPUT);
         $digital4->write(LOW);
}elsif($locate==2){
         $digital1->mode(OUTPUT);
         $digital1->write(LOW);
         $digital2->mode(OUTPUT);
         $digital2->write(HIGH);
         $digital3->mode(OUTPUT);
         $digital3->write(LOW);
         $digital4->mode(OUTPUT);
         $digital4->write(LOW);
}elsif($locate==3){
         $digital1->mode(OUTPUT);
         $digital1->write(LOW);
         $digital2->mode(OUTPUT);
         $digital2->write(LOW);
         $digital3->mode(OUTPUT);
         $digital3->write(HIGH);
         $digital4->mode(OUTPUT);
         $digital4->write(LOW);
}elsif($locate==4){
         $digital1->mode(OUTPUT);
         $digital1->write(LOW);
         $digital2->mode(OUTPUT);
         $digital2->write(LOW);
         $digital3->mode(OUTPUT);
         $digital3->write(LOW);
         $digital4->mode(OUTPUT);
         $digital4->write(HIGH);
}
}
=pod
#获取系统时间，并取得时分；
while(1){
        my $time=localtime; #Mon Jul  3 23:28:28 2017
        print "$time\n";
        if($time=~/\w*\s\w*\s\d*\s(\d)(\d):(\d)(\d):(\d)(\d)/){
        print "$1$2:$3$4:$5$6\n";   #23:28:28时分秒
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
        usleep(2000);
#匹配到pin；
if(my $m<1000){
$m++;
my $hz=1000; 
usleep($hz);  #sleep时间变量； 
$locate=1;
$num=$shi1;
&digital;
&pin;

usleep($hz);
$locate=2;
$num=$shi2;
&digital;
&pin;

usleep($hz);
$locate=3;
$num=$miao1;
&digital;
&pin;

usleep($hz);
$locate=4;
$num=$miao2;
&digital;
&pin;
redo;
}else{
last;
}
}
}
=cut

#编辑显示1，2，3，4；
while(1){
        $locate=1;
        $num=1;
        &digital;
        &pin;
        usleep($hz);
        $locate=2;
        $num=2;
        &digital;
        &pin;
        usleep($hz);
        $locate=3;
        $num=3;
        &digital;
        &pin;
        usleep($hz);
        $locate=4;
        $num=4;
        &digital;
        &pin;
        usleep($hz);
$hz=6500;
}
}
