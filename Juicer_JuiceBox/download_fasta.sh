#!/bin/sh

URL=ftp://ftp.flybase.net/releases/FB2016_05/dmel_r6.13/fasta/dmel-all-chromosome-r6.13.fasta.gz

wget -O - --header="Accept-Encoding: gzip" $URL -nd -P ./fasta | gunzip > ./fasta/fasta.fasta

sed -e '1673517,$d' ./fasta/fasta.fasta > ./fasta/fasta_filtered.fasta
