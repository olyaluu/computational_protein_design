#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A833A4D8_id23
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your LigandMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "ligand_mpnn" \
--checkpoint_ligand_mpnn "./model_params/ligandmpnn_v_32_005_25.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A833A4D8_id23" \
--out_folder "./outputs/mpj/A0A833A4D8_id23" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--redesigned_residues "A3 A6 A7 A10 A11 A14 A17 A18 A21 A22 A24 A25 A32 A36 A39 A42 A43 A45 A46 A49 A50 A53 A59 A60 A63 A66 A67 A70 A73 A74 A77 A80 A81 A90 A94 A97 A98 A100 A101 A103 A104 A107 A110 A111 A85 A29 A78" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
