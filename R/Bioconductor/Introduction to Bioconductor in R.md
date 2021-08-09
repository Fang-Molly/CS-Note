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

    * Install Bioconductor packages
    
```R
BiocManager::install("BSgenome")
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
        * Inheritance works, but depends on the input

* S4

    * positive
        * Formal definition of classes
        * Bioconductor reusability
        * Has validation of types
        * Naming conventions
            * Example: `mydescriptor <- new("GenomeDescription")`
            
    * Negative
        * Complex structure compared to S3

* Is it S4 or not?

* S4 class definition

    * name
    * slots (methods/fields)
    * contains (inheritance definition)

## 1.3 Introducing biology of genomic datasets

* Genome elements
    * Genetic information DNA alphabet
    * A set of chromosomes (hightly variable number)
    * Genes (carry heredity instructions)
        * coding and non-coding
    * Proteins (responsible for specific functions)
        * DNA-to-RNA (transcription)
        * RNA-to-protein (translation) 

* Yeast
    * A single cell microorganism
    * The fungus that people love
    * Used for fermentation : beer, bread, kefir, kombucha, bioremediation, etc.
    * Name: Saccharomyces cerevisiae or S. cerevisiae

* BSgenome annotation package

```R
# install BSgenome.Scerevisiae.UCSC.sacCer3
> if (!requireNamespace("BiocManager", quietly = TRUE))
+     install.packages("BiocManager")
> 
> BiocManager::install("BSgenome.Scerevisiae.UCSC.sacCer3")

# load the package and store data into yeast
> library(BSgenome.Scerevisiae.UCSC.sacCer3)
> yeast <- BSgenome.Scerevisiae.UCSC.sacCer3

# intrested in other genomes
> available.genome()

# using accessors
> length(yeast)
[1] 17
> names(yeast)
 [1] "chrI"    "chrII"   "chrIII"  "chrIV"   "chrV"    "chrVI"   "chrVII"  "chrVIII" "chrIX"  
[10] "chrX"    "chrXI"   "chrXII"  "chrXIII" "chrXIV"  "chrXV"   "chrXVI"  "chrM"   
> seqlengths(yeast)
   chrI   chrII  chrIII   chrIV    chrV   chrVI  chrVII chrVIII   chrIX    chrX   chrXI  chrXII 
 230218  813184  316620 1531933  576874  270161 1090940  562643  439888  745751  666816 1078177 
chrXIII  chrXIV   chrXV  chrXVI    chrM 
 924431  784333 1091291  948066   85779 
```

* Get sequences : S4 method for BSgenome

```R
> getSeq(yeast)
DNAStringSet object of length 17:
       width seq                                                             names               
 [1]  230218 CCACACCACACCCACACACCCACACACCAC...TGGGTGTGGTGTGGGTGTGGTGTGTGTGGG chrI
 [2]  813184 AAATAGCCCTCATGTACGTCTCCTCCAAGC...GGTGTGTGTGGGTGTGGTGTGTGGGTGTGT chrII
 [3]  316620 CCCACACACCACACCCACACCACACCCACA...TGTGTGGGTGTGGTGGGTGTGGTGTGTGTG chrIII
 [4] 1531933 ACACCACACCCACACCACACCCACACACAC...CATAAAATAAAGGTAGTAAGTAGCTTTTGG chrIV
 [5]  576874 CGTCTCCTCCAAGCCCTGTTGTCTCTTACC...GAACAGGGTTTCATTTTCATTTTTTTTTTT chrV
 ...     ... ...
[13]  924431 CCACACACACACCACACCCACACCACACCC...GTGTGGTGTGGGTGTGGTGTGTGTGTGGGG chrXIII
[14]  784333 CCGGCTTTCTGACCGAAATTAAAAAAAAAA...TGTGTGGGTGTGTGTGGGTGTGGTGTGGGT chrXIV
[15] 1091291 ACACCACACCCACACCACACCCACACCCAC...GATGTGAGAGAGTGTGTGGGTGTGGTGTGT chrXV
[16]  948066 AAATAGCCCTCATGTACGTCTCCTCCAAGC...TCATTTTTTTTTTTTAATTTCGGTCAGAAA chrXVI
[17]   85779 TTCATAATTAATTTTTTATATATATATTAT...AATATGCTTAATTATAATATAATATCCATA chrM

