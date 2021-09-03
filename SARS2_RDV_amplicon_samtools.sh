#!/bin/bash
input="./samples.txt"
while IFS= read -r line
do
	/home/denison-thelio/bbmap/reformat.sh in=${line}_nsp12.bam out=${line}_filter_nsp12.bam ref=SARSCoV2_virema.fasta minlength=3250 maxlength=3400
	samtools sort -@ 32 -o ${line}_filter_nsp12.sort.bam ${line}_filter_nsp12.bam
	samtools index -b ${line}_filter_nsp12.sort.bam
	echo "Alignment statistics for " ${line} " (total):" >> SARS2_RDV_amplicon_minimap2_align.txt
	samtools idxstats ${line}.sort.bam >> SARS2_RDV_amplicon_minimap2_align.txt
	echo >> SARS2_RDV_amplicon_minimap2_align.txt
	echo "Alignment statistics for " ${line} " (nsp12):" >> SARS2_RDV_amplicon_minimap2_align.txt
	samtools idxstats ${line}_filter_nsp12.sort.bam >> SARS2_RDV_amplicon_minimap2_align.txt
	echo >> SARS2_RDV_amplicon_minimap2_align.txt
done < "$input"