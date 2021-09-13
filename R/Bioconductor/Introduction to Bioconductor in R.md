# 1 What is Bioconductor?

## 1.1 Introduction to the Bioconductor Project

* The Bioconductor Project

    * an open source repository for R packages, datasets and workflows that are specific for analyzing biological data.

    * a useful extension on CRAN, the R Archive

* What do we measure and why?

    * structure : elements, regions, size, order, relationships
    * function : expression, levels, regulation, phenotypes

* Install R

    * Install the latest R (version 4.1.0) for mac from https://cran.r-project.org/bin/macosx/
    
* Install Bioconductor

```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.13")
```

* Install Bioconductor packages

    * Install core packages
    
```R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install()
```
    
    * Install specific packages
    
```R
BiocManager::install("BSgenome")
```

    * Find Bioconductor packages
    
```R
BiocManager::available()
```
    
    * Update Installed Bioconductor Packages
    
```R
BiocManager::install()
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

# check installed packages
installed.packages()

# update all available packages
update.packages()

# list all packages where an update is available
old.packages()

# update only a specific package
install.packages("plotly")
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

```R
# load a package 
> library(GenomeInfoDb)
# create a new object from a class
> mydescriptor <- new("GenomeDescription")
# ask if an object is S4
> isS4(mydescriptor)
[1] TRUE
# S4 start with 'Formal class'
> str(mydescriptor)
Formal class 'GenomeDescription' [package "GenomeInfoDb"] with 7 slots
...

* S4 class definition

An S4 class describes a representation of an object with:

    * name
    * slots (methods/fields)
    * contains (inheritance definition)

```R
> MyEpicProject <- setClass(# Define class name with UpperCamelCase
                            "MyEpicProject", 
                            # Define slots, helpful for validation
                            slots = c(ini = "Date", 
                                      end = "Date", 
                                      milestone = "character"), 
                            # Define inheritance
                            contains = "MyProject")
```

* S4 accessors : Basic information of an S4 object is accessed through accessor-functions, also called methods.

    * Function `.S4methods()` show a summary of its accessors

```R
> .S4methods(class = "GenomeDescription")
 [1] bsgenomeName    commonName      organism        provider       
 [5] providerVersion releaseDate     releaseName     seqinfo        
 [9] seqnames        show      
```

    * `showMethods()` function for the other subclasses
```R
> showMethods(class = "GenomeDescription", where = search())
Function: bsgenomeName (package GenomeInfoDb)
x="GenomeDescription"

Function: commonName (package GenomeInfoDb)
object="GenomeDescription"
...
```

    * Show object summary : `show()`

```R
> show(mydescriptor)
| organism:  ()
| genome: 
| provider: 
| release date: 
| ---
| seqlengths:
|  
|  
```
```
> showClass("BSgenome")
Class "BSgenome" [package "BSgenome"]

Slots:
                                                
Name:               pkgname     single_sequences
Class:            character OnDiskNamedSequences
                                                
Name:    multiple_sequences              seqinfo
Class:        RdaCollection              Seqinfo
                                                
Name:         user_seqnames   injectSNPs_handler
Class:            character    InjectSNPsHandler
                                                
Name:           .seqs_cache         .link_counts
Class:          environment          environment
                           
Name:              metadata
Class:                 list

Extends: "Annotated"   # parent classes

Known Subclasses: "MaskedBSgenome"  
```

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

# Select chromosome sequence by name, one or many
> getSeq(yeast, "chrM")
85779-letter DNAString object
seq: TTCATAATTAATTTTTTATATATATATTATATTATAATATTAATT...TATTATTATACAGAAATATGCTTAATTATAATATAATATCCATA

# Select start, end and or width
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

> getSeq(yeast, "chrM", end = 10)
10-letter DNAString object
seq: TTCATAATTA

> head(yeast$chrM)
6-letter DNAString object
seq: TTCATA

> tail(yeast$chrI)
6-letter DNAString object
seq: TGTGGG 

> names(yeast)
 [1] "chrI"    "chrII"   "chrIII"  "chrIV"   "chrV"    "chrVI"   "chrVII" 
 [8] "chrVIII" "chrIX"   "chrX"    "chrXI"   "chrXII"  "chrXIII" "chrXIV" 
[15] "chrXV"   "chrXVI"  "chrM"  

