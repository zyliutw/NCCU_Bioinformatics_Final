Finish by Juicer / JuiceBox
=========================

###Reference:

[JuiceBox](http://aidenlab.org/juicebox/)
[Juicer](http://aidenlab.org/juicer/docs.html)

###Pre-install
[Burrows-Wheeler Aligner](http://bio-bwa.sourceforge.net)


###Download Project
```
git clone https://github.com/yad50968/NCCU_Bioinformatics_Final.git
cd NCCU_Bioinformatics_Final/Juicer_JuiceBox/
```

##You have do 7 times

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

###Step6
Run
```
./juicer.sh -z ./fasta/fasta_filtered.fasta -p ./chrom.sizes -y ./DpnII.txt -g dm3
```

###Step7
You have to add *_abnorm.sam in the ./split</br>
It may be new issue...
```
cp ./tmp_abnorm.sam
```

###Step8
Move *.hic to other directory and change file name
```
mv ./aligned/inter.hic ./out_hic/{times}.hic


###Step9
Remove ./splits ./aligned
```
rm -rf ./splits ./aligned
```


---------------

###Juicebox
After finish above steps<br>
Open juicebox with all the .hic files in the out_hic directory




