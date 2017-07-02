#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);
        my $pin= RPi::Pin->new(18);  #蜂蜜器模块,初始化沉默；
       $pin-> mode(OUTPUT);
       $pin->write(HIGH);
       sleep(2);
        while(1){
            foreach(0,10,5,20,10,40,0,60,100){
             my $pin= RPi::Pin->new(18);
                $pin-> mode(PWM_OUT);
                $pin->pwm_write(18,$_);
                 sleep(1);
                }
                 $pin-> mode(OUTPUT);#循环结束，初始化沉默蜂鸣器；
                 $pin->write(HIGH);
                         sleep(2);
}
