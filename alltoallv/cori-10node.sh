#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 10
#SBATCH -J alltoallv-cori-10nodes
#SBATCH -o alltoallv-cori-10nodes.o%j

srun -N 10 --ntasks-per-node 64 ./alltoallv-test 0.001 10
