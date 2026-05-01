#SBATCH -J 6_uce_alignment
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

phyluce_align_seqcap_align \
    --input sample-incomplete_NoRogue.fasta \
    --output Combined_incomplete_mafft_notrim_fasta \
    --taxa 29 \
    --aligner mafft \
    --cores 64 \
    --no-trim \
    --incomplete-matrix \
    --output-format fasta \
    --log-path log_out

###no-trim option: only use with gblocks. Delete if not usign gblocks.