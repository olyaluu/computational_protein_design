#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A0W0Y7J5
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your SolubleMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "soluble_mpnn" \
--checkpoint_soluble_mpnn "./model_params/solublempnn_v_48_002.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A0W0Y7J5" \
--out_folder "./outputs/mpj/A0A0W0Y7J5" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--fixed_residues "A31 A34 A38 A41 A44 A45 A48 A51 A52 A79 A75 A76 A72 A68 A69 A65 A61 A62 A90 A94 A97 A101 A100 A104 A108 A107 A23 A19 A20 A16 A12 A13 A9 A5 A6 A2 A35 A39 A73 A42 A29 A85 A17 A98" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
