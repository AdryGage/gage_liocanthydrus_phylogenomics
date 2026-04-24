#!/bin/bash
#SBATCH -J 0_cat
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

### To merge reads from different runs. 
### See https://github.com/AdryGage/gage_liocanthydrus_phylogenomics/blob/main/genome_assembly_scripts/README.md

#before running, sample.list must be created for the directory by running the following:
#ls *.gz | cut -d "_" -f1 | sort -u >> sample.list

# ls = list
# | = pipe, or send output of previous opteration to next operation.
# cut = cut string 
	# Options. these can be adjusted according to the nameing strings
	# -d "_" = delimiter for cut, here specifying underscore "_" as the character separating different fields
	# -f1 = specifies the field to be printed, in this case 1 indicates the first field, which will be whatever comes before the first underscore (e.g. BLTE39)
# | pipe again
# sort -u = sort and exclude (-u) duplicates 
# >> amend output to file = sample.list

#check sample.list for accuracy before proceeding

#create array from sample.list file
array=$(cat sample.list) 

#catenate based on array
for i in $array;
do cat "$i"*R1*fastq.gz >> "$i"_R1_merged.fastq.gz; 
cat "$i"*R2*fastq.gz >> "$i"_R2_merged.fastq.gz; 
done

## That should do it. Set the array to one or two samples first, then try it. 
 