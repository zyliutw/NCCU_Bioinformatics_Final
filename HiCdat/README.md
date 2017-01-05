Finish by HiCdat tool
=========================

[Reference: HiCdat](https://github.com/MWSchmid/HiCdat)

Pre-install:

[R](https://www.r-project.org/)</br>
[Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)</br>
[Samtools](http://samtools.sourceforge.net/)</br>
[HiCdatPre Binary for mac 64bit](https://github.com/MWSchmid/HiCdat/blob/master/other/mac_64bit.zip?raw=true)</br>
[HiCdatPre Binary windows 7 64bit](https://github.com/MWSchmid/HiCdat/blob/master/other/windows_64bit.zip?raw=true)</br>
[HiCdatPre Binary linux 64bit (need Qt4 lib)](https://github.com/MWSchmid/HiCdat/blob/master/other/linux_64bit.zip?raw=true)</br>

HiCdatR requires the R libraries "gplots", "randomizeBE", "MASS", and "HiCseg". You can install them with:
```r
install.packages(c("gplots", "randomizeBE", "MASS"))
source("http://bioconductor.org/biocLite.R")
biocLite("HiCseg")

install.packages("/path/to/HiCdatR_0.99.0.tar.gz", repos=NULL, type = "source")
```


Download Project
```
git clone https://github.com/yad50968/NCCU_Bioinformatics_Final.git
cd NCCU_Bioinformatics_Final
```

1. Download fastq and Decompress (It will create fastq folder)
```sh
sh ./download_fastq.sh
```


2. Download fasta, Decompress, filter it (It will create fasta folder)
```sh
sh ./download_fasta.sh
```

3. Use Bowtie2 to build index
```sh
bowtie2-build ./fasta/fasta_filtered.fasta ./fasta_index/build_fasta
```

4. Use Bowtie2 and Samtool to generate .BAM
```sh
sh run_bowtie_samtool.sh
```

5. Use HiCdatPre to merge BAM files
6. Use HiCdatPre to generate fragments 輸入 fasta_filtered.fasta 產生 fragments (設定binsize : 100000) ex: ./fasta_fra.txt
7. Use HiCdatPre to generate map read-pairs to fragments  輸入 第五步＆第六步產生的資料 產生 map read-pairs to fragments 資料 (HiCdat library所需要資料,7組, 取給R用的檔案放到./Data)
8. Use HiCdatPre to generate R-source file containing basic genome information of organism   輸入 ./fasta/fasta_filtered.fasta 產生 R-source file containing basic genome information of organism (HiCata library所需要, ex ./Rscripts/organism-specific_R-code.R)

9. Fix the path and the file names in the Rscript/HiCdat-Result.R 
10. Run
```sh
Rscript ./Rscript/HiCdat-Result.R
```