> yeast_M <- getSeq(yeast, "chrM")
> yeast_M
85779-letter DNAString object
seq: TTCATAATTAATTTTTTATATATATATTATATTATAATATTAATT...TATTATTATACAGAAATATGCTTAATTATAATATAATATCCATA

> getSeq(yeast, end = 10)
DNAStringSet object of length 17:
     width seq                                                               names               
 [1]    10 CCACACCACA                                                        chrI
 [2]    10 AAATAGCCCT                                                        chrII
 [3]    10 CCCACACACC                                                        chrIII
 [4]    10 ACACCACACC                                                        chrIV
 [5]    10 CGTCTCCTCC                                                        chrV
 ...   ... ...
[13]    10 CCACACACAC                                                        chrXIII
[14]    10 CCGGCTTTCT                                                        chrXIV
[15]    10 ACACCACACC                                                        chrXV
[16]    10 AAATAGCCCT                                                        chrXVI
[17]    10 TTCATAATTA                                                        chrM

> head(seqnames(yeast))
[1] "chrI"   "chrII"  "chrIII" "chrIV"  "chrV"   "chrVI" 

> tail(seqnames(yeast))
[1] "chrXII"  "chrXIII" "chrXIV"  "chrXV"   "chrXVI"  "chrM"  

> tail(seqlengths(yeast))
 chrXII chrXIII  chrXIV   chrXV  chrXVI    chrM 
1078177  924431  784333 1091291  948066   85779 

> print(yeast$chrM)
85779-letter DNAString object
seq: TTCATAATTAATTTTTTATATATATATTATATTATAATATTAATT...TATTATTATACAGAAATATGCTTAATTATAATATAATATCCATA

> nchar(yeast$chrM)
[1] 85779

> alphabet(yeast_M)
 [1] "A" "C" "G" "T" "M" "R" "W" "S" "Y" "K" "V" "H" "D" "B" "N" "-" "+" "."
> alphabetFrequency(yeast_M)
    A     C     G     T     M     R     W     S     Y     K     V     H     D     B     N     - 
36169  6863  7813 34934     0     0     0     0     0     0     0     0     0     0     0     0 
    +     . 
    0     0 
> alphabet(yeast_M, baseOnly = TRUE)
[1] "A" "C" "G" "T"

> class(yeast_M)
[1] "DNAString"
attr(,"package")
[1] "Biostrings"
> dna_seq <- subseq(unlist(yeast_M), end = 21)
> dna_seq
21-letter DNAString object
seq: TTCATAATTAATTTTTTATAT
```

# 2 Biostrings and when to use them?

## 2.1 Introduction to Biostrings

* Biological string containers

    * Memory efficient to store and manipulate sequence of characters
    * Containers that can be inherited
    * The BString class comes from big string

```R
library(Biostrings)
showClass("XString")
showClass("BString")
showClass("BStringSet")
```

* Biostring alphabets

```R
> DNA_BASES      # DNA 4 bases
[1] "A" "C" "G" "T"
> RNA_BASES      # RNA 4 bases
[1] "A" "C" "G" "U"
> AA_STANDARD    # 20 amino acids
 [1] "A" "R" "N" "D" "C" "Q" "E" "G" "H" "I" "L" "K" "M" "F" "P" "S" "T" "W" "Y" "V"
> DNA_ALPHABET
 [1] "A" "C" "G" "T" "M" "R" "W" "S" "Y" "K" "V" "H" "D" "B" "N" "-" "+" "."
> RNA_ALPHABET
 [1] "A" "C" "G" "U" "M" "R" "W" "S" "Y" "K" "V" "H" "D" "B" "N" "-" "+" "."
