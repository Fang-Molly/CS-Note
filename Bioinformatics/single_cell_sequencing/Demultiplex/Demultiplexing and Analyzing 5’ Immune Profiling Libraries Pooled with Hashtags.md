Demultiplexing and Analyzing 5’ Immune Profiling Libraries Pooled with Hashtags
===============================================================================

Learn more on the [10X Genomics Analysis Guides](https://www.10xgenomics.com/resources/analysis-guides/demultiplexing-and-analyzing-5%E2%80%99-immune-profiling-libraries-pooled-with-hashtags) website

# 1. Prepare input files

## 1.1 FASTQ files

## 1.2 Reference

* **Human reference transcriptome**

```bash
# Download
curl -O https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz

# Decompress
tar -xvzf refdata-gex-GRCh38-2020-A.tar.gz
```

* **V(D)J reference**

```bash
# Download
curl -O https://cf.10xgenomics.com/supp/cell-vdj/refdata-cellranger-vdj-GRCh38-alts-ensembl-7.0.0.tar.gz

# Decompress
tar -xzvf refdata-cellranger-vdj-GRCh38-alts-ensembl-7.0.0.tar.gz
```

## 1.3 Custom Cell Multiplexing Oligo (CMO) reference

[5p_hashing_demux_cmo-set.csv](https://github.com/Fang-Molly/CS-note/blob/master/Bioinformatics/single_cell_sequencing/Demultiplex/5p_hashing_demux_cmo-set.csv)

```csv
id,name,read,pattern,sequence,feature_type
Hash-tag1,Hash-tag1,R2,^NNNNNNNNNN(BC)NNNNNNNNN,GTCAACTCTTTAGCG,Multiplexing Capture
Hash-tag2,Hash-tag2,R2,^NNNNNNNNNN(BC)NNNNNNNNN,TGATGGCCTATTGGG,Multiplexing Capture
Hash-tag3,Hash-tag3,R2,^NNNNNNNNNN(BC)NNNNNNNNN,TTCCGCCTCTCTTTG,Multiplexing Capture
Hash-tag4,Hash-tag4,R2,^NNNNNNNNNN(BC)NNNNNNNNN,AGTAAGTTCAGCGTA,Multiplexing Capture
```

## 1.4 Config CSV

* 5p_hashing_demux_config.csv

```csv
[gene-expression]
reference,/path/to/cellranger/prebuilt/human/refdata-gex-GRCh38-2020-A/
cmo-set,/path/to/working-directory/demultiplexing/5p_hashing_demux_cmo-set.csv

[libraries]
fastq_id,fastqs,feature_types
PBMC-ALL_60k_universal_HashAB1-4_BL_4tags_Rep1_gex,Path/to/GEX/FASTQs,Gene Expression
PBMC-ALL_60k_universal_HashAB1-4_BL_4tags_Rep1_ab,Path/to/AB/FASTQs,Multiplexing Capture

[samples]
sample_id,cmo_ids
Donor1_healthy,Hash-tag1
Donor2_healthy,Hash-tag2
Donor3_ALLpatient,Hash-tag3
Donor4_ALLpatient,Hash-tag4
```

# 2. Run the demultiplexing command

```bash
CSV=/mnt/share/miseq_data/10XGenomics/demulplex_test/demultiplexing/5p_hashing_demux_config.csv

export PATH=/home/wmeng/yard/apps/cellranger-7.1.0/:$PATH

cellranger multi --id=demultiplexed_samples \
                 --csv=$CSV \
                 --jobmode=local --localcores=26 --localmem=200
```

# 3. Convert per sample BAM files to FASTQs for the GEX data



































