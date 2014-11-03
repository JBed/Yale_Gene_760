#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=8
###PBS -m abe -M jason.bedford@yale.edu

#tophat program 
tophat="/home/rs785/gene760/TOOLS/bowtie-0.12.7/bowtie"

#the data files
cp1="/home2/ra364/DATA/PS3/CP-1.fastq"
cp2="/home2/ra364/DATA/PS3/CP-2.fastq"

svz1="/home2/ra364/DATA/PS3/SVZ-IZ-1.fastq" 
svz2="/home2/ra364/DATA/PS3/SVZ-IZ-2.fastq"

vz1="/home2/ra364/DATA/PS3/VZ-1.fastq"
vz2="/home2/ra364/DATA/PS3/VZ-2.fastq"


# GTF file for tophat
GTFfile="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes"


# the bowtie index files 
bindx="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Sequence/BowtieIndex/genome"


$tophat -p 8 $bindx $cp1




