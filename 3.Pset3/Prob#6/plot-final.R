
library(cummeRbund)

setwd("/home2/jrb97/scratch/mRNA-runs/CP-VZ-SVZ")


cuff<-readCufflinks(rebuild=T)

gene.diff<-diffData(genes(cuff))
mySigGeneIds<-getSig(cuff,alpha=0.05)
myGenes<-getGenes(cuff,mySigGeneIds)

h.rep<-csHeatmap(myGenes)

plot(h.rep)


dend<-csDendro(genes(cuff))

png("heatmap.rplot")
h.rep
dev.off()

png("dendrogram.rplot")
plot(dend)
dev.off()


