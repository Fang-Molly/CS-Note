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

* Convert fastq to fasta

```
for filename in *.fastq; do
seqtk seq -a "$filename" > "$filename".fasta; done
```

* Run IgBlast

```bash
for file in *.fasta; do
export IGDATA=~/immc/igblast
bin/igblastn \
    -germline_db_V ~/immc/igblast/database/imgt_human_ig_v\
    -germline_db_D ~/immc/igblast/database/imgt_human_ig_d \
    -germline_db_J ~/immc/igblast/database/imgt_human_ig_v \
    -auxiliary_data ~/immc/igblast/optional_file/human_gl.aux \
    -domain_system imgt -ig_seqtype Ig -organism human \
    -outfmt '7 std qseq sseq btop' \
    -query ~/Desktop/seq_data/fastq_qc/"$file" \
    -out "$file".fmt7

MakeDb.py igblast -i D0043-rep1.fasta.fmt7 -s D0043-rep1.fasta \
    -r ~/immc/germlines/imgt/human/vdj \
    --format airr

MakeDb.py igblast -i D0043-rep2.fasta.fmt7 -s D0043-rep2.fasta \
    -r ~/immc/germlines/imgt/human/vdj --outname data\
    --format airr
```


```bash
export IGDATA=~/immc/igblast
AssignGenes.py igblast -s ~/Desktop/seq_data/fastq_qc/D0043-rep1.fasta \
	-b ~/immc/igblast --organism human --loci ig \
	--format blast --outdir ~/Desktop/seq_data/igblast --nproc 4
```

















