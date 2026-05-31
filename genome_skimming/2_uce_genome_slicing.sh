#SBATCH -J 2_uce_genome_slicing
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

phyluce_probe_slice_sequence_from_genomes \
    --lastz sample-genome-lastz \
    --conf genomes.conf \
    --flank 500 \
    --name-pattern "probe_set_{}.lastz.clean" \
    --output sample-genomeskim-fasta