
Normally, HPC is used for data pre-processing since the raw data is very large
(~ 100 GB or more for each sample) and need more RAM to process. Large data may
be stored in cloud or in HPC (data storage part of a HPC).

Bash is the command language that is normally used for pre-processing. But there
are also tools from packages written with python, R, Java or purl.

There are handy integrated development environment (IDE), e.g. PyCharm for
python and RStudio for R. But in HPC linux system, IDE is a bit hard to
achieve. Using virtual machine in HPC could probably allow us to use IDE.

We can start with some useful bash commands (execute these commands in
terminal):

# Useful bash commands

+ Where am I?
  - pwd

+ Change directory
  - cd
  - cd ~/data

+ Move up one level
  - cd ..

+ List files in folder
  - ls
  - ls -llt (list files according to time modified)

+ Look at a file
  - less fileName

+ Copy a file
  - cp ~/data/file ~/otherdir/

+ Delete a file
  - rm fileName

+ Delete a directory
  - rmdir ~/dirName/

+ Move a file
  - mv ~/data/file~ /otherdir/file

+ Secure copy
  - scp user@host1:dir/file user@host2:dir/file

+ Compress a file
  - Compress:
    - gzip –c file > file.gz
    - we can also use `pigz` tool to zip files:
      - % brew install pigz
      - % pigz fileName  #this command compress the file to zip format
  - Decompress:
    - gunzip file.gz
    - unpigz file.gz
**pigz tool is quicker than gzip tool in both compression and decompression**

+ Make a new folder
  - mkdir data2

+ Current directory
  - ./

+ Home directory
  - ~/

+ Count lines in a file
  - wc –l fileName

+ Check how to use function in bash
  - man functionXXX
  - functionXXX -help

# Start from `fastq` files, pre-alignment

+ Demultiplexing

+ Raw sequencing QC (FastQC)

+ Adapter trimming (e.g. TrimGalore for WGBS data)

+ Skills needed:

  - Need to know how to write bash scripts

  - Run bash scripts in HPC (SLURM)

# Alignment

+ Align `fastq` files to reference genome and output`.bam` files

+ Find the best aligner by reading related publications. If time allowed, you
can test and compare the aligners using your data.

# Post-alignment

+ Methylation calling

+ CNV calling for CNV analysis
