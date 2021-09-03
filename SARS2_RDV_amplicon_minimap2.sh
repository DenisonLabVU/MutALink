#!/bin/bash
touch SARS2_RDV_amplicon_minimap2_align.txt
touch SARS2_nsp12.bed
echo "MT020881.1	13441	13442" >> SARS2_nsp12.bed
echo "MT020881.1	16236	16237" >> SARS2_nsp12.bed
input="./samples.txt"
while IFS= read -r line
do
	cat ${line}/*fastq > ${line}_pass.fastq
	minimap2 -ax map-ont SARSCoV2_virema.fasta ${line}_pass.fastq > ${line}.sam
	samtools view -@ 32 -b ${line}.sam > ${line}.bam
	samtools view -@ 32 -b -L SARS2_nsp12.bed ${line}.bam > ${line}_nsp12.bam
	samtools sort -@ 32 -o ${line}.sort.bam ${line}.bam
	samtools sort -@ 32 -o ${line}_nsp12.sort.bam ${line}_nsp12.bam
	samtools index -b ${line}.sort.bam
	samtools index -b ${line}_nsp12.sort.bam
	echo "Alignment statistics for " ${line} " (total):" >> SARS2_RDV_amplicon_minimap2_align.txt
	samtools idxstats ${line}.sort.bam >> SARS2_RDV_amplicon_minimap2_align.txt
	echo >> SARS2_RDV_amplicon_minimap2_align.txt
		echo "Alignment statistics for " ${line} " (nsp12):" >> SARS2_RDV_amplicon_minimap2_align.txt
	samtools idxstats ${line}_nsp12.sort.bam >> SARS2_RDV_amplicon_minimap2_align.txt
	echo >> SARS2_RDV_amplicon_minimap2_align.txt
done < "$input"