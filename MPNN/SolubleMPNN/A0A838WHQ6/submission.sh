#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A838WHQ6
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your SolubleMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "soluble_mpnn" \
--checkpoint_soluble_mpnn "./model_params/solublempnn_v_48_002.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A838WHQ6" \
--out_folder "./outputs/mpj/A0A838WHQ6" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--fixed_residues "A4 A7 A8 A12 A15 A18 A22 A25 A26 A29 A30 A32 A33 A39 A43 A47 A50 A53 A54 A56 A57 A60 A61 A63 A64 A65 A67 A68 A71 A80 A81 A85 A88 A89 A91 A92 A95 A98 A99 A102 A103 A105 A106 A112 A116 A119 A120 A122 A123 A126 A129 A130 A133 A134" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
