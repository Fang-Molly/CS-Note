T and B cell receptor repertoire sequencing data analysis
=========================================================

# 1. Prepare files

## 1.1 rename filenames

## 1.2 list files

# 2. Run Mixcr

```
for filename in *.fastq; do

mixcr analyze amplicon --species hsa \
      --starting-material dna \
      --5-end v-primers \
      --3-end j-primers \
      --adapters adapters-present \
      --receptor-type trb \
      --report "$filename".report.txt \
      --assemble "-OaddReadsCountOnClustering=true" \
      "$filename" "$filename"; done
```

# 3. Run vdjtools

## 3.1 convert mixcr to VDJtools format

```
java -jar vdjtools.jar Convert -S mixcr *.txt  vdj
```

## 3.2 Basic analysis

#### CalcBasicStats

```
java -jar vdjtools.jar CalcBasicStats  vdj*.txt out
```

#### TrackClonotypes

```
java -Xmx1024m -jar vdjtools.jar TrackClonotypes -i aaV -p *.txt out
```

### PoolSamples

```
for rep1 in *rep1.txt; do

    rep2="${rep1%1.txt}2.txt"
    java -jar vdjtools.jar poolsamples -i aaV "$rep1" "$rep2" "$rep1" ; done
```


--------------------------------
# list files

ls *.txt > list.txt

# convert pdf to png

for p in *.pdf
do
    pdftoppm "$p" "$p" -png
done

# mixcr
# IGH, TRB

for filename in *.fastq; do

mixcr analyze amplicon --species hsa \
      --starting-material dna \
      --5-end v-primers \
      --3-end j-primers \
      --adapters adapters-present \
      --receptor-type TRB \
      --report "$filename".report.txt \
      --assemble "-OaddReadsCountOnClustering=true" \
      "$filename" "$filename"; done

rm *.clna *.vdjca
mkdir 01_fastq 02_report 03_clonotypes 04_vdj
mv *.fastq 01_fastq
mv *.report.txt 02_report

java -jar vdjtools.jar Convert -S mixcr *.txt  vdj

mv vdj* metadata.txt 04_vdj

mv *.txt 03_clonotypes


# vdj
## Basic analysis

# CalcBasicStats

java -jar vdjtools.jar CalcBasicStats  *.txt calcbasicstats/

# CalcSegmentUsage

java -jar vdjtools.jar CalcSegmentUsage -p -u *.txt calcsegmentusage/

java -jar vdjtools.jar CalcSegmentUsage -p -u D0001.txt D0001

# CalcSpectratype

java -jar vdjtools.jar CalcSpectratype -a -u *.txt calcspectratype/


# PlotFancySpectratype

java -jar vdjtools.jar PlotFancySpectratype D0001.txt D0001.txt

 

# PlotFancyVJUsage

java -jar vdjtools-patch.sh vdjtools.jar   PlotFancyVJUsage 1085-KO-NPneg.txt 1085-KO-NPneg

for filename in *.txt; do

java -jar vdjtools.jar PlotFancyVJUsage "$filename" --plot-type plotfancyvjusage/"$filename"; done

for p in plotfancyvjusage/*.pdf; do
pdftoppm "$p" "$p" -png; done


# PlotSpectratypeV

java -jar vdjtools.jar PlotSpectratypeV *.txt out

for filename in *.txt; do
java -jar vdjtools.jar PlotSpectratypeV "$filename" PlotSpectratypeV/"$filename"; done

for p in PlotSpectratypeV/*.pdf; do
pdftoppm "$p" "$p" -png; done


## Diversity estimation

# PlotQuantileStats

# RarefactionPlot

# CalcDiversityStats


## Repertoire overlap analysis

# OverlapPair

# CalcPairwiseDistances

# ClusterSamples

# TestClusters

# TrackClonotypes

java -Xmx1024m -jar vdjtools.jar TrackClonotypes -i aaV -p *.txt trackclonotypes/

java -Xmx1024m -jar vdjtools.jar TrackClonotypes -i aaV -p -t 100 HDL108*.txt trackclonotypes/HDL108/


java -Xmx1024m -jar vdjtools.jar TrackClonotypes -i aaV -p -t 100 *.txt out


## Operate on clonotype tables

# JoinSamples

java -jar vdjtools.jar JoinSamples -p D507*.txt JoinSamples/D507

java -jar vdjtools.jar JoinSamples -p D513*.txt JoinSamples/D513

java -jar vdjtools.jar JoinSamples -p D514*.txt JoinSamples/D514

java -jar vdjtools.jar JoinSamples -p D515*.txt JoinSamples/D515

java -jar vdjtools.jar JoinSamples -p D519*.txt JoinSamples/D519

java -jar vdjtools.jar JoinSamples -p HDL108*.txt JoinSamples/HDL108


# PoolSamples

for rep1 in *rep1.fastq.clonotypes.TRB.txt_cdr3aa50off.txt; do

    rep2="${rep1%1.fastq.clonotypes.TRB.txt_cdr3aa50off.txt}2.fastq.clonotypes.TRB.txt_cdr3aa50off.txt"
    
    java -jar vdjtools.jar poolsamples -i aaV "$rep1" "$rep2" "$rep1" ; done


java -jar vdjtools.jar poolsamples -i aaV "TC366-iTFR.txt" "TC366-nTFR.txt" "TC366-TFR.txt"


# FilterNonFunctional

java -jar vdjtools.jar FilterNonFunctional  *.txt filternonfunctional/


