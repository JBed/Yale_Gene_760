#!/usr/bin/perl

use strict;
use warnings;

###Timothy Johnstone, 2/6/13
###This script counts the number of CTCF sites in a given chromosome
###Retrieves filenames from user as supplied command-line arguments
#This script could be half the length but I emphasized user-interactivity and pretty output

#Initialize Hash and counter
my %chrSites = ();
my $processedSites = 0;

#Retrieve filenames from user and setup bedfile and countfile IO
my $infileName = $ARGV[0] or die("Please enter your infile and outfile as arguments 1 and 2");
my $outfileName = $ARGV[1] or die("Please enter your infile and outfile as arguments 1 and 2");
open (INFILE, "<", $infileName) or die("Could not find/open input file $infileName");
open (OUTFILE,,">", $outfileName) or die("Could not access/create output file $outfileName");

#Iterate through the infile, populating the hash with counts
while (<INFILE>) {
	my @line = split("\t"); 	$processedSites++;
	if (exists $chrSites{$line[0]}) { 
		$chrSites{$line[0]}++;   
	} 
	else { 
		$chrSites{$line[0]} = 1; 
	}
}

#Sort chromosomes numerically and alphabetically (syntax: sort {boolean fn} subject)
my @sortedKeys = sort {
    my ($chrA, $numA) = $a =~ m/(\D+)(\d+)?/; 
    my ($chrB, $numB) = $b =~ m/(\D+)(\d+)?/;
    if (defined $numA && defined $numB) {$numA <=> $numB } else { $chrA cmp $chrB }
} keys %chrSites;

#Output results and clean up
print OUTFILE "$_\t$chrSites{$_}\n" for (@sortedKeys);
close(OUTFILE); close(INFILE);
