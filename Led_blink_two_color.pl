#!/usr/bin/env perl
use RPi::Pin;
use RPi::WiringPi::Constant qw(:all);
while(1){

my $pin = RPi::Pin->new(5);

$pin->mode(INPUT);
$pin->write(LOW);



my $num = $pin->num;
my $mode = $pin->mode;
my $state = $pin->read;

print "pin number $num is in mode $mode with state $state\n";

my $pin1 = RPi::Pin->new(6);

$pin1->mode(OUTPUT);
$pin1->write(HIGH);



my $num = $pin1->num;
my $mode = $pin1->mode;
my $state = $pin1->read;
print "pin1 number $num is in mode $mode with state $state\n";

sleep(1);


my $pin = RPi::Pin->new(5);

$pin->mode(OUTPUT);
$pin->write(HIGH);

my $num = $pin->num;
my $mode = $pin->mode;
my $state = $pin->read;

print "pin number $num is in mode $mode with state $state\n";

my $pin1 = RPi::Pin->new(6);

$pin1->mode(OUTPUT);
$pin1->write(LOW);



my $num = $pin1->num;
my $mode = $pin1->mode;
my $state = $pin1->read;
print "pin1 number $num is in mode $mode with state $state\n";


sleep(1);
redo if(1);
}
int wiringPiSetupSys(void);