> AA_ALPHABET
 [1] "A" "R" "N" "D" "C" "Q" "E" "G" "H" "I" "L" "K" "M" "F" "P" "S" "T" "W" "Y" "V" "U" "O" "B"
[24] "J" "Z" "X" "*" "-" "+" "."
```

* Transcription DNA to RNA

```R
> dna_seq <- DNAString("ATGATCTCGTAA")
> dna_seq
12-letter DNAString object
seq: ATGATCTCGTAA
> rna_seq <- RNAString(dna_seq)
> rna_seq
12-letter RNAString object
seq: AUGAUCUCGUAA
> RNA_GENETIC_CODE
UUU UUC UUA UUG UCU UCC UCA UCG UAU UAC UAA UAG UGU UGC UGA UGG CUU CUC CUA CUG CCU CCC CCA CCG 
"F" "F" "L" "L" "S" "S" "S" "S" "Y" "Y" "*" "*" "C" "C" "*" "W" "L" "L" "L" "L" "P" "P" "P" "P" 
CAU CAC CAA CAG CGU CGC CGA CGG AUU AUC AUA AUG ACU ACC ACA ACG AAU AAC AAA AAG AGU AGC AGA AGG 
"H" "H" "Q" "Q" "R" "R" "R" "R" "I" "I" "I" "M" "T" "T" "T" "T" "N" "N" "K" "K" "S" "S" "R" "R" 
GUU GUC GUA GUG GCU GCC GCA GCG GAU GAC GAA GAG GGU GGC GGA GGG 
"V" "V" "V" "V" "A" "A" "A" "A" "D" "D" "E" "E" "G" "G" "G" "G" 
attr(,"alt_init_codons")
[1] "UUG" "CUG"
> aa_seq <- translate(rna_seq)
> aa_seq
4-letter AAString object
seq: MIS*
> translate(dna_seq)
4-letter AAString object
seq: MIS*
```

## 2.2 Sequence handling

* Single vs set

    * XString : store a single sequence
        * BString for any string
        * DNAString for DNA
        * RNAString for RNA
        * AAString for amino acids

    * XStringSet for many sequences
        * BStringSet
        * DNAStringSet
        * RNAStringSet
        * AAStringSet

* Create a stringSet and collate it

* Complement sequence

```R
> a_seq <- DNAString("ATGATCTCGTAA")
> a_seq
12-letter DNAString object
seq: ATGATCTCGTAA
> complement(a_seq)
12-letter DNAString object
seq: TACTAGAGCATT
> rev(a_seq)
12-letter DNAString object
seq: AATGCTCTAGTA
> reverse(a_seq)
12-letter DNAString object
seq: AATGCTCTAGTA
> reverseComplement(a_seq)
12-letter DNAString object
seq: TTACGAGATCAT
```



# 3 IRanges and GenomicRanges

## 3.1 IRanges and Genomic Structures

* Sequence Ranges

```R
> library(IRanges)
> myIRanges <- IRanges(start = 20, end = 30)
> myIRanges
IRanges object with 1 range and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]        20        30        11
```

```R
# width = end - start + 1
> (myIRanges_width <- IRanges(start = c(1, 20), width = c(30, 11)))
IRanges object with 2 ranges and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]         1        30        30
  [2]        20        30        11
  
> (myIRanges_end <- IRanges(start = c(1,20), end = 30))
IRanges object with 2 ranges and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]         1        30        30
  [2]        20        30        11
```

* Rle - run length encoding
    * compute and store the lengths and values of a vector or factor
    * general S4 container used to save long repetitive vectors efficiently

```R
> (some_numbers <- c(3,2,2,2,3,3,4,2))
[1] 3 2 2 2 3 3 4 2
> (Rle(some_numbers))
numeric-Rle of length 8 with 5 runs
  Lengths: 1 3 2 1 1
  Values : 3 2 3 4 2
```









# 4 Introducing ShortRead