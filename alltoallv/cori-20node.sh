#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 20
#SBATCH -J alltoallv-cori-20nodes
#SBATCH -o alltoallv-cori-20nodes.o%j

srun -N 20 --ntasks-per-node 64 ./alltoallv-test 1 10
