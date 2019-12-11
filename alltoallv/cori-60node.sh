#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 60
#SBATCH -J alltoallv-cori-60nodes
#SBATCH -o alltoallv-cori-60nodes.o%j

srun -N 60 --ntasks-per-node 64 ./alltoallv-test 0.001 10
