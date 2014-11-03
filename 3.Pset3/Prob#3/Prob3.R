
# note: UP50_gene.txt and UP50_iso.txt were generated 
# using a pythong program that I wrote

UP50_gene = read.delim("UP50_gene.txt",header=T)
UP50_iso = read.delim("UP50_iso.txt",header=T)

boxplot(UP50_gene,main="Gene FPKM distribution",col="Steel blue",ylab="FPKM",xlab="Group")
boxplot(UP50_iso,main="Gene FPKM distribution",col="Steel blue",ylab="FPKM",xlab="Group")
