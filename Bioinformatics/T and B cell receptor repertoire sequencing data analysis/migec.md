MIGEC: Molecular Identifier Guided Error Correction pipeline
============================================================

# 1. Installing and running

* To install it get the latest [JRE](https://www.oracle.com/java/technologies/downloads/) and download the executable from [releases section](https://github.com/mikessh/MIGEC/releases).

* To ran a specific script from the pipeline, say Checkout, execute

```
java -jar MIGEC-$VERSION.jar Checkout [arguments]
```

# Clontech kit

python3 immune_profiler.py -r BCR -f fastq -m metadata.csv -o out -t CDR3

# MIGEC

# De-multiplexing
# Checkout-batch

java -jar migec.jar CheckoutBatch -cute --skip-undef barcodes.txt checkout/


# MIG statistics
# Histogram

java -jar migec.jar Histogram checkout histogram/


# Consensus assembly
# Assemble-batch

java -jar migec.jar AssembleBatch --force-collision-filter --force-overseq 5 checkout histogram assemble/

java -jar migec.jar AssembleBatch --force-collision-filter --force-overseq 1 checkout histogram assemble/


# V(D)J junction mapping

# CdrBlast-batch

java -jar migec.jar CdrBlast -R IGH checkout/D328-69SP-2_R2.fastq.gz cdrblast

java -jar migec.jar Report -c checkout -i histogram -a assemble -b cdrblast.txt report

# merge

java -jar mitools.jar merge -ss -s 0.7 D328-69SP-2_R1.t5.cf.fastq D328-69SP-2_R2.t5.cf.fastq 
D328-69SP-2_R12.t5.cf.fastq

for R1 in *R1.t1.cf.fastq; do

    R2="${R1%1.t1.cf.fastq}2.t1.cf.fastq"
    
    R12="${R1%1.t1.cf.fastq}12.t1.cf.fastq"

    java -jar mitools.jar merge -ss -s 0.7 "$R1" "$R2" "$R12" ; done




for rep1 in *rep1.txt; do

    rep2="${rep1%1.txt}2.txt"
    
    java -jar vdjtools.jar poolsamples -i aaV "$rep1" "$rep2" "$rep1" ; done

