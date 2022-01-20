MiXCR: a universal tool for fast and accurate analysis of T- and B- cell receptor repertoire sequencing data
============================================================================================================

# 1. Installation

* Install mixcr using conda on mac

```
conda install -c imperial-college-research-computing mixcr
```

# 2. Run mixcr

```
for filename in *.fastq; do

mixcr analyze amplicon --species hsa \
      --starting-material dna \
      --5-end v-primers \
      --3-end j-primers \
      --adapters adapters-present \
      --receptor-type IGH \
      --report "$filename".report.txt \
      --assemble "-OaddReadsCountOnClustering=true" \
      "$filename" "$filename"; done
```

# 3. Convert to VDJtools format

```
java -jar vdjtools.jar Convert -S mixcr *.txt  vdj
```

