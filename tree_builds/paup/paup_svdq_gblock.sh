#!/bin/bash
#SBATCH -J paup_svdq_gblock
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/paup_svdq_gblock_%j.err
#SBATCH -o ./log_out/paup_svdq_gblock_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/paup_4.0a169

#NOTE: svdq requires a concatenated input

paup -n ./paup_svdq_gblock.nex

quit