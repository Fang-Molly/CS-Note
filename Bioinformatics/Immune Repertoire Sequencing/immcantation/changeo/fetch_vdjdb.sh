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
