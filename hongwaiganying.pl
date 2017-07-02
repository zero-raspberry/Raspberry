#!/usr/bin/env perl 
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
my ($pin5,$pin18,$pin13);
$pin5=RPi::Pin->new(5); #用于指示程序正常，可以删除；
$pin5->mode(OUTPUT);
$pin5->write(HIGH);

$pin18=RPi::Pin->new(18);#蜂鸣器接口
$pin18->mode(OUTPUT);
$pin18->write(HIGH);

$pin13=RPi::Pin->new(13);#红外感应，
$pin13->mode(INPUT);#接收到人靠近，INput的值变为1，否则为0；

$pin13->write(LOW);

while(1){
        if ($pin13->read==1){
                $pin18->mode(PWM_OUT);
                $pin18->pwm_write(1023);
                print "Caution! Someone is closing!\n";
                sleep(2);
        }else{
                $pin18->write(HIGH); #再OUTPUT高电平状态时，蜂鸣器不响。
                $pin18->mode(OUTPUT);
                sleep(2);
                print"It's safety!\n";

        }

}
