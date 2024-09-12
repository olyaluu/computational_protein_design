The scripts in the folders were created as part of a master's project "Characterisation and design modifications of 
multiheme-containing proteins using computational- and AI-derived design"

List of Files: 

1) The "MPNN" folder contains customized scripts used for submission to an HPC cluster to run SolubleMPNN and LigandMPNN.

2) The "MD" folder contains customized scripts used for running molecular dynamics simulations with AMBER24 on an HPC cluster:
	1. Preparing Structure:
		- tleap.in - to generate the system
		- heme.frcmod and hemeb.lib - parameter files
	2. System Minimization:
		- min1.in, min2.in, heat1.in, heat2 - configuration files
		- minimize.sh - to run minimization
	3. Molecular Dynamics Simulations:
		- eq_norst.in , MD_50ns.in - configuration files
		- run_MD.sh - to run MD
	4. Analysis:
		- cpptraj_ethane.sh - to calculate RMSD and RMSF
		- cpptraj.sh - to extract RMSD and RMSF data as .dat files