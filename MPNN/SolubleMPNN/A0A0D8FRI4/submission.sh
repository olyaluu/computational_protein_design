#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A0D8FRI4
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your SolubleMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "soluble_mpnn" \
--checkpoint_soluble_mpnn "./model_params/solublempnn_v_48_002.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A0D8FRI4" \
--out_folder "./outputs/mpj/A0A0D8FRI4" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--fixed_residues "A2 A6 A9 A13 A16 A17 A20 A23 A24 A29 A35 A43 A44 A48 A51 A52 A54 A57 A58 A61 A64 A65 A73 A76 A77 A80 A83 A84 A87 A88 A91 A92 A94 A95 A105 A109 A111 A112 A115 A119 A122 A125 A126" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
