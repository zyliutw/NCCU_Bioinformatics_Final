#!/bin/sh


URL=ftp://ftp.ddbj.nig.ac.jp/ddbj_database/dra/fastq/SRA048/SRA048653/SRX111555/

wget -A "*_*" -r $URL -nd -P ./fastq

bzip2 -d ./fastq