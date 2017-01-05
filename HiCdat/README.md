使用 HiCdat 工具完成

參考：
https://github.com/MWSchmid/HiCdat

先安裝
R : https://www.r-project.org/
Bowtie2 : http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
samtools : http://samtools.sourceforge.net/

HiCdatPre 
	for mac 64bit
		https://github.com/MWSchmid/HiCdat/blob/master/other/mac_64bit.zip?raw=true
	for windows 7 64bit
		https://github.com/MWSchmid/HiCdat/blob/master/other/windows_64bit.zip?raw=true
	for linux 64bit (need Qt4 lib)
		https://github.com/MWSchmid/HiCdat/blob/master/other/linux_64bit.zip?raw=true

HiCdatR requires the R libraries "gplots", "randomizeBE", "MASS", and "HiCseg". You can install them with:

install.packages(c("gplots", "randomizeBE", "MASS"))
source("http://bioconductor.org/biocLite.R")
biocLite("HiCseg")

install.packages("/path/to/HiCdatR_0.99.0.tar.gz", repos=NULL, type = "source")




git clone https://github.com/yad50968/NCCU_Bioinformatics_Final.git
cd NCCU_Bioinformatics_Final


1. 下載 7組 fastq and 解壓縮
sh ./download_fastq.sh



2. 下載 fasta /解壓縮 /filter沒有用的資料
sh ./download_fasta.sh

3. 透過 Bowtie2 建立 index
bowtie2-build ./fasta/fasta_filtered.fasta ./fasta_index/build_fasta

4. 透過 Bowtie2 & samtool 產生 7組 bam檔 
sh run_bowtie_samtool.sh

5. 透過 HiCdatPre 將 bam 檔 merge
6. 透過 HiCdatPre 輸入 fasta_filtered.fasta 產生 fragments (設定binsize : 100000) ex: ./fasta_fra.txt
7. 透過 HiCdatPre 輸入 第五步＆第六步產生的資料 產生 map read-pairs to fragments 資料 (HiCdat library所需要資料,7組, 取給R用的檔案放到./Data)
8. 透過 HiCdatPre 輸入 ./fasta/fasta_filtered.fasta 產生 R-source file containing basic genome information of organism (HiCata library所需要, ex ./Rscripts/organism-specific_R-code.R)

9. 修改 Rscript/HiCdat-Result.R 中的路徑以及檔案名稱
10. Rscript ./Rscript/HiCdat-Result.R

