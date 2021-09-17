HISAT, StringTie, and Ballgown
==============================

Nature Protocols article : Transcript-level expression analysis of RNA-seq experiments with HISAT, StringTie and Ballgown

# Align the RNA-seq reads to the genome

## 1. Map the reads for each sample to the reference genome with HISAT2

* Hisat2 is the next generation of spliced aligner from the same group that have developed TopHat. It is a fast and sensitive alignment program for mapping next-generation sequencing reads (both DNA and RNA) to a population of human genomes (as well as to a single reference genome). The indexing scheme is called a Hierarchical Graph FM index (HGFM).

### Install Hisat2

```
brew install hisat2
```

### Create Hisat2 indexes

```
hisat2-build -p 4 reference/GRCm39.genome.fa alignments/hisat2/GRCm39.genome.index
```

### Map the reads for each sample to the reference genome

```
hisat2 -p 4 --dta -x 04_Mapping/alignments/hisat2/Index/GRCm39.genome.index 03_Trimming/skewer/F.read1.fq-trimmed.fastq -S 04_Mapping/alignments/hisat2/F_skewer_hisat2.sam
```

## 2. Sort and convert the SAM files to BAM

```
samtools sort -@ 4 -o F_skewer_hisat2.bam F_skewer_hisat2.sam
```

## 3. Assemble and quantify expressed genes and transcripts

```
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/B_skewer_hisat2_vM27.gtf -l B 04_Mapping/alignments/hisat2/B_skewer_hisat2.bam
```

## 4. Merge transcripts from all samples

```
stringtie --merge -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf 04_Mapping/alignments/hisat2/stringtie/mergelist.txt
```

## 5. Examine how the transcripts compare with the reference annotation (optional)

```
gffcompare -r 04_Mapping/reference/gencode.vM27.annotation.gtf -G -o 04_Mapping/alignments/hisat2/merged 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf
```

## 6. Estimate transcript abundances and create table counts for Ballgown

```
stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/B/B_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/B_skewer_hisat2.bam
```

# Run the differential expression analysis

## 7. Load relevant R packages

```R
# load the packages
library(ballgown)
library(RSkittleBrewer)
library(genefilter)
library(dplyr)
library(devtools)

# change to the directory
setwd("~/Desktop/rnaseq/04_Mapping/alignments/hisat2")

# load the sample information
pheno_data <- read.csv("geuvadis_phenodata.csv")

# create a ballgown object













