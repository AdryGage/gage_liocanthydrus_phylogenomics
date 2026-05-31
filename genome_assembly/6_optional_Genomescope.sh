#!/bin/bash
#SBATCH -J 6_gscope
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

### THIS IS OUTDATED
### Needs to be updated

module load R/4.2

for i in *21mer_out.histo;
do OUTNAME=`echo "$i" | sed 's/out.histo/gscope_19/g'`;
NAME=`echo "$i"`;

#need to put rscript in a specfic directory, call with full path.
Rscript /panfs/pfs.local/work/bi/s953b810/Genomescope.R $NAME 21 150 ./$OUTNAME;

done