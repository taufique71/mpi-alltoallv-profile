#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 32
#SBATCH -J alltoallv-cori-32nodes
#SBATCH -o alltoallv-cori-32nodes.o%j

srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 10
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 20
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 30
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 40
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 50
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 60
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 70
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 80
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 1 90
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 10
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 20
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 30
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 40
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 50
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 60
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 70
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 80
srun -N 32 --ntasks-per-node 64 ./alltoallv-test 2 90
