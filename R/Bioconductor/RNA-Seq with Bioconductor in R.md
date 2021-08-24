# 1 Introduction to RNA-Seq theory and workflow

## 1.1 Introduction to RNA-Seq

* RNA-Seq Packages

    * `DESeq2`
    * `RColorBrewer`
    * `pheatmap`
    * `tidyverse`

## 1.2 RNA-Seq Workflow

* RNA-Seq Workflow

    * Biological samples/Library preparation
    * Sequence reads : FASTQ files
    * Quality control
    * Splice-aware mapping to genome
    * Counting reads associated with genes
    * Statistical analysis to identify differentially expressed genes

* raw count matrix

    * head() : show the first six observations of file
    * str() : show the structure of file

## 1.3 Differential gene expression overview

* RNA-Seq count distribution

* raw counts
    * Count matrix : ```wt_rawcounts <- read.csv("rawcounts.csv")```

* metadata

# 2 Exploratory data analysis

## 2.1 Introduction to differential expression analysis

* DESeq2 vignette

* analysis flow
    * Read counts associated with genes
    * Quality control
        * Normalization
        * Unsupervised clustering analyses
    * DE analysis
        * Modelling raw counts for each gene
        * Shrinking log2 fold changes
        * Testing for differential expression

* Bringing in data for DESeq2 : `read.csv("csv file")`

```R
wt_rawcounts <- read.csv("wt_rawcounts.csv")
View(wt_rawcounts)
```

## 2.2 Organizing the data for DESeq2

* DESeq2 requires the sample names in the metadata and counts datasets to be in the same order.
* 



## 2.3 Count normalization




## 2.4 Hierarchical heatmap




## 2.5 Principal component analysis 






















