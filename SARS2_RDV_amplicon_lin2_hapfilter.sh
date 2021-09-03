#!/bin/bash
touch SARS2_RDV_amplicon_lineage2_haplotypes.txt
input="./samples_lineage2.txt"
while IFS= read -r line
do
	#All reads containing C799R
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799R.js ${line}_filter_nsp12.sort.bam > ${line}_C799R.sam
	samtools view -b -@ 32 ${line}_C799R.sam > ${line}_C799R.bam
	samtools sort -@ 32 -o ${line}_C799R.sort.bam ${line}_C799R.bam
	samtools index -b -@ 32 ${line}_C799R.sort.bam
	echo "Reads containing C799R for " ${line} ":" >> SARS2_RDV_amplicon_lineage2_haplotypes.txt
	samtools idxstats ${line}_C799R.sort.bam >> SARS2_RDV_amplicon_lineage2_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
done < "$input"