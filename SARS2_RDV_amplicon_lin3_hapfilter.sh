#!/bin/bash
touch SARS2_RDV_amplicon_lineage3_haplotypes.txt
input="./samples_lineage3.txt"
while IFS= read -r line
do
	#All reads containing V792I
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f V792I.js ${line}_filter_nsp12.sort.bam > ${line}_V792I.sam
	samtools view -b -@ 32 ${line}_V792I.sam > ${line}_V792I.bam
	samtools sort -@ 32 -o ${line}_V792I.sort.bam ${line}_V792I.bam
	samtools index -b -@ 32 ${line}_V792I.sort.bam
	echo "Reads containing V792I for " ${line} ":" >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	samtools idxstats ${line}_V792I.sort.bam >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing S759I
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f S759A.js ${line}_filter_nsp12.sort.bam > ${line}_S759A.sam
	samtools view -b -@ 32 ${line}_S759A.sam > ${line}_S759A.bam
	samtools sort -@ 32 -o ${line}_S759A.sort.bam ${line}_S759A.bam
	samtools index -b -@ 32 ${line}_S759A.sort.bam
	echo "Reads containing S759A for " ${line} ":" >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	samtools idxstats ${line}_S759A.sort.bam >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing S759I+V792I
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f V792I.js ${line}_S759A.bam > ${line}_S759A-V792I.sam
	samtools view -b -@ 32 ${line}_S759A-V792I.sam > ${line}_S759A-V792I.bam
	samtools sort -@ 32 -o ${line}_S759A-V792I.sort.bam ${line}_S759A-V792I.bam
	samtools index -b -@ 32 ${line}_S759A-V792I.sort.bam
	echo "Reads containing S759A+V792I for " ${line} ":" >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	samtools idxstats ${line}_S759A-V792I.sort.bam >> SARS2_RDV_amplicon_lineage3_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
done < "$input"