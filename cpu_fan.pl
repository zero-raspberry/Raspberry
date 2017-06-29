#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);  #使用时间模块，usleep（毫秒）

 my $pin= RPi::Pin->new(5);
 	$pin-> mode(INPUT);
 	$pin-> write(LOW);
 	
		while(1){
			open (TEMP1,'< /sys/class/thermal/thermal_zone0/temp');
			my $temp=<TEMP1>;
			print $temp;
			close TEMP1;
			$temp=$temp/1000;
			if ($temp>45){
				$pin-> mode(OUTPUT);
 				$pin-> write(LOW);
				sleep(10);
				$pin-> mode(INPUT);				
			}else{
				sleep(10); 
			}
}
