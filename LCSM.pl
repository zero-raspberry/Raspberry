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
my @dna=reverse sort values%hash;#�����������򼯺ϣ�
	print "@dna\n";
my$assumption_longest_shared=$dna[0];#fasta�ļ�����̵����У�
	print $assumption_longest_shared,"\n";
my$long=length$assumption_longest_shared;
#����̵���������shared substring �б�
my@shared_substring;my$assumption_longest_shared_subset;my@assumption_longest_shared_subset;
for(my$i=0;$i<$long;$i++){#ÿ�δ�ǰ���ȥ1base,�����µ��б�
	$assumption_longest_shared_subset=substr($assumption_longest_shared,$i);
		#print "\$assumption_longest_shared_subset:$assumption_longest_shared_subset\n";
		push@assumption_longest_shared_subset,$assumption_longest_shared_subset;
}
#print"@assumption_longest_shared_subset\n";	
foreach(@assumption_longest_shared_subset){#���������б����Ԫ��	
	my$long_set=length$_;
	print"\$_:$_,$long_set\n";
		for(my$i=0;$i<$long_set;$i++){#ÿ��Ԫ�شӺ����ȥ1base/�Σ�
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
#print"@shared_substring\n";#������̵�fasta�ļ���Ӧ���е�����substringƬ�Σ���Ƭ�δӳ���������Ȼ����Ƭ��ȥ�ȶ�ÿһ��fasta�ļ���
print "@ae";








