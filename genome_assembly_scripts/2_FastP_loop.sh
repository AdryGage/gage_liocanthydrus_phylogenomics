#!/bin/bash
 #SBATCH -N 1                	# nodes
 #SBATCH -n 8		       	# specify MPI processes
 #SBATCH -c 1			# specify # threads per process
 #SBATCH -t 3-0:00:00
 #SBATCH -p single
 #SBATCH -A hpc_sbaca_su2    #account to charge for cpu time
 #SBATCH -o output=2_fastP_%j.log     # Standard output and error log # optional, name of the stdout, using the job number (%j) and the first node (%N)
 #SBATCH -e slurm-%j.err-%N # optional, name of the stderr, using job and first node values
 # below are job commands

module load conda

conda init

source activate /project/sbaca/conda/envs/FastP



#you may not need the conda environment commands depending on how you are using FastP
#the below scripts assume that for each sample there is a single R1 and R2 read file. 
#If you have multiple files for each read direction for a single sample (happens when spread across multiple lanes), you need to catenate the respective read files so you have a single R1 and R2 file for each sample. 
#catenating also gives the added benefit of simplifying file names early on.



for i in *R1_001.fastq.gz; 
do TRIMNAME1=`echo $i | sed 's/.fastq.gz/.clean.fastq.gz/g'`;
TRIMNAME2=`echo $TRIMNAME1 | sed 's/R1/R2/g'`;
REVERSE=`echo $i | sed 's/R1/R2/g'`;
UNPAIRED=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;
UNPAIRED2=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton.fastq.gz/g'`;

fastp -w 8 -i $i -I $REVERSE -o /work/sbaca/clean_reads/$TRIMNAME1 -O /work/sbaca/clean_reads/$TRIMNAME2 --unpaired1 /work/sbaca/clean_reads/$UNPAIRED --unpaired2 /work/sbaca/clean_reads/$UNPAIRED2 -q 20 -l 30 -w 6 --detect_adapter_for_pe -g;
done

# --overrepresentation_analysis <-- you can ommit the overrepresentation analysis , this is more useful for harvesting genome characteristics. Not bad to check out though..
#  --adapter_fasta adapter_list.fasta    <-- this is the option used for adding the list of your adapters. 
# If you export your adapter list as a .csv, you can use sed and cut commands to turn it into a fasta; or do it manually so the fasta looks like this (minus the hashes):

# > name_of_adapter1_its_arbitrary
# ATGTTCTCAT
# > name_of_adapter2
# ATTTTGTTA 
