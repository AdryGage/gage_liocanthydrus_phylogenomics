#!/bin/bash
#SBATCH -J 7_gblock
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_7_%j.err
#SBATCH -o ./log_out/_7_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
source activate ~/.conda/envs/phyluce-1.7.3

# input files needs to be fastas

# b1 = Minimum Number Of Sequences For A Conserved Position (50% of the number of sequences + 1) Any integer bigger than half the number of sequences and smaller or equal than the total number of sequences
# b2 = Minimum Number Of Sequences For A Flank Position (85% of the number of sequences) Any integer equal or bigger than Minimum Number Of Sequences For A Conserved Position
# b3 = Maximum Number Of Contiguous Nonconserved Positions (8)Any integer
# b4 = Minimum Length Of A Block (10) Any integer equal or bigger than 2

phyluce_align_get_gblocks_trimmed_alignments_from_untrimmed \
    --alignments Combined_incomplete_mafft_notrim_fasta \
    --output liocanthydrus_combined_edgetrim_gblocks_0.5 \
    --output-format nexus \
    --b1 0.5 \
    --b2 0.5 \
    --b3 14 \
    --b4 6 \
    --cores 64 \
    --log-path log_out \

# takes ~1 min, can combine with other scripts