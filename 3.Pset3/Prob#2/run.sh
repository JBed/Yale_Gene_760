#PBS -q gerstein -W PARTITION:m610
#PBS -l nodes=1:ppn=8

#the data
cp1=
cp2=
svz1=
svz2=
vz1=
vz2=

# the gtf file 
gtfile="/home/rs785/gene760/DATA/PS3/Mus_musculus/UCSC/mm9/Annotation/Genes/genes.gtf"


# need to index first 
samtools index <data>


# now can run cuff diff

cuffdiff -o CP-VZ_diff -p 8 

$gtfile

out_CP-1/accepted_hits.bam, out_CP-2/accepted_hits.bam out_VZ-1/accepts.bam, out_VZ-2/accepted_hits.bam



# I think that, that is all
