
salmon quant -i indexes/transcripts -l SR  -r ../03*/fastp/D*.gz -o alignments/salmon/D -g reference/gencode.vM27.annotation.gtf --seqBias --validateMappings -p 4 
 

STAR --genomeSAsparseD 3 \
--runMode genomeGenerate \
--genomeDir 04_Mapping/alignments/star/Index \
--genomeFastaFiles 04_Mapping/reference/GRCm39.primary_assembly.genome.fa \
--sjdbGTFfile 04_Mapping/reference/gencode.vM27.annotation.gtf \
--sjdbOverhang 50 \
--outFileNamePrefix 04_Mapping/alignments/star/Index \
--runThreadN 3


STAR --genomeDir 04_Mapping/alignments/star/Index --readFilesCommand gunzip -c --readFilesIn 03_Trimming/fastp/Z.read1_fastp.fq.gz --outSAMtype BAM SortedByCoordinate --quantMode GeneCounts --outFileNamePrefix 04_Mapping/alignments/star/Z_ --outFilterMultimapNmax 1 --outReadsUnmapped unmapped_Z --runThreadN 3 --genomeSAsparseD 3





tophat  -p 4 \
-G 04_Mapping/reference/gencode.vM27.annotation.gtf \
-o 04_Mapping/alignments/tophat/D \
04_Mapping/reference/GRCm39_genome_btindex/GRCm39_genome.btindex \
03_Trimming/fastp/D.read1_fastp.fq

bowtie2-build --large-index GRCm39.genome.fa mouse_genome_GRCm39.btindex


cufflinks -p 4 --library-type fr-unstranded -o ./04_Mapping/alignments/tophat/E/cufflinks -G ./04_Mapping/reference/gencode.vM27.annotation.gtf ./04_Mapping/alignments/tophat/E/accepted_hits.bam


cufflinks -p 4 --library-type fr-unstranded -o ./04_Mapping/alignments/tophat/Z/cufflinks -G ./04_Mapping/reference/gencode.vM27.annotation.gtf ./04_Mapping/alignments/tophat/Z/Z_tophat.sam


samtools view -h 04_Mapping/alignments/tophat/Z/accepted_hits.bam > 04_Mapping/alignments/tophat/Z/Z_tophat.sam 

hisat2-build -p 4 reference/GRCm39.genome.fa alignments/hisat2/GRCm39.genome.index

hisat2 -p 4 --dta \
-x 04_Mapping/alignments/hisat2/Index/GRCm39.genome.index \
03_Trimming/skewer/F.read1.fq-trimmed.fastq \
-S 04_Mapping/alignments/hisat2/F_skewer_hisat2.sam



samtools sort -@ 4 -o E_skewer_hisat2.bam E_skewer_hisat2.sam  

 



hisat2 -p 4 --dta -x 04_Mapping/alignments/hisat2/Index/GRCm39.genome.index 03_Trimming/skewer/X.read1.fq-trimmed.fastq -S 04_Mapping/alignments/hisat2/X_skewer_hisat2.sam ; hisat2 -p 4 --dta -x 04_Mapping/alignments/hisat2/Index/GRCm39.genome.index 03_Trimming/skewer/B.read1.fq-trimmed.fastq -S 04_Mapping/alignments/hisat2/B_skewer_hisat2.sam ; hisat2 -p 4 --dta -x 04_Mapping/alignments/hisat2/Index/GRCm39.genome.index 03_Trimming/skewer/C.read1.fq-trimmed.fastq -S 04_Mapping/alignments/hisat2/C_skewer_hisat2.sam   



samtools sort -@ 4 -o F_skewer_hisat2.bam F_skewer_hisat2.sam ; samtools sort -@ 4 -o G_skewer_hisat2.bam G_skewer_hisat2.sam ; samtools sort -@ 4 -o H_skewer_hisat2.bam H_skewer_hisat2.sam ; samtools sort -@ 4 -o K_skewer_hisat2.bam K_skewer_hisat2.sam ; samtools sort -@ 4 -o M_skewer_hisat2.bam M_skewer_hisat2.sam ; samtools sort -@ 4 -o X_skewer_hisat2.bam X_skewer_hisat2.sam ; samtools sort -@ 4 -o Z_skewer_hisat2.bam Z_skewer_hisat2.sam ; samtools sort -@ 4 -o A_skewer_hisat2.bam A_skewer_hisat2.sam ; samtools sort -@ 4 -o B_skewer_hisat2.bam B_skewer_hisat2.sam ; samtools sort -@ 4 -o C_skewer_hisat2.bam C_skewer_hisat2.sam


stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/B_skewer_hisat2_vM27.gtf -l B 04_Mapping/alignments/hisat2/B_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/C_skewer_hisat2_vM27.gtf -l C 04_Mapping/alignments/hisat2/C_skewer_hisat2.bam;
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/D_fastp_hisat2_vM27.gtf -l D 04_Mapping/alignments/hisat2/D_fastp_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/E_skewer_hisat2_vM27.gtf -l E 04_Mapping/alignments/hisat2/E_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/F_skewer_hisat2_vM27.gtf -l F 04_Mapping/alignments/hisat2/F_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/G_skewer_hisat2_vM27.gtf -l G 04_Mapping/alignments/hisat2/G_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/H_skewer_hisat2_vM27.gtf -l H 04_Mapping/alignments/hisat2/H_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/K_skewer_hisat2_vM27.gtf -l K 04_Mapping/alignments/hisat2/K_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/M_skewer_hisat2_vM27.gtf -l M 04_Mapping/alignments/hisat2/M_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/X_skewer_hisat2_vM27.gtf -l X 04_Mapping/alignments/hisat2/X_skewer_hisat2.bam; 
stringtie -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/Z_skewer_hisat2_vM27.gtf -l Z 04_Mapping/alignments/hisat2/Z_skewer_hisat2.bam


stringtie --merge -p 4 -G 04_Mapping/reference/gencode.vM27.annotation.gtf -o 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf 04_Mapping/alignments/hisat2/stringtie/mergelist.txt


gffcompare -r 04_Mapping/reference/gencode.vM27.annotation.gtf -G -o 04_Mapping/alignments/hisat2/merged 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf


stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/B/B_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/B_skewer_hisat2.bam; 
stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/C/C_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/C_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/D/D_fastp_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/D_fastp_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/E/E_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/E_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/F/F_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/F_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04c_Mapping/alignments/hisat2/ballgown/G/G_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/G_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/H/H_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/H_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/K/K_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/K_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/M/M_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/M_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/X/X_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/X_skewer_hisat2.bam; stringtie -e -B -p 4 -G 04_Mapping/alignments/hisat2/stringtie/stringtie_merged.gtf -o 04_Mapping/alignments/hisat2/ballgown/Z/Z_skewer_hisat2_stringtie_ballgown.gtf 04_Mapping/alignments/hisat2/Z_skewer_hisat2.bam



> setwd("~/Desktop/rnaseq/04_Mapping/alignments/hisat2")

library(ballgown)
library(RSkittleBrewer)
library(genefilter)
library(dplyr)
library(devtools)

> pheno_data <- read.csv("geuvadis_phenodata.csv")
> bg <- ballgown(dataDir = "ballgown", samplePattern = "tspo_", pData = pheno_data)



qualimap rnaseq -pe -bam alignments/star/B/B_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC -p strand-specific-reverse --java-mem-size=4G

qualimap rnaseq -pe -bam alignments/star/C/C_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/C -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/D/D_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/D -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/E/E_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/E -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/F/F_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/F -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/G/G_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/G -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/H/H_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/H -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/K/K_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/K -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/M/M_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/M -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/X/X_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/X -p strand-specific-reverse --java-mem-size=4G; qualimap rnaseq -pe -bam alignments/star/Z/Z_Aligned.sortedByCoord.out.bam -gtf reference/gencode.vM27.annotation.gtf -outdir alignments/star/QC/Z -p strand-specific-reverse --java-mem-size=4G






paste *_ReadsPerGene.out.tab | grep -v "_" | awk '{printf "%s\t", $1}{for (i=2;i<=NF;i+=4) printf "%s\t", $i; printf "\n" }' > tmp

ls *_ReadsPerGene.out.tab | sed 's/_ReadsPerGene.out.tab//g' |awk 'BEGIN{ORS="";print "gene_name\t"}{print $0"\t"}END{print "\n"}' > header.txt

cat header.txt tmp > raw_counts_matrix.txt

rm tmp header.txt 


for i in *_ReadsPerGene.out.tab
do echo $i
cut -f1,2 $i | grep -v "_" > `basename $i ReadsPerGene.out.tab`counts.txt
done


gencode.vM27.annotation.gtf

gunzip *.gz ; awk -F "\t" 'BEGIN{OFS="\t"}{if($3=="transcript"){split($9, a, "\""); print a[4], a[2], a[8]}}' *.gtf > tx2gene.gencode.vM27.csv
