#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char** argv){
    MPI_Init(&argc, &argv);
    int nprocs, myrank;
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
    if(argc != 3){
        if(myrank == 0) printf("Invalid input\n"); 
        MPI_Barrier(MPI_COMM_WORLD);
        MPI_Abort(MPI_COMM_WORLD, MPI_ERR_OTHER);
    }

    // Indicates total data volume
    double param_1 = atof(argv[1]); 
    // Indicates probability distribution which denotes 
    // how the data distribution would look like after Alltoallv
    int param_2 = atoi(argv[2]); 
    int total_data_volume = (int)(param_1 * 1000000000);
    int local_data_volume = (myrank < nprocs-1) ? 
                            (total_data_volume / nprocs) : 
                            (total_data_volume - (total_data_volume / nprocs) * myrank);

    char* send_data = (char*) malloc(local_data_volume*sizeof(char));
    memset(send_data, 'x', local_data_volume);
    /*long long int* send_data = 
     * (long long int*) malloc(local_data_volume*sizeof(long long int));*/
    /*memset(send_data, 123456789, local_data_volume);*/


    for(int param_2 = 10; param_2 < 100; param_2 = param_2 + 10){
        double p = (param_2*1.0)/100.0;
        double* distribution = (double*) malloc(nprocs*sizeof(double));
        int* sendcnt = (int*) malloc(nprocs*sizeof(int));
        int* sdispls = (int*) malloc(nprocs*sizeof(int));
        for(int i = 0; i < nprocs; i++){
            distribution[i] = pow((1.0 - p), i) * p;
            sendcnt[i] = (int)(distribution[i] * local_data_volume);
            if(i == 0) sdispls[i] = 0;
            else sdispls[i] = sdispls[i-1] + sendcnt[i-1];
        }

        int* recvcnt = (int*) malloc(nprocs*sizeof(int));
        int* rdispls = (int*) malloc(nprocs*sizeof(int));
        MPI_Alltoall(sendcnt, 1, MPI_INT, recvcnt, 1, MPI_INT, MPI_COMM_WORLD);
        rdispls[0] = 0;
        for(int i = 1; i < nprocs; i++){
            rdispls[i] = rdispls[i-1] + recvcnt[i-1];
        }
        int recv_data_volume = rdispls[nprocs-1] + recvcnt[nprocs-1];
        char* recv_data = (char*) malloc(recv_data_volume*sizeof(char));
        /*long long int* recv_data = (long long int*) malloc(recv_data_volume*sizeof(long long int));*/
        int count = 10;
        double t0 = MPI_Wtime();
        for(int i = 0; i < count; i++){
            MPI_Alltoallv(send_data, sendcnt, sdispls, MPI_CHAR,
                          recv_data, recvcnt, rdispls, MPI_CHAR, MPI_COMM_WORLD);
        }
        double t1 = MPI_Wtime();
        double runtime = (t1-t0)/count;
        if(myrank == 0){
            printf("%d, %0.2lf, %lf, %0.10lf\n",
                    nprocs, p, param_1, runtime);
        }
        free(distribution);
        free(sendcnt);
        free(sdispls);
        free(recvcnt);
        free(rdispls);
        free(recv_data);
    }
    MPI_Finalize();
    return 0;
}
