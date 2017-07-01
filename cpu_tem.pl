#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);  #使用时间模块，usleep（毫秒）

 my $pin= RPi::Pin->new(5);#控制风扇，接三极管的B口；
 my $pin1=RPi::Pin->new(6);#开关和风扇口保持同步，用于指示灯；
        $pin-> mode(INPUT);
        $pin-> write(LOW);
        $pin1->write(LOW);
                while(1){
                        open (TEMP1,'< /sys/class/thermal/thermal_zone0/temp');
                        my $temp=<TEMP1>;
                        print $temp;
                        close TEMP1;
                        $temp=$temp/1000;
                        if ($temp>45){ #CPU温度大于45°接通，运行10s；直到小于45°，休眠10s后再检测温度；
                                $pin-> mode(OUTPUT);
                                $pin-> write(HIGH);
                                $pin1-> mode(OUTPUT);
                                $pin1-> write(HIGH);
                                sleep(10);
                                $pin-> write(LOW);
                                $pin1-> write(LOW);
                        }else{
                                sleep(10);
                        }
}

#正极接三极管E口，负极接C口，GPIO接B口，中间接风扇、电阻；