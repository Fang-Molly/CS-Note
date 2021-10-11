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
wt_metadata <- read.csv("wt_metadata.csv")
View(wt_metadata)
```

## 2.2 Organizing the data for DESeq2

* Bringing in data for DESeq2 : sample order

    * DESeq2 requires the sample names in the metadata and counts datasets to be in the same order.  `rownames(wt_metabada) == colnames(wt_rawcounts)`

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
# Create DESeq object using the DESeqDataSetFromMatrix() function
dds_wt <- DESeqDataSetFromMatrix(countData = wt_rawcounts, colData = reordered_wt_metadata, design = ~ condition)
```

## 2.3 Count normalization

* normalize the raw counts to assess sample-level quality control metrics by removing the influence of these factors on the overal counts.

* The factors influence the number of reads aligning to each gene

    * **RNA expression**
    * library depth/size
    * gene length
    * RNA composition

* `estimateSizeFactor()` function : to calculate the normalized counts

* `sizeFactor()` function : to view the size factor used for normalization

* `counts()` function : to extract the normalized counts
    * with the `normalized = TRUE` argument : extract the normalized counts
    * with the `normalized = FALSE` argument : extract the raw counts

```R
dds_smoc2 <- estimateSizeFactors(dds_moc2)
smoc2_normalized_counts <- counts(dds_smoc2, normalized = TRUE)
```

## 2.4 Hierarchical heatmap

* visualiztion methods for unsupervised clustering analyses
    * hierarchical clustering heatmaps
    * principal component analysis (PCA)

* log transformation : variance stabilizing transformation (VST)

```R
vsd_wt <- vst(dds_wt, blind=TRUE)
```

* Hierarchical clustering with correlation heatmaps

```R
# extract the vst matrix from the object
vsd_mat_wt <- assay(vsd_wt)

# compute pairwise correlation values
vsd_cor_wt <- cor(vsd_mat_wt)
View(vsd_cor_wt)

# load pheatmap libraries
library(pheatmap)

# plot heatmap
pheatmap(vsd_cor_wt, annotation = select(wt_metadata, condition))
```

## 2.5 Principal component analysis (PCA)

* emphasize the variation present in a dataset

```R
# plot PCA
plotPCA(vsd_wt, intgroup="condition")
``` 

# 3 Differential expression analysis with DESeq2

## 3.1 DE analysis

* The differential expression analysis with DESeq2 consists of roughly three steps:

    * fitting the raw counts for each gene to the DESeq2 negative binomial model and testing for differential expression
    * shrinking the log2 fold changes
    * extracting and visualizing the results

* DESeq2 workflow : Model

```R
# Create DESeq object
dds_wt <- DESeqDataSetFromMatrix(countData = wt_rawcounts, colData = reordered_wt_metadata, design = ~ condition)
```

* DESeq2 workflow : Design formula

```R
~ strain + sex + treatment + sex : treatment
```

* DESeq2 workflow : Running

```R
# run analysis
dds_wt <- DESeq(dds_wt)
```

## 3.2 DESeq2 model -dispersion

* DESeq2 model - mean-variance relationship

```R
# syntax for apply()
apply(data, rows/columns, function_to_apply)

# calculating mean for each gene (each row)
mean_counts <- apply(wt_rawcounts[, 1:3], 1, mean)

# calculating variance for each gene (each row)
variance_counts <- apply(wt_rawcounts[, 1:3], 1, var)

# creating data frame with mean and variance for every gene
df <- data.frame(mean_counts, variance_counts)

ggplot(df) + 
        geom_point(aes(x=mean_counts, y=variance_counts)) +
        scale_y_log10() +
        scale_x_log10() +
        xlab("Mean counts per gene") +
        ylab("Variance per gene")
```

* Dispersion formula : Var = u + a * u2
    * Var: variance
    * u : mean
    * a : dispersion
    * Variance + => dispersion +  ; mean + => dispersion -

