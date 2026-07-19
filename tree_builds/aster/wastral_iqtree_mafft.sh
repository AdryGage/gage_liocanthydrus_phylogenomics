#!/bin/bash
#SBATCH -J wASTRAL-mafft
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_wASTRAL-mafft_%j.err
#SBATCH -o ./log_out/_wASTRAL-mafft_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate /work/adry/conda/envs/aster_1.25

working_directory=(..)
input_file=("$working_directory"/iqtree/iqtree_genetrees_mafft/*.treefile)
output=("$working_directory"/aster/wastral_iqtree_mafft.stree)

wastral -i $input_file -o $output -t 64 --mode 1 --root SLE827

# --mode 1      Hybrid support (branch length & support)
# --mode 2      Branch support
# --mode 3      Branch length

# --root        ID of sample to use as root