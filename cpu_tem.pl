#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
use Time::HiRes qw(usleep);  #ʹ��ʱ��ģ�飬usleep�����룩

 my $pin= RPi::Pin->new(5);#���Ʒ��ȣ��������ܵ�B�ڣ�
 my $pin1=RPi::Pin->new(6);#���غͷ��ȿڱ���ͬ��������ָʾ�ƣ�
        $pin-> mode(INPUT);
        $pin-> write(LOW);
        $pin1->write(LOW);
                while(1){
                        open (TEMP1,'< /sys/class/thermal/thermal_zone0/temp');
                        my $temp=<TEMP1>;
                        print $temp;
                        close TEMP1;
                        $temp=$temp/1000;
                        if ($temp>45){ #CPU�¶ȴ���45���ͨ������10s��ֱ��С��45�㣬����10s���ټ���¶ȣ�
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

#������������E�ڣ�������C�ڣ�GPIO��B�ڣ��м�ӷ��ȡ����裻