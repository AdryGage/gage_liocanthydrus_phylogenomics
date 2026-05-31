#!/bin/bash
#SBATCH -J 0_fatotwobit
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

source activate ~/.conda/envs/fatotwobit_482
array=$(cat ~/sample.list)

# Create a .2bit version of each contigs.fasta file from our assemblies
for critter in $array; do faToTwoBit assemblies/$critter/contigs.fasta assemblies/$critter/${critter%.*}.2bit; done

# Create a new `genomes.conf` file to act as a directory list for our new .2bit files
echo '[scaffolds]' > genomes.conf
for i in $array; do echo ${i%.*}:~/assemblies/${i%.*}/${i%.*}.2bit >> genomes.conf; done