#!/usr/bin/env perl
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);
        my $pin= RPi::Pin->new(18);  #蜂蜜器模块gpio.pin18;
        $pin-> mode(OUTPUT);#初始化沉默蜂鸣器；
        $pin->write(HIGH);
        while(1){
        my $time=localtime;
        print $time."\n";
                if ($time=~/\w*\s\w*\s\d*\s(\d*):(\d*):(\d*)/){
                         print "$1:$2:$3"; #取出localtime 时分秒部分；
                     print"\n";
                }
                     if ($2==00 && $3==00 || $2==30 && $3==00 ){  #匹配成功，整点或半点报时；
                                $pin-> mode(OUTPUT);
                                $pin->write(LOW);
                                sleep(2);
                                $pin-> mode(OUTPUT);#关闭蜂鸣；
                                $pin->write(HIGH);
                        }else{
                                print "please wait!\n";
                        }
          sleep(1);
        }
