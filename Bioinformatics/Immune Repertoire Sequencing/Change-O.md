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

```
# Download and extract IgBLAST
VERSION="1.19.0"
wget ftp://ftp.ncbi.nih.gov/blast/executables/igblast/release/${VERSION}/ncbi-igblast-${VERSION}-x64-linux.tar.gz
tar -zxf ncbi-igblast-${VERSION}-x64-linux.tar.gz
cp ncbi-igblast-${VERSION}/bin/* ~/bin
# Download reference databases and setup IGDATA directory
fetch_igblastdb.sh -o ~/share/igblast
cp -r ncbi-igblast-${VERSION}/internal_data ~/share/igblast
cp -r ncbi-igblast-${VERSION}/optional_file ~/share/igblast
# Build IgBLAST database from IMGT reference sequences
fetch_imgtdb.sh -o ~/share/germlines/imgt
imgt2igblast.sh -i ~/share/germlines/imgt -o ~/share/igblast
```







