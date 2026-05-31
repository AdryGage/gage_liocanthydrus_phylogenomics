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

## References & Citations 
As this repository depends on several third party resources, it is important that you cite all relevant materials appropriately if you incorporate them into your own work. If you are simply using this repository as a template to jump-start your own phylogenomics pipeline, it is not necessary to credit us.

***You can find a full list of references in the '[references_and_citations](references_and_citations)' submodule.***