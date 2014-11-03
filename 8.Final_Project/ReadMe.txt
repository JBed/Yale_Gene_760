This document contains detailed instructions on how to reproduce the list of genes that was used for GO term analysis. 

Step #1: Preparing the input files.

PromoterRegion.bed
First we used bedtools to intersect the peaks from SRF ChIP-seq, DHS as well as two histone modification peaks for each 
cell line, which we refer to as “SRF active binding regions”. We found SRF active binding regions in each cell line and 
also identified unique peaks for each cell line. Then, A table of promoter regions, i.e., 1kbp region upstream UCSC 
annotated TSS, were downloaded from UCSC. Bedtools was used to find promoter regions in each cell line that overlaps with
SRF active binding regions (either all for each cell line or unique SRF active binding regions in each cell line), which
are put in PromoterRegion.bed. 
# Here are the files we used for this purpose (files located on the louise cluster)
/home2/cl657/Final/intersect/GM12878_promoters_SRF_bind.bed
/home2/cl657/Final/intersect/GM12878_unique_promoters.bed
/home2/cl657/Final/intersect/K562_promoters_SRF_bind.bed
/home2/cl657/Final/intersect/K562_unique_promoters.bed

Gene.diff
This file was produced by running cufflinks (cuffdiff) on the aligned RNA-Seq data (K562 vs GM12878). This file gives 
statistical information on which of the gene are differentially regulated between the two cell lines.
# Here is the file we used for this purpose (files located on the louise cluster)
/home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff

UCSC2Alias.txt
This file was downloaded from UCSC genome assembly hg19, genes and gene prediction group, UCSC genes track, and kgAlias 
table. This file is necessary to link UCSC gene annotation used in PromoterRegion.bed with the common gene names used in 
Gene.diff.
# Here is the file we used for this purpose (files located on the louise cluster)
/home2/cl657/Final/kgAlias.txt

Step #2: Running the program

With these files we now want to find the name of the genes in the two cell lines are up regulated and are in 
PromoterRegion.bed. 

Here we are interested in gene which are up-regulated in one cell line but not the other (differentially regulated). 
We took advantage of the cuffdiff significance statistic: took those clarified as ‘yes’ in significance column 
(implying a q-value of less than 0.05). To find in which cell line it is up regulated, we looked at the Log10(fold change).
If this number was greater than zero then GM12878 was upregulated (relative to K562) and if it was less than zero then K562 
was upregulated (relative to GM12878). The user can specify which cell line they want to be up regulated in the output gene by 
importing the name of that cell line as the last option when calling the script. 

To run the command:
$perl final.pl <Gene.diff> <PromoterRegion.bed> <UCSC2Alias.txt> <Outfile.txt> K562/GM12878

# Here are the commands we used (files located on the louise cluster):
perl final.pl /home2/cl657/Final/intersect/GM12878_promoters_SRF_bind.bed /home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff /home2/cl657/Final/kgAlias.txt GM12878_out.txt

perl final.pl /home2/cl657/Final/intersect/GM12878_unique_promoters.bed /home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff /home2/cl657/Final/kgAlias.txt GM12878_unique_out.txt

perl final.pl /home2/cl657/Final/intersect/K562_promoters_SRF_bind.bed /home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff /home2/cl657/Final/kgAlias.txt K562_out.txt

perl final.pl /home2/cl657/Final/intersect/K562_unique_promoters.bed /home2/pls32/Project/RNA_Seq_DATA/K562vGM12878_cuffdiff_output/gene_exp.diff /home2/cl657/Final/kgAlias.txt K562_unique_out.txt

Step #3: Removing duplicate findings
Our perl script does not remove gene which are found multiple times. To do this we used the bash command "uniq". How this could be done is shown below: 
uniq GM12878_out.txt > GM12878_up_out.txt
uniq GM12878_unique_out.txt > GM12878_unique_up_out.txt
uniq K562_out.txt > K562_up_out.txt
uniq K562_unique_out.txt > K562_unique_up_out.txt

Those four files are what we used for GO term analysis




