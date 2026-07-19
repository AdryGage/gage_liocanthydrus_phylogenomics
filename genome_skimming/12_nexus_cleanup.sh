#!/bin/bash
#SBATCH -J 12_nexus_cleanup
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 01:00:00
#SBATCH -p single
#SBATCH -e error_out/_12_%j.err
#SBATCH -o log_out/_12_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

source_gblock_70=(./concat/Concat_gblock_70perc_nexus/Concat_gblock_70perc_nexus.nexus)
gblock_destination_70=(./concat/Concat_gblock_70perc_nexus/Concat_gblock_70perc_formatted.nexus)

source_gblock_90=(./concat/Concat_gblock_90perc_nexus/Concat_gblock_90perc_nexus.nexus)
gblock_destination_90=(./concat/Concat_gblock_90perc_nexus/Concat_gblock_90perc_formatted.nexus)

source_mafft_70=(./concat/Concat_mafft_70perc_nexus/Concat_mafft_70perc_nexus.nexus)
mafft_destination_70=(./concat/Concat_mafft_70perc_nexus/Concat_mafft_70perc_formatted.nexus)

source_mafft_90=(./concat/Concat_mafft_90perc_nexus/Concat_mafft_90perc_nexus.nexus)
mafft_destination_90=(./concat/Concat_mafft_90perc_nexus/Concat_mafft_90perc_formatted.nexus)

# Create edited copy of concatenated alignments that is in a friendly format
sed "s/'//g; s/uce-/uce/g; s/.nexus//g" $source_gblock_70 > $gblock_destination_70
sed "s/'//g; s/uce-/uce/g; s/.nexus//g" $source_gblock_90 > $gblock_destination_90

sed "s/'//g; s/uce-/uce/g; s/.nexus//g" $source_mafft_70 > $mafft_destination_70
sed "s/'//g; s/uce-/uce/g; s/.nexus//g" $source_mafft_90 > $mafft_destination_90
