#!/bin/bash

## Qianhui Wan (qianhui.wan@flinders.edu.au)
## 2021-01-09
## Standard ENCODE pipeline was used for our WGBS data (Flinders HPC)
## https://github.com/ENCODE-DCC/wgbs-pipeline
## clone the pipeline using 
## $ cd /home/wan1722
## $ git clone https://github.com/ENCODE-DCC/wgbs-pipeline

### Setup for parameters for SLURM. Use `#SBATCH`, we can difine job name etc.
#SBATCH --job-name=WGBS_test
#SBATCH --mail-user=qianhui.wan@flinders.edu.au
#SBATCH --mail-type=ALL

#SBATCH --output=/home/wan1722/sbatch_output/%x-%j.out.txt
#SBATCH --error=/home/wan1722/sbatch_output/%x-%j.err.txt

#SBATCH --partition=hpc_general
#SBATCH --time=0-01:00:00

#SBATCH --ntasks=1
#SBATCH --mem=12G
#SBATCH --gres="gpu:0"

## Step1: Load modules to install Caper

module load Java/11.0.2
module load python2
module load python36
module load python/3.8 ## This version is python3.8
## Then install Caper using: 
# pip install caper
## Check Caper installed or not: 
# caper
## Inotialise Caper in slurm backend becuase I will use 
## Flinders HPC for these data: 
# caper init slurm
## edit the default.conf file in /home/wan1722/.caper directory

## GitHub: https://github.com/ENCODE-DCC/caper
## Caper is a python wrapper for Cromwell and 
## Cromwell is an open-source Workflow Management System for bioinformatics

## Workflow
## (1) Run fastqc for all fastq files (WGBS data of 4 samples)
## (2) Mapping of reads: Bismark. 
## mapping bisulfite sequencing reads against a Bismark transformed genome
## Bismark-transformed, Bowtie-indexed genome is needed
## (3) genBS for alignment
## (4) Bsmooth for smmoting CpG methylation values
## Attention: Before we run caper, we need to chage to our output directory 
## first (change to a directory where you want to put your results in).


# Runing workflow

## Prepare input.json file
cd /home/wan1722/wgbs-pipeline

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

## Use Caper to run the WDL workflow (use SLURM)
cd /scratch/user/wan1722/qianhui_RA/WGBS_placenta/output
caper run wgbs-pipeline.wdl -i input.json -m wgbs_testrun_metadata.json

## Submit a Caper leader job for caper run to SLURM. Define or skip a 
## SLURM account -A [SLURM_ACCOUNT] or a SLURM partition -p [SLURM_PARTITON] 
## according to your SLURM's configuration. 
## Make sure that those parameters match with whatever defined 
## (slurm-account or slurm-partition in ~/.caper/default.conf) in Caper's 
## configuration file. -J [JOB_NAME] is to identify Caper's leader job for 
## each workflow. Make a separate directory for each workflow output will be 
## written to each directory.
# sbatch -A wan1722 -p hpc_general -J WGBS_test --export=ALL --mem 3G -t 4-0 --wrap "caper run wgbs-pipeline.wdl -i input.json"

## Inspecting output from WGBS workflow

## Rather than needing to dig through the highly nested Cromwell output 
## directories or complex JSON metadata, Croo can be used to generate a more 
## legible HTML table of paths to outputs. To invoke croo, run the following, 
## passing a Cromwell metadata JSON file as input:

# croo "${PATH_TO_METADATA_JSON}"

  