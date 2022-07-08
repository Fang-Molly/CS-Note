pRESTO - The REpertoire Sequencing TOolkit
===========================================

# Overview

pRESTO is a toolkit for processing raw reads from high-throughput sequencing of B cell and T cell repertoires.

# Download and installation

[We can follow the instruction from the presto website](https://presto.readthedocs.io/en/stable/install.html)

# Run pRESTO

```bash
echo "Extracting .gz files if they exist"
gunzip *.gz &> /dev/null

echo "Running pRESTO"
PairSeq.py -1 *R1* -2 *R2* --coord illumina

AssemblePairs.py align \
    -1 *R1*_pair-pass.fastq \
    -2 *R2*_pair-pass.fastq \
    --coord illumina \
    --rc tail

FilterSeq.py quality -s *_assemble-pass.fastq -q 30

FilterSeq.py trimqual \
    -s *_quality-pass.fastq \
    -q 30 \
    --win 20

FilterSeq.py length -s *trimqual-pass.fastq -n 100

FilterSeq.py maskqual -s *length-pass.fastq -q 30

FilterSeq.py missing -s *maskqual-pass.fastq -n 10

mkdir fastq_qc
mv *missing-pass.fastq fastq_qc
rm *pass*.fastq
```
