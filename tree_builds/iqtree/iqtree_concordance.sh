#!/bin/bash
#SBATCH -J IQTREE-concordance
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_IQTREE-concordance_%j.err
#SBATCH -o ./log_out/_IQTREE-concordance_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/iqtree_3.1.2

concat_gblock=(~/tree_builds/iqtree/iqtree_concat_gblock/iqtree_concat_gblock.treefile)
gene_gblock=(~/tree_builds/iqtree/iqtree_genetrees_gblock/iqtree_genetrees_gblock.treefile)
concat_aln_gblock=(~/genome_skimming/concat/Concat_gblock_90perc_nexus/Concat_gblock_90perc_nexus.nexus)
model_gblock=("TVM{1.00248,3.21104,1.06365,1.49074}+F{0.319923,0.180321,0.180168,0.319589}+R10{0.357801,0.00544313,0.0903072,0.0966687,0.0769584,0.471311,0.0775945,1.00904,0.0820494,1.14347,0.0950944,1.1606,0.0866814,1.1613,0.0912438,1.16214,0.0340636,7.53602,0.00820596,25.2454}")

concat_mafft=(~/tree_builds/iqtree/iqtree_concat_mafft/iqtree_concat_mafft.treefile)
gene_mafft=(~/tree_builds/iqtree/iqtree_genetrees_mafft/iqtree_genetrees_mafft.treefile)
concat_aln_mafft=(~/genome_skimming/concat/Concat_mafft_90perc_nexus/Concat_mafft_90perc_nexus.nexus)
model_mafft=("TVM{0.996776,3.34512,1.01615,1.64957}+F{0.31938,0.180894,0.180771,0.318956}+R6{0.432866,0.0421096,0.155882,0.567386,0.155221,0.833165,0.159584,0.972144,0.0854002,3.72132,0.0110478,26.3458}")

# Output directories must exist before running through IQ-TREE
#mkdir ./concordance_gblock
#mkdir ./concordance_mafft

output_concordance_gblock_prefix=(~/tree_builds/iqtree/iqtree_concordance_gblock/iqtree_concordance_gblock)
output_concordance_mafft_prefix=(~/tree_builds/iqtree/iqtree_concordance_mafft/iqtree_concordance_mafft)

# gblock gCF/sCF
iqtree -t $concat_gblock --gcf $gene_gblock -s $concat_aln_gblock --scf 100 --prefix $output_concordance_gblock_prefix -T 64 -seed 12345

# gblock sCFl
iqtree -te $concat_gblock -s $concat_aln_gblock -m $model_gblock --scfl 100 --prefix ${output_concordance_gblock_prefix}_scfl -T 64 -seed 12345

# MAFFT-trimmed gCF/sCF
iqtree -t $concat_mafft --gcf $gene_mafft -s $concat_aln_mafft --scf 100 --prefix $output_concordance_mafft_prefix -T 64 -seed 12345

# MAFFT-trimmed sCFl
iqtree -te $concat_mafft -s $concat_aln_mafft -m $model_mafft --scfl 100 --prefix ${output_concordance_mafft_prefix}_scfl -T 64 -seed 12345