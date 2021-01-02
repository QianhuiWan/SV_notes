# SV_notes

## Some background information

Genomic structural variation (SV) means the variation of chromosome structures.
SV contains many types of variations including deletion, duplication,
copy number variations (CNV), insertions, translocations etc. It normally
affects a sequence of 1 kb to 3 Mb in length.

SV is larger than SNP and more difficult to detect than SNPs. Some diseased are
suspected to be associated with SV, but the relation between phenotype and SV
is not very certain.

CNV including insertions, deletions and duplications, is a type of SV. Many of
the CNVs are not located in coding regions.

## Database of SV

+ NCBI, CNV track, http://genome.ucsc.edu/cgi-bin/hgc?hgsid=806070869_YFBnEeX6AkbpLIEabh1KygvTh0c9&c=chr6&l=162725083&r=162725907&o=162712346&t=162750092&g=dgvSupporting&i=essv7014351

+ ENCODE, CNV track, https://genome.ucsc.edu/cgi-bin/hgTrackUi?db=hg18&g=wgEncodeHudsonalphaCnv

## CNV analyses

+ CNV are normally called from whole genome sequencing (WGS) data or whole exome
sequencing (WES) data.

+ Comparing to short-read sequencing and bulk tissue sequencing, long read
genome sequencing and single cell sequencing is not widely used at present. So
we look at short-read sequencing for now.

+ There are some pipelines (tutorial) for CNV calling from DNA sequencing data:

  + Pipeline from Broad Instititue (bash): http://software.broadinstitute.org/software/genomestrip/node_CNVPipelineOverview.html

  + CNVkit (python): https://cnvkit.readthedocs.io/en/stable/pipeline.html

  + DNA-seq analysis pipeline from NIH: https://docs.gdc.cancer.gov/Data/Bioinformatics_Pipelines/DNA_Seq_Variant_Calling_Pipeline/

## Some papers related with CNV and CNV analyses

+ 'Copy-number variants in clinical genome sequencing: deployment and interpretation for rare and undiagnosed disease' https://www.nature.com/articles/s41436-018-0295-y

+ 'A highly sensitive and specific workflow for detecting rare copy-number variants from exome sequencing data' https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-020-0712-0
