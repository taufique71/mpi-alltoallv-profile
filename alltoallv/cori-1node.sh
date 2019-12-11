#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 1
#SBATCH -J alltoallv-cori-1nodes
#SBATCH -o alltoallv-cori-1nodes.o%j

srun -N 1 --ntasks-per-node 64 ./alltoallv-test 0.001 10
