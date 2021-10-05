Differential expression analysis
================================

1. Change to the directory that contains all the StringTie results

```R
setwd("~/Desktop/rnaseq/04_Mapping/alignments/hisat2")
```

2. Load relevant R packages.

```R
library(ballgown)  # for performing the analyses
library(RSkittleBrewer)  # for setting up colors
library(genefilter)  # for fast calculation of means and variances
library(dplyr)  # for sorting and arranging results
library(devtools)  # for reproducibility and installing packages
```

3. Load the phenotype data for the samples. Create the phenotype file "geuvadis_phenodata.csv"

```
"sample","phenotype","treatment"
"tspo_A","wild","none"
"tspo_B","wild","yes"
"tspo_C","KO","none"
"tspo_D","KO","yes"
"tspo_E","wild","none"
"tspo_F","wild","yes"
"tspo_G","KO","none"
"tspo_H","KO","yes"
"tspo_K","wild","none"
"tspo_M","wild","yes"
"tspo_X","KO","none"
"tspo_Z","KO","yes"
```

```R
pheno_data <- read.csv("geuvadis_phenodata.csv")
```

4. Read the expression data that were calcultaed by StringTie.

```R
bg_tspo <- ballgown(dataDir = "ballgown", samplePattern = "tspo_", pData = pheno_data)
```

5. Filter to remove low-abundance genes. Remove all transcripts with a variance across samples less than one

```R
bg_tspo_filt <- subset(bg_tspo, "rowVars(texpr(bg_tspo)) > 1", genomesubset = TRUE)
```

6. Identify transcripts that show statistically significant differences between groups.

```R
results_transcripts_phenotype <- stattest(bg_tspo_filt, feature = "transcript", covariate = "phenotype", adjustvars = c("treatment"), getFC = TRUE, meas = "FPKM")
```

7. Identify genes that show statistically significant differences between groups

```R
results_genes_phenotype <- stattest(bg_tspo_filt, feature = "gene", covariate = "phenotype", adjustvars = c("treatment"), getFC = TRUE, meas = "FPKM")
```

8. Add gene names and gene IDs to the results_transcripts_phenotype data frame

```R
results_transcripts_phenotype <- data.frame(geneNames = ballgown::geneNames(bg_tspo_filt), geneIDs = ballgown::geneIDs(bg_tspo_filt), results_transcripts_phenotype)
```

9. Sort the results from the smallest P value to the largest.

```R
results_transcripts_phenotype = arrange(results_transcripts_phenotype, pval)
results_genes_phenotype = arrange(results_genes_phenotype, pval)
```

10. Write the results to a csv file that can be shared and distributed

```R
> write.csv(results_transcripts_phenotype, "tspo_transcript_phenotype.csv", row.names = FALSE)
> write.csv(results_genes_phenotype, "tspo_gene_phenotype_results.csv", row.names = FALSE)
```

11. Identify transcripts and genes with a q value < 0.05

```R
> results_genes_phenotype_qval0.05 <- subset(results_genes_phenotype, results_genes_phenotype$qval < 0.05)
> results_transcripts_phenotype_qval0.05 <- subset(results_transcripts_phenotype, results_transcripts_phenotype$qval < 0.05)
> write.csv(results_transcripts_phenotype_qval0.05, "tspo_transcript_phenotype_qval0.05.csv", row.names = FALSE)
> write.csv(results_genes_phenotype_qval0.05, "tspo_gene_phenotype_qval0.05.csv", row.names = FALSE)
```

12. Make the plots pretty. 


14. 


* To perform statistical analysis to try and discover **changes in expression levels of defined features (genes, transcripts, exons)** between experimental groups with **replicated samples**.

# Popular tools

* Most of the popular tools for differential expression analysis are available as R / Bioconductor packages.

* Bioconductor is an R project and repository that provides a set of packages and methods for omics data analysis.

* The best performing tools for differential expression analysis tend to be:

    * DESeq2
    * edgeR
    * limma (voom)

# DESeq2

* DESeq2 is an R/Bioconductor implemented method to detect differentially expressed features. It uses the negative binomial generalized linear models.
* DESeq2 (as edgeR) is based on the hypothesis that most genes are not differentially expressed.

## DESeq2 steps:
* Modeling raw counts for each gene:
    * Estimate size factors (accounts for differences in library size).
    * Estimate dispersions.
    * GLM (Generalized Linear Model) fit for each gene.
* Testing for differential expression (Wald test).

## Raw count matrices

* Prepare data from STAR













