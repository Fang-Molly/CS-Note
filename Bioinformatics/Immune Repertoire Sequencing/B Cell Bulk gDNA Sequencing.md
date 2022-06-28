B Cell Bulk gDNA Sequencing
===========================

# 1. Software installation

## Install pRESTO

https://presto.readthedocs.io/en/stable/install.html

## Install the ImmuneDB Docker image

* Install Docker

	* Download Docker: https://docs.docker.com/desktop/mac/install/
	* Set up Dockerhub account and log in

* Install ImmuneDB

	* Search "immunedb" on Dockerhub: https://hub.docker.com/r/arosenfeld/immunedb
	* Docker Pull: `docker pull arosenfeld/immunedb:v0.29.10`

# 2. Raw Data Processing

## Run pRESTO

* Locate the sequencing FASTQ files: `cd $DATA/fastq_raw`

```bash
PairSeq.py -1 *R1*.fastq -2 *R2*.fastq
AssemblePairs.py align -1 *R1*_pair-pass.fastq \
 -2 *R2*_pair-pass.fastq \
 --coord illumina
FilterSeq.py quality -s *assemble-pass.fastq
FilterSeq.py trimqual -s *quality-pass.fastq -q 30 --win 20
FilterSeq.py length -s *trimqual-pass.fastq -n 100
FilterSeq.py maskqual -s *length-pass.fastq -q 30
FilterSeq.py missing -s *maskqual-pass.fastq -n 10
```

* Move the quality-controlled data into a new directory

```bash
mkdir $DATA/fastq_qc
mv *missing-pass.fastq $DATA/fastq_qc
rm *pass*.fastq

mkdir $DATA/immunedb_share
mkdir $DATA/immunedb_share/input
cp $DATA/fastq_qc/*missing-pass.fastq $DATA/immunedb_share/input
```

## Run IgBLAST

* Run the docker container

```bash
docker run -v $DATA/immunedb_share:/share \
 -p 8080:8080 \
 -it arosenfeld/immunedb
 --cpuset-cpus 4
```


* Run IgBLAST on the QC'd FASTQ files

	* SPECIES:human, mouse
	* LOCUS: IGH, IGL, IGK, TRA, TRB

```
run_igblast.sh human IGH /share/input /share/input

mkdir -p /share/sequences
mv /share/input/*.fast[aq] /share/sequences
```






