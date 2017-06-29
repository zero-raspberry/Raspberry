#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);  #使用时间模块，usleep（毫秒）

# set the pin to PWM_OUT mode. Must be physical pin 12
 my $pin= RPi::Pin->new(18);
        $pin-> mode(PWM_OUT);

# values are 0-1023 which represent 0% to 100% power

$pin->pwm_write(18,1023); # pin output is ~50%
 
# make pin go from off to bright gradually...
# requires Time::HiRes qw(usleep);

# my $pin = $pi->pin(5);
# $pin-> mode(PWM_OUT);
@reverse=reverse(1..1023);
while(1){
for (1..1023){
    $pin->pwm_write(18,$_);
   usleep (900);     
    }
    usleep(1000);
for (@reverse){
    $pin->pwm_write(18,$_);
    usleep (900);
    }
}
