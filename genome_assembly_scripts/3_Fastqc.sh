#!/bin/bash
#SBATCH --job-name=FastQC      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= @gmail.com     # Where to send mail
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=1            # Number of CPU cores per task
#SBATCH --mem=40gb            # Job memory request
#SBATCH --time=00-06:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=1_fastqc_%j.log     # Standard output and error log


module load fastqc/0.11.8 

#before cleaning
#for i in ./*.fastq.gz; do fastqc $i; done

#after cleaning
for i in ./*clean*.gz; do fastqc $i; done
