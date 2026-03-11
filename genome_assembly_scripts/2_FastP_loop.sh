#!/bin/bash
#SBATCH -J adry_fastp
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p workq
#SBATCH -e _2_fastp_%j.err
#SBATCH -o _2_fastp_%j.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=adry.gage@lsu.edu

module load conda

conda init
source activate /work/adry/conda/envs/fastp

for i in *R1_merged.fastq.gz; 
do TRIMNAME1=`echo $i | sed 's/.fastq.gz/.clean.fastq.gz/g'`;
TRIMNAME2=`echo $TRIMNAME1 | sed 's/R1/R2/g'`;
REVERSE=`echo $i | sed 's/R1/R2/g'`;
UNPAIRED=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;
UNPAIRED2=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;

fastp -w 8 -i $i -I $REVERSE -o clean_reads/$TRIMNAME1 -O clean_reads/$TRIMNAME2 --unpaired1 clean_reads/$UNPAIRED --unpaired2 clean_reads/$UNPAIRED2 -q 20 -l 30 -w 6 --detect_adapter_for_pe -g;
done

#you may not need the conda environment commands depending on how you are using FastP
#the below scripts assume that for each sample there is a single R1 and R2 read file. 
#If you have multiple files for each read direction for a single sample (happens when spread across multiple lanes), you need to catenate the respective read files so you have a single R1 and R2 file for each sample. 
#catenating also gives the added benefit of simplifying file names early on.

# --overrepresentation_analysis <-- you can ommit the overrepresentation analysis , this is more useful for harvesting genome characteristics. Not bad to check out though..
#  --adapter_fasta adapter_list.fasta    <-- this is the option used for adding the list of your adapters. 
# If you export your adapter list as a .csv, you can use sed and cut commands to turn it into a fasta; or do it manually so the fasta looks like this (minus the hashes):

# > name_of_adapter1_its_arbitrary
# ATGTTCTCAT
# > name_of_adapter2
# ATTTTGTTA 
