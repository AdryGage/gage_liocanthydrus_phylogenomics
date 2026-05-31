#!/bin/bash
#SBATCH -J 5_jellyfish_histo
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -e ./error_out/_%J_%j.err
#SBATCH -o ./log_out/_%J_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda
conda init
source activate ~/.conda/envs/jellyfish_2.2.10

#Run this on jellyfish outputs and move output histo files in seperate directory. 

for i in *reads.jf

do INNAME=`echo "$i" `;
OUTNAME=`echo "$i" | sed 's/reads.jf/reads.histo/g'`;
jellyfish histo -t 10 $INNAME  > $OUTNAME;
done
