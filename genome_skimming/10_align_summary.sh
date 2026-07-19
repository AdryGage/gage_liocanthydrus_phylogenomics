#!/bin/bash
#SBATCH -J 10_phyluce_alignsummary
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_10_%j.err
#SBATCH -o ./log_out/_10_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3

# this directs the summary report to the normal log output directory

phyluce_align_get_align_summary_data \
    --alignments Combined_mafft_trimmed_nexus \
    --input-format nexus \
    --cores 64 \
    --log-path log_out \

phyluce_align_get_align_summary_data \
    --alignments Combined_incomplete_mafft_notrim_fasta \
    --input-format fasta \
    --cores 64 \
    --log-path log_out \