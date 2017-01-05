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

Step1 Download fastq and Decompress (It will create fastq folder)
```sh
sh ./download_fastq.sh
```


Step2 Download fasta, Decompress, filter it (It will create fasta folder)
```sh
sh ./download_fasta.sh
```

Step3 Use Bowtie2 to build index
```sh
bowtie2-build ./fasta/fasta_filtered.fasta ./fasta_index/build_fasta
```

Step4 Use Bowtie2 and Samtool to generate .BAM
```sh
sh run_bowtie_samtool.sh
```

Step5 Use HiCdatPre to merge BAM files<br>
Step6 Use HiCdatPre to generate fragments (Set binsize : 100000) ex: ./fasta_fra.txt</br>
Step7 Use HiCdatPre to generate map read-pairs to fragments ex ./Data/<br>
Step8 Use HiCdatPre to generate R-source file containing basic genome information of organism<br>ex ./Rscripts/organism-specific_R-code.R)</br>

Step9 Fix the path and the file names in the Rscript/HiCdat-Result.R <br>
Step10 Run
```sh
Rscript ./Rscript/HiCdat-Result.R
```

