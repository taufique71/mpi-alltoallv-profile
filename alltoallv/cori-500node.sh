#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 500
#SBATCH -J alltoallv-cori-500nodes
#SBATCH -o alltoallv-cori-500nodes.o%j

srun -N 500 --ntasks-per-node 64 ./alltoallv-test 1 10