> head(seqnames(yeast))
[1] "chrI"   "chrII"  "chrIII" "chrIV"  "chrV"   "chrVI" 

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

```R
# show the letters included in the sequence
alphabet(zikaVirus)
# show the counts per letter
alphabetFrequency(zikaVirus)
alphabet(zikaVirus, baseOnly = TRUE)
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

    * XStringSet : for many sequences
        * BStringSet
        * DNAStringSet
        * RNAStringSet
        * AAStringSet

* Create a stringSet and collate it

```R
zikaVirus <- readDNAStringSet("data/zika.fa")
length(zikaVirus)
width(zikaVirus)

1
10794

# collate the sequence use unlist
zikaVirus_seq <- unlist(zikaVirus)
length(zikaVirus_seq)

10794
```

* From a single sequence to a set

```R
zikaSet <- DNAStringSet(zikaVirus_seq, start = c(1, 101, 201), end = c(100, 200, 300))
zikaSet
```

* Complement sequence

```R
> a_seq <- DNAString("ATGATCTCGTAA")
> a_seq
12-letter DNAString object
seq: ATGATCTCGTAA
> complement(a_seq)
12-letter DNAString object
seq: TACTAGAGCATT
```

* Rev a sequence : changed the sequence order, from top to bottom. 

```R
> rev(a_seq)
12-letter DNAString object
seq: AATGCTCTAGTA
```

* Reverse a sequence :  reverses from right to left each sequence of the set

```R
> reverse(a_seq)
12-letter DNAString object
seq: AATGCTCTAGTA
```

* Reverse complement

```R
> reverseComplement(a_seq)
12-letter DNAString object
seq: TTACGAGATCAT
```

## 2.3 Why are you interested in patterns?

* What can we find with patterns?

    * Gene start
    * Protein end
    * Regions that enhance or silence gene expression
    * Conserved regions between organisms
    * Genetic Varition

* Patten matching

    * `matchpattern(pattern, subject)` : 1 string to 1 string

    * `vmatchPattern(pattern, subject)` 
        * 1 set of strings to 1 string
        * 1 string to a set of strings

* Palindromes : sequences that read the same backwards as forwards

    * `findPalindromes()` : find palindromic regions in a single sequence


# 3 IRanges and GenomicRanges

## 3.1 IRanges and Genomic Structures

* **Sequence Ranges**

```R
# loading IRanges
> library(IRanges)
# create a range using the IRanges() function and define it by start and end
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

* **Rle - run length encoding** : construct IRanges

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

* **IRanges with logical vector**

```R
# create a range with logical vector
> IRanges(start = c(FALSE, FALSE, TRUE, TRUE))
IRanges object with 1 range and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]         3         4         2
```

* **IRanges with logical Rle**

```R
> gi <- c(TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE)
> myRle <- Rle(gi)
> myRle
logical-Rle of length 7 with 3 runs
  Lengths:     2     2     3
  Values :  TRUE FALSE  TRUE
  
> IRanges(start = myRle)
IRanges object with 2 ranges and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]         1         2         2
  [2]         5         7         3
```

## 3.2 Gene of interest using Genomic Ranges

* Examples of genomic intervals

    * Reads aligned to a reference
    * Genes of interest
    * Exonic regions
    * Single nucleotide polymorphisms(SNPs)
    * Regions of transcription or binding sites, RNA-seq or ChIP-seq

* **Genomic Ranges**

    * GRanges class is a container to save genomic intervals by chromosome
 
```R
# install the package GenomicRanges
if (!require("BiocManager"))
    install.packages("BiocManager")
BiocManager::install("GenomicRanges")
# load the package
> library(GenomicRanges)

> (myGR <- GRanges("chr1:200-300"))
GRanges object with 1 range and 0 metadata columns:
      seqnames    ranges strand
         <Rle> <IRanges>  <Rle>
  [1]     chr1   200-300      *
  -------
  seqinfo: 1 sequence from an unspecified genome; no seqlengths
```

* **Genomic Ranges accessors**

```R
# check available accessors
methods(class = "GRanges")
# used for chromosome names
seqnames(gr)
# returns an IRanges object for ranges
ranges(gr)
# stores metadata columns
mcols(gr)
# generic function to store sequence information
seqinfo(gr)
# stores the genome name
genome(gr)
```

    * Accessors are both setter and getter functions
    * Accessors can be inherited thanks to S4 definitions
    
