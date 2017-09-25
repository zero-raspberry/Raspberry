#!/usr/bin/env perl
use strict;
my $filepath='D:\perl file\eclipse\workplace\Rosalind\share.txt';
open(FILE,"< $filepath")or
die"Can't open such file $!\n";
my@dataset=<FILE>;
my%hash;my$key;my$value;
foreach my$fasta(@dataset){
	chomp$fasta;$fasta=~s/\s*//;
	if($fasta=~/^>.*/){
		$key=$fasta;
		undef $value;
	}else{$value.=$fasta}
	$hash{$key}=$value;
}
foreach(keys %hash){print "$_=>$hash{$_}\n"};
close FILE;
my @dna=reverse sort values%hash;#所有序列逆序集合；
	print "@dna\n";
my$assumption_longest_shared=$dna[0];#fasta文件中最短的序列；
	print $assumption_longest_shared,"\n";
my$long=length$assumption_longest_shared;
#用最短的序列生成shared substring 列表；
my@shared_substring;my$assumption_longest_shared_subset;my@assumption_longest_shared_subset;
for(my$i=0;$i<$long;$i++){#每次从前面减去1base,生成新的列表；
	$assumption_longest_shared_subset=substr($assumption_longest_shared,$i);
		#print "\$assumption_longest_shared_subset:$assumption_longest_shared_subset\n";
		push@assumption_longest_shared_subset,$assumption_longest_shared_subset;
}
#print"@assumption_longest_shared_subset\n";	
foreach(@assumption_longest_shared_subset){#遍历上面列表里的元素	
	my$long_set=length$_;
	print"\$_:$_,$long_set\n";
		for(my$i=0;$i<$long_set;$i++){#每个元素从后面减去1base/次；
				my$share=substr($_,0,$long_set-$i);
				push@shared_substring,$share;
	}
}


my @ar;my%hash1;
foreach my$ele(@shared_substring){
	my$long=length$ele;
	$hash1{$ele}=$long;
};
my@ae=sort{$hash1{$b}<=>$hash1{$a}}keys %hash1;
#print"@shared_substring\n";#生成最短的fasta文件对应序列的所有substring片段，对片段从长到短排序，然后用片段去比对每一个fasta文件；
print "@ae";








