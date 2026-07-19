#!/bin/bash
#SBATCH -J 6_uce_alignment
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -e ./error_out/_6_%j.err
#SBATCH -o ./log_out/_6_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3

# Update 'taxa' to mach number of individuals

# 'no-trim' for use in gblocks (output must be fasta)
phyluce_align_seqcap_align \
    --input sample-incomplete_NoRogue.fasta \
    --output Combined_incomplete_mafft_notrim_fasta \
    --taxa 38 \
    --aligner mafft \
    --cores 64 \
    --no-trim \
    --incomplete-matrix \
    --output-format fasta \
    --log-path log_out

# MAFFT alignment and edge trimming
phyluce_align_seqcap_align \
    --input sample-incomplete_NoRogue.fasta \
    --output Combined_incomplete_mafft_trimmed_nexus \
    --taxa 38 \
    --aligner mafft \
    --cores 64 \
    --incomplete-matrix \
    --output-format nexus \
    --log-path log_out