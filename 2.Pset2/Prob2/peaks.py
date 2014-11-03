

file_data = open("/home2/jrb97/PS2/macs14/K562_H3K27ac/K562_H3K27ac_peaks_peaks.xls")

counts = 0
for row in file_data:
	clen = row.strip().split()
	if len(clen) != 0:
		if clen[0] != "#":
			counts=counts+1


print counts