```R
> gr <- GRanges(
+     seqnames = Rle(c("chr1", "chr2", "chr1", "chr3"), c(1, 3, 2, 4)),
+     ranges = IRanges(101:110, end = 111:120, names = head(letters, 10)),
+     strand = Rle(strand(c("-", "+", "*", "+", "-")), c(1, 2, 2, 3, 2)),
+     score = 1:10,
+     GC = seq(1, 0, length=10))
> gr
GRanges object with 10 ranges and 2 metadata columns:
    seqnames    ranges strand |     score        GC
       <Rle> <IRanges>  <Rle> | <integer> <numeric>
  a     chr1   101-111      - |         1  1.000000
  b     chr2   102-112      + |         2  0.888889
  c     chr2   103-113      + |         3  0.777778
  d     chr2   104-114      * |         4  0.666667
  e     chr1   105-115      * |         5  0.555556
  f     chr1   106-116      + |         6  0.444444
  g     chr3   107-117      + |         7  0.333333
  h     chr3   108-118      + |         8  0.222222
  i     chr3   109-119      - |         9  0.111111
  j     chr3   110-120      - |        10  0.000000
  -------
  seqinfo: 3 sequences from an unspecified genome; no seqlengths
>
> seqnames(gr)
factor-Rle of length 10 with 4 runs
  Lengths:    1    3    2    4
  Values : chr1 chr2 chr1 chr3
Levels(3): chr1 chr2 chr3
> 
> ranges(gr)
IRanges object with 10 ranges and 0 metadata columns:
        start       end     width
    <integer> <integer> <integer>
  a       101       111        11
  b       102       112        11
  c       103       113        11
  d       104       114        11
  e       105       115        11
  f       106       116        11
  g       107       117        11
  h       108       118        11
  i       109       119        11
  j       110       120        11
> 
> strand(gr)
factor-Rle of length 10 with 5 runs
  Lengths: 1 2 2 3 2
  Values : - + * + -
Levels(3): + - *
> 
> granges(gr)
GRanges object with 10 ranges and 0 metadata columns:
    seqnames    ranges strand
       <Rle> <IRanges>  <Rle>
  a     chr1   101-111      -
  b     chr2   102-112      +
  c     chr2   103-113      +
  d     chr2   104-114      *
  e     chr1   105-115      *
  f     chr1   106-116      +
  g     chr3   107-117      +
  h     chr3   108-118      +
  i     chr3   109-119      -
  j     chr3   110-120      -
  -------
  seqinfo: 3 sequences from an unspecified genome; no seqlengths
> 
> mcols(gr)
DataFrame with 10 rows and 2 columns
      score        GC
  <integer> <numeric>
a         1  1.000000
b         2  0.888889
c         3  0.777778
d         4  0.666667
e         5  0.555556
f         6  0.444444
g         7  0.333333
h         8  0.222222
i         9  0.111111
j        10  0.000000
> 
> mcols(gr)$score
 [1]  1  2  3  4  5  6  7  8  9 10
```
  
* **Chromosome X GRanges**

```R    
# install annotation package for TxDb object(s)
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")

# load the package
> library(TxDb.Hsapiens.UCSC.hg38.knownGene)
> hg <- TxDb.Hsapiens.UCSC.hg38.knownGene

# select genes from chromosome X
> hg_chrXg <- genes(hg, filter = list(tx_chrom = c("chrX")))
> hg_chrXg
GRanges object with 1071 ranges and 1 metadata column:
            seqnames              ranges strand |     gene_id
               <Rle>           <IRanges>  <Rle> | <character>
      10009     chrX 120250752-120258398      + |       10009
  100093698     chrX   13310652-13319933      + |   100093698
  100124540     chrX   47388649-47388777      + |   100124540
  100126270     chrX 147909431-147911817      - |   100126270
  100126301     chrX 147258760-147258850      - |   100126301
        ...      ...                 ...    ... .         ...
       9823     chrX 101655281-101659850      - |        9823
       9843     chrX   66162549-66268867      + |        9843
       9947     chrX 141903894-141909374      + |        9947
       9949     chrX 110194186-110440233      - |        9949
       9968     chrX   71118556-71142454      + |        9968
  -------
  seqinfo: 595 sequences (1 circular) from hg38 genome
```

