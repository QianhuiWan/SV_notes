# My Notes of Genome Assembly Workshop (12April2021):

  - Meta-genomics
    - Yeast ITS profiling for wine samples
    - RNA Sequencing is used for this profiling

  - NGS applications (SAGC)
    - DNA and RNA sequencing
    - Single cell genomics: 10000 cells in one go
    - Spatial transcriptomics by Visium (Visium Spatial Gene Expression)
    - High throught put qPCR
    - Use `nextflow` and `snakemake` for pipeline orgnisation
    - Help with experimental design

  - Reference genome for cattle
    - Unphased, partially phased and phased assemblies
    - PacBio reads
    - All models are wrong but some are useful -- George Box, statistician
    - Comparison of cattle genomes
    - Iso-Seq data
    - Need to find good ways to compare different genomes of cattle species

  - Crop research
    - Plant breeding
    - Good genome assembly improve biomaker identification
    - GWAS study for plant genome vs traits
      - Identify disease resistance loci for plants
    - Visualising genome diversity allows better decision making
    - There are many repetitive regions across genome
    - Genotyping vs phenotyping (genotyping is cheaper than phenotyping)

  - Genome assembly concepts

    - Nanopore long read sequencing has higher error rate than short read
    sequencing and PacBio long read sequencing but still a good way to know the
    location of repeat elements. PacBio long read is shorter than Nanopore, but
    more accurate. PacBio long read sequencing is as accurate as short read 
    sequencing becuase they all have repeated measures for each base pair.

    - Workshop contents: SARS-CoV-2 data set is used as an example for showing
    genome assembly steps. See the flowing link for workshop details:
    https://sagc-bioinformatics.github.io/workshop-agrigenomics/
