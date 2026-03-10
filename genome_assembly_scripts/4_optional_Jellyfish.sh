#!/bin/bash
#SBATCH --job-name=FastQC      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= @gmail.com     # Where to send mail
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
#SBATCH --mem=100gb            # Job memory request
#SBATCH --time=00-06:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=2_jellyfish_%j.log     # Standard output and error log

module load jellyfish/2.2.10

#adjust names for loop
for i in SMBE*cat.clean.fastq.gz;

do OUTNAME=`echo "$i" | sed 's/fastq.gz/reads.jf/g'`;
NAME=`echo "$i"`;
jellyfish count -C -m 21 -s 30G -t 10 <(zcat $NAME) -o $OUTNAME;
done
