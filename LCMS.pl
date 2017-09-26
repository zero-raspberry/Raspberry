#!/usr/bin/env perl
use strict;
my $filepath='D:\eclipse\workspace\Rosalind\rosalind_lcsm.txt';
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
	$hash{$key}=$value;#提取fasta文件hash；
}
#foreach(keys %hash){print "$_=>$hash{$_}\n"};
close FILE;

my @dna=values%hash;#此处是所有的fasta序列列表；
	#print "hash values====:@dna\n";
my %reverse_hash;
foreach my$odfasta(@dna){
	my$long=length$odfasta;
	$reverse_hash{$odfasta}=$long;
};
my@reverse_hash=sort{$reverse_hash{$a}<=>$reverse_hash{$b}}keys %reverse_hash;#此处是所有的fasta序列从短到长排列的列表；
#fasta序列根据长度和ASCII从小到大排序；
#print "reverse_hash values===:@reverse_hash\n";
my$assumption_longest_shared=$reverse_hash[0]; #fasta文件中最短的序列；
	#print "I'm shortest fasta====:$assumption_longest_shared\n";
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
	#print"\$_:$_,$long_set\n";
		for(my$i=0;$i<$long_set;$i++){#每个元素从后面减去1base/次；
				my$share=substr($_,0,$long_set-$i);
				push@shared_substring,$share;
	}
}
#把生成的substring去重复，对片段从长到短排序，然后用片段去比对每一个fasta文件；
my%substring;
foreach my$ele(@shared_substring){
	my$long=length$ele;
	$substring{$ele}=$long;
};
my@reverse_shared_substring=sort{$substring{$b}<=>$substring{$a}}keys %substring; #此处是所有的substring的列表；
#print "I'm all of assumption shared substring===:@reverse_shared_substring\n+++++++++++++++++++++++++++++\n";

#用substring取遍历fasta列表；
my$fing_string;my$aim_fasta;my$alintimes=scalar@reverse_hash;my@shared;
foreach $fing_string(@reverse_shared_substring){
	#print"substring:$fing_string\n========>>>>\n";
	my$flag=0;
	foreach $aim_fasta(@reverse_hash){
		#print"$aim_fasta\n";
		if($aim_fasta=~/.*$fing_string.*/s){$flag++;print"flag:$flag,fasta:$aim_fasta\n";}else{next;};if($flag==$alintimes){push@shared,$fing_string;$flag=0;}
	}	
}

@shared=sort@shared;
my%shared;
foreach my$eles(@shared){
	my$long=length$eles;
	$shared{$eles}=$long;
};
my@shared_substringnew=sort{$shared{$b}<=>$shared{$a}}keys %shared;
print"@shared_substringnew\n";