```R
# plot dispersion estimates
plotDispEsts(dds_wt)
```

## 3.3 DESeq2 model -contrasts

```R
results(wt_dds, alpha = 0.05)
```

```R
results(dds, contrast = c("condition_factor", "level_to_compare", "base_level"), alpha = 0.05)
```

```R
wt_res <- results(dds_wt, contrast = c("condition", "fibrosis", "normal"), alpha = 0.05)
# DESeq2 LFC shrinkage
plotMA(wt_res, ylim=c(-8,8))
```

## 3.4 DESeq2 results

* get descriptions for the columns in the results table

```R
mcols(wt_res)
head(wt_res, n=10)
```

* Significant DE genes - summary

```
summary(wt_res)
```

* Significant DE genes - fold-change threshold

```
wt_res <- results(dds_wt, contrast = c("condition", "fibrosis", "normal"), alpha = 0.05, lfcThreshold = 0.32)

wt_res <- lfcShrink(dds_wt, contrast = c("condition", "fibrosis", "normal"), res = wt_res)
```

* results - annotate

```R
library(annotables)
grcm38
```

* results - extract

```
wt_res_all <- data.frame(wt_res) %>%
              rownames_to_column(var = "ensgene") %>%
              left_join(x = wt_res_all,
                        y = grcm38[, c("ensgene", "symbol", "description")],
                        by = "ensgene")
view(wt_res_all)
```

* Significant DE genes - arrange

```
wt_res_sig <- subset(wt_res_all, padj < 0.05)
wt_res_sig <- wt_res_sig %>%
        arrange(padj)
View(wt_res_all)
```

# 4 Exploration of differential expression results

## 4.1 Visualization of results

* Visualizing results -Expression heatmap

```R
# Subset normalized counts to significant genes
sig_norm_counts_wt <- normalized_counts_wt[wt_res_si$ensgene, ]
# choose a color palette from RColorBrewer
library(RColorBrewer)
heat_colors <- brewer.pal(6, "YlOrRd")
display.brewer.all()
# Run pheatmap
pheatmap(sig_norm_counts_wt, color = heat_colors, cluster_rows = T, show_rownames = F, annotation = select(wt_metadata, condition), scale = "row")
```

* Visualizing results - Volcano plot

```R
# Obtain logical vector regarding whether padj values are less than 0.05
wt_res_all <- wt_res_all %>%
              rownames_to_column(var = "ensgene") %>%
              mutate(threshold = padj < 0.05)
# Volcano plot
ggplot(wt_res_all) +
        geom_point(aes(x = log2FoldChange, y = -log10(padj), color = threshold)) +
        xlab("log2 fold change") +
        ylab("log10 adjusted p-value") +
        theme(legend.position = "none", 
              plot.title = element_text(size = rel(1.5), hjust = 0.5),
              axis.title = element_text(size = rel(1.25)))
```

* Visualizing results - Expression plot

    * Significant results:

    * Normalized counts for significant genes

```R
top_20 <- data.frame(sig_norm_counts_wt)[1:20, ] %>%
        rownames_to_column(var = "ensgene")
top_20 <- gather(top_20, key = "samplename", value = "normalized_counts", 2:8)
top_20 <- inner_join(top_20, rownames_to_column(wt_metadata, var = "samplename"), by = "samplename")
ggplot(top_20) +
        geom_point(aes(x = ensgene, y = normalized_counts, color = condition)) +
        scale_y_log10() +
        xlab("Genes") +
        ylab("Normalized Counts") +
        ggtitle("Top 20 Significant DE Genes") +
        theme_bw() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
        theme(plot.title = element_text(hjust = 0.5))
```

## 4.2 RNA-Seq next steps

* Vignette : http://bioconductor.org/packages/devel/vignettes/DESeq2/inst/doc/DESeq2.html

* Bioconductor support site: https://support.bioconductor.org (tag'DESeq2')


















