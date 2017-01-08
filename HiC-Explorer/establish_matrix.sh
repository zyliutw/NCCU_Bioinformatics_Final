#!/bin/bash

for i in $(ls ./sam | cut -d_ -f 1|  sort -u)
do
    hicBuildMatrix -s ./sam/{i}_1.sam ./sam/{i}_2.sam -bs 100000 -seq GATC -b ./bam/{i}.bam -o ./matrix/{i}.matrix
done
    
