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
