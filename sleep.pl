#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);  #使用时间模块，usleep（毫秒）
while(1){
	my $pin= RPi::Pin->new(5);
	$pin-> mode(OUTPUT);
	$pin-> write (LOW);
	 my $pinnum=$pin->num;
	 my $pinmode=$pin->mode;
	 my $state=$pin->read;
print "pin number $pinnum id in mode $pinmode with state $state\n";
	 usleep(500);     #亮灯500ms
	$pin-> mode(INPUT);
	$pin-> write (HIGH);
	sleep(1);#熄灭1s；
}