
## interspearseting program

file1 = open("/home2/jrb97/scratch/Clutter/gene760_2014/DROPBOX/PS2/ra364")

file2 = open ("/home2/jrb97/scratch/Clutter/gene760_2014/DROPBOX/PS2/ra364")

out = open("/home2/jrb97/PS2/out.txt")

data1 = []
for row in file1:
	data1.append(row)

data2 = []
for row in file2:
	date2.append(row)

for ii in range(len(data1)):
	if ii/2 == 1:
