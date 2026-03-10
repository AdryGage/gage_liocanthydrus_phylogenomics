#!/bin/bash
#SBATCH --job-name=assemble
#SBATCH --partition=sixhour
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=6:00:00
#SBATCH --mem=40G
#SBATCH --mail-user= @gmail.com
#SBATCH --mail-type=END,FAIL
#SBATCH -o
#SBATCH --output=quast_%j.log

module load quast
module load java




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

