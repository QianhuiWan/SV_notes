#!/bin/bash

## Qianhui Wan (qianhui.wan@flinders.edu.au)
## 2021-01-09
## Standard ENCODE pipeline was used for our WGBS data (Flinders HPC)
## https://github.com/ENCODE-DCC/wgbs-pipeline
## clone the pipeline using
## $ git clone https://github.com/ENCODE-DCC/wgbs-pipeline

## Step1: Load modules to install Caper

module load Java/11.0.2
module load python2
module load python36
module load python/3.8 ## This version is python3.8
## Then install Caper using:
pip install caper
## Check Caper installed or not:
caper
## Inotialise Caper in slurm backend:
caper init slurm
## edit the default.conf file in /home/wan1722/.caper directory
## Attention: we need to chage to our output directory first and then run caper.

## GitHub: https://github.com/ENCODE-DCC/caper
## Caper is a python wrapper for Cromwell and
## Cromwell is an open-source Workflow Management System for bioinformatics

## workflow
## (1) Run fastqc for all fastq files (WGBS data of 4 samples)
## (2) Mapping of reads: Bismark.
## mapping bisulfite sequencing reads against a Bismark transformed genome
## Bismark-transformed, Bowtie-indexed genome is needed

# Runing workflow

## Prepare input.json file

cat << EOF > input.json
{
  "wgbs.extra_reference": "tests/data/conversion_control.fa.gz",
  "wgbs.fastqs": [
    [
      [
        "tests/data/sample5_data_1_200000.fastq.gz",
        "tests/data/sample5_data_2_200000.fastq.gz"
      ]
    ]
  ],
  "wgbs.reference": "tests/data/sacCer3.fa.gz",
  "wgbs.underconversion_sequence_name": "NC_001416.1"
}
EOF

## Use Caper to run the WDL workflow (better to run caper in slurm format)

caper run wgbs-pipeline.wdl -i input.json -m wgbs_testrun_metadata.json
