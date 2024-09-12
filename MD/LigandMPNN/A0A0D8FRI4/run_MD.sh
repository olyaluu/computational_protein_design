#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --time=6-00:00:00
#SBATCH --mem=10GB
#SBATCH --account=jgin030344

#
#
#
#
#
for case in A0A0D8FRI4 ;
##
##
do
echo $case
for number in 1 2 3 4 5;
do
#mpiexec -np 14 --oversubscribe pmemd.MPI -O -i min1.in -o ${case}_${number}_min1.out -p ${case}.prmtop -c ${case}.rst7 -ref ${case}.rst7 -r ${case}_${number}_min1.rst
#~
#mpirun -np 14 --oversubscribe pmemd.MPI -O -i heat1.in -o ${case}_${number}_heat1.out -p ${case}.prmtop -c ${case}_${number}_min1.rst -ref ${case}.rst7 -r ${case}_${number}_heat1.rst
##
#mpirun -np 16 --oversubscribe pmemd.MPI -O -i min2_rstlig.in -o ${case}_${number}_min2_rstlig.out -p ${case}.prmtop -c ${case}_${number}_heat1.rst -r ${case}_${number}_min2_rstlig.rst -ref ${case}_${number}_heat1.rst
###
#mpirun -np 14 --oversubscribe pmemd.MPI -O -i min2.in -o ${case}_${number}_min2.out -p ${case}.prmtop -c ${case}_${number}_heat1.rst -r ${case}_${number}_min2.rst -ref ${case}_${number}_heat1.rst
###
###
#mpirun -np 14 --oversubscribe pmemd.MPI -O -i heat2.in -o ${case}_${number}_heat2.out -p $case.prmtop -c ${case}_${number}_min2.rst -r ${case}_${number}_heat2.rst
#
$AMBERHOME/bin/pmemd.cuda -O -i eq_norst.in -o ${case}_${number}_eq.out -p $case.prmtop -c ${case}_${number}_heat2.rst -ref ${case}_${number}_heat2.rst -r ${case}_${number}_eq.rst
##
$AMBERHOME/bin/pmemd.cuda -O -i MD_50ns.in -o ${case}_${number}_50nsMD.out -p $case.prmtop -c ${case}_${number}_eq.rst -ref ${case}_${number}_eq.rst -r ${case}_${number}_MD.rst -x ${case}_${number}_MD.nc

done
done
