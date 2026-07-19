#!/bin/bash
#SBATCH -J 11_phyluce_nexus_export
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -p single
#SBATCH -e error_out/_11_%j.err
#SBATCH -o log_out/_11_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3

phyluce_align_concatenate_alignments  \
 --alignments ./aligned_completeness_matrix/Combined_gblock_90perc_nexus \
 --nexus \
 --output ./concat/Concat_gblock_90perc_nexus \

phyluce_align_concatenate_alignments  \
 --alignments ./aligned_completeness_matrix/Combined_mafft_90perc_nexus \
 --nexus \
 --output ./concat/Concat_mafft_90perc_nexus \

phyluce_align_concatenate_alignments  \
 --alignments ./aligned_completeness_matrix/Combined_gblock_70perc_nexus \
 --nexus \
 --output ./concat/Concat_gblock_70perc_nexus \

 phyluce_align_concatenate_alignments  \
 --alignments ./aligned_completeness_matrix/Combined_mafft_70perc_nexus \
 --nexus \
 --output ./concat/Concat_mafft_70perc_nexus \