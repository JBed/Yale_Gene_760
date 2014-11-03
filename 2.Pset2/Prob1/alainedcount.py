

file_data = open("/home2/jrb97/PS2/bowtie/K562_H3K27ac/K562_H3K27ac.sam")

counts = 0
for row in file_data:
	if row.strip().split()[0] ==



	clen = row.strip().split()
	if len(clen) != 0:
		if clen[0] != "#":
			counts=counts+1


print counts
