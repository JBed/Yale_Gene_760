#!/bin/sh 
#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=2

##for the NHEK cell lines

cd /home2/jrb97/PS2/macs14/NHEK_polII
pwd
macs14 --nomodel -t /home2/jrb97/PS2/bowtie/NHEK_polII/NHEK_polII_sorted.bam -c /home2/jrb97/PS2/bowtie/NHEK_input/NHEK_input_sorted.bam -f BAM -g hs -w -S -n NHEK_polII_peaks
cd /home2/jrb97/PS2/macs14/NHEK_H3K27ac
pwd
macs14 --nomodel --nolambda -t /home2/jrb97/PS2/bowtie/NHEK_H3K27ac/NHEK_H3K27ac_sorted.bam -c /home2/jrb97/PS2/bowtie/NHEK_input/NHEK_input_sorted.bam -f BAM -g hs -w -S -n NHEK_H3K27ac_speaks


## for the K562 cell lines
cd /home2/jrb97/PS2/macs14/K562_H3K27ac
pwd
macs14 --nomodel -t /home2/jrb97/PS2/bowtie/K562_H3K27ac/K562_H3K27ac_sorted.bam -c /home2/jrb97/PS2/bowtie/K562_input/K562_input_sorted.bam -f BAM -g hs -w -S -n K562_H3K27ac_peaks
cd /home2/jrb97/PS2/macs14/K562_polII
pwd
macs14 --nomodel --nolambda -t /home2/jrb97/PS2/bowtie/K562_polII/K562_polII_sorted.bam -c /home2/jrb97/PS2/bowtie/K562_input/K562_input_sorted.bam -f BAM -g hs -w -S -n K562_polII_peaks

