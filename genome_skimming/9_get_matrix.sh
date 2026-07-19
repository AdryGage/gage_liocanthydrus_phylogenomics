#!/bin/bash
#SBATCH -J 9_phyluce_getmatrix_UCE
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_9_%j.err
#SBATCH -o ./log_out/_9_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3
   
phyluce_align_get_only_loci_with_min_taxa \
    --alignments Combined_incomplete_ET_no_locus_names_trimmed \
    --taxa 38 \
    --percent 0.70 \
    --output ./aligned_completeness_matrix/Combined_mafft_70perc_nexus \
    --cores 64 \
    --log-path log_out \

phyluce_align_get_only_loci_with_min_taxa \
    --alignments Combined_incomplete_ET_no_locus_names_notrim \
    --taxa 38 \
    --percent 0.70 \
    --output ./aligned_completeness_matrix/Combined_gblock_70perc_nexus \
    --cores 64 \
    --log-path log_out \

#input format cannot be fasta. I learned that. On the streets. Bitch. 
#BTW I have no idea who might be reading this. 

# ^^^ Comment is too good to remove -Adry

##--percent flag indicates completeness threshold for each locus; i.e. number of samples that must be represented in a given locus/gene to be included in the matrix
## e.g. 0.90 means that 90% of the complete sampling (44 out of 48 samples) must be represnted in a locus alignment to be included in the matrix.
   
#Change percent to .70
#Runthis for Gblocks also at .90 and .70 percent
#Total of 4 different alignment. 

phyluce_align_get_only_loci_with_min_taxa \
    --alignments Combined_incomplete_ET_no_locus_names_trimmed \
    --taxa 38 \
    --percent 0.90 \
    --output ./aligned_completeness_matrix/Combined_mafft_90perc_nexus \
    --cores 64 \
    --log-path log_out \

phyluce_align_get_only_loci_with_min_taxa \
    --alignments Combined_incomplete_ET_no_locus_names_notrim \
    --taxa 38 \
    --percent 0.90 \
    --output ./aligned_completeness_matrix/Combined_gblock_90perc_nexus \
    --cores 64 \
    --log-path log_out \