#!/usr/bin/env perl 
=pod
ģ��ʮ��·�ڽ�ͨ�źŵ�ϵͳ��
a�飺�̵�10s����˸2s�����12s����һ�鿪ʼ���̵ƣ���
b�飺��һ�飬�ں�ƺ�2s��ʼ���̵�10s����˸2s�����12s��
=cut
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
#�����ӳ��򣬳�ʼ���������̣����Ϩ��״̬��
	&int_light;
	sleep(1);
	while(1){
#�̵���5s��Ϩ��2s��pina(5,����)pinb(6����),pinc(13����);
		my($pina,$pinb,$pinc,$i);
		$pina=RPi::Pin->new(6);
		$pina->mode(OUTPUT);
		$pina->write(LOW);  #LOWΪ����
			$numa=$pina->num;
			$modea=$pina->mode;
			$statea=$pina->read;
	print "pin $numa in mode $modea with state $statea\n";
		sleep(5); #��5s��Ϩ��1s,������һ�����̵���˸3�룬1sÿ�Σ���
		$i=0;
		until($i>3){
			$i++;
			$pina->mode(OUTPUT);
			$pina->write(LOW); 
			sleep(1); #��1s��
			$pina->mode(INPUT);
			$pina->write(HIGH); 
			sleep(1); #Ϩ��1s��
			
		}
#:�̵���˸�����󣬰׵���3s,Ϩ��
		$pinc=RPi::Pin->new(13);
		$pinc->mode(OUTPUT);
		$pinc->write(LOW); 
		sleep(3);
		$pinc->mode(INPUT);
		$pinc->write(HIGH); 
#��������5s��
		$pinb=RPi::Pin->new(5);
		$pinb->mode(OUTPUT);
		$pinb->write(LOW);
		$numb=$pinb->num;
		$modeb=$pinb->mode;
		$stateb=$pinb->read;
		print "pin $numb in mode $modeb with state $stateb\n";
		sleep(5);
		$pinb->mode(INPUT);
		$pinb->write(HIGH);

sub int_light{
	$pina=RPi::Pin->new(5);
	$pinb=RPi::Pin->new(6);
	$pinc=RPi::Pin->new(13);
	$pina->mode(OUTPUT);
	$pina->write(HIGH);
	$pinb->mode(OUTPUT);
	$pinb->write(HIGH);
	$pinc->mode(OUTPUT);
	$pinc->write(HIGH);
		$statea=$pina->read;
		$stateb=$pinb->read;
		$statec=$pinc->read;
		print "pin 5,6,13 with state $statea,$stateb,$statec\n";
	}
}

