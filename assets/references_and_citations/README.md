# References
Here, you can find all references for this repository/project with a bibliography provided in multiple formats (in progress). If using the resources and documentation provided here for your own research, **you must cite all third-party packages and software used in your pipeline**.

## Do I need to cite this repository?
If you are simply using this GitHub repository as a template to help you get started on your own phylogenomics project, it is not necessary to cite this specific repository. *However*, you must cite the third-party materials referenced by this repository if included in your pipeline.

## How to cite the *Liocanthydrus* phylogenomics project
If your project builds upon our work on *Liocanthydrus* and/or related Noteridae, cite the following works as appropriate:

### Results of *Liocanthydrus* phylogenomic analysis
TBD (publication in development)

### Noteridae 3.4kv1 UCE probe set
The Noteridae 3.4kv1 probe set has been developed by [Baca et al. (2025)](https://doi.org/10.1111/syen.12643) and is provided here with permission. If you use this UCE probe set for your own research, please cite the following:

>Baca, S. M., Gustafson, G. T., DeRaad, D. A., Alexander, A., Hime, P. M., & Short, A. E. Z. (2025). A shallow‐scale phylogenomics approach reveals repeated patterns of diversification among sympatric lineages of cryptic Neotropical aquatic beetles (Coleoptera: Noteridae). Systematic Entomology, 50(1), 82–101. https://doi.org/10.1111/syen.12643


## Third-party resources
### Genome Assembly

#### [FastQC 0.12.1](https://github.com/s-andrews/fastqc)
Developed by [Simon Andrews](https://github.com/s-andrews) to infer the quality of FastQ files.

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

### Genome Skimming

#### [PHYLUCE 1.7.3](https://github.com/faircloth-lab/phyluce)
UCE phylogenomics software developed by [faircloth-lab](https://www.faircloth-lab.org/) for use in a variety of applications.

>Faircloth BC. 2015. PHYLUCE is a software package for the analysis of conserved genomic loci. Bioinformatics. https://doi.org/10.1093/bioinformatics/btv646.

### Phylogenetic Tree Reconstruction

#### [IQ-TREE 3.1.2](https://iqtree.github.io/)
Maximum-likelihood phylogenetic tree construction program.

>Thomas KF Wong, Nhan Ly-Trong, Huaiyan Ren, Piyumal Demotte, Hector Banos, Andrew J Roger, Edward Susko, Chris Bielow, Nicola De Maio, Nick Goldman, Matthew W Hahn, Mario dos Reis, Le Sy Vinh, Gavin Huttley, Robert Lanfear, Bui Quang Minh (2026) IQ-TREE 3: Phylogenomic Inference Software using Complex Evolutionary Models. Mol. Biol. Eviol.. https://doi.org/10.1093/molbev/msag117

ModelFinder as implemented in IQ-TREE:

>Kalyaanamoorthy, S., Minh, B. Q., Wong, T. K. F., von Haeseler, A., & Jermiin, L. S. (2017). ModelFinder: Fast model selection for accurate phylogenetic estimates. Nature Methods, 14(6), 587–589. https://doi.org/10.1038/nmeth.4285

Ultrafast bootstrap (UFBoot) as implemented in IQ-TREE:

>Kalyaanamoorthy, S., Minh, B. Q., Wong, T. K. F., von Haeseler, A., & Jermiin, L. S. (2017). ModelFinder: Fast model selection for accurate phylogenetic estimates. Nature Methods, 14(6), 587–589. https://doi.org/10.1038/nmeth.4285

Gene/site concordance factor analyses as implemented in IQ-TREE:

>Yu K Mo, Robert Lanfear, Matthew W Hahn, Bui Quang Minh (2023) Updated site concordance factors minimize effects of homoplasy and taxon sampling. Bioinformatics, 39:btac741. https://doi.org/10.1093/bioinformatics/btac741

Partitioned analysis for multi-gene alignments:

>O. Chernomor, A. von Haeseler, and B.Q. Minh (2016) Terrace aware data structure for phylogenomic inference from supermatrices. Syst. Biol., 65:997-1008. https://doi.org/10.1093/sysbio/syw037

#### [PAUP* 4.0a169](https://paup.phylosolutions.com/)
'Phylogenetic Analysis Using PAUP' software package originally developed by David Swofford.

>Swofford, D. L. 2003. PAUP*. Phylogenetic Analysis Using Parsimony (*and Other Methods).
Version 4. Sinauer Associates, Sunderland, Massachusetts.

SVD Quartets as implemented in PAUP*:

>Chifman, J., & Kubatko, L. (2014). Quartet Inference from SNP Data Under the Coalescent Model. Bioinformatics, 30(23), 3317–3324. https://doi.org/10.1093/bioinformatics/btu530

Node age estimation via qAge, as implented in PAUP*:

>Peng, J., Swofford, D. L., & Kubatko, L. (2022). Estimation of speciation times under the multispecies coalescent. Bioinformatics, 38(23), 5182–5190. https://doi.org/10.1093/bioinformatics/btac679

#### [ASTER 1.25](https://github.com/chaoszhang/ASTER/tree/master)
Coalescent-based phylogeny tree construction software package centered on the fourth major iteration of the 'Accurate Species Tree ALgorithm' (ASTRAL-IV).

>Zhang, C., Nielsen, R., & Mirarab, S. (2025). ASTER: A Package for Large-Scale Phylogenomic Reconstructions. Molecular Biology and Evolution, 42(8). https://doi.org/10.1093/molbev/msaf172

Coalescent-Aware Species Tree Length Estimation in Substitution-unit (CASTLES) as integrated in ASTRAL-IV:

>Tabatabaee, Y., Zhang, C., Warnow, T., & Mirarab, S. (2023). Phylogenomic branch length estimation using quartets. Bioinformatics, 39(Supplement_1), i185–i193. https://doi.org/10.1093/bioinformatics/btad221

Weighted-ASTRAL (wASTRAL) as implemented in ASTER:

>Zhang, C., & Mirarab, S. (2022). Weighting by Gene Tree Uncertainty Improves Accuracy of Quartet-based Species Trees. Molecular Biology and Evolution, 39(12), msac215. https://doi.org/10.1093/molbev/msac215


## Relevant papers on *Liocanthydrus*

Reclassification of *Liocanthydrus* as genus, along with synonymous taxa. Diagnostic descriptions of *L. angustus*, *L. octoguttatus*, *L. bicolor*, *L. uniformis*, *L. clayae*, *L. armulatus*, and *L. nanops*.

>Baca, S. M., Gustafson, G. T., Toledo, M., & Miller, K. B. (2014). Revision of the Neotropical burrowing water beetle genus Liocanthydrus Guignot (Coleoptera: Noteridae: Noterinae: Noterini) with the description of two new species. Zootaxa, 3793(2), 231–246. https://doi.org/10.11646/zootaxa.3793.2.3


Diagnostic descriptions of *L. zanclus* and *L. mecespilus* along with records of *L. clayae* and *L. bicolor*.

>Guimarães, B. A. C., & Ferreira-Jr, N. (2015). Two new species and new records of Liocanthydrus Guignot (Coleoptera, Noteridae) from Brazil. Zootaxa, 3914(5), 591–596. https://doi.org/10.11646/zootaxa.3914.5.8


Diagnostic descriptions of *L. ramosae* and *L. distintus* along with records of *L. armulatus* and *L. clayae*.

>García R., M. M., Camacho M., J. A., & Poleo S., N. C. (2018). El género Liocanthydrus en Venezuela (Coleoptera: Noteridae) con descripción de dos nuevas especies. UNED Research Journal, 10(2), 296–303. https://doi.org/10.22458/urj.v10i2.2161


First record of *Liocanthydrus* larvae.

>Urcola, J. I., Toledo, M. E., Baca, S. M., & Michat, M. C. (2025). The genus Liocanthydrus Guignot, 1957 (Coleoptera, Noteridae) in Argentina: New records and larval morphology. ZooKeys, 1231, 371–384. https://doi.org/10.3897/zookeys.1231.144746


Molecular phylogenetic study of Noteridae, which includes *L. clayae* (described as *L. bicolor* in paper, but has been re-identifed as *L. clayae* in 2026 by Gage & Baca). This study also involved the development of the Noteridae 3.4kv1 UCE probe set.

>Baca, S. M., Gustafson, G. T., DeRaad, D. A., Alexander, A., Hime, P. M., & Short, A. E. Z. (2025). A shallow‐scale phylogenomics approach reveals repeated patterns of diversification among sympatric lineages of cryptic Neotropical aquatic beetles (Coleoptera: Noteridae). Systematic Entomology, 50(1), 82–101. https://doi.org/10.1111/syen.12643


