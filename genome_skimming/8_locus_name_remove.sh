#!/bin/bash
#SBATCH -J 8_phyluce_namerm_UCE
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_8_%j.err
#SBATCH -o ./log_out/_8_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3
   
phyluce_align_remove_locus_name_from_files \
    --alignments Combined_mafft_trimmed_nexus \
    --output Combined_incomplete_ET_no_locus_names_trimmed \
    --cores 64 \
    --input-format nexus  

phyluce_align_remove_locus_name_from_files \
    --alignments liocanthydrus_combined_edgetrim_gblocks_0.5 \
    --output Combined_incomplete_ET_no_locus_names_notrim \
    --cores 64 \
    --input-format nexus  

#--output-format fasta \
#--alignments can either be mafft aligned files that have been trimmed/cut with gblocks, or mafft aligned & edge trimmed files without gblocks. Note the difference.
