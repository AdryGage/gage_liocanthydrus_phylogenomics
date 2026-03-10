

# the below script is what I use to generate a SPAdes job file for each sample to run simultanously on our 6hour cluster partition.

#First generate a sample list first (example provided):
array=`cat sample.list`

#checks array:
echo $array  #depending on the list format you may have to use this synax: echo "${array[@]}"   

#This replaces INDIV in the script below with the appropriate sample name
for i in $array; do awk '{gsub("INDIV","'$i'",$0); print($0);}' 7_SPAdes_template.sh > SPADES_"$i".sh; done  

# This submits all the scripts. 
for i in $array; do sbatch SPADES_"$i".sh; done  


##### copy to template file: 7_SPAdes_template.sh

#!/bin/bash
#SBATCH --job-name=assemble
#SBATCH --partition=sixhour
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem=120G
#SBATCH --mail-user=  @gmail.com   #<-add email here
#SBATCH --mail-type=END,FAIL
#SBATCH -o
#SBATCH --output=SPAdes_%j.log

module load conda
module load java

conda activate /panfs/pfs.local/work/bi/s953b810/conda/envs/SPAdes

###do an assembly using the adapter-filtered data as input; modify names and paths as needed
###H3re set to run with reads all in same directory: Can also modify to make directories for each samples' reads if need be

spades.py -1 ./INDIV_R1.clean.trim.fastq.gz -2 ./INDIV_R2.clean.trim.fastq.gz -o ./assemblies/INDIV -t 12

##### for continuing. -o <existing SPAdes assembly output directory>.
#spades.py --continue  -o ./assemblies/INDIV



#SPADES USAGE: -1, -2 = <cleaned, (optionally filtered with bbduk) forward and reverse read files>; -s = <cleaned singleton read file>; -o <output directory> (doesn't have to me pre-made); -t <threads>



#######################################
############ Should look like this after; filename SPAdes_SMBE59.sh:




#!/bin/bash
#SBATCH --job-name=assemble
#SBATCH --partition=sixhour
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=6:00:00
#SBATCH --mem=120G
#SBATCH --mail-user=humphrey778@gmail.com
#SBATCH --mail-type=END,FAIL
#SBATCH -o
#SBATCH --output=SPAdes_%j.log

module load conda
module load java

conda activate /panfs/pfs.local/work/bi/s953b810/conda/envs/SPAdes


### USAGE: -1, -2 = <cleaned, (optionally filtered with bbduk) forward and reverse read files>; -s = <cleaned singleton read file>; -o <output directory> (doesn't have to me pre-made); -t <threads>
#omitting singletons as they are a mess. 

#do an assembly using the adapter-filtered data as input
#spades.py -1 ./SMBE59_R1.clean.trim.fastq.gz -2 ./SMBE59_R2.clean.trim.fastq.gz -o ./assemblies/SMBE59 -t 12

##### for continuing. -o <existing SPAdes assembly output directory>.
spades.py --continue  -o ./assemblies/SMBE59





