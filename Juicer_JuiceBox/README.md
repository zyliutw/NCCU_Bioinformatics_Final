Finished with Juicer / JuiceBox
=========================

###Reference:

[JuiceBox](http://aidenlab.org/juicebox/)
[Juicer](http://aidenlab.org/juicer/docs.html)

###Pre-install
[Burrows-Wheeler Aligner](http://bio-bwa.sourceforge.net)
[CUDA](https://developer.nvidia.com/cuda-downloads)

###For MacOSX
You have to use gawk instead of awk
```
brew install gawk
alias awk gawk
```

--------------------------
##Pre

###Download Project
```
git clone https://github.com/yad50968/NCCU_Bioinformatics_Final.git
cd NCCU_Bioinformatics_Final/Juicer_JuiceBox/
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
Generate chrom size file<br>
Note : split with tab<br>
ex : chrom.sizes file

###Step4
Generate BWA index<br>
Note : bwa index files must be in the same directory with reference genome file (.fasta)
```
bwa index ./fasta/fasta_filtered.fasta bwa.index
```

###Step5
Generate restriction sites in genome
```
python ./misc/generate_site_positions.py DpnII ./DpnII.txt ./fasta/fasta_filtered.fasta
```

###Step6
Make /opt directory
```
sudo mkdir /opt
sudo cp -r ./scripts /opt
```

--------------------
##Run with juicer

###Step1
Rename .fastq file and move it the ./fastq<br>
```
cp ./all_fastq/SRR389762_1.fastq ./fastq/SRR389762_R1.fastq
cp ./all_fastq/SRR389762_2.fastq ./fastq/SRR389762_R2.fastq
cp ./all_fastq/SRR389763_1.fastq ./fastq/SRR389763_R1.fastq
....
```

###Step2
Run
```
./juicer.sh -z ./fasta/fasta_filtered.fasta -p ./chrom.sizes -y ./DpnII.txt -g dm3
```

###Step3
You have to add *_abnorm.sam in the ./split after you run juicer.sh</br>
It may be new issue...
```
cp ./tmp_abnorm.sam
```



---------------

###Juicebox
After finish above steps<br>
Open juicebox with the .hic files in the /aligned directory




