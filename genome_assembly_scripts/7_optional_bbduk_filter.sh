#!/bin/bash
#SBATCH --job-name=bbduk
#SBATCH --partition=sixhour
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=6:00:00
#SBATCH --mem=60G
#SBATCH --mail-user= @gmail.com
#SBATCH --mail-type=END,FAIL
#SBATCH -o
#SBATCH --output=bbduck_%j.log

module load java

for i in *R1*.fastq.gz; 
do TRIMNAME1=`echo $i | sed 's/.fastq/.trim.fastq/g'`;
TRIMNAME2=`echo $TRIMNAME1 | sed 's/R1/R2/g'`;
REVERSE=`echo $i | sed 's/R1/R2/g'`;

##filter for length and genotype quality; this trims for read length and quality. Will give input output metrics to see what the data drop off is like. I'll sometimes increase these, but this tends to work as a good way to get rid of the shortest, worst reads at a relatively minimal cost in data.

/panfs/pfs.local/work/bi/s953b810/BBtools/bbmap/bbduk.sh  in1=$i in2=$REVERSE out1=$TRIMNAME1 out2=$TRIMNAME2 qtrim=r minlen=70 trimq=20 maq=20;

done



#for singletons
#/panfs/pfs.local/work/bi/s953b810/BBtools/bbmap/bbduk.sh  in1=./Clean_reads/SMBE23_S4_R1_001.clean.singleton.fastq.gz out1=./Clean_reads/SMBE23_S4_R1_001.trim.singleton.fastq.gz qtrim=r1 trimq=20 minlen=90 maq=30

