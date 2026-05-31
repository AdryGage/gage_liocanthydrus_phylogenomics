#!/bin/bash
#SBATCH -J 9_quast
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
module load java

conda init
source activate ~/.conda/envs/quast_5.3.0



quast ./SLE1126/scaffolds.fasta \
      ./SLE1126/contigs.fasta \
      -o SLE1126_quast_out \
      -t 4




quast ./SMBE52/scaffolds.fasta \
      ./SMBE52/contigs.fasta \
      -o SMBE52_quast_out \
      -t 4




quast ./SMBE54/scaffolds.fasta \
      ./SMBE54/contigs.fasta \
      -o SMBE54_quast_out \
      -t 4




quast ./SMBE56/scaffolds.fasta \
      ./SMBE56/contigs.fasta \
      -o SMBE56_quast_out \
      -t 4




quast ./SMBE57/scaffolds.fasta \
      ./SMBE57/contigs.fasta \
      -o SMBE57_quast_out \
      -t 4




quast ./SMBE59/scaffolds.fasta \
      ./SMBE59/contigs.fasta \
      -o SMBE59_quast_out \
      -t 4




quast ./SMBE60/scaffolds.fasta \
      ./SMBE60/contigs.fasta \
      -o SMBE60_quast_out \
      -t 4




quast ./SMBE64/scaffolds.fasta \
      ./SMBE64/contigs.fasta \
      -o SMBE64_quast_out \
      -t 4




quast ./SMBE65/scaffolds.fasta \
      ./SMBE65/contigs.fasta \
      -o SMBE65_quast_out \
      -t 4




quast ./SMBE66/scaffolds.fasta \
      ./SMBE66/contigs.fasta \
      -o SMBE66_quast_out \
      -t 4




quast ./SMBE67/scaffolds.fasta \
      ./SMBE67/contigs.fasta \
      -o SMBE67_quast_out \
      -t 4




quast ./SMBE68/scaffolds.fasta \
      ./SMBE68/contigs.fasta \
      -o SMBE68_quast_out \
      -t 4

