#!/usr/bin/env perl 
use strict;
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
my ($pin5,$pin18,$pin13);
$pin5=RPi::Pin->new(5); #����ָʾ��������������ɾ����
$pin5->mode(OUTPUT);
$pin5->write(HIGH);

$pin18=RPi::Pin->new(18);#�������ӿ�
$pin18->mode(OUTPUT);
$pin18->write(HIGH);

$pin13=RPi::Pin->new(13);#�����Ӧ��
$pin13->mode(INPUT);#���յ��˿�����INput��ֵ��Ϊ1������Ϊ0��

$pin13->write(LOW);

while(1){
        if ($pin13->read==1){
                $pin18->mode(PWM_OUT);
                $pin18->pwm_write(1023);
                print "Caution! Someone is closing!\n";
                sleep(2);
        }else{
                $pin18->write(HIGH); #��OUTPUT�ߵ�ƽ״̬ʱ�����������졣
                $pin18->mode(OUTPUT);
                sleep(2);
                print"It's safety!\n";

        }

}
