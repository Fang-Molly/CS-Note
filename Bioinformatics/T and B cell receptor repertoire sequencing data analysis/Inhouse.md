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


