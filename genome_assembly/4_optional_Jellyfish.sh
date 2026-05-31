#!/bin/bash
#SBATCH -J 4_jellyfish
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

#adjust names for loop
for i in SMBE*cat.clean.fastq.gz;

do OUTNAME=`echo "$i" | sed 's/fastq.gz/reads.jf/g'`;
NAME=`echo "$i"`;
jellyfish count -C -m 21 -s 30G -t 10 <(zcat $NAME) -o $OUTNAME;
done
