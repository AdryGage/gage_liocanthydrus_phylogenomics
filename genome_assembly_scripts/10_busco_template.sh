#!/bin/bash
#SBATCH -J busco_INDIV      # Job name
#SBATCH -A hpc_sbaca_su2
#SBATCH -N 1
#SBATCH -n 64
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH -p single
#SBATCH -e ./error_out/_10_busco_INDIV_%j.err        # Error log
#SBATCH -o ./log_out/_10_busco_INDIV_%j.log     # Standard output
#SBATCH --mail-type=ALL
#SBATCH --mail-user=adry.gage@lsu.edu

module load conda

conda init
source activate /work/adry/conda/envs/busco_6.0.0

busco -i /work/adry/processing_room/assemblies/INDIV/contigs.fasta -m genome -o INDIV_BUSCO --out_path /work/adry/processing_room/assemblies/INDIV --auto-lineage --plot /work/adry/processing_room/assemblies/INDIV/busco/ -c 64