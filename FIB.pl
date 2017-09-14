#!/usr/bin/env perl
use strict;
my $n=29;
my $k=4;
my@array=(1,1);
#An=An-1 + An-2*k ;
for(my $i=0;$i<$n-2;$i++){
	
	my$A=pop(@array);
	print "A:$A\n";
	my$B=pop(@array);
	print "B:$B\n";
	my$C=$A+$B*$k;
	print "C:$C\n_________________\n";
	push(@array,$A,$C);
	print"array:@array\n";
}
