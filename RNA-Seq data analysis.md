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

# 2 FASTQ format for sequencing reads

* Run FastQC in an Interactively mode

    * Instrall the FastQC application on MacOSX
    * Open the FastQC and load FastQ files
    * View the QC results and save the report

* Run FastQC in a non-interactively mode (as part of a pipeline)

    * Instrall the FastQC by downloading the file
    * run FastQC in terminal
    * Generate automatically report file in the same folder
    
```
$ fastqc A.read1.fq
Approx 5% complete for A.read1.fq
Approx 10% complete for A.read1.fq
Approx 15% complete for A.read1.fq
Approx 20% complete for A.read1.fq
Approx 25% complete for A.read1.fq
Approx 30% complete for A.read1.fq
Approx 35% complete for A.read1.fq
Approx 40% complete for A.read1.fq
Approx 45% complete for A.read1.fq
Approx 50% complete for A.read1.fq
Approx 55% complete for A.read1.fq
Approx 60% complete for A.read1.fq
Approx 65% complete for A.read1.fq
Approx 70% complete for A.read1.fq
Approx 75% complete for A.read1.fq
Approx 80% complete for A.read1.fq
Approx 85% complete for A.read1.fq
Approx 90% complete for A.read1.fq
Approx 95% complete for A.read1.fq
Analysis complete for A.read1.fq
```

# 3 Trimming - Turn the raw fastQ file into a trimmed fastQ file containing only good quality data
































