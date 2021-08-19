Differential expression analysis
================================

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












