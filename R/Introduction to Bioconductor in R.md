# 1 What is Bioconductor?

## 1.1 Introduction to the Bioconductor Project

* The Bioconductor Project

    * an open source repository for R packages, datasets and workflows that are specific for analyzing biological data.

    * a useful extension on CRAN, the R Archive

* What do we measure and why?

    * structure : elements, regions, size, order, relationships
    * function : expression, levels, regulation, phenotypes

* How to install Bioconductor packages?

    * Install the latest R (version 4.1.0) for mac from https://cran.r-project.org/bin/macosx/
    * Install the current release of Bioconductor (version 3.13) https://bioconductor.org/install/

```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.13")
```

* Bioconductor version and package version

```R
# check R version
> R.version
               _                           
platform       x86_64-apple-darwin17.0     
arch           x86_64                      
os             darwin17.0                  
system         x86_64, darwin17.0          
status                                     
major          4                           
minor          1.0                         
year           2021                        
month          05                          
day            18                          
svn rev        80317                       
language       R                           
version.string R version 4.1.0 (2021-05-18)
nickname       Camp Pontanezen             

# check Bioconductor version
> BiocManager::install()
Bioconductor version 3.13 (BiocManager 1.30.16), R 4.1.0
  (2021-05-18)
> BiocManager::version()
[1] ‘3.13’

# load a package
> library(BiocManager)
Bioconductor version 3.13 (BiocManager 1.30.16), R 4.1.0
  (2021-05-18)

# check the package version
> packageVersion("BiocManager")
[1] ‘1.30.16’

# check versions for reproducibility
> sessionInfo()
R version 4.1.0 (2021-05-18)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 10.16

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets 
[6] methods   base     

other attached packages:
[1] BiocManager_1.30.16

loaded via a namespace (and not attached):
[1] compiler_4.1.0     tools_4.1.0       
[3] BiocVersion_3.13.1
```

## 1.2 The Role of S4 in Bioconductor

* The two most used systems in R are S3 and S4

* S3

    * Positive
        * CRAN, simple but powerful
        * Flexible and interactive
        * Uses a generic function
        * Functionality depends on the first argument
        * Example: `plot()` and `methods(plot)`

    * Negative
        * Bad at validating types and naming conventions (do not dot?)


* S4





# 2 Biostrings and when to use them?

# 3 IRanges and GenomicRanges

# 4 Introducing ShortRead
