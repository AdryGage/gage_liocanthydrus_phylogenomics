#!/bin/bash
#SBATCH -J IQTREE-concat-mafft-czb
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_IQTREE-concat-mafft-czb_%j.err
#SBATCH -o ./log_out/_IQTREE-concat-mafft-czb_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/iqtree_3.1.2

iqtree -s ~/genome_skimming/concat/Concat_mafft_90perc_nexus/Concat_mafft_90perc_nexus.nexus -T AUTO --prefix ./iqtree_concat_mafft_czb/iqtree_concat_mafft_czb -B 1000 -m MFP -alrt 1000 -czb

#IQ-TREE 3 flags
#
# -s        Alignment file name/path to read from (required). Supports FASTA, PHYLIP, NEXUS, Clustal, and MSF.
# -S        Alignment file directory to read multiple alignments from, for which multiple trees will be created per alignment and outputted to a single 'monolithic' .treefile. Use in place of -s.
# --prefix  Prefix of the output files (multiple files produced). Default prefix is the input alignment file name.
# -T        Core count.
# -redo     If IQ-TREE had a successful previous run, this flag forces a redo of the analysis and will overwrite all output files. NOTE: If IQ-TREE was unable to complete a run (i.e. time limit on cluster), this flag should be omitted - IQ-TREE reads from a checkpoint file and will resume from an interruption if the script is re-run without changes.
# -B        Ultrafast Bootstrap (UFBoot) replicate count (min 1000 recommended).
# -bnni     Optimize each UFBoot replicate with a hill-climbing nearest neighbor interchange (NNI). Useful to reduce risk of overestimating branch supports due to model violations.
# -b        Standard nonparametric bootstrap replicate count (min 100 recommended).
# -m        Specify substitution model name. Default is MFP (ModelFinder Plus), which automatically determines model with minimal BIC score.
# -alrt     SH-like approximate likelihood ratio test (SH-aLRT) replicate count (min 1000 recommended). Can be combined with UFBoot in a single run, where branches of the resulting .treefile will have both SH-aLRT and UFBoot support values assigned to them.
# -st       Specify input model. By default, IQ-TREE will apply the DNA model if your alignment has DNA sequences, but you can change to a codon model to compare protein-coding DNA alignments.
# -czb      Collapse near zero branches, so that the final tree may be multifurcating. This is useful for bootstrapping in the presence of polytomy to reduce bootstrap supports of short branches.

# NOTE: prefix (output) directory must exist prior to running if a path is specified.