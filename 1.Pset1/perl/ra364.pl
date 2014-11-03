#!/usr/bin/perl

#=====================================================================
# PROGRAM: CHROMOSOME OCCURENCE COUNT
# FUNCTION: Counts number of hits per chromosome utilizing hash tables
#		   from FIMO output or similar text file
# AUTHOR: Robert Amezquita (RA364)
# DATE: 021213
#=====================================================================

use strict;
# use warnings;

# 1. READ IN INPUT - OPEN OUTPUT
# 	Format of FIMO Output/Program Input: contains 9 cols
#	2nd col is chr, 3-4 cols are start/stop
my $Input = '/home2/ra364/GENE760/PS_1/CD4_Hela_Jurkat.bed';
my $Output = 'chrCounts.txt';
open (INPUT, "<", $Input) or die "Could not open $Input: $!\n";
open (OUTPUT, ">", $Output) or die "Could not create $Output: $!\n";

# 2. CREATE HASH TABLE (for human genome)
my %chrHash = ('chr1'=>0,'chr2'=>0,'chr3'=>0,'chr4'=>0,'chr5'=>0,'chr6'=>0,'chr7'=>0,'chr7'=>0,
			 'chr8'=>0,'chr9'=>0,'chr10'=>0,'chr11'=>0,'chr12'=>0,'chr13'=>0,'chr14'=>0,
			 'chr15'=>0,'chr16'=>0,'chr17'=>0,'chr18'=>0,'chr19'=>0,'chr20'=>0,'chr21'=>0,
			 'chr22'=>0,'chrX'=>0,'chrY'=>0); # could populate hash as is read

# 3. POPULATE HASH TABLE KEYS with VALUES
while (<INPUT>) { # read through input by line
	my @col = split("\t"); # tabular split
	if (exists $chrHash{$col[0]}) { # prevents non-chr entry
		$chrHash{$col[0]}++; # recursive addition
	}
}

# 4. PRINT RESULTS TO OUTPUT
while (my ($key, $value) = each(%chrHash)) { # creates key and val scalars for each entry in hash
	print OUTPUT "$key\t$value\n"; # prints tab delimited key and respective value
}

print "Chromosome counting successful!"

