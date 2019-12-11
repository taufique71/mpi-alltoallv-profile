#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 30
#SBATCH -J alltoallv-cori-30nodes
#SBATCH -o alltoallv-cori-30nodes.o%j

srun -N 30 --ntasks-per-node 64 ./alltoallv-test 0.001 10
