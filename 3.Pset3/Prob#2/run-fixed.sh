#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=8


#the data files
cp1="/home2/jrb97/scratch/mRNA-runs/out_CP-1/accepted_hits.bam"
cp2="/home2/jrb97/scratch/mRNA-runs/out_CP-2/accepted_hits.bam"
svz1="/home2/jrb97/scratch/mRNA-runs/out_SVZ-IZ-1/accepted_hits.bam"
svz2="/home2/jrb97/scratch/mRNA-runs/out_SVZ-IZ-2/accepted_hits.bam"
vz1="/home2/jrb97/scratch/mRNA-runs/out_VZ-1/accepted_hits.bam"
vz2="/home2/jrb97/scratch/mRNA-runs/out_VZ-2/accepted_hits.bam"

#the out dirs
CPVZ="/home2/jrb97/scratch/mRNA-runs/CP-VZ"
CPSVZ="/home2/jrb97/scratch/mRNA-runs/CP-SVZ"
VZSVZ="/home2/jrb97/scratch/mRNA-runs/VZ-SVZ"
ALL="/home2/jrb97/scratch/mRNA-runs/CP-VZ-SVZ"

# the bowtie index files 
bindx="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Sequence/BowtieIndex/genome"

# the gtf file 
gtfile="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf"


cuffdiff -p 8 -o $ALL -L CP,VZ,SVZ-IZ $gtfile $cp1,$cp2 $vz1,$vz2 $svz1,$svz2

##cuffdiff -p 8 -o $CPVZ -L CP,VZ $gtfile $cp1,$cp2 $vz1,$vz2

cuffdiff -p 8 -o $CPSVZ -L CP,SVZ-IZ $gtfile $cp1,$cp2 $svz1,$svz2

cuffdiff -p 8 -o $VZSVZ -L VZ,SVZ-IZ $gtfile $vz1,$vz2 $svz1,$svz2

