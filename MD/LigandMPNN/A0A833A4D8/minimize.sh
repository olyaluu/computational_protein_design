#!/bin/bash
#SBATCH --account=jgin030344
#SBATCH --partition=cpu
#SBATCH --cpus-per-task=14
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --time=10:10:00
#SBATCH --mem=10GB
#
#
#
#
#
#
for case in A0A833A4D8_p4a ;
##
##
do
echo $case
for number in 1 2 3 4 5;
do
mpiexec -np 14 --oversubscribe pmemd.MPI -O -i min1.in -o ${case}_${number}_min1.out -p ${case}.prmtop -c ${case}.inpcrd -ref ${case}.inpcrd -r ${case}_${number}_min1.rst
#~
mpirun -np 14 --oversubscribe pmemd.MPI -O -i heat1.in -o ${case}_${number}_heat1.out -p ${case}.prmtop -c ${case}_${number}_min1.rst -ref ${case}.inpcrd -r ${case}_${number}_heat1.rst
##
#mpirun -np 16 --oversubscribe pmemd.MPI -O -i min2_rstlig.in -o ${case}_${number}_min2_rstlig.out -p ${case}.prmtop -c ${case}_${number}_heat1.rst -r ${case}_${number}_min2_rstlig.rst -ref ${case}_${number}_heat1.rst
###
mpirun -np 14 --oversubscribe pmemd.MPI -O -i min2.in -o ${case}_${number}_min2.out -p ${case}.prmtop -c ${case}_${number}_heat1.rst -r ${case}_${number}_min2.rst -ref ${case}_${number}_heat1.rst
###
###
mpirun -np 14 --oversubscribe pmemd.MPI -O -i heat2.in -o ${case}_${number}_heat2.out -p $case.prmtop -c ${case}_${number}_min2.rst -r ${case}_${number}_heat2.rst
done
done
