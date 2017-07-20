#!/usr/bin/env perl
use strict;
#写一个脚本：1.读取限制酶的database，并转换成正则匹配的序列，出入哈希中；2.读取dan序列；3.匹配查找，返回未知；4.程序调用
#读取bionet.txt,并转化格式；
sub read_file{
	my($filename)=@_;
	open(FILE,"< $filename")
	or die "Can't open $filename $!\n";
	my @file=<FILE>;
	return @file;
}
sub sequence_from_fasta{
    my(@fasta_file_data) = @_;
    use strict;
    use warnings;
    # Declare and initialize variables
    my $sequence = '';
    foreach my $line (@fasta_file_data) {
        # discard blank line
        if ($line =~ /^\s*$/) {
            next;
        # discard comment line
        } elsif($line =~ /^\s*#/) {
            next;
        # discard fasta header line
        } elsif($line =~ /^>/) {
            next;
        # keep line, add to sequence string
        } else {
            $sequence .= $line;
        }
    }
    # remove non-sequence data (in this case, whitespace) from $sequence string
    $sequence =~ s/\s//g;
    return $sequence;
}
#对采用bionent格式表示没切位点进行修饰，转换成正则表达式模式；
sub IUB2regexp{   
	my ($iub)=@_;
	my $regexp;
	my %iub2regexp=(
	A => 'A',
	C => 'C',
	G => 'G',
	T => 'T',
	R => '[GA]',
	Y => '[CT]',
	M => '[AC]',
	K => '[GT]',
	S => '[GC]',
	W => '[AT]',
	B => '[CGT]',
	D => '[AGT]',
	H => '[ACT]',
	V => '[ACG]',
	N => '[ACGT]',);
	$iub=~s/\^*//g;
	for(my $i=0; $i<length($iub); ++$i){  #对于每个酶切位点的序列，先替换^，然后从0位开始往后逐个替换R,Y,... 生成新的用正则表达式表示的酶切位点序列；
		 $regexp.=$iub2regexp{substr($iub,$i,1)};
	}
	return $regexp;
}
 sub bionet{
 	my ($rebasefile)=@_;
 	use strict;
 	my $name;
	my $site;
	my $reg_site;
 	my @rebase=read_file($rebasefile);#读进来的文件是一行一行的，每行由酶的名称和空格和酶切位点序列组成，foreach遍历每一行，split把每行拆除2个元素的列表；
 	my @file=();
 	my %re_hash=();
 	foreach(@rebase){
		( 1 .. /Rich Roberts/ ) and next;
/^\s*$/ and next;
 		@file=split(" ",$_);
# 		next if(/^\s/);
		$name=shift@file;
		$site=pop@file;
		$reg_site=IUB2regexp($site);
		$re_hash{$name}="$site $reg_site";
 	}
 	return %re_hash;
 }

sub find_pos{
	my($regexp1,$seq1)=@_;   # $regexp为正则表达式表示的部分
	my @pos=();
	my $pos;
	while($seq1=~/$regexp1/ig){
		$pos=pos($seq1);
		push(@pos,($pos-length($&)+1)); #pos返回的是匹配部分（$&）的末尾的位置;	
}
	return @pos;
}
=pod
 my $rebasefile='L:\CentOS7资料（勿删）\bionet.txt';
 my %hash=bionet($rebasefile);
 foreach( keys %hash){
 	print "$_=>$hash{$_}\n";
 }
=cut
#以上已经完成酶切位点格式转化，名称、位点哈希生成（用bionet。txt的路径调用bionet子程序即可供后续使用）；
#下一步读取dan序列，输入需要查找的酶的名称，返回此为点在dna中的位置信息；
my $seq=();
my %hash;
my @pos;
my @dna;
my $enzyme;
my $dna='D:\perl file\eclipse\workplace\Raw_data\ZB16121600696(GJB-5)GJB2-F-CX(111803771)_Pw_D03.seq';
@dna=read_file($dna);
$seq=sequence_from_fasta(@dna);
my $bionet='D:\perl file\eclipse\workplace\Raw_data\bionet.txt';
%hash=bionet($bionet);
do{
print "please enter enzyme or quit:\n";
chomp($enzyme=<>);
my $value;

if($enzyme=~/^\s*$/){
	print "Sorry,You typed quit!\n";
	exit;
}elsif(exists $hash{$enzyme}){
		my@value=split(" ",$hash{$enzyme});
		$value=pop@value;
		@pos=&find_pos($value,$seq);
		if(@pos){print"@pos\n";}else{print "$enzyme is not in \$seq\n"};
}#else{print "tpye wring enzyme!\n";}

}until($enzyme=~/quit/i);
exit;
