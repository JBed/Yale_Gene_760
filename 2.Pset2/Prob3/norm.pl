#! usr/bin/perl

##run wiht: perl jrb97_norm.pl <file to normalize> <total number of mapped reads>

use strict;
use warnings;

#get the name of the input file
my $wigin = $ARGV[0];

#and imput number of mapped reads
my $parm = $ARGV[1]/1000000; 

# set the output directory
my $wigout = $ARGV[0]."_scaled.wig";

# now open the required files or die with error
open (FILE, "<",$wigin) or die "cannot open the FILE\n";
open (OUTPUT, ">",$wigout) or die "cannot open the OUTPUT\n";

# loop over the rows in the imput file
while (<FILE>){
	if ($_ =~ "chrom=chr") {
		print OUTPUT $_;}
		#we keep the header lines the same
		elsif ($_ =~ "version") {print OUTPUT $_;}
		# but for the rows with counts we normalize
		else	{# by the total number of mapped reads.
			my @line = split(/\s+/,$_);
			print OUTPUT $line[0]."\t".$line[1]/$parm."\n";
		}

}

# close things up and finish nicly
close FILE;
close OUTPUT;


