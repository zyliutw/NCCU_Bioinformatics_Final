Finished with HiC-Explorer
=========================

[Reference: Hic-Explorer](http://hicexplorer.readthedocs.io/en/latest/index.html)

###Pre-install
[Python2.7](https://www.python.org)<br>
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
```
sh ./download_fastq.sh
```

###Step2 
Download fasta, Decompress, filter it (It will create fasta folder)
```
sh ./download_fasta.sh
```

###Step3
Generate .bt for hisat tool
```
hisat-build -f ./fasta/fasta_filtered.fasta ./bt/deml
```

###Step4
Using hisat to align
```
sh align_with_hisat.sh
```

###Step5
Using hicBuildMatrix to establish matrix
```
sh establish_matrix.sh
```

###Step6
Merge matrix
```
hicSumMatrices -m $(ls ./matrix) -o ./merged.matrix.npz
```

###Step7
Correct matrix
```
hicCorrectMatrix correct --chromosomes 2L 2R 3L 3R 4 X -m ./merged.matrix.npz -o deml.Corrected.npz
```


###Step8
Generage png
```
hicPlotMatrix --log1p --dpi 300 –m ./dmel.Corrected.npz --chromosomeOrder 2L 2R 3L 3R 4 X -o ./output/dmel.png
```

