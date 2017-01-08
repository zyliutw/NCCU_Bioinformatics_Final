Finish by HiC-Explorer
=========================

[Reference: Hic-Explorer](http://hicexplorer.readthedocs.io/en/latest/index.html)

###Pre-install
[Python2.7](https://www.python.org)
[hisat](http://www.ccb.jhu.edu/software/hisat/index.shtml)

###Install

Using [conda](https://github.com/conda/conda)
```sh
conda install -c bioconda hicexplorer=0.1
```

###Download Project
```
git clone https://github.com/yad50968/NCCU_Bioinformatics_Final.git
cd NCCU_Bioinformatics_Final/Hic-Explorer/
```

###Step1 
Download fastq and Decompress (It will create fastq folder)<br>
About need 150GB
```sh
sh ./download_fastq.sh
```

###Step2 
Download fasta, Decompress, filter it (It will create fasta folder)
```sh
sh ./download_fasta.sh
```

###Step3
Generate .bt for hisat tool
```sh
hisat-build -f ./fasta/fasta_filtered.fasta deml
```

###Step4
Using hisat to align
```sh
sh align_with_hisat.sh
```

###Step5
Using hicBuildMatrix to establish matrix
```
sh establish matrix
```

###Step6
Merge matrix

###Step7
Correct matrix

###Step8
Generage png