## 3.3 Manipulating collections of GRanges

* **GRangesList**

    * The `GRangesList-class` is a container for storing a collection of `GRanges`
        * Efficient for sorting a large number of elements

    * To construct a `GRangesList`
        * `as(mylist, "GRangesList")`
        * `GRangesList(myGranges1, myGranges2, ...)`

    * To convert back to `GRanges`
        * `unlist(myGRangesList)`

    * Accessors `methods(class = "GRangesList")`

* When to use lists?

    * Multiple GRanges objects may be combined into a GRangesList
        * GRanges in a list will be taken as compound features of a larger object

    * Examples of GRangesLists are
        * transcripts by gene
        * exons by transcripts
        * read alignments
        * sliding windows
```R
> hg_chrXg
GRanges object with 1071 ranges and 1 metadata column:
            seqnames              ranges strand |     gene_id
               <Rle>           <IRanges>  <Rle> | <character>
      10009     chrX 120250752-120258398      + |       10009
  100093698     chrX   13310652-13319933      + |   100093698
  100124540     chrX   47388649-47388777      + |   100124540
  100126270     chrX 147909431-147911817      - |   100126270
  100126301     chrX 147258760-147258850      - |   100126301
        ...      ...                 ...    ... .         ...
       9823     chrX 101655281-101659850      - |        9823
       9843     chrX   66162549-66268867      + |        9843
       9947     chrX 141903894-141909374      + |        9947
       9949     chrX 110194186-110440233      - |        9949
       9968     chrX   71118556-71142454      + |        9968
  -------
  seqinfo: 595 sequences (1 circular) from hg38 genome

> slidingWindows(hg_chrXg, width = 2000, step = 2000)
GRangesList object of length 1071:
$`10009`
GRanges object with 4 ranges and 0 metadata columns:
        seqnames              ranges strand
           <Rle>           <IRanges>  <Rle>
  10009     chrX 120250752-120252751      +
  10009     chrX 120252752-120254751      +
  10009     chrX 120254752-120256751      +
  10009     chrX 120256752-120258398      +
  -------
  seqinfo: 595 sequences (1 circular) from hg38 genome

$`100093698`
GRanges object with 5 ranges and 0 metadata columns:
            seqnames            ranges strand
               <Rle>         <IRanges>  <Rle>
  100093698     chrX 13310652-13312651      +
  100093698     chrX 13312652-13314651      +
  100093698     chrX 13314652-13316651      +
  100093698     chrX 13316652-13318651      +
  100093698     chrX 13318652-13319933      +
  -------
  seqinfo: 595 sequences (1 circular) from hg38 genome

$`100124540`
GRanges object with 1 range and 0 metadata columns:
            seqnames            ranges strand
               <Rle>         <IRanges>  <Rle>
  100124540     chrX 47388649-47388777      +
  -------
  seqinfo: 595 sequences (1 circular) from hg38 genome

...
<1068 more elements>
```

* `GenomicFeatures` uses transcript database (`TxDb`) objects to store metadata, manage genomic locations and relationships between features and its identifiers.

```R
# load the TxDb library
> library(TxDb.Hsapiens.UCSC.hg38.knownGene)
# store the object hg
> (hg <- TxDb.Hsapiens.UCSC.hg38.knownGene)
TxDb object:
# Db type: TxDb
# Supporting package: GenomicFeatures
# Data source: UCSC
# Genome: hg38
# Organism: Homo sapiens
# Taxonomy ID: 9606
# UCSC Table: knownGene
# UCSC Track: GENCODE V36
# Resource URL: http://genome.ucsc.edu/
# Type of Gene ID: Entrez Gene ID
# Full dataset: yes
# miRBase build ID: NA
# Nb of transcripts: 232184
# Db created by: GenomicFeatures package from Bioconductor
# Creation time: 2021-04-28 16:32:07 +0000 (Wed, 28 Apr 2021)
# GenomicFeatures version at creation time: 1.41.3
# RSQLite version at creation time: 2.2.6
# DBSCHEMAVERSION: 1.2
```

* **Genes, transcripts, exons**

