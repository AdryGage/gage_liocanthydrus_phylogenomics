#!/bin/bash
#SBATCH -J adry_fastqc
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -e _3_Fastqc_%j.err
#SBATCH -o _3_Fastqc_%j.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=adry.gage@lsu.edu

module load conda

conda init
#conda create -p /work/adry/conda/envs/XXX
#conda install bioconda::XXX

source activate /work/adry/conda/envs/fastqc

#before cleaning
#for i in ./*.fastq.gz; do fastqc $i; done

#after cleaning
for i in ./clean_reads/*clean*.gz; do fastqc $i; done
