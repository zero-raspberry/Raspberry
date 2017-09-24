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
%hash=reverse%hash;#fasta序列和名称hash(key为序列，value为fasta名称)，以及序列@value；
print values%hash;
my(%prefix,%suffix,@prefix,@suffix,$prefixxx,$suffixxx,$match,$match2,$seq);
foreach my$fix(@value){
$prefix{$fix}=$fix."_".substr($fix,0,$integer_k);#取前缀；
$suffix{$fix}=$fix."_".substr($fix,-$integer_k,$integer_k);#取后缀；
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






