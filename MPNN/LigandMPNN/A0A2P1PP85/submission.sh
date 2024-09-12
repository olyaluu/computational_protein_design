#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A2P1PP85_id23
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your LigandMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "ligand_mpnn" \
--checkpoint_ligand_mpnn "./model_params/ligandmpnn_v_32_005_25.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A2P1PP85_id23" \
--out_folder "./outputs/mpj/A0A2P1PP85_id23" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--redesigned_residues "A4 A8 A11 A12 A14 A15 A18 A21 A22 A26 A27 A28 A32 A35 A36 A38 A39 A42 A45 A46 A49 A62 A63 A65 A66 A69 A73 A76 A77 A80 A83 A84 A85 A90 A94 A97 A98 A101 A103 A104 A107 A108 A112 A1 A52 A53 A54 A55 A56 A58 A60" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
