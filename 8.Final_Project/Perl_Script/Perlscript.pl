#! /usr/bin/perl
use strict;

#----
#This script is used to find the upregulated gene which have SRF active binding in there promoter region
#usage: $perl name.pl <Gene.diff> <PromoterRegion.bed> <UCSC2Alias.txt> <Outfile.txt> K562/GM12878
#the last option is for specifying the cell line that is relatively upregulated.
#written by Jason Bedford and Cong Liang. Input provided by all of the memebers of Team 3
#---

#first check if the correct number of command line options were entered. if not then print error message and die.
if ( @ARGV < 4 )
{
  die "Error! usage: perl name.pl <Gene.diff> <PromoterRegion.bed> <UCSC2Alias.txt> <Outfile.txt> K562/GM12878 \n";
}

# Read in files. (A full description of these files is provided in ReadMe.txt, below we provide a summary)
# Cuffdiff output of differentially expression
# my $expression = "/home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff";
my $expression = $ARGV[0];

# Promoter regions of genes that are marked by Srf binding, known DNA hypersensitivity, active Histone modifications, and regions of known promoters.
# my $promoter = "/home2/cl657/Final/intersect/K562_unique_promoters.bed";
my $promoter = $ARGV[1];

# File linking UCSC gene name to Alias names (Here we used official common names)
# my $genes = "/home2/cl657/Final/kgAlias.txt";
my $genes = $ARGV[2];

# Output file: a list of genes that are diff regulated and marked by Srf binding, known DNA hypersensitivity, active Histone modifications, and regions of known promoters.
# Use uniq command in bash to get rid of repeats.
# my $out = "./K562_unique_out.txt";
my $out = $ARGV[3];

#This specified the cell line that is relatively upregulated.
my $anal = $ARGV[4];

#open the files or return an error
open EXP, $expression or die "Couldn't open file: $expression $!\n";
open PRO, $promoter or die "Couldn't open file: $promoter $!\n";
open GEN, $genes or die "Couldn't open file: $genes $!\n";
open OUT, '>',$out or die "Couldn't open file: $out $!\n";

# Make the hash table
my %hash = ();
while (my $var2 = <GEN>){
	# Get rid of line ending '\r‘
	$var2 =~ s/\r|\n//g;
	# Get rid of line ending '\n'
	chomp($var2);
	#now split the string $var2 by escape character "\t" (tab) which separates the columns
	my @list = split /\t/, $var2;
	# Make the a hash table: hash[UCSC gene name]= Alias
	push(@{$hash{$list[1]}}, $list[0]);
};

# link diff genes to Srf binding, known DNA hypersensitivity, active Histone modifications, and regions of known promoters.
my @name;
while (my $var2 = <EXP>){
	chomp($var2);
	@name = split(/\t/,$var2);
	# GM12878 / K562; take significantly differentially regulated genes.
	# log2(foldchange) > 0; GM12878 up regulated
	# log2(foldchange) < 0; K562 up regulated
	# The last comun state weather the gene is diff expressed
	# after multiple hypothesis corrections. yes=>significant, no=>not significant
	if ($anal eq "K562"){

	if ( ($name[9] < 0) and ($name[13] eq "yes") ){
		#check if the UCSC gene name exist in the hash
		if (exists $hash{$name[1]}){
			#if it does then loop over the lines in PromoterRegion.bed
			while (my $var1 = <PRO>){
				#split on the "\t" (tab) and "_" (underscore) to get the Alias. often this will return a list of alaises.
				my @list = split /\t/, $var1;
				my @pro_id = split /_/, $list[3];
				# Check if the promoter region of diff gene is marked by Srf. The ~~ will search for the existence of the Alias in a list.
				if($pro_id[0] ~~ @{$hash{$name[1]}}){
					#if we find a match then print the UCSC gene name to <Outfile.txt>
					print OUT $name[1]."\n";
				};
			};
			# Get back to beginning of the PromoterRegion.bed file
			seek(PRO, 0, 0);
		};
	};

	}elsif ($anal eq "GM12878"){

	if ( ($name[9] > 0) and ($name[13] eq "yes") ){
		#check if the UCSC gene name exist in the hash
		if (exists $hash{$name[1]}){
			#if it does then loop over the lines in PromoterRegion.bed
			while (my $var1 = <PRO>){
				#split on the "\t" (tab) and "_" (underscore) to get the Alias. often this will return a list of alaises.
				my @list = split /\t/, $var1;
				my @pro_id = split /_/, $list[3];
				# Check if the promoter region of diff gene is marked by Srf. The ~~ will search for the existence of the Alias in a list.
				if($pro_id[0] ~~ @{$hash{$name[1]}}){
					#if we find a match then print the UCSC gene name to <Outfile.txt>
					print OUT $name[1]."\n";
				};
			};
			# Get back to beginning of the PromoterRegion.bed file
			seek(PRO, 0, 0);
		};
	};
		}else{
			#if we have some unrecognised parameter then just print an error message and die
			die "Error! invalid last option use K562 or GM12878 for this\n"
		};
};


# the output file <outfile.txt> will be produced in the current working directory. To get the list of uniqe gene we recommend using 
# the bash command "uniq" for example $uniq outfile.txt >  out-uiq.txt

