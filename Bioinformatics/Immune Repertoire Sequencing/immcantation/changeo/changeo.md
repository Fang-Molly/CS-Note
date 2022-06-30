Change-O - Repertoire clonal assignment toolkit
===============================================

# Overview

Change-O is a collection of tools for processing the output of V(D)J alignment tools, assigning clonal clusters to immunoglobulin (Ig) sequences, and reconstructing germline sequences.

# Download and installation

* Download: https://pypi.org/project/changeo/#files

* Installation: `pip3 install changeo-x.y.z.tar.gz`

# Commandline Usage

## AssignGenes.py igblast

```
usage: AssignGenes.py igblast [--version] [-h] [-o OUT_FILES [OUT_FILES ...]]
                              [--outdir OUT_DIR] [--outname OUT_NAME]
                              [--nproc NPROC] -s SEQ_FILES [SEQ_FILES ...] -b
                              IGDATA
                              [--organism {human,mouse,rabbit,rat,rhesus_monkey}]
                              [--loci {ig,tr}] [--vdb VDB] [--ddb DDB]
                              [--jdb JDB] [--format {blast,airr}]
                              [--exec IGBLAST_EXEC]
```

```bash
export DATA=''

AssignGenes.py igblast \
	-o $DATA/igblast
	-s $DATA/fastq_qc/*.fastq
	-b 
	--organism human
	--loci ig
	--format airr
```
	

# Using IgBLAST

## Configuring IgBLAST

* Get tools from https://bitbucket.org/kleinstein/immcantation/src/master/scripts/

	* `fetch_igblastdb.sh`

	* `fetch_imgtdb.sh`

	* `clean_imgtdb.py`

	* `imgt2igblast.sh`

* Download and configure the IgBLAST and IMGT reference databases

```bash
#!/usr/bash

# Download and extract IgBLAST
VERSION="1.19.0"
wget ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/${VERSION}/ncbi-igblast-${VERSION}-x64-macosx.tar.gz
tar -zxf ncbi-igblast-${VERSION}-x64-macosx.tar.gz
cp ncbi-igblast-${VERSION}/bin/* ~/bin

# Download reference databases and setup IGDATA directory
bash fetch_igblastdb.sh -o ~/immc/igblast
cp -r ncbi-igblast-${VERSION}/internal_data ~/immc/igblast
cp -r ncbi-igblast-${VERSION}/optional_file ~/immc/igblast

# Build IgBLAST database from IMGT reference sequences
bash fetch_imgtdb.sh -o ~/immc/germlines/imgt
bash imgt2igblast.sh -i ~/immc/germlines/imgt -o ~/immc/igblast
```

* Build databases for each segment

```bash
#!/usr/bash

# V segment database
~/bin/edit_imgt_file.pl ~/immc/germlines/imgt/human/vdj/imgt_human_IGHV.fasta > ~/immc/igblast/fasta/imgt_human_ig_v.fasta

~/bin/makeblastdb -parse_seqids -dbtype nucl \
    -in ~/immc/igblast/fasta/imgt_human_ig_v.fasta \
    -out ~/immc/igblast/database/imgt_human_ig_v

# D segment database
~/bin/edit_imgt_file.pl ~/immc/germlines/imgt/human/vdj/imgt_human_IGHD.fasta > ~/immc/igblast/fasta/imgt_human_ig_d.fasta

~/bin/makeblastdb -parse_seqids -dbtype nucl \
    -in ~/immc/igblast/fasta/imgt_human_ig_d.fasta \
    -out ~/immc/igblast/database/imgt_human_ig_d

# J segment database
~/bin/edit_imgt_file.pl ~/immc/germlines/imgt/human/vdj/imgt_human_IGHJ.fasta > ~/immc/igblast/fasta/imgt_human_ig_j.fasta

~/bin/makeblastdb -parse_seqids -dbtype nucl \
    -in ~/immc/igblast/fasta/imgt_human_ig_j.fasta \
    -out ~/immc/igblast/database/imgt_human_ig_j
```

## Running IgBLAST


```bash

bash run_igblast.sh \
	-s ~/Desktop/seq_data/fastq_qc/D0043-rep1.fasta \
	-o ~/Desktop/seq_data/igblast \
    -g human \
	-t ig \
	-b ~/immc/igblast \
	-i nt \
	-n 4
	
```

```bash
export IGDATA='~/immc/scripts/ncbi-igblast-1.19.0/bin'
export DATA='~/Desktop/seq_data'

for file in $DATA/fastq_qc/*.fasta; do

AssignGenes.py ~/bin/igblast \
	-s ~/Desktop/seq_data/fastq_qc/D0043-rep1.fasta \
	-b ~/immc/igblast \
	-o ~/Desktop/seq_data/igblast \
	-r $IGDATA
	--organism human \
	--loci ig \
	--format airr \
	--nproc 4; done
```

convert fastq to fasta

```
for filename in *.fastq; do
seqtk seq -a "$filename" > "$filename".fasta; done
```


















