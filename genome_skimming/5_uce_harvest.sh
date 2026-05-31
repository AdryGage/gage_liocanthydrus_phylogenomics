#SBATCH -J 5_uce_harvest
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

#you need to make a log directory
#use command: mkdir log

#what does this do?
#Given a match-count file (produced from phyluce_assembly_get_match_counts), output a monolithic FASTA-formatted file of UCE loci.

phyluce_assembly_get_fastas_from_match_counts \
    --contigs ./sample-genomeskim-fasta \
    --locus-db ./matched_sample_uce/probe.matches.sqlite\
    --match-count-output sample-uce-incomplete.conf \
    --output sample-incomplete_NoRogue.fasta \
    --incomplete-matrix sample-combined.incomplete \
    --log-path log_out