#!/usr/bin/env perl
my $filepath='D:\eclipse\workspace\Rosalind\rosalind_grph.txt';
open(FILE,"< $filepath")or
die "Can't open such file $!\n";
my@dataset=<FILE>;
#print @dataset;
my $integer_k=3;
my(%hash,$key,$value,$suffix,$prefix,@value);
foreach my$data(@dataset){
	$data=~s/\s*//;chomp$data;
	if($data=~/^>(.*)/s){$key=$1}else{$value.=$data;push@value,$data};
	$hash{$key}=$value;
	undef $value;
}
%hash=reverse%hash;#fasta���к�����hash(keyΪ���У�valueΪfasta����)���Լ�����@value��
print values%hash;
my(%prefix,%suffix,@prefix,@suffix,$prefixxx,$suffixxx,$match,$match2,$seq);
foreach my$fix(@value){
$prefix{$fix}=$fix."_".substr($fix,0,$integer_k);#ȡǰ׺��
$suffix{$fix}=$fix."_".substr($fix,-$integer_k,$integer_k);#ȡ��׺��
}
%prefix=reverse%prefix;
%suffix=reverse%suffix;
@prefix=keys %prefix;       #     print"prefix: @prefix\n";
@suffix=keys %suffix;       #     print"suffix: @suffix\n";
foreach$suffixxx(@suffix){
	$suffixxx=~/.*(.{3}$)/s;$match=$1; 
	foreach$prefixxx(@prefix){
		$prefixxx=~/.*(.{3}$)/s;$match2=$1;
		if($match eq $match2){
			my$part1=$suffix{$suffixxx};
			my$part2=$prefix{$prefixxx};
			#if($hash{$part1} ne $hash{$part2}){
			$seq=$hash{$part1}.$hash{$part2};
			print "$seq\n";
			#}
		}
	}
}






