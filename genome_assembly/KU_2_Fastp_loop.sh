#!/bin/bash
#SBATCH --job-name=FASTP      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= @gmail.com     # Where to send mail
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=6            # Number of CPU cores per task
#SBATCH --mem=120gb            # Job memory request
#SBATCH --time=06:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=2_fastP_%j.log     # Standard output and error log
 
module load conda

conda activate /panfs/pfs.local/work/bi/s953b810/conda/envs/FastP

#you may not need the conda environment commands depending on how you are using FastP

#the below scripts assume that for each sample there is a single R1 and R2 read file. 
#If you have multiple files for each read direction for a single sample (happens when spread across multiple lanes), you need to catenate the respective read files so you have a single R1 and R2 file for each sample. 
#catenating also gives the added benefit of simplifying file names early on.



for i in *R1_001.fastq.gz; 
do TRIMNAME1=`echo $i | sed 's/.fastq.gz/.clean.fastq.gz/g'`;
TRIMNAME2=`echo $TRIMNAME1 | sed 's/R1/R2/g'`;
REVERSE=`echo $i | sed 's/R1/R2/g'`;
UNPAIRED=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton_R1.fastq.gz/g'`;
UNPAIRED2=`echo $TRIMNAME1 | sed 's/clean.fastq.gz/clean.singleton_R2.fastq.gz/g'`;

fastp -i $i -I $REVERSE -o $TRIMNAME1 -O $TRIMNAME2 --unpaired1 $UNPAIRED --unpaired2 $UNPAIRED2 -q 20 -l 30 -w 6 --detect_adapter_for_pe --overrepresentation_analysis -g;
done

# you can ommit the overrepresentation analysis, this is more useful for harvesting genome characteristics. Not bad to check out though..
#  --adapter_fasta adapter_list.fasta    <-- this is the option used for adding the list of your adapters. 
# If you export your adapter list as a .csv, you can use sed and cut commands to turn it into a fasta; or do it manually so the fasta looks like this (minus the hashes):

# > name_of_adapter1_its_arbitrary
# ATGTTCTCAT
# > name_of_adapter2
# ATTTTGTTA 