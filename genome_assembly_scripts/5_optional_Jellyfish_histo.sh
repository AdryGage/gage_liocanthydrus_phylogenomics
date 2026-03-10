#!/bin/bash
#SBATCH --job-name=FastQC      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= .com     # Where to send mail
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=10            # Number of CPU cores per task
#SBATCH --mem=100gb            # Job memory request
#SBATCH --time=00-06:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=2_jellyfish_%j.log     # Standard output and error log

module load jellyfish/2.2.10

#Run this on jellyfish outputs and move output histo files in seperate directory. 

for i in *reads.jf

do INNAME=`echo "$i" `;
OUTNAME=`echo "$i" | sed 's/reads.jf/reads.histo/g'`;
jellyfish histo -t 10 $INNAME  > $OUTNAME;
done
