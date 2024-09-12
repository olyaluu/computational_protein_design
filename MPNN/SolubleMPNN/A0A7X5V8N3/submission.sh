#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A7X5V8N3
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your SolubleMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "soluble_mpnn" \
--checkpoint_soluble_mpnn "./model_params/solublempnn_v_48_002.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A7X5V8N3" \
--out_folder "./outputs/mpj/A0A7X5V8N3" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--fixed_residues "A3 A6 A7 A10 A13 A17 A20 A24 A27 A35 A39 A42 A43 A45 A49 A52 A56 A59 A68 A69 A72 A75 A76 A79 A82 A86 A87 A91 A98 A101 A104 A105 A108 A109 A112 A95 A99 A102 A21 A28 A89 A83 A46" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
