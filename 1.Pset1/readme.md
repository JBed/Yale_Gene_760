Jason Bedford Gene 760 Problem Set #1
===

Problem#1
Part#1: 190 common SNPs
Part#2: Minor allele frequency (MAF) is the frequency at which the least common allele occurs in a given population. Here the alleles are the different types of SNPs that occur at a given position in the genome. For a general variation at a given position in the human genome to be considered a polymorphism it needs to occur in at least 1% of the population. 
Part#3: see jrb97_CTCF_commonSNPs.bed in this directory. 
Part#4: 6 overlapping SNPs

Problem#2
Part#1:
Command: bedtools intersect -a jrb97_CTCF_NM006565.bed –b jrb97_CTCF_CommonSNPs.bed | wc -l
Explanation: Step#1 (bedtools intersect -a jrb97_CTCF_NM006565.bed –b jrb97_CTCF_CommonSNPs.bed) this part interests the file jrb97_CTCF_NM006565.bed with jrb97_CTCF_CommonSNPs.bed. Step#2 (| wc -l) the output from step#1 is then piped into the wc –l command which counts the number of lines. 
Output: 190 overlapping SNPs. This same number was obtained using the UCSC Table Browser. 

Problem#3: saved in: jrb97_CTCF_allSNPs.bed

Problem#4: 
Part#1: 57 overlapping SNPs.
Part#2: http://genome.ucsc.edu/cgi-bin/hgTracks?hgS_doOtherUser=submit&hgS_otherUserName=JBedford&hgS_otherUserSessionName=hg19_all_snvs_jrb97

Problem#5:
Part#1: 98%
Part#2: Mouse Gene CTCF (uc009ndn.1)
Part#3: The gene CTCF is conserved across humans and mouse. 

Problem#6:
Note: I used the following commands to do the intersection.
bedtools intersect -a CD4_CTCF_hg19.bed -b HeLa_CTCF_hg19.bed -f 0.5 -r > CD4Hela_intersect_CTCF.bed
bedtools intersect -a CD4Hela_intersect_CTCF.bed -b Jurkat_CTCF_hg19.bed -f 0.5 -r > CD4HelaJurkat_intersect_CTCF.bed
Part#1: 6583 constitutive active CTCF sites across the three cell types. 

Problem#7: The motif is: CGCCCCCTGGTGGC with 8154 occurrences. 

Problem#8: 
Part#1:
chr1: 828
chr10: 296
chr11: 430
chr12: 429
chr13: 86
chr14: 154
chr15: 191
chr16: 289
chr17: 452
chr18: 79
chr19: 401
chr2: 412
chr20: 234
chr21: 73
chr22: 205
chr3: 371
chr4: 114
chr5: 275
chr6: 324
chr7: 309
chr8: 252
chr9: 304
chrX: 68
chrY: 7
Part#2: See jrb97_CTCF_count.pl in this directory.
Part#3: See jrb97_CTCF_distribution.pdf in this directory.
Used the following commands:
y = data.frame(Chrom=c('chr10', 'chr20', 'chr5', 'chry', 'chr9', 'chr18', 'chr6', 'chr17', 'chr4', 'chr21' , 'chr19', 'chr15', 'chr11', 'chr14', 'chr12', 'chr1', 'chr2', 'chr3', 'chr7', 'chr16', 'chr8', 'chrX', 'chr13', 'chr22'), Count=c(296, 234, 275, 7, 304, 79, 324, 452, 114, 73, 401, 191, 430, 154, 429, 828, 412, 371, 309, 289, 252, 68, 86, 205))
barplot(y$Count, names.arg=y$Chrom )

Problem#9:
Part#1: There is enrichment for developmental and signaling processes.
Part#2: CTCF regulates many cellular processes while it is possible that CTCF is involved in the above-mentioned processes it defiantly not exclusively involved in these processes. 

Problem#10
Note I used the following commands:
bedtools intersect -a RAD21_regions.bed -b CD4HelaJurkat_intersect_CTCF.bed | wc -l
bedtools intersect -a LAD_regions.bed -b CD4HelaJurkat_intersect_CTCF.bed | wc -l  
Part#1: CTCF sites overlap more frequently with RAD21.
Part#2: Cohesin-mediated enhancer blocking.
Part#3: This analysis could potentially be biased if there exists substantially more places where CTCF could possibly overlap RAD21 than places of possible overlap with LAD. 
Part#4: In Martin et al. statistical significance of CTCF overlaps with various sites of interest was assessed by generating many pseudo constitutive and syntenic (CONSYN)-CTCF sites. I would do exactly this for the overlap of CTCF with RAD21 and LAD to determine function could these CTCF sites. 
