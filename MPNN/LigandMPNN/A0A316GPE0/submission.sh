#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=compute
#SBATCH --time=1:00:00
#SBATCH --mem=10000M
#SBATCH --output=output.out         # this is the name of the slurm output file, call it whatever you like
#SBATCH --job-name=A0A316GPE0_id21
#SBATCH --account=BISC030525        # change this to your specific account number, it should be in an email from IT services

# your LigandMPNN command goes here
# construct this command according to the examples on the github and your design task

python run.py --model_type "ligand_mpnn" \
--checkpoint_ligand_mpnn "./model_params/ligandmpnn_v_32_005_25.pt" \
--seed 120 \
--pdb_path "./inputs/mpj/A0A316GPE0_id21" \
--out_folder "./outputs/mpj/A0A316GPE0_id21" \
--omit_AA "CH" \
--bias_AA "A:-3.0" \
--redesigned_residues "A3 A7 A13 A14 A17 A18 A21 A24 A25 A28 A35 A42 A45 A46 A49 A50 A53 A56 A57 A70 A74 A77 A80 A81 A84 A95 A98 A99 A102 A106 A109 A110 A113 A114 A116 A117 A43 A54 A85 A90 A89 A88 A11 A64" \
--pack_side_chains 1 \
--pack_with_ligand_context 1 \
--number_of_packs_per_design 1 \
--batch_size 25 \
--number_of_batches 4 \
