#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);
#����4������ܣ�
my ($num,$local);
$digital2-> mode(OUTPUT);
$digital2->write(LOW);
$digital3-> mode(OUTPUT);#��ʼ����ȫ��Ϩ�𣨿���ͨ��ʱ��ȫ����2�Σ�������
$digital3->write(LOW);
$digital4-> mode(OUTPUT);#��ʼ����ȫ��Ϩ�𣨿���ͨ��ʱ��ȫ����2�Σ�������
$digital4->write(LOW);
#����8������pin��1����ťpin��
my $pina=RPi::Pin->new(19);
my $pinb=RPi::Pin->new(26);
my $pinc=RPi::Pin->new(23);
my $pind=RPi::Pin->new(24);
my $pine=RPi::Pin->new(25);
my $pinf=RPi::Pin->new(12);
my $ping=RPi::Pin->new(16);
my $pindp=RPi::Pin->new(20);
my $button=RPi::Pin->new(18); #��ť���л���ʾʱ������ڣ�
#����0--9.�Ĺ��򣻣���$unm��ʾ����ť��ʱ�����壩

sub pin_led{
if($num==0){
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(LOW);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(HIGH);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
elsif($num==1){	
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); #��
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(HIGH);#��
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(HIGH);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(HIGH);
	 $ping=mode->(OUTPUT);
	 $ping=write->(HIGH);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==2){
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW);
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(HIGH);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(LOW);
	 $pine=mode->(OUTPUT);
	 $pine=write->(HIGH);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==3){ #f,a,g,b,c��
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(HIGH);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==4){e,g,a,b,c
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(HIGH);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==5){f,e,g,b,c,
	 $pina=mode->(OUTPUT);
	 $pina=write->(HIGH); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==6){b,c,d,e,f,g
	 $pina=mode->(OUTPUT);
	 $pina=write->(HIGH); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(LOW);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==7){a,b,f
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(HIGH);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(HIGH);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(HIGH);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==8){
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(LOW);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}elsif($num==9){
	 $pina=mode->(OUTPUT);
	 $pina=write->(LOW); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(LOW);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(LOW);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(LOW);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(LOW);
	 $ping=mode->(OUTPUT);
	 $ping=write->(LOW);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(HIGH);
}else($num eq ":"){
	 $pina=mode->(OUTPUT);
	 $pina=write->(HIGH); 
	 $pinb=mode->(OUTPUT);
	 $pinb=write->(HIGH);
	 $pinc=mode->(OUTPUT);
	 $pinc=write->(HIGH);
	 $pind=mode->(OUTPUT);
	 $pind=write->(HIGH);
	 $pine=mode->(OUTPUT);
	 $pine=write->(HIGH);
	 $pinf=mode->(OUTPUT);
	 $pinf=write->(HIGH);
	 $ping=mode->(OUTPUT);
	 $ping=write->(HIGH);
	 $pindp=mode->(OUTPUT);
	 $pindp=write->(LOW);
}
}
#����1-4�ŵĹ��򣻣���$locate�ֱ��ʾ��1��2��3��4λ�����������
sub pin_local{
if($locate==1){
	 $digital1=mode->(OUTPUT);
	 $digital1=write->(LOW);
	 $digital2=mode->(OUTPUT);
	 $digital2=write->(HIGH);
	 $digital3=mode->(OUTPUT);
	 $digital3=write->(HIGH);
	 $digital4=mode->(OUTPUT);
	 $digital4=write->(HIGH);
}elsif($locate==2){
	 $digital1=mode->(OUTPUT);
	 $digital1=write->(HIGH);
	 $digital2=mode->(OUTPUT);
	 $digital2=write->(LOW);
	 $digital3=mode->(OUTPUT);
	 $digital3=write->(HIGH);
	 $digital4=mode->(OUTPUT);
	 $digital4=write->(HIGH);
}elsif($locate==3){
	 $digital1=mode->(OUTPUT);
	 $digital1=write->(HIGH);
	 $digital2=mode->(OUTPUT);
	 $digital2=write->(HIGH);
	 $digital3=mode->(OUTPUT);
	 $digital3=write->(LOW);
	 $digital4=mode->(OUTPUT);
	 $digital4=write->(HIGH);
}elsif($locate==4){
	 $digital1=mode->(OUTPUT);
	 $digital1=write->(HIGH);
	 $digital2=mode->(OUTPUT);
	 $digital2=write->(HIGH);
	 $digital3=mode->(OUTPUT);
	 $digital3=write->(HIGH);
	 $digital4=mode->(OUTPUT);
	 $digital4=write->(LOW);
}
}
#��ȡϵͳʱ�䣬��ȡ��ʱ�֣�
while(1){
	my $time=localtime;
	print "$time\n";
	if($time=~/\w*\s\w*\s\d*\s(\d)(\d):(\d)(\d):(\d)(\d)/){
	print "$1$2:$3$4:$5$6";
	print "\n\n";
	sleep(2);
	}	
	#ƥ�䵽pin�ϵ��ã�
	$locate==1;
	&pin_local;
	$num=$3;
	&pin_led;
	$locate==2;
	&pin_local;
	$num=$4;
	&pin_led;
	$locate==3;
	&pin_local;
	$num=$5;
	&pin_led;
	$locate==4;
	&pin_local;
	$num=$6;
	&pin_led;
}





