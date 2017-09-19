#!/usr/bin/env perl
use strict;
my $n=99;#-th month;
my $k=1;#·±Ö³ÏµÊý£»
my $m=16;#(meaning that they reproduce only twice before dying);
my@array=(1,1);
my $con;
#An=An-1 + An-2*k+An-m-1(n-m-1>0) ;
for(my $i=3;$i<$n+1;$i++){
	$con=$i-$m-1;
	if($con==0){#m=3,con=4;
		print"step0:$con\n";
		my $E=$array[-1]+$array[-2]*$k-1;
		push(@array,$E);
	}elsif($con<0){
		print"step1:$con\n";
		my $E=$array[-1]+$array[-2]*$k;
		push(@array,$E);
	}else{
		print"step2:$con\n";
		my $E=$array[-1]+$array[-2]*$k-$array[$con-1];
		push(@array,$E);
	}
	print"array:@array\n";
}
