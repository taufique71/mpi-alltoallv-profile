#!/bin/bash -l

#SBATCH -q debug
#SBATCH -C knl
#SBATCH -A m1982
#SBATCH -t 00:30:00

#SBATCH -N 16
#SBATCH -J alltoallv_test
#SBATCH -o alltoallv_test.o%j

srun -N 1 -n 64 ./alltoallv-test 1 10
srun -N 1 -n 64 ./alltoallv-test 1 20
srun -N 1 -n 64 ./alltoallv-test 1 30
srun -N 1 -n 64 ./alltoallv-test 1 40
srun -N 1 -n 64 ./alltoallv-test 1 50
srun -N 1 -n 64 ./alltoallv-test 1 60
srun -N 1 -n 64 ./alltoallv-test 1 70
srun -N 1 -n 64 ./alltoallv-test 1 80
srun -N 1 -n 64 ./alltoallv-test 1 90
srun -N 1 -n 64 ./alltoallv-test 2 10
srun -N 1 -n 64 ./alltoallv-test 2 20
srun -N 1 -n 64 ./alltoallv-test 2 30
srun -N 1 -n 64 ./alltoallv-test 2 40
srun -N 1 -n 64 ./alltoallv-test 2 50
srun -N 1 -n 64 ./alltoallv-test 2 60
srun -N 1 -n 64 ./alltoallv-test 2 70
srun -N 1 -n 64 ./alltoallv-test 2 80
srun -N 1 -n 64 ./alltoallv-test 2 90
srun -N 2 -n 128 ./alltoallv-test 1 10
srun -N 2 -n 128 ./alltoallv-test 1 20
srun -N 2 -n 128 ./alltoallv-test 1 30
srun -N 2 -n 128 ./alltoallv-test 1 40
srun -N 2 -n 128 ./alltoallv-test 1 50
srun -N 2 -n 128 ./alltoallv-test 1 60
srun -N 2 -n 128 ./alltoallv-test 1 70
srun -N 2 -n 128 ./alltoallv-test 1 80
srun -N 2 -n 128 ./alltoallv-test 1 90
srun -N 2 -n 128 ./alltoallv-test 2 10
srun -N 2 -n 128 ./alltoallv-test 2 20
srun -N 2 -n 128 ./alltoallv-test 2 30
srun -N 2 -n 128 ./alltoallv-test 2 40
srun -N 2 -n 128 ./alltoallv-test 2 50
srun -N 2 -n 128 ./alltoallv-test 2 60
srun -N 2 -n 128 ./alltoallv-test 2 70
srun -N 2 -n 128 ./alltoallv-test 2 80
srun -N 2 -n 128 ./alltoallv-test 2 90
srun -N 4 -n 256 ./alltoallv-test 1 10
srun -N 4 -n 256 ./alltoallv-test 1 20
srun -N 4 -n 256 ./alltoallv-test 1 30
srun -N 4 -n 256 ./alltoallv-test 1 40
srun -N 4 -n 256 ./alltoallv-test 1 50
srun -N 4 -n 256 ./alltoallv-test 1 60
srun -N 4 -n 256 ./alltoallv-test 1 70
srun -N 4 -n 256 ./alltoallv-test 1 80
srun -N 4 -n 256 ./alltoallv-test 1 90
srun -N 4 -n 256 ./alltoallv-test 2 10
srun -N 4 -n 256 ./alltoallv-test 2 20
srun -N 4 -n 256 ./alltoallv-test 2 30
srun -N 4 -n 256 ./alltoallv-test 2 40
srun -N 4 -n 256 ./alltoallv-test 2 50
srun -N 4 -n 256 ./alltoallv-test 2 60
srun -N 4 -n 256 ./alltoallv-test 2 70
srun -N 4 -n 256 ./alltoallv-test 2 80
srun -N 4 -n 256 ./alltoallv-test 2 90
srun -N 8 -n 512 ./alltoallv-test 1 10
srun -N 8 -n 512 ./alltoallv-test 1 20
srun -N 8 -n 512 ./alltoallv-test 1 30
srun -N 8 -n 512 ./alltoallv-test 1 40
srun -N 8 -n 512 ./alltoallv-test 1 50
srun -N 8 -n 512 ./alltoallv-test 1 60
srun -N 8 -n 512 ./alltoallv-test 1 70
srun -N 8 -n 512 ./alltoallv-test 1 80
srun -N 8 -n 512 ./alltoallv-test 1 90
srun -N 8 -n 512 ./alltoallv-test 2 10
srun -N 8 -n 512 ./alltoallv-test 2 20
srun -N 8 -n 512 ./alltoallv-test 2 30
srun -N 8 -n 512 ./alltoallv-test 2 40
srun -N 8 -n 512 ./alltoallv-test 2 50
srun -N 8 -n 512 ./alltoallv-test 2 60
srun -N 8 -n 512 ./alltoallv-test 2 70
srun -N 8 -n 512 ./alltoallv-test 2 80
srun -N 8 -n 512 ./alltoallv-test 2 90
srun -N 16 -n 1024 ./alltoallv-test 1 10
srun -N 16 -n 1024 ./alltoallv-test 1 20
srun -N 16 -n 1024 ./alltoallv-test 1 30
srun -N 16 -n 1024 ./alltoallv-test 1 40
srun -N 16 -n 1024 ./alltoallv-test 1 50
srun -N 16 -n 1024 ./alltoallv-test 1 60
srun -N 16 -n 1024 ./alltoallv-test 1 70
srun -N 16 -n 1024 ./alltoallv-test 1 80
srun -N 16 -n 1024 ./alltoallv-test 1 90
srun -N 16 -n 1024 ./alltoallv-test 2 10
srun -N 16 -n 1024 ./alltoallv-test 2 20
srun -N 16 -n 1024 ./alltoallv-test 2 30
srun -N 16 -n 1024 ./alltoallv-test 2 40
srun -N 16 -n 1024 ./alltoallv-test 2 50
srun -N 16 -n 1024 ./alltoallv-test 2 60
srun -N 16 -n 1024 ./alltoallv-test 2 70
srun -N 16 -n 1024 ./alltoallv-test 2 80
srun -N 16 -n 1024 ./alltoallv-test 2 90
