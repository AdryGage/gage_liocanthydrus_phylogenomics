#!/bin/bash
#SBATCH --job-name=Gscope      # Job name
#SBATCH --partition=sixhour          # Partition Name (Required)
#SBATCH --mail-type=BEGIN,END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user= @gmail.com     # Where to send mail
#SBATCH --ntasks=1                   # Run a single task
#SBATCH --cpus-per-task=4            # Number of CPU cores per task
#SBATCH --mem=80gb            # Job memory request
#SBATCH --time=00-06:00:00              # Time limit days-hrs:min:sec
#SBATCH --output=Genomescope_%j.log     # Standard output and error log

module load R/4.2


for i in *21mer_out.histo;
do OUTNAME=`echo "$i" | sed 's/out.histo/gscope_19/g'`;
NAME=`echo "$i"`;

#need to put rscript in a specfic directory, call with full path.
Rscript /panfs/pfs.local/work/bi/s953b810/Genomescope.R $NAME 21 150 ./$OUTNAME;


done
