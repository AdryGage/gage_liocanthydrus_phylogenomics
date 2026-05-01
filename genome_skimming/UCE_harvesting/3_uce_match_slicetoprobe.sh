#SBATCH -J 3_uce_match_slicetoprobe
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

module load conda
source activate ~/.conda/envs/phyluce-1.7.3

phyluce_assembly_match_contigs_to_probes \
	--contigs ./sample-genomeskim-fasta \
	--probes ./probe_set.fasta \
	--output matched_sample_uce \
	--min-identity 80 \