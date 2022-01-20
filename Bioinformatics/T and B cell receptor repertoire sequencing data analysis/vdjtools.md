VDJtools: a framework for post-analysis of repertoire sequencing data
=====================================================================

# 1. Installing VDJtools

## 1.1 Install Java

* Make sure that you have installed Java Runtime Environment (JRE) v1.8 by running `java -version`.

## 1.2 Download and unpack the VDJtools binaries

`java -jar path-to-vdjtools-X.X.X.jar RoutineName`

## 1.3 Setting up plotting routines

* Install R programming language and packages

```
java -jar vdjtools.jar Rinstall
```

```
install.packages(c("circlize", "grid", "gridExtra", "VennDiagram"), repos='http://cran.us.r-project.org')
install.packages(c("reshape2", "FField", "reshape", "gplots", "gridExtra", "circlize", "ggplot2", "grid", "VennDiagram", "ape", "MASS", "plotrix", "RColorBrewer", "scales"), repos='http://cran.us.r-project.org')
```

# 2. Basic analysis

## 2.1 CalcBasicStats

```
java -jar vdjtools.jar CalcBasicStats  *.txt out
```

## 2.2 CalcSegmentUsage

```
java -jar vdjtools.jar CalcSegmentUsage -p -u *.txt out
```

## 2.3 CalcSpectratype

```
java -jar vdjtools.jar CalcSpectratype -a -u *.txt out
```

## 2.4 PlotFancySpectratype

```
# for single file, out pdf file
java -jar vdjtools.jar PlotFancySpectratype D0001.txt D0001.txt

# for multiple files, out png file
for filename in *.txt; do
java -jar vdjtools.jar PlotFancySpectratype --plot png "$filename" "$filename"; done
```

## 2.5 PlotFancyVJUsage

```
# for single file
java -jar vdjtools.jar PlotFancyVJUsage D0001.txt D0001.txt

# for multiple files
for filename in *.txt; do
java -jar vdjtools.jar PlotFancyVJUsage --plot png "$filename" "$filename"; done
```

## 2.6 PlotSpectratypeV

```
# for single file
java -jar vdjtools.jar PlotSpectratypeV D0001.txt D0001.txt

# for multiple files
for filename in *.txt; do
java -jar vdjtools.jar PlotSpectratypeV --plot png "$filename" "$filename"; done
```

# 3. Diversity estimation

## 3.1 PlotQuantileStats

```
java -jar vdjtools.jar PlotQuantileStats D0001.txt D0001.txt

for filename in *.txt; do
java -jar vdjtools.jar PlotQuantileStats --plot png "$filename" "$filename"; done
```

## 3.2 RarefactionPlot

```
java -jar vdjtools.jar RarefactionPlot *.txt RarefactionPlot
```

## 3.3 CalcDiversityStats

```
java -jar vdjtools.jar CalcDiversityStats *.txt CalcDiversityStats
```

# 4. Repertoire overlap analysis

## 4.1 OverlapPair

```
java -jar vdjtools.jar OverlapPair -p D0007.txt R0007.txt R0007-3M-DS.txt R0007-3M-AR.txt R0007-0M-DS.txt R0007-0M-AR.txt OverlapPair
```

## 4.2 CalcPairwiseDistances

```
java -jar vdjtools.jar CalcPairwiseDistances *.txt CalcPairwiseDistances
```

## 4.3 ClusterSamples

```
java -jar vdjtools.jar ClusterSamples -p *.txt ClusterSamples
```

## 4.4 TestClusters

## 4.5 TrackClonotypes

```
java -Xmx1024m -jar vdjtools.jar TrackClonotypes -i aaV -p *.txt out
```

# 5. Operate on clonotype tables

# JoinSamples

java -jar vdjtools.jar JoinSamples -p 

# PoolSamples

for rep1 in *rep1.txt; do

    rep2="${rep1%1.txt}2.txt"

    java -jar vdjtools.jar poolsamples -i aaV "$rep1" "$rep2" "$rep1" ; done


java -jar vdjtools.jar poolsamples -i aaV "TC366-iTFR.txt" "TC366-nTFR.txt" "TC366-TFR.txt"






