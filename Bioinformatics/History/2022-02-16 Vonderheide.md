# pool rep1 and rep2

```
java -jar vdjtools.jar poolsamples -i aaV "vdj.txt.ND429-C8-KD10-18-DNA-rep1clones.txt" "vdj.txt.ND429-C8-KD10-18-DNA-rep2clones.txt" "ND429-C8-KD10-18-DNA-clones-pooled.txt"
```

# delete long CDR3aa >= 30

# delete one copy

# PlotFancySpectratype

```
for filename in *.txt; do
java -jar vdjtools.jar PlotFancySpectratype "$filename" plotfancyspectratype/"$filename"; done

# convert pdf to png
for p in *.pdf
do
    pdftoppm "$p" "$p" -png
done
```

# PlotFancyVJUsage

```
for filename in *.txt; do

java -jar vdjtools.jar PlotFancyVJUsage  "$filename" plotfancyvjusage/"$filename"; done

# convert pdf to png
for p in *.pdf
do
    pdftoppm "$p" "$p" -png
done
```










