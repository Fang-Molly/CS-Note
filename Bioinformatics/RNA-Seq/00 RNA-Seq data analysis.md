RNA-Seq data analyis
====================

# 1 Introduction : What is RNA-Seq?

## 1.1 RNA-Seq is used to analyze RNA by revealing

* RNA/gene/transcript expression;
* alternatively spliced transcripts;
* gene fusion and SNPs;
* post-translational modification.

## 1.2 RNA-Seq can be performed using:

* total RNA (in this case the content of ribosomal RNA is about 80%);
* rRNA depleted RNA (after removing ribosomal RNA);
* mRNA transcripts (by performing polyA enrichment of RNA);
* small RNA, such as miRNA, tRNA (by selecting the size of RNA molecules; e.g., < 100 nt);
* RNA molecules transcribed at a specific time (ribosomal profiling);
* specific RNA molecules (via hybridization with probes complementary to desired transcripts).

## 1.3 RNA-Seq can produce:

* single-end short reads (50-450 nt), which are useful for gene expression quantification (mainly Illumina, but also Ion Torrent and BGISEQ);
* paired-end reads (2 x 50-250 nt), which are useful for detecting splicing events and refinement of transcriptome annotation;
* single long reads (PACBio or Nanopore), which are used for the de novo identification of new transcripts and improving transcriptome assembly.

## 1.4 mRNA-Seq data analysis workflow

![avatar](https://biocorecrg.github.io/RNAseq_course_2019/images/RNAseq_workflow.png)



# 2 SRA-tools

* Install SRA-tools

```
$ wget  https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.11.0/sratoolkit.2.11.0-mac64.tar.gz
$ tar -vxzf *.gz
$ export PATH=$PATH:$PWD/sratoolkit.2.11.0-mac64/bin
$ which fastq-dump
/Users/fangliu/applications/sratoolkit.2.11.0-mac64/bin/fastq-dump
# Proceed to the Quick Configuration Guide
```

* fastq-dump : a program to download data from SRA database (installation is needed)
    * -split-files
    * –origfmt
    * –skip-technical : downloads only biological reads

`fastq-dump --gzip --origfmt --split-files --skip-technical SRR-IDENTIFIER`

```
$ fastq-dump --gzip --split-files SRR6466185
Read 32345 spots for SRR6466185
Written 32345 spots for SRR6466185
$ ls -lh SRR*
-rw-r--r--  1 FangLiu  staff   6.3M Aug 11 23:48 SRR6466185_1.fastq.gz
-rw-r--r--  1 FangLiu  staff   7.4M Aug 11 23:48 SRR6466185_2.fastq.gz
```

# 3 Data Format

## 3.1 Fasta format

## 3.2 Bed format and regular expressions

* The BED format is a "tab" separated text file.

## 3.3 Tabular files

* A tabular file (or tab separated text) is a table which columns are separated by the character \t.
* An easy way to obtain this format is to export a spreadsheet (like the excel file) in TSV.

## 3.4 GTF files

* The General Transfer Format (GTF) format contains annotation of features and consists of one line per feature, each containing 9 columns of data.


# 4 Space in volumes and permissions

## Volume sizes and disk space

* Check the size of a file : `ls -lh` (list, human readable)
* Get a summary of the disk usage size of a directory : `du -sh` (disk usage, summarize, human readable format)
* Display disk usage of all the files and directories : `du -ah` (all)
* Show the system disk space statistics : `df -h` (disk filesystem, human readable)

## Permissions

* Create a small file

`echo "my file" > test.txt`

* `chmod` : controls the changes of permissions

# 5 Variables and "For" loops

## Variables

* A variable can contain a number, a character or a string of character.

* Create a variable:

```
# Assign the string "hola" to the variable "myfirstvariable":
myfirstvariable=hola
```
* Variable names can be written in:
    * uppercase
    * lowercase
    * a mixture of both
  
* Access the content of a variable with $
* Show the content of a variable with echo

```
# Show the content of the variable
echo $myfirstvariable
```

* Store a directory path in a variable and list what is inside that directory:

```
# shortcut to a directory path
pathtodir=~/my_beautiful_folder

# list what is in that directory
ls $pathtodir
```

* Use curly brackets if there are ambiguities:
    * = } isolate the variable name

```
# create a variable
$ mynumber=1
# bash is looking for a variable called "number_one"
$ echo $mynumber_one
# ${number} is corrected interpreted
$ echo ${mynumber}_one
1_one
```

* Calculations on variables:
    * `bc` : basic calculator

```
$ num=2
$ echo $((num + 1))
3
$ echo $(echo $num+1 | bc)
3
$ echo `echo $num+1 | bc`
3
$ echo `echo $num/3 | bc`
0
$ echo "scale=4; $((num))/3" | bc
.6666
```

* Built-in variables

| Variable  | Returns                                                    |
|:---------:|:-----------:                                               |
| $USER     | the user name                                              |
| $HOME     | the path of the home directory                             |
| $HOSTNAME | the hostname of the machine you are currently connected to |
| $RANDOM   | a different random number each time it is accessed         |


## "for" loops

* For loops are used to repeat certain tasks or blocks of code.

# 6 RNA-Seq data repositories

* The major repositories for gene expression data:

    * GEO
    * Array-express
    * ENCODE

* These repositories are linked to the repositories of NGS raw data (Fastq files):

    * SRA (Sequence Read Archive)
    * ENA (European Nucleotide Archive)
    * DDBJ-DRA
































