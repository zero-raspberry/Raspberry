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
	$hash{$key}=$value;#��ȡfasta�ļ�hash��
}
#foreach(keys %hash){print "$_=>$hash{$_}\n"};
close FILE;

my @dna=values%hash;#�˴������е�fasta�����б�
	#print "hash values====:@dna\n";
my %reverse_hash;
foreach my$odfasta(@dna){
	my$long=length$odfasta;
	$reverse_hash{$odfasta}=$long;
};
my@reverse_hash=sort{$reverse_hash{$a}<=>$reverse_hash{$b}}keys %reverse_hash;#�˴������е�fasta���дӶ̵������е��б�
#fasta���и��ݳ��Ⱥ�ASCII��С��������
#print "reverse_hash values===:@reverse_hash\n";
my$assumption_longest_shared=$reverse_hash[0]; #fasta�ļ�����̵����У�
	#print "I'm shortest fasta====:$assumption_longest_shared\n";
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
	#print"\$_:$_,$long_set\n";
		for(my$i=0;$i<$long_set;$i++){#ÿ��Ԫ�شӺ����ȥ1base/�Σ�
				my$share=substr($_,0,$long_set-$i);
				push@shared_substring,$share;
	}
}
#�����ɵ�substringȥ�ظ�����Ƭ�δӳ���������Ȼ����Ƭ��ȥ�ȶ�ÿһ��fasta�ļ���
my%substring;
foreach my$ele(@shared_substring){
	my$long=length$ele;
	$substring{$ele}=$long;
};
my@reverse_shared_substring=sort{$substring{$b}<=>$substring{$a}}keys %substring; #�˴������е�substring���б�
#print "I'm all of assumption shared substring===:@reverse_shared_substring\n+++++++++++++++++++++++++++++\n";

#��substringȡ����fasta�б�
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


