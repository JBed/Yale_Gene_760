#!/bin/sh 
#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=2

cd /home2/jrb97
source .bashrc
cd /home2/jrb97/scratch/WGS-Data/jas-test

bowtie -n 2 -k 1 -p 2 /home2/jrb97/scratch/WGS-Data/ref-fasa/Homo19 interleaved_reads.fq -S > interleaved_reads.sam

samtools view -bS interleaved_reads.sam | samtools sort - interleaved_reads_sorted

samtools index /home2/jrb97/PS2/bowtie/interleaved_reads_sorted.bam /home2/jrb97/PS2/bowtie/interleaved_reads_sortedc.bam.bai
