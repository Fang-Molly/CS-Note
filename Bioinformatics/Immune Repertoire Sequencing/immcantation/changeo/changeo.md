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
 
* Option 1 : Run IgBlast using AssignGenes.py

```
export PATH=$PATH:~/immc/scripts/ncbi-igblast-1.19.0/bin

for file in *.fasta; do
AssignGenes.py igblast -s ~/Desktop/seq_data/fastq_qc/"$file" \
-b ~/immc/igblast --organism human --loci ig \
--format airr --outdir ~/Desktop/seq_data/igblast --nproc 4; done
```

* Option 2 : Run IgBlast using igblastn

```bash
cd ~/Desktop/seq_data/fastq_qc

# run igblast
for file in *.fasta; do
export IGDATA=~/immc/igblast
~/bin/igblastn \
    -germline_db_V ~/immc/igblast/database/imgt_human_ig_v\
    -germline_db_D ~/immc/igblast/database/imgt_human_ig_d \
    -germline_db_J ~/immc/igblast/database/imgt_human_ig_j \
    -auxiliary_data ~/immc/igblast/optional_file/human_gl.aux \
    -domain_system imgt -ig_seqtype Ig -organism human \
    -outfmt '7 std qseq sseq btop' \
    -query ~/Desktop/seq_data/fastq_qc/"$file" \
    -out "$file".fmt7; done

# convert to airr format
for file1 in *.fmt7; do for file2 in *.fasta; do
MakeDb.py igblast -i "$file1" -s "$file2" \
    -r ~/immc/germlines/imgt/human/vdj \
    --format airr; done; done
```




# Genotyping and discovery of novel V gene alleles with TIgGER



```python
# assign clonal groups
! DefineClones.py -d ~/Desktop/seq_data/tigger/data_ph_genotyped.tsv --vf v_call_genotyped \
--model ham --norm len --dist 0.08 --format airr --nproc 4 \
--outname data_ph_genotyped --outdir ~/Desktop/seq_data/changeo/
```

```python
CreateGermlines.py -d ~/Desktop/seq_data/changeo/data_ph_genotyped_clone-pass.tsv \
-r ~/immc/germlines/imgt/human/vdj/*IGH[DJ].fasta ~/Desktop/seq_data/tigger/v_genotype.fasta \
-g dmask --cloned --vf v_call_genotyped \
--format airr --outname data_ph_genotyped --outdir ~/Desktop/seq_data/changeo/
```

# 6. Alakazam: Analysis of clonal diversity



# 7. Alakazam: Physicochemical properties of the CDR3














