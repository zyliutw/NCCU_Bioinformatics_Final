#!/bin/bash
for i in $(ls ./fastq)
do
    hisat -x ./bt/dmel --sensitive-local --reorder -p 40 -U ./fastq/${i} -S ./sam/${i%.*}.sam
done
