#SBATCH -J 4_uce_match_count
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

phyluce_assembly_get_match_counts \
    --locus-db matched_sample_uce/probe.matches.sqlite \
    --taxon-list-config sample_uce_combined.conf \
    --taxon-group 'all' \
    --incomplete-matrix \
    --output sample-uce-incomplete.conf

# NOTE: Output .fasta files will need to be renamed with all caps before proceeding to next step, as defined in the sample_uce_combined.conf
# Why don't I just make this script do that?

