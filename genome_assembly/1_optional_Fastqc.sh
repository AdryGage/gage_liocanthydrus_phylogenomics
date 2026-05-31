#!/bin/bash
#SBATCH -J 1_pretrim_fastqc
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
source activate ~/.conda/envs/fastqc_0.12.1

#before cleaning
#I'll often skip this step. 
for i in ./*.fastq.gz; do fastqc $i; done

#after cleaning
#for i in ./*clean*.gz; do fastqc $i; done
