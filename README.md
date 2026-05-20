# Liocanthydrus Phylogenomics
A script repository for Adry Gage's phylogenomic workflow on studying *Liocanthydrus*.

![A cartoon drawing depicting the overall workflow of extracting DNA from specimens, processing DNA through Illumina sequencing, assembling genomes, harvesting UCEs, and creating a phylogeny tree.](assets/images/diagrams/from_genomes_to_trees.png)
> A very "high quality" diagram showing the overall process of taking genomes from *Liocanthydrus* beetles to construct phylogeny trees.

## Who is this for?
This repository is primarily meant to implement versioning control over the software parameters used to construct a UCE-based phylogeny and infer *Liocanthydrus* species relationships to aid in reproducing results. It is also a convenient template that can be cloned for related phylogenomic studies. With both considerations in mind, this GitHub repository is designed to be generalized enough so that you may deploy its content quickly for your own research (e.g. blank fields in template scripts) while retaining the specific settings used at each step in the workflow. The markdown (.md) files are also included as a quick guide on how to navigate the repository and utilize the software that the scripts call upon, making this a beginner-friendly toolkit for those new to phylogenomics and command-line interfaces (CLIs). 

### What do I need to know before using this?
There are a few prerequisites that will help you make use of this repository's contents:
- Knowledge of CLI
    - 'Terminal' on MacOS, 'Command Prompt' or 'PowerShell' on Windows
    - Understand basic navigation through CLI
    - Bash shell - particulary for high-performance computing (HPC)
- Basic concepts of phylogenomics
    - Short-read DNA sequencing (such as on an Illumina platform)
    - Different methods for constructing a phylogeny tree
        - Maximum likelihood and Bayesian inference
        - Concatenation and coalescence
    

### How do I get started?
To get started with using this repository, you can simply clone this via git. GitHub provides excellent [documentation](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) on how to achieve this.

Once you made your clone (or if you want more details), you can read the ["getting_started.md"](guides/getting_started.md) guide to get all corresponding software set up.

## Citations 
As this repository depends on several third party packages and software, it is important that you cite all relevant materials appropriately if you make use of them for your project. However, use of this specific repository does not need to be credited - it is simply a template to help you get started.

***Third party packages & software utilized in this project are listed below. Cite if used.***

### Genome Assembly

#### [FastQC 0.12.1](https://github.com/s-andrews/fastqc)
Developed by s-andrews to infer the quality of FastQ files.

#### [FastP 1.0.1](https://github.com/opengene/fastp)
A quick tool for processing FastQ files - particularly, short reads.

>Shifu Chen. fastp 1.0: An ultra-fast all-round tool for FASTQ data quality control and preprocessing. iMeta 4.5 (2025): e70078. https://doi.org/10.1002/imt2.70078

#### [SPAdes 4.2.0](https://github.com/ablab/spades)
Genome assembly tool designed for Illumina sequence data.

>Prjibelski, A., Antipov, D., Meleshko, D., Lapidus, A., & Korobeynikov, A. (2020). Using SPAdes de novo assembler. Current Protocols in Bioinformatics, 70, e102. https://doi.org/10.1002/cpbi.102

#### [QUAST 5.3.0](https://github.com/ablab/quast)
The 'QUality ASsessment Tool' used for evaluating genome assembly metrics.

>Alla Mikheenko, Vladislav Saveliev, Pascal Hirsch, Alexey Gurevich,
WebQUAST: online evaluation of genome assemblies,
Nucleic Acids Research (2023) 51 (W1): W601–W606. https://doi.org/10.1093/nar/gkad406

#### [BUSCO 6.0.0](https://gitlab.com/ezlab/busco)
Assessment tool for evaluating genome assembly completeness.

>Fredrik Tegenfeldt, Dmitry Kuznetsov, Mosè Manni, Matthew Berkeley, Evgeny M Zdobnov, Evgenia V Kriventseva, OrthoDB and BUSCO update: annotation of orthologs with wider sampling of genomes, Nucleic Acids Research, Volume 53, Issue D1, 6 January 2025, Pages D516–D522. https://doi.org/10.1093/nar/gkae987

### Phylogeny Construction

#### [PHYLUCE 1.7.3](https://github.com/faircloth-lab/phyluce)
UCE phylogenomics software developed by faircloth-lab for use in a variety of applications.

>Faircloth BC. 2015. PHYLUCE is a software package for the analysis of conserved genomic loci. Bioinformatics. https://doi.org/10.1093/bioinformatics/btv646.
