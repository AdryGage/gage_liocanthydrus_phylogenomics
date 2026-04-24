#!/bin/bash
#SBATCH -J 10_busco_INDIV
#SBATCH -A allocation
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_%J_%j.err
#SBATCH -o ./log_out/_%J_%j.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=my@email.com

module load conda

conda init
source activate ~/.conda/envs/busco_6.0.0

busco -i ./assemblies/INDIV/contigs.fasta -m genome -o INDIV_BUSCO --out_path ./assemblies/INDIV --auto-lineage --plot ./assemblies/INDIV/busco/ -c 64