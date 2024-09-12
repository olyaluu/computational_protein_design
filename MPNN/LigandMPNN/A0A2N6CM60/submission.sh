#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A2N6CM60_id30
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your LigandMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "ligand_mpnn" \
--checkpoint_ligand_mpnn "./model_params/ligandmpnn_v_32_005_25.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A2N6CM60_id30" \
--out_folder "./outputs/mpj/A0A2N6CM60_id30" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--redesigned_residues "A4 A7 A8 A15 A18 A19 A22 A25 A26 A29 A30 A41 A45 A49 A52 A53 A55 A56 A59 A60 A63 A72 A73 A80 A83 A87 A90 A91 A100 A104 A107 A108 A111 A114 A115 A118 A12 A119 A121 A65 A57 A77" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
