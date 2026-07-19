#!/bin/bash
#SBATCH -J ASTRAL4-mafft
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_ASTRAL4-mafft_%j.err
#SBATCH -o ./log_out/_ASTRAL4-mafft_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/aster_1.25

working_directory=(..)
input_file=("$working_directory"/iqtree/iqtree_genetrees_mafft/*.treefile)
output=("$working_directory"/aster/astral4_iqtree_mafft.stree)

astral4 -i $input_file -o $output -t 64 --root SLE827 2>./log_out/astral4_mafft.log