```R
# load the library TxDb
> library(TxDb.Hsapiens.UCSC.hg38.knownGene)
# store the project hg
> hg <- TxDb.Hsapiens.UCSC.hg38.knownGene
# prefilter results to chrX
> seqlevels(hg) <- c("chrX")
# transcripts
> transcripts(hg, columns = c("tx_id", "tx_name"), filter = NULL)
GRanges object with 7169 ranges and 2 metadata columns:
         seqnames              ranges strand |     tx_id           tx_name
            <Rle>           <IRanges>  <Rle> | <integer>       <character>
     [1]     chrX       253743-255091      + |    223936 ENST00000431238.7
     [2]     chrX       276322-303353      + |    223937 ENST00000399012.6
     [3]     chrX       276324-291537      + |    223938 ENST00000484611.7
     [4]     chrX       276353-291629      + |    223939 ENST00000430923.7
     [5]     chrX       281055-288869      + |    223940 ENST00000445062.6
     ...      ...                 ...    ... .       ...               ...
  [7165]     chrX 155828585-155829576      - |    231100 ENST00000412936.6
  [7166]     chrX 155978992-155979325      - |    231101 ENST00000456370.6
  [7167]     chrX 155985370-155986249      - |    231102 ENST00000421233.6
  [7168]     chrX 156014623-156016837      - |    231103 ENST00000399966.9
  [7169]     chrX 156025664-156027877      - |    231104 ENST00000507418.6
  -------
  seqinfo: 1 sequence from hg38 genome
# exons
> exons(hg, columns = c("tx_id", "exon_id"), filter = list(tx_id = "179161"))
GRanges object with 0 ranges and 2 metadata columns:
   seqnames    ranges strand |         tx_id   exon_id
      <Rle> <IRanges>  <Rle> | <IntegerList> <integer>
  -------
  seqinfo: 1 sequence from hg38 genome
# genes
> genes(hg, columns = c("tx_id", "gene_id"), filter = NULL)
GRanges object with 1071 ranges and 2 metadata columns:
            seqnames              ranges strand |                    tx_id     gene_id
               <Rle>           <IRanges>  <Rle> |            <IntegerList> <character>
      10009     chrX 120250752-120258398      + |            226612,226613       10009
  100093698     chrX   13310652-13319933      + |                   224200   100093698
  100124540     chrX   47388649-47388777      + |                   224935   100124540
  100126270     chrX 147909431-147911817      - | 230565,230566,230567,...   100126270
  100126301     chrX 147258760-147258850      - |                   230554   100126301
        ...      ...                 ...    ... .                      ...         ...
       9823     chrX 101655281-101659850      - | 229713,229714,229715,...        9823
       9843     chrX   66162549-66268867      + | 225468,225469,225470,...        9843
       9947     chrX 141903894-141909374      + |            227045,227046        9947
       9949     chrX 110194186-110440233      - | 229944,229945,229946,...        9949
       9968     chrX   71118556-71142454      + | 225568,225569,225570,...        9968
  -------
  seqinfo: 1 sequence from hg38 genome
# cds
> cds(hg, columns = c("tx_id", "cds_id", filter = NULL))
GRanges object with 9025 ranges and 2 metadata columns:
         seqnames              ranges strand |                    tx_id    cds_id
            <Rle>           <IRanges>  <Rle> |            <IntegerList> <integer>
     [1]     chrX       284188-284314      + | 223937,223939,223940,...    266827
     [2]     chrX       288733-288787      + |                   223941    266828
     [3]     chrX       288733-288829      + |                   223944    266829
     [4]     chrX       288733-288869      + | 223937,223939,223940,...    266830
     [5]     chrX       290648-290757      + |                   223947    266831
     ...      ...                 ...    ... .                      ...       ...
  [9021]     chrX 155513986-155514265      - |     231094,231095,231097    275847
  [9022]     chrX 155524456-155524632      - |     231094,231095,231097    275848
  [9023]     chrX 155545096-155545276      - |            231094,231097    275849
  [9024]     chrX 155545096-155545277      - |                   231095    275850
  [9025]     chrX 155669758-155669789      - |                   231095    275851
  -------
  seqinfo: 1 sequence from hg38 genome
```

> `columns` and `filter` can be `NULL` or any of these:
> `"gene_id", "tx_id", "tx_name", "tx_chrom", "tx_strand", "exon_id", "exon_name", "exon_chrom", "exon_strand", "cds_id", "cds_name", "cds_chrom", "cds_strand" and "exon_rank"`

* **Exons by transcripts**

```R








# 4 Introducing ShortRead











