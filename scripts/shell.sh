#110615
#keywords used to search human metatranscriptome data
#METATRANSCRIPTOMIC human PAIRED 

#download http://www.ncbi.nlm.nih.gov/Traces/sra/?run=ERR348421
#Bioproject	SRA Study	Title
#PRJEB4673	ERP003984	Next Generation Sequencing approaches such as Illumnia HiSeq2000 and 454 were used to study diversity and gene expression profiles in human oral biofilms.
#Hide abstract
#Micro-organisms inhabiting teeth surfaces grow on biofilms where a specific and complex succession of bacteria has been described by co-aggregation tests and DNA-based studies. Although the composition of oral biofilms is well established, the active portion of the bacterial community and the patterns of gene expression in vivo have not been studied. Using RNA-sequencing technologies, we present the first metatranscriptomic study of human dental plaque, performed by two different approaches: (1) A short-reads, high-coverage approach by Illumina sequencing to characterize the gene activity repertoire of the microbial community during biofilm development; (2) A long-reads, lower-coverage approach by pyrosequencing to determine the taxonomic identity of the active microbiome before and after a meal ingestion. The high-coverage approach allowed us to analyze over 398 million reads, revealing that microbial communities are individual-specific and no bacterial species was detected as key player at any time during biofilm formation. We could identify some gene expression patterns characteristic for early and mature oral biofilms. The transcriptomic profile of several adhesion genes was confirmed through qPCR by measuring expression of fimbriae-associated genes. In addition to the specific set of gene functions overexpressed in early and mature oral biofilms, as detected through the short-reads dataset, the long-reads approach detected specific changes when comparing the metatranscriptome of the same individual before and after a meal, which can narrow down the list of organisms responsible for acid production and therefore potentially involved in dental caries.

#ERX321257: Illumina HiSeq 2000 sequencing
#1 ILLUMINA (Illumina HiSeq 2000) run: 17M spots, 819.7M bases, 576.8Mb downloads
#
#Submitted by: Center for Public Health Research, University of Valencia (Center for Public Health Research, University of V)
#Study: Next Generation Sequencing approaches such as Illumnia HiSeq2000 and 454 were used to study diversity and gene expression profiles in human oral biofilms.
#PRJEB4673 • ERP003984 • All experiments • All runs
#show Abstract
#Sample: Homo sapiens; human oral biofilm
#SAMEA2239912 • ERS353341 • All experiments • All runs
#Organism: Homo sapiens
#Library:
#Name: 10674
#Instrument: Illumina HiSeq 2000
#Strategy: RNA-Seq
#Source: METATRANSCRIPTOMIC
#Selection: size fractionation
#Layout: SINGLE
#Runs: 1 run, 17M spots, 819.7M bases, 576.8Mb
#Run	# of Spots	# of Bases	Size	Published
#ERR348421	16,999,993	819.7M	576.8Mb	2013-10-16
#
#ID: 515034


# download ERR348421 and get fastq file
#/home/unix/wcchou/gsapWenChi/bin/sratoolkit.2.5.2-centos_linux64/bin/fastq-dump --outdir ./home/unix/wcchou/gsapWenChi/ncbi/public/sra/ERR348421.sra /home/unix/wcchou/gsapWenChi/ncbi/public/sra/ERR348421.fastq
fastqDataPath="/home/unix/wcchou/gsapWenChi/ncbi/public/sra/ERR348421.fastq"

cd /home/unix/wcchou/gsapWenChi/projects/MetatranscriptomeAnnotation/data
#111315
usearch="/home/unix/wcchou/gsapWenChi/bin/usearch8.0.1623_i86linux32"
uparseFun="/home/unix/wcchou/gsapWenChi/stamps/uparse"

$usearch -fastq_filter ${fastqDataPath} -fastaout ./filtered.fa -fastq_maxee 0.5
#00:50  50Mb  100.0% Filtering, 86.4% passed
#  16999993  FASTQ recs (17.0M)             
#   2312072  Low qual recs discarded (expected errs > 0.50)
#  14687921  Converted (14.7M, 86.4%)

$usearch -derep_fulllength filtered.fa -fastaout derep.fa -sizeout
#---Fatal error---
#Memory limit of 32-bit process exceeded, 64-bit build required

#$usearch -sortbysize derep.fa -fastaout sorted.min2.fa -minsize 2

#$usearch -cluster_otus sorted.min2.fa -otus otu_reps.init.fa -uparseout otu_reps.init.up -relabel OTU_ -sizein -sizeout



grep -c ">" filtered.fa 
14687921
grep -c ">" derep.fa 
1441118
grep -c ">" sorted.min2.fa 
449489
grep -c ">consensus" s.U.msaout 
7972















