#!/usr/bin/env perl 
=pod
Ä£ÄâÊ®×ÖÂ·¿Ú½»Í¨ĞÅºÅµÆÏµÍ³£»
a×é£ºÂÌµÆ10s£¬ÉÁË¸2s£¬ºìµÆ12s£¨ÁíÒ»×é¿ªÊ¼ÁÁÂÌµÆ£©£»
b×é£ºÁíÒ»×é£¬ÔÚºìµÆºó2s¿ªÊ¼ÁÁÂÌµÆ10s£¬ÉÁË¸2s£¬ºìµÆ12s£»
=cut
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
#µ÷ÓÃ×Ó³ÌĞò£¬³õÊ¼»¯£¨À¶£¬ÂÌ£¬ºì¾ùÏ¨Ãğ×´Ì¬£©
	&int_light;
	sleep(1);
	while(1){
#ÂÌµÆÁÁ5s£¬Ï¨Ãğ2s£»pina(5,À¶£»)pinb(6£¬ÂÌ),pinc(13£¬°×);
		my($pina,$pinb,$pinc,$i);
		$pina=RPi::Pin->new(6);
		$pina->mode(OUTPUT);
		$pina->write(LOW);  #LOWÎª¿ªÆô
			$numa=$pina->num;
			$modea=$pina->mode;
			$statea=$pina->read;
	print "pin $numa in mode $modea with state $statea\n";
		sleep(5); #ÁÁ5sºóÏ¨Ãğ1s,½øÈëÏÂÒ»²½£¨ÂÌµÆÉÁË¸3Ãë£¬1sÃ¿´Î£©£»
		$i=0;
		until($i>3){
			$i++;
			$pina->mode(OUTPUT);
			$pina->write(LOW); 
			sleep(1); #ÁÁ1s£»
			$pina->mode(INPUT);
			$pina->write(HIGH); 
			sleep(1); #Ï¨Ãğ1s£»
			
		}
#:ÂÌµÆÉÁË¸½áÊøºó£¬°×µÆÁÁ3s,Ï¨Ãğ£»
		$pinc=RPi::Pin->new(13);
		$pinc->mode(OUTPUT);
		$pinc->write(LOW); 
		sleep(3);
		$pinc->mode(INPUT);
		$pinc->write(HIGH); 
#£ºÀ¶µÆÁÁ5s£¬
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

