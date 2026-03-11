#!/bin/bash
#SBATCH -J SPAdes_INDIV      # Job name
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 36:00:00
#SBATCH -p bigmem
#SBATCH -e ./error_out/_8_SPAdes_INDIV_%j.err        # Error log
#SBATCH -o ./log_out/_8_SPAdes_INDIV_%j.log     # Standard output
#SBATCH --mail-type=ALL
#SBATCH --mail-user=adry.gage@lsu.edu

module load conda
module load java

conda init
source activate /work/adry/conda/envs/SPAdes

###do an assembly using the adapter-filtered data as input; modify names and paths as needed
###H3re set to run with reads all in same directory: Can also modify to make directories for each samples' reads if need be

spades.py -1 ./INDIV_R1_merged.clean.fastq.gz -2 ./INDIV_R2_merged.clean.fastq.gz -o ./assemblies/INDIV -t 28 -m 2048

##### for continuing. -o <existing SPAdes assembly output directory>.
#spades.py --continue  -o ./assemblies/INDIV

#SPADES USAGE: -1, -2 = <cleaned, (optionally filtered with bbduk) forward and reverse read files>; -s = <cleaned singleton read file>; -o <output directory> (doesn't have to me pre-made); -t <threads>

# the above script is what I use to generate a SPAdes job file for each sample to run simultanously on our 6hour cluster partition.

#First generate a sample list first (example provided):
#array=`cat sample.list`

#checks array:
#echo $array  #depending on the list format you may have to use this synax: echo "${array[@]}"   

#This replaces INDIV in the script below with the appropriate sample name
#for i in $array; do awk '{gsub("INDIV","'$i'",$0); print($0);}' SPAdes_1.sh > SPADES_"$i".sh; done  

# This submits all the scripts. 
#for i in $array; do sbatch SPADES_"$i".sh; done 
