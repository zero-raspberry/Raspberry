#!/usr/bin/env perl
use strict;
my $n=81;#-th month;
my $k=1;#繁殖系数；
my $m=3;#(meaning that they reproduce only twice before dying);
my@array=(1,1,2,2);
#An=An-1 + An-2*k ;
my $long=scalar(@array);
for(my $i=0;$long<$n;$i=$long){
	my $E=$array[-1]+$array[-2]*$k-$array[-4];
	push(@array,$E);
	$long=scalar(@array);
}
print "@array\n";
my $total;
foreach my$key(2..$m+1){
	$total+=$array[-$key];
	print"\$total:$total\n";
}
my $total2=$total-2*$array[-$m];
print $total2;

# my $num=$array[-1]+$array[-2]*$k...$array[-m-1]-$array[-];


=pod
my$D=pop(@array);
	my$C=pop(@array);
	my$B=pop(@array);
	my$A=pop(@array);#my $E=$array[-1]+$array[-2]-$array[-4]替代；
	my$E=$D+$C*$k-$A;



for(my $i=0;$i<$n-4;$i++){
	my$A=pop(@array);
	print "A:$A\n";
	my$B=pop(@array);
	print "B:$B\n";
	my$D=pop(@array);
	my$E=pop(@array);
	my$C=$A+$B*$k-$E;
	print "C:$C\n_________________\n";
	push(@array,$D,$B,$A,$C);
	print"array:@array\n";
}
=cut
