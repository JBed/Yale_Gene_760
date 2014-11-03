Jason Bedford Gene 760 Problem Set 2
===


Problem #1
For each dataset, report the number of aligned reads (reported alignments) in your answer file. I used the following command:

bowtie -v 2 -m 1 /home2/ra364/DATA/PS2/hg19 /home2/ra364/DATA/PS2/input.fastq -S > /home2/jrb97/PS2/bowtie/output_align.sam

Which will allow for up to two mismatches per seed, and only report uniquely mapping reads. My results are below.

K562_H3K27ac aligned reads: 6326092
K562_polII aligned reads: 4320877
K562_input aligned reads: 15887656

NHEK_H3K27ac aligned reads: 7942075
NHEK_polII aligned reads: 10308481
NHEK_input aligned reads: 7646344


Problem #2: Part #1
Upload your peak calls (in BED format) as custom tracks to the UCSC Genome Browser and save as a session.

URL: http://genome.ucsc.edu/cgi-bin/hgTracks?hgS_doOtherUser=submit&hgS_otherUserName=jbedford&hgS_otherUserSessionName=jrb97_PS2

Problem #2: Part #2
Report the total number of peaks called. To determine the total number of peaks I used the following commands for TF binding.


macs14 --nomodel -t /home2/jrb97/PS2/bowtie/NHEK_polII/NHEK_polII_sorted.bam -c /home2/jrb97/PS2/bowtie/NHEK_input/NHEK_input_sorted.bam -f BAM -g hs -w -S -n /home2/jrb97/macs14/NHEK_polII_peaks

macs14 --nomodel -t /home2/jrb97/PS2/bowtie/K562_polII/ K562_polII_sorted.bam -c /home2/jrb97/PS2/bowtie/ K562_input/ K562_input_sorted.bam -f BAM -g hs -w -S -n /home2/jrb97/macs14/K562_polII_peaks


And the following command for histone modifications.


macs14 --nomodel --nolambda -t /home2/jrb97/PS2/bowtie/NHEK_H3K27ac/NHEK_H3K27ac_sorted.bam -c /home2/jrb97/PS2/bowtie/NHEK_input/NHEK_input_sorted.bam -f BAM -g hs -w -S -n /home2/jrb97/macs14/NHEK_H3K27ac_peaks

macs14 --nomodel --nolambda -t /home2/jrb97/PS2/bowtie/ K562_H3K27ac/ K562_H3K27ac_sorted.bam -c /home2/jrb97/PS2/bowtie/ K562_input/ K562_input_sorted.bam -f BAM -g hs -w -S -n /home2/jrb97/macs14/K562_H3K27ac_peaks


This produced the following answers.

K562_H3K27ac peaks: 28652
K562_polII peaks: 21382
NHEK_H3K27ac peaks: 51246
NHEK_polII peaks: 30682


Problem #2: Part #3
The number of MACS H3K27ac and polII peaks called for each cell type at promoters (1 kb upstream of TSS).

Note I used following command: bedtools intersect -wa -u -a input_peaks.bed -b promoters.bed | wc –l 

K562_H3K27ac peaks: 5946
K562_polII peaks: 3194
NHEK_H3K27ac peaks: 6820
NHEK_polII peaks: 3746


The number of MACS H3K27ac and polII peaks called for each cell type at exons. 

Note I used following command: intersect -wa -u -a K562H3K27ac_peaks.bed -b exons.bed | wc -l

K562_H3K27ac peaks: 12503
K562_polII peaks: 9740
NHEK_H3K27ac peaks: 15143
NHEK_polII peaks: 11026

The number of MACS H3K27ac and polII peaks called for each cell type at intergenic/intronic regions. 

Note I used following command:  bedtools intersect -v -wa -a input_peaks.bed -b promoters.bed | bedtools intersect -v -wa -a - -b exons.bed | wc -l


K562_H3K27ac peaks: 23153
K562_polII peaks: 12526
NHEK_H3K27ac peaks: 32518
NHEK_polII peaks: 21358


Discussion: PolII peaks at prompters indicate that the downstream gene is actively transcribed in the probed cells. While, H3K27ac peaks at promoters indicate that the downstream gene is poised for transcription. H3K27ac and/or PolII peaks in intergenic/intronic regions indicate potential regulatory regions.



Problem #3:
Please see jrb97_norm.pl



Problem #4:

K562_H3K27ac: bigWig 17804212 vs wig 157212208
K562_polII: bigWig 17025028 vs wig 180012901
NHEK_H3K27ac: bigWig 15440346 vs wig 134146576
NHEK_polII: bigWig 23697131 vs wig 250203907



Problem #5:
Use UCSC to determine the number of promoter and intergenic/intronic H3K27ac and polII peaks (MACS calls) that are:
Part#1:
Shared between K562: 
promoter: 5126
intergenic/intronic: 4356

NHEK cells:
promoter: 2391
intergenic/intronic: 2974

Part#2:
Unique to K562: 
H3K27ac: 768
PolII: 1460

Unique to NHEK: 
H3K27ac: 2348
PolII: 1547


Discussion: Here we are comparing at histone modifications and transcription factor binding sits across the two cell lines. We see that about 2x more peaks are shared between the two cell lines than differ. I am not sure if a biological significance can be assigned to this observation. 




Problem #6:
Use DAVID to determine Gene Ontology enrichments for promoters marked by H3K27ac and polII in each cell type.

Part #1: Promoters marked by polII in both K562 and NHEK: See jrb97_DAVID_polII_K562.txt

Part #2: Promoters marked by polII only in K562: See jrb97_DAVID_polII_K562.txt

Part #3: Promoters marked by polII only in NHEK: See jrb97_DAVID_polII_NHEK.txt

Discussion: Here we see enrichment in DNA transcription, and protein kinase signaling pathways. With out further knowledge of the cells I don’t know what biological insights can be inferred.







Problem #7:
Use GREAT to determine functional enrichments for:

Part #1: Intergenic/intronic H3K27ac sites shared between both cell types: See jrb97_GREAT_shared.txt

Part #2: Intergenic/intronic H3K27ac sites unique to NHEK: See jrb97_GREAT_K562.txt

Part #3: Intergenic/intronic H3K27ac sites unique to K562: See jrb97_GREAT_NHEK.txt

Discussion: Here we see that both of the cell lines show enrichment for reactive / oxidative stress. Unfortunately, without further knowledge of the cells I don’t know what biological insights can be inferred.









Problem #8:
Use GREAT to determine functional enrichment for GATA1+H3K27ac sites compared to:
Part #1: the whole genome:  See jrb97_GREAT_GATA1_genome.txt
Part #2: all intergenic/intronic H3K27ac sites in K562 cells: jrb97_GREAT_GATA1_ac.txt
Number of overlapping sights: 1832













