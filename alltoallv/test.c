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
    
    int param_1 = atoi(argv[1]); // Indicates total data volume
    int param_2 = atoi(argv[2]); // Indicates probability distribution which denotes how the data distribution would look like after all to all

    double p = (param_2*1.0)/100.0;
    double* distribution = (double*) malloc(nprocs*sizeof(double));
    int* sendcnt = (int*) malloc(nprocs*sizeof(int));
    int* sdispls = (int*) malloc(nprocs*sizeof(int));
    int totsend = 0;
    for(int i = 0; i < nprocs; i++){
        distribution[i] = pow(1.0 - p, i)*p;
        sendcnt[i] = (int)(distribution[i] * param_1 * 1.0 * 1000000000);
        totsend += sendcnt[i];
        if(i == 0) sdispls[i] = 0;
        else sdispls[i] = sdispls[i-1] + sendcnt[i];
    }
    char* sendbuff = (char*) malloc(totsend*sizeof(int));
    if(myrank == 0){
        /*printf("nprocs:%d - Testing with data volume: %lf\n",nprocs, (param_1*1.0)/sum);*/
        for(int i = 0; i < nprocs; i++){
            printf("%d -> %d\n", sdispls[i], sendcnt[i]);
        }
    }
    MPI_Finalize();
    return 0;
}
