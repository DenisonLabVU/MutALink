#!/bin/bash
input="./samples.txt"
while IFS= read -r line
do
	/home/denison-thelio/bbmap/pileup.sh in=${line}_filter_nsp12.sort.bam basecov=${line}_coverage.txt delcoverage=t 32bit=t -Xmx64g
done < "$input"