#!/bin/bash
touch SARS2_RDV_amplicon_lineage1_haplotypes.txt
input="./samples_lineage1.txt"
while IFS= read -r line
do
	#All reads containing V166A
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f V166A.js ${line}_filter_nsp12.sort.bam > ${line}_V166A.sam
	samtools view -b -@ 32 ${line}_V166A.sam > ${line}_V166A.bam
	samtools sort -@ 32 -o ${line}_V166A.sort.bam ${line}_V166A.bam
	samtools index -b -@ 32 ${line}_V166A.sort.bam
	echo "Reads containing V166A for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+N198S
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f N198S.js ${line}_V166A.bam > ${line}_V166A-N198S.sam
	samtools view -b -@ 32 ${line}_V166A-N198S.sam > ${line}_V166A-N198S.bam
	samtools sort -@ 32 -o ${line}_V166A-N198S.sort.bam ${line}_V166A-N198S.bam
	samtools index -b -@ 32 ${line}_V166A-N198S.sort.bam
	echo "Reads containing V166A+N198S for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-N198S.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+N198S+S759A
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f S759A.js ${line}_V166A-N198S.bam > ${line}_V166A-N198S-S759A.sam
	samtools view -b -@ 32 ${line}_V166A-N198S-S759A.sam > ${line}_V166A-N198S-S759A.bam
	samtools sort -@ 32 -o ${line}_V166A-N198S-S759A.sort.bam ${line}_V166A-N198S-S759A.bam
	samtools index -b -@ 32 ${line}_V166A-N198S-S759A.sort.bam
	echo "Reads containing V166A+N198S+S759A for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-N198S-S759A.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+N198S+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_V166A-N198S.bam > ${line}_V166A-N198S-C799F.sam
	samtools view -b -@ 32 ${line}_V166A-N198S-C799F.sam > ${line}_V166A-N198S-C799F.bam
	samtools sort -@ 32 -o ${line}_V166A-N198S-C799F.sort.bam ${line}_V166A-N198S-C799F.bam
	samtools index -b -@ 32 ${line}_V166A-N198S-C799F.sort.bam
	echo "Reads containing V166A+N198S+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-N198S-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+N198S+S759A+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_V166A-N198S-S759A.bam > ${line}_V166A-N198S-S759A-C799F.sam
	samtools view -b -@ 32 ${line}_V166A-N198S-S759A-C799F.sam > ${line}_V166A-N198S-S759A-C799F.bam
	samtools sort -@ 32 -o ${line}_V166A-N198S-S759A-C799F.sort.bam ${line}_V166A-N198S-S759A-C799F.bam
	samtools index -b -@ 32 ${line}_V166A-N198S-S759A-C799F.sort.bam
	echo "Reads containing V166A+N198S+S759A+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-N198S-S759A-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+S759A
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f S759A.js ${line}_V166A.bam > ${line}_V166A-S759A.sam
	samtools view -b -@ 32 ${line}_V166A-S759A.sam > ${line}_V166A-S759A.bam
	samtools sort -@ 32 -o ${line}_V166A-S759A.sort.bam ${line}_V166A-S759A.bam
	samtools index -b -@ 32 ${line}_V166A-S759A.sort.bam
	echo "Reads containing V166A+S759A for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-S759A.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+S759A+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_V166A-S759A.bam > ${line}_V166A-S759A-C799F.sam
	samtools view -b -@ 32 ${line}_V166A-S759A-C799F.sam > ${line}_V166A-S759A-C799F.bam
	samtools sort -@ 32 -o ${line}_V166A-S759A-C799F.sort.bam ${line}_V166A-S759A-C799F.bam
	samtools index -b -@ 32 ${line}_V166A-S759A-C799F.sort.bam
	echo "Reads containing V166A+S759A+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-S759A-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing V166A+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_V166A.bam > ${line}_V166A-C799F.sam
	samtools view -b -@ 32 ${line}_V166A-C799F.sam > ${line}_V166A-C799F.bam
	samtools sort -@ 32 -o ${line}_V166A-C799F.sort.bam ${line}_V166A-C799F.bam
	samtools index -b -@ 32 ${line}_V166A-C799F.sort.bam
	echo "Reads containing V166A+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_V166A-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing N198S
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f N198S.js ${line}_filter_nsp12.sort.bam > ${line}_N198S.sam
	samtools view -b -@ 32 ${line}_N198S.sam > ${line}_N198S.bam
	samtools sort -@ 32 -o ${line}_N198S.sort.bam ${line}_N198S.bam
	samtools index -b -@ 32 ${line}_N198S.sort.bam
	echo "Reads containing N198S for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_N198S.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing N198S+S759A
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f S759A.js ${line}_N198S.bam > ${line}_N198S-S759A.sam
	samtools view -b -@ 32 ${line}_N198S-S759A.sam > ${line}_N198S-S759A.bam
	samtools sort -@ 32 -o ${line}_N198S-S759A.sort.bam ${line}_N198S-S759A.bam
	samtools index -b -@ 32 ${line}_N198S-S759A.sort.bam
	echo "Reads containing N198S+S759A for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_N198S-S759A.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing N198S+S759A+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_N198S-S759A.bam > ${line}_N198S-S759A-C799F.sam
	samtools view -b -@ 32 ${line}_N198S-S759A-C799F.sam > ${line}_N198S-S759A-C799F.bam
	samtools sort -@ 32 -o ${line}_N198S-S759A-C799F.sort.bam ${line}_N198S-S759A-C799F.bam
	samtools index -b -@ 32 ${line}_N198S-S759A-C799F.sort.bam
	echo "Reads containing N198S+S759A+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_N198S-S759A-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing N198S+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_N198S.bam > ${line}_N198S-C799F.sam
	samtools view -b -@ 32 ${line}_N198S-C799F.sam > ${line}_N198S-C799F.bam
	samtools sort -@ 32 -o ${line}_N198S-C799F.sort.bam ${line}_N198S-C799F.bam
	samtools index -b -@ 32 ${line}_N198S-C799F.sort.bam
	echo "Reads containing N198S+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_N198S-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing S759A
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f S759A.js ${line}_filter_nsp12.sort.bam > ${line}_S759A.sam
	samtools view -b -@ 32 ${line}_S759A.sam > ${line}_S759A.bam
	samtools sort -@ 32 -o ${line}_S759A.sort.bam ${line}_S759A.bam
	samtools index -b -@ 32 ${line}_S759A.sort.bam
	echo "Reads containing S759A for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_S759A.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing S759A+C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_S759A.bam > ${line}_S759A-C799F.sam
	samtools view -b -@ 32 ${line}_S759A-C799F.sam > ${line}_S759A-C799F.bam
	samtools sort -@ 32 -o ${line}_S759A-C799F.sort.bam ${line}_S759A-C799F.bam
	samtools index -b -@ 32 ${line}_S759A-C799F.sort.bam
	echo "Reads containing S759A+C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_S759A-C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	#All reads containing C799F
	java -jar /home/denison-thelio/jvarkit/dist/samjdk.jar -f C799F.js ${line}_filter_nsp12.sort.bam > ${line}_C799F.sam
	samtools view -b -@ 32 ${line}_C799F.sam > ${line}_C799F.bam
	samtools sort -@ 32 -o ${line}_C799F.sort.bam ${line}_C799F.bam
	samtools index -b -@ 32 ${line}_C799F.sort.bam
	echo "Reads containing C799F for " ${line} ":" >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	samtools idxstats ${line}_C799F.sort.bam >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
	echo >> SARS2_RDV_amplicon_lineage1_haplotypes.txt
done < "$input"