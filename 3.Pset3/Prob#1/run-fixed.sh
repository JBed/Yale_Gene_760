#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=8


#the data files
cp1="/home2/ra364/DATA/PS3/CP-1.fastq"
cp2="/home2/ra364/DATA/PS3/CP-2.fastq"
svz1="/home2/ra364/DATA/PS3/SVZ-IZ-1.fastq" 
svz2="/home2/ra364/DATA/PS3/SVZ-IZ-2.fastq"
vz1="/home2/ra364/DATA/PS3/VZ-1.fastq"
vz2="/home2/ra364/DATA/PS3/VZ-2.fastq"

# the bowtie index files 
bindx="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Sequence/BowtieIndex/genome"

# the gtf file 
gtfile="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf"


tophat -p 8 -o ~/scratch/mRNA-runs/out_CP-1 -G $gtfile $bindx $cp1
tophat -p 8 -o ~/scratch/mRNA-runs/out_CP-2 -G $gtfile $bindx $cp2

tophat -p 8 -o ~/scratch/mRNA-runs/out_SVZ-IZ-1 -G $gtfile $bindx $svz1
tophat -p 8 -o ~/scratch/mRNA-runs/out_SVZ-IZ-2 -G $gtfile $bindx $svz2

tophat -p 8 -o ~/scratch/mRNA-runs/out_VZ-1 -G $gtfile $bindx $vz1
tophat -p 8 -o ~/scratch/mRNA-runs/out_VZ-2 -G $gtfile $bindx $vz2


#tophat -p 8 -o CP-1_out -G $gtfile --transcriptome-index=$bindx mm9 $cp1
#tophat -p 8 -o CP-2_out -G $gtfile --transcriptome-index=$bindx mm9 $cp2

#tophat -p 8 -o SVZ-IZ-1_out -G $gtfile --transcriptome-index=$bindx mm9 $svz1
#tophat -p 8 -o SVZ-IZ-2_out -G $gtfile --transcriptome-index=$bindx mm9 $svz2

#tophat -p 8 -o VZ-1_out -G $gtfile --transcriptome-index=$bindx mm9 $vz1
#tophat -p 8 -o VZ-2_out -G $gtfile --transcriptome-index=$bindx mm9 $vz2


#tophat -p 8 -o out_CP-1 -G $gtfile $bindx $cp1
#tophat -p 8 -o out_CP-2 -G $gtfile $bindx $cp2
#tophat -p 8 -o out_SVZ-IZ-1 -G $gtfile $bindx $svz1
#tophat -p 8 -o out_SVZ-IZ-2 -G $gtfile $bindx $svz2
#tophat -p 8 -o out_VZ-1 -G $gtfile $bindx $vz1
#tophat -p 8 -o out_VZ-2 -G $gtfile $bindx $vz2



