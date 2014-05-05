use strict;

my $peaks = "/home2/cl657/Final/intersect/K562_Srf_DHS_His.bed";
my $expression = "/home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff";
my $out = "./out.txt";


open SRF, $peaks or die "Couldn't open file: $peaks $!\n";
open EXP, $expression or die "Couldn't open file: $expression $!\n";
open OUT, '>',$out or die "Couldn't open file: $out $!\n";


my @val1;
my @val2;
my @val3;
my @val4;



print "Now relate the diff. regulated genes to the peaks \n";
while (my $var2 = <EXP>){
	my @val2 = split(/\t/,$var2);
	my @val3 = split(":",$val2[3]);
	my $chr2 = substr($val3[0], 3, 4);
	my @val4 = split("-",$val3[1]);
	while (my $var1 = <SRF>){
		my @val1 = split(/\t/,$var1);
		my $chr1 = substr($val1[0], 3, 4);
		if( ($chr1 eq $chr2) and ($val4[0] < $val1[1]) and ($val4[0]+1000 > $val1[1]) ){
			print "yes!!";
		};
	};
};




print "All done :) \n";

