#!/bin/bash
input="./samples_nanopolish.txt"
while IFS= read -r line
do
	candidate="./SARSCoV2_nsp12_candidate.vcf"
	genome="./SARSCoV2.fasta"
	window="MT020881.1:13442-16236"
	/home/denison-thelio/nanopolish/nanopolish index -d /var/lib/minknow/data/SARS2_RDV_nsp12_amplicon/pooled_amplicons/20210728_2034_MN34196_FAQ51597_b522c81e/fast5/ -s /var/lib/minknow/data/SARS2_RDV_nsp12_amplicon/pooled_amplicons/20210728_2034_MN34196_FAQ51597_b522c81e/sequencing_summary_FAQ51597_2d160373.txt ${line}_pass.fastq
	/home/denison-thelio/nanopolish/nanopolish variants -t 32 --snps --window ${window} -p 1 --genotype ${candidate} -c ${candidate} -o ${line}_nanopolish.vcf --bam ${line}_filter_nsp12.sort.bam --genome ${genome} --reads ${line}_pass.fastq
done < "$input"