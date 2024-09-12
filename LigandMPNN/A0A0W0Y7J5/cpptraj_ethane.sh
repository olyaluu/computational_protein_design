#!/bin/bash
for i in *MD.nc;
do
echo $i
echo "parm A0A0W0Y7J5_p4a.prmtop" >> ${i}_cpptraj2.in
echo "trajin $i" >> ${i}_cpptraj2.in
echo "autoimage" >> ${i}_cpptraj2.in
echo "rms ToFirst :1-111@C,CA,N first out ${i}_rmsd_backbone.dat mass" >> ${i}_cpptraj2.in
echo "atomicfluct out ${i}_rmsf_2.dat :1-111@C,CA,N byres" >> ${i}_cpptraj2.in
echo "rmsd HEB first :HEB out ${i}_rmsd_HEB_2.dat" >> ${i}_cpptraj2.in
echo "run" >> ${i}_cpptraj2.in
done