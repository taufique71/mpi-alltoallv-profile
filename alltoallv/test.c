#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char** argv){
    MPI_Init(&argc, &argv);
    int nprocs, myrank;
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    if(argc != 3){
        if(myrank == 0) printf("Invalid input. There should be three inputs - <file binary>, <integer>, <integer between 1 and 99>.\n");
        MPI_Barrier(MPI_COMM_WORLD);
        MPI_Abort(MPI_COMM_WORLD, MPI_ERR_OTHER);
    }
    int param_1 = atoi(argv[1]); 
    int param_2 = atoi(argv[2]);
    double p = (param_2*1.0)/100.0;
    double* distribution = (double*) malloc(nprocs*sizeof(double));
    double sum = 0.0;
    for(int i = 0; i < nprocs; i++){
        distribution[i] = pow(1.0-p, i)*p;
        sum += distribution[i];
    }
    if(myrank == 0){
        printf("Testing with data volume: %lf\n", (param_1*1.0)/sum);
    }
    MPI_Finalize();
    return 0;
}
