
use strict;
use warnings;

# use: perl jrb97-parseGTF.pl 


# location of the .gtf file - one would need to change the next three lines to run on other files
my $gtf = "/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf";
my $gene = "SVZ_gene_up.txt";
my $out = 'transcriptID_SVZ.txt';


# make the hash
my %gtid;
open GTF, $gtf or die "Couldn't open gtf file: $!\n";
while(my $line = <GTF>) {
	$line =~ 's/[\n\r]/g';
	my @part1 = split /\t/, $line;
	my @part2 = split /\"/, $part1[8];
	$gtid{$part2[1]} = $part2[3];
}

close GTF;


# 
open INPUT, '<', $gene or die "Couldn't open input file: $!\n";
open OUTPUT, '>', $out or die "Couldn't open output file: $!\n"; 


while(my $line = <INPUT>) {
	$line =~ s/[\r\n]//g;
	my @clen = split /\t/, $line;
	if (exists $gtid{$clen[0]}) {
		print OUTPUT $gtid{$clen[0]}."\n";
	} else {
	}
}

close INPUT;
close OUTPUT;








use strict;
use warnings;



my $gtf = "/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf";
my $gene = "CP_gene_up.txt";
my $out = 'transcriptID_CP.txt';


my %gtid;
open GTF, $gtf or die "Couldn't open gtf file: $!\n";
while(my $line = <GTF>) {
	$line =~ 's/[\n\r]/g';
	my @part1 = split /\t/, $line;
	my @part2 = split /\"/, $part1[8];
	$gtid{$part2[1]} = $part2[7];
}

close GTF;


open INPUT, '<', $gene or die "Couldn't open input file: $!\n";
open OUTPUT, '>', $out or die "Couldn't open output file: $!\n"; 


while(my $line = <INPUT>) {
	$line =~ s/[\r\n]//g;
	my @clen = split /\t/, $line;
	if (exists $gtid{$clen[0]}) {
		print OUTPUT $gtid{$clen[0]}."\t".$clen[3]."\n";
	} else {
	}
}

close INPUT;
close OUTPUT;







