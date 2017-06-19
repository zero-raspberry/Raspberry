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

sleep(1);
my $pin = RPi::Pin->new(5);

$pin->mode(OUTPUT);
$pin->write(HIGH);

my $num = $pin->num;
my $mode = $pin->mode;
my $state = $pin->read;

print "pin number $num is in mode $mode with state $state\n";
sleep(1);
redo if(1);
}

