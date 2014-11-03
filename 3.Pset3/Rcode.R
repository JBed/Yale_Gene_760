source("http://bioconductor.org/biocLite.R")

biocLite("cummeRbund")
library(cummeRbund)

cuff = readCufflinks()

myGeneIds<-c("CP","SVZ","VZ")

is.vector(myGeneIds)

myGenes<-getGenes(cuff,myGeneIds)

csHeatmap(myGenes,cluster='both')



csDendro(genes(cuff))


> dend.rep<-csDendro(genes(cuff),replicates=T)