import random


in_file = open("/home2/jrb97/scratch/jrb97_PS3/VZ_DAVID.txt")

out_file = open("/home2/jrb97/scratch/jrb97_PS3/VZ_test.txt", "w")

ii=0
for row in in_file:
	if ii!=0:
		clen = row.strip().split()
		clen[-1] = str(float(clen[-1])+random.uniform(0, 1.0))
		clen[-2] = str(float(clen[-2])+random.uniform(0, 1.0))
		clen[-3] = str(float(clen[-3])+random.uniform(0, 1.0))
		clen[-4] = str(float(clen[-4])+random.uniform(0, 1.0))
		out_file.write("\t".join(clen)+"\n")
	ii=ii+1




