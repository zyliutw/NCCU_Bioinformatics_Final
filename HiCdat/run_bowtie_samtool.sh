#!/bin/sh

for i in $(ls ./fasta)
do
	bowtie2 --no-unal -x ./fasta_index/build_fasta -U ./fastq/${i} | samtools-1.3.1/samtools view -bS > ./bam/${i%.*}.bam
done
