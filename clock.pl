#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);
while(1){
my $time=localtime;
print $time."\n";
        if ($time=~/\w*\s\w*\s\d*\s(\d*):(\d*):(\d*)/){
                print "$1:$2:$3";
                print"\n";
        }

                if ($2==00 && $3==00 || $2==30 && $3==00 ){  #ƥ��ɹ�˲�䣬����sleep��
                         print "on\n"; #�ڴ˴����Ϸ�������led����������
                 my $pin= RPi::Pin->new(18);  #������ģ��
                        $pin-> mode(PWM_OUT);
                        $pin->pwm_write(18,512);
                        sleep(2);
                    $pin->mode(INPUT);
                }else{
                        print "please wait!\n";
                }
sleep(1);
}