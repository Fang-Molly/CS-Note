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

* Statistical packages in Bioconductor
    * DESeq2 vignette : negative binomial model
    * EdgeR : negative binomial model
    * Limma-Voom

* Differential expression analysis : DESeq2 vignette

    * Open the DESeq2 : `vignette(DESeq2)`

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
# read in raw counts
wt_rawcounts <- read.csv("wt_rawcounts.csv")
View(wt_rawcounts)
```
```R
# Read in metadata
wt_metadata <- read.csv("wt_rawcounts.csv")
View(wt_metadata)
```

## 2.2 Organizing the data for DESeq2

* Bringing in data for DESeq2 : sample order

    * DESeq2 requires the sample names in the metadata and counts datasets to be in the same order. `rownames(wt_metabada) == colnames(wt_rawcounts)`

* Matching order between vectors

    * Using the `match()` function: `match(vector1, vector2)`
        * vector1 : vector of values with the desired order
        * vector2 : vector of values to reorder
        * output : the indices for how to rearrange vector2 to be in the same order as vector1

    * `match(colnames(wt_rawcounts), rownames(wt_metadata)`

* Reordering using `match()` output

```R
idx <- match(colnames(wt_rawcounts), rownames(wt_metadata))
reordered_wt_metadata <- wt_metadata[idx, ]
View(reordered_wt_metadata)
```

* Creating the DESeq2 object

```R
# Create DESeq object
dds_wt <- DESeqDataSetFromMatrix(countData = wt_rawcounts, colData = reordered_wt_metadata, design = ~ condition)
```





## 2.3 Count normalization




## 2.4 Hierarchical heatmap




## 2.5 Principal component analysis 






















