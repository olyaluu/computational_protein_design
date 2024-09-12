#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A316AG42
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your SolubleMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "soluble_mpnn" \
--checkpoint_soluble_mpnn "./model_params/solublempnn_v_48_002.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A316AG42" \
--out_folder "./outputs/mpj/A0A316AG42" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--fixed_residues "A88 A91 A94 A95 A98 A97 A101 A102 A105 A108 A109 A77 A74 A70 A67 A63 A64 A33 A37 A40 A43 A44 A47 A50 A51 A54 A26 A22 A18 A19 A15 A11 A12 A8 A4 A5 A31 A25 A82 A83 A23 A78" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
