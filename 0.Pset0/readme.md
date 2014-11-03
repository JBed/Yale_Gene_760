Gene 760 – Problem Set 0 
===

The purpose of this problem set is to familiarize students with Louise, UNIX, and Perl. By the end of this  problem set we hope students will have learnt the following skills: 
• Logging onto Louise from their computer 
• Use of simplequeue and qsub to work safely on Louise  • The use of basic UNIX commands 
• How to find and learn about new UNIX commands  
• Writing a basic Perl script 
• How to find and learn about new Perl commands  
 
To teach these skills we will be using genotyping data generated from an Illumina microarray. We will  use these methods to identify the sex of the sample. 
 
Students are to submit a tabIdelimited text file with the responses to the questions below and the perl  script used to answer the final step to ‘/home/rs785/gene760/DROPBOX/PS0’ by Tues, Jan 28. 
 
Prior$to$the$Discussion$Section:$
 
Please download a text editor (text wrangler), and file sharing program (cyberduck), and Rstudio, links  for which can all be found on the class wiki. Also, in order to work run command lines on LOUISE make  sure you have a mac with terminal (should come included) or have downloaded PuTTY to your PC, which  can be found on the class wiki as well. 
$
Introduction$to$Unix$
 
1) Log onto Louise using SSH 
ANS: Write the command and a description of what the command does   
2) Use the queuing system to log onto a node  ANS: Write the command and a description of what the command does 
 
3) Update your .bashrc by using emacs to copy the text from rs785’s .bashrc and paste it in to your own. 
Source your bash after you’ve done this.  ANS: Write out the emacs command and the keystrokes used to save the file/exit the editor  ANS: Explain what the .bashrc is and what it does  
 
4) Make symbolic links in your home directory to the “ANNOTATION”, “DATA”, “DROPBOX”, AND 
“REFERENCE” directories from the rs785 home directory. 
ANS:$What is the command to make a symbolic link and what is a symbolic link?     
5) In your home directory make a directory called ‘Problem_set_0’ and change directory into this  directory. Work out the absolute path of this directory. 
ANS: Write the commands and a description of what each command does   
6) Copy the file to your directory and then submit a job using simplequeue to unzip it:  ‘/home/ss64/gene760_2013/DATA/PS0/Test_FinalReport_1Mv3_hg18.txt.gz’  ANS: Write the commands and a description of what each command does 
ANS: Explain what simplequeue is and why it is useful   
7) Count the number of lines in the file; look at the first and last 50 lines of the unzipped file  ANS: Write the commands and a description of what each command does  ANS: State the number of lines and the name of SNP on the 50th line from the top and 50th line  from the bottom 
 
8) Make a file called ‘chrXY_Test_FinalReport_1Mv3_hg18.txt’; extract all the SNPs from chrX and chrY 
from Test_FinalReport_1Mv3_hg18.txt and put them into the file you made (hint ‘X’ and ‘Y’ only  appear in column 2) 
ANS: Write the commands and a description of what each command does  ANS: State the number of lines in the new file and the number of chrX, chrY and chrXY SNPs   
9) Download the file and open it in excel. Count the number of SNPs that are heterozygous on chrX  (only). 
ANS: State the number of heterozygous SNPs on chrX, the percentage of chrX that is heterozygous  and whether you think this sample is male or female 
 
10) Change the filename ‘chrXY_Test_FinalReport_1Mv3_hg18.txt’ to ‘chrXY_Perl_In_1.txt’; copy and  unzip the three files: 
‘/home/rs785/gene760/DATA/PS0/chrXY_Perl_In_2.txt.gz’  ‘/home/rs785/gene760/DATA/PS0/chrXY_Perl_In_3.txt.gz’  ‘/home/rs785/gene760/DATA/PS0/chrXY_Perl_In_4.txt.gz’ 
List the files in your current directory.  ANS: Write the commands and a description of what each command does  ANS: State the size of ‘chrXY_Perl_In_4.txt’ in bytes 
 
Introduction$to$Perl$
 
11) Write a perl script to determine the sex of the four files 
ANS: State the sex of samples 1, 2, 3, and 4 
   
Copy you answer file and the perl script you wrote to ‘/home/rs785/gene760/DROPBOX/PS0. The  perl script should be able to determine the sex of four files with the same name in a different directory.   
 
Brief$Introduction$to$R$
 
R is a useful software environment for statistical computing and graphics. You will be using it at various  points throughout the course. Here we will use it to do a simple significance test. 
  11) Use Fisher’s exact test (fisher.test in R) and your answers to determine if the number of heterozygous  & homozygous SNPs on the X chromosome is significantly different between males and females. 
ANS: Write your commands and a description of what each command does 
ANS: Copy the output from the Fisher’s exact test in R to your answer sheet & interpret.    
*Hint: make a 2x2 contingency table in R using the ‘matrix’ function:   
￼￼￼ 
￼￼￼Men 
￼￼￼Women 
￼￼￼￼￼Heterozygous SNPs 
￼￼￼￼￼￼ 
￼￼￼￼ 
￼￼￼￼￼￼￼Homozygous SNPs 
￼￼￼ 
￼￼￼ 
￼￼￼ 
