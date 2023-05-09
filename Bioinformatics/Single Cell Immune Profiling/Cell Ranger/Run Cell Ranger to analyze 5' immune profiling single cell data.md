Run Cell Ranger to analyze 5' immune profiling single cell data
===============================================================

# 1. Tools required

## 1.1 Cell Ranger

> [Follow the instruction from 10X Genomics](https://support.10xgenomics.com/single-cell-vdj/software/pipelines/latest/installation)

* **Cell Ranger download and install**

```bash
$ cd /apps
[ download file from downloads page ]

$ tar -xzvf cellranger-7.1.0.tar.gz
[ unpack the Cell Ranger file ]
```

* **Reference data files download and unpack**

  * [GRCh38 Human V(D)J Reference]
  * [GRCh38 Human Reference]

```bash
[ download file from downloads page ]

$ tar -xzvf refdata-cellranger-vdj-GRCh38-alts-ensembl-7.1.0.tar.gz
```

* **Prepend the Cell Ranger directory to your $PATH**

```
$ export PATH=/opt/cellranger-7.1.0:$PATH
```

## 1.2 bamtofastq: 10x BAM to FASTQ converter

Download from [the releases page](https://github.com/10XGenomics/bamtofastq)


# 2. Generating FASTQs with cellranger mkfastq: from bcl to fastq

[Follow the instruction from the 10X Genomics](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/mkfastq)

* Create the index sample sheet **index.csv**, including the index information from one sequencing run.

```
[Data]
Lane,Sample_ID,index
1,ABC_vdj,SI-TT-A1
1,PB_vdj,SI-TT-A2
1,RM_vdj,SI-TT-A3
1,ABC_gex,SI-TT-A4
1,PB_gex,SI-TT-A5
1,RM_gex,SI-TT-A6
1,ABC_hto,SI-TN-A1
1,PB_hto,SI-TN-A2
1,RM_hto,SI-TN-A3
```

* Find the path of Illumina BCL run folder.

* Run cellranger

```bash
cd /mnt/share/miseq_data/10XGenomics/cellranger

SAMPLE=HPAP
CSV=/mnt/share/miseq_data/10XGenomics/cellranger/index/gex.csv
RUN=/mnt/share/miseq_data/Nextseq/180514_NB502099_0087_AHTHVVBGX5

export PATH=/home/wmeng/yard/apps/cellranger-7.1.0/:$PATH
cellranger mkfastq --id=$SAMPLE \
                   --samplesheet=$CSV \
                   --run=$RUN \
                   --jobmode=local --localcores=26 --localmem=200
```

# 3. Demultiplex the GEX and VDJ data pooled with Hashtags

## 3.1 Demultiplex the 5' GEX fastqs data by hashtags, using `cellranger multi`

* Create custom Cell Multiplexing Oligo(CMO) reference: 5p_hashing_demux_cmo-set.csv

```
id,name,read,pattern,sequence,feature_type
Hash-tag1,Hash-tag1,R2,^NNNNNNNNNN(BC)NNNNNNNNN,GTCAACTCTTTAGCG,Multiplexing Capture
Hash-tag2,Hash-tag2,R2,^NNNNNNNNNN(BC)NNNNNNNNN,TGATGGCCTATTGGG,Multiplexing Capture
Hash-tag3,Hash-tag3,R2,^NNNNNNNNNN(BC)NNNNNNNNN,TTCCGCCTCTCTTTG,Multiplexing Capture
Hash-tag4,Hash-tag4,R2,^NNNNNNNNNN(BC)NNNNNNNNN,AGTAAGTTCAGCGTA,Multiplexing Capture
```
* Create Config CSV: 5p_hashing_demux_config.csv

```
[gene-expression]
reference,/mnt/share/miseq_data/10XGenomics/cellranger/reference/refdata-gex-GRCh38-2020-A
cmo-set,/mnt/share/miseq_data/10XGenomics/demultiplex_test/demultiplex/5p_hashing_demux_cmo-set.csv

[libraries]
fastq_id,fastqs,feature_types
PBMC-ALL_60k_universal_HashAB1-4_BL_4tags_Rep1_gex,/mnt/share/miseq_data/10XGenomics/demultiplex_test/fastqs/gex_fastq,Gene Expression
PBMC-ALL_60k_universal_HashAB1-4_BL_4tags_Rep1_ab,/mnt/share/miseq_data/10XGenomics/demultiplex_test/fastqs/ab_fastq,Multiplexing Capture

[samples]
sample_id,cmo_ids
Donor1_healthy,Hash-tag1
Donor2_healthy,Hash-tag2
Donor3_ALLpatient,Hash-tag3
Donor4_ALLpatient,Hash-tag4
```

* Run `cellranger multi`

```
CSV=/mnt/share/miseq_data/10XGenomics/demultiplex_test/demultiplex/5p_hashing_demux_config.csv

export PATH=/home/wmeng/apps/cellranger-7.1.0/:$PATH

cellranger multi --id=demultiplexed_samples \
                 --csv=$CSV \
                 --jobmode=local --localcores=26 --localmem=200
```

## 3.2 Convert per sample BAM files to FASTQs for the GEX data with the bamtofastq tool

```bash
export PATH=/home/wmeng/yard/apps/cellranger-7.1.0/:$PATH
source ~/apps/cellranger-7.1.0/sourceme.bash

bamtofastq --reads-per-fastq=2200000000 demultiplexed_samples/outs/per_sample_outs/Donor1_healthy/count/sample_alignments.bam bamtofastq/Donor1_healthy

bamtofastq --reads-per-fastq=2200000000 demultiplexed_samples/outs/per_sample_outs/Donor2_healthy/count/sample_alignments.bam bamtofastq/Donor2_healthy

bamtofastq --reads-per-fastq=2200000000 demultiplexed_samples/outs/per_sample_outs/Donor3_ALLpatient/count/sample_alignments.bam bamtofastq/Donor3_ALLpatient

bamtofastq --reads-per-fastq=2200000000 demultiplexed_samples/outs/per_sample_outs/Donor4_ALLpatient/count/sample_alignments.bam bamtofastq/Donor4_ALLpatient
```

## 3.3 Run cellranger multi for GEX, HTO, TCR, and BCR data

* Create the Feature Reference CSV


* Create sample-specific multi config CSV files


* Run cellranger multi for each sample

```bash
CSV=/mnt/share/miseq_data/10XGenomics/demulplex_test/final_analysis/Donor1_final_Multiplex_config1.csv

export PATH=/home/wmeng/yard/apps/cellranger-7.1.0/:$PATH

cellranger multi --id=Donor1-final2 --csv=$CSV --jobmode=local --localcores=26 --localmem=200
cellranger multi --id=Donor2-final --csv=Donor2_final_Multiplex_config.csv
cellranger multi --id=Donor3-final --csv=Donor3_final_Multiplex_config.csv
cellranger multi --id=Donor4-final --csv=Donor4_final_Multiplex_config.csv
```


