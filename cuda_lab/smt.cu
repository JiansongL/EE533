#include <cstdio>
#include <vector>
#include <cstdlib>
#include <cmath>
#include <cuda_runtime.h>

#define TILE_WIDTH 16

#define CUDA_CHECK(call) \
    do { \
        cudaError_t err = call; \
        if (err != cudaSuccess) { \
            fprintf(stderr, "CUDA error at %s:%d code=%d(%s) \"%s\"\n", __FILE__, __LINE__, err, cudaGetErrorName(err), #call); \
            exit(1); \
        } \
    } while (0)

__global__ void matrixMultiplyTiled(const float* A, const float* B, float* C, int N) {
    __shared__ float ds_A[TILE_WIDTH][TILE_WIDTH];
    __shared__ float ds_B[TILE_WIDTH][TILE_WIDTH];

    int bx = blockIdx.x; int by = blockIdx.y;
    int tx = threadIdx.x; int ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    float Pvalue = 0.0f;

    for (int m = 0; m < (N + TILE_WIDTH - 1) / TILE_WIDTH; ++m) {
        if (Row < N && (m*TILE_WIDTH + tx) < N)
            ds_A[ty][tx] = A[Row * N + m * TILE_WIDTH + tx];
        else
            ds_A[ty][tx] = 0.0f;

        if (Col < N && (m*TILE_WIDTH + ty) < N)
            ds_B[ty][tx] = B[(m*TILE_WIDTH + ty) * N + Col];
        else
            ds_B[ty][tx] = 0.0f;

        __syncthreads();

        for (int k = 0; k < TILE_WIDTH; ++k)
            Pvalue += ds_A[ty][k] * ds_B[k][tx];

        __syncthreads();
    }

    if (Row < N && Col < N)
        C[Row * N + Col] = Pvalue;
}

int main(int argc, char** argv) {
    int N = (argc > 1) ? atoi(argv[1]) : 512;
    int REPEAT = (argc > 2) ? atoi(argv[2]) : 3;

    size_t bytes = (size_t)N * N * sizeof(float);

    std::vector<float> hA(N*N), hB(N*N), hC(N*N);
    for (auto &x : hA) x = (float)rand()/RAND_MAX - 0.5f;
    for (auto &x : hB) x = (float)rand()/RAND_MAX - 0.5f;

    float *dA, *dB, *dC;
    CUDA_CHECK(cudaMalloc(&dA, bytes));
    CUDA_CHECK(cudaMalloc(&dB, bytes));
    CUDA_CHECK(cudaMalloc(&dC, bytes));
    CUDA_CHECK(cudaMemcpy(dA, hA.data(), bytes, cudaMemcpyHostToDevice));
    CUDA_CHECK(cudaMemcpy(dB, hB.data(), bytes, cudaMemcpyHostToDevice));

    dim3 block(TILE_WIDTH, TILE_WIDTH);
    dim3 grid((N + TILE_WIDTH - 1)/TILE_WIDTH, (N + TILE_WIDTH - 1)/TILE_WIDTH);

    cudaEvent_t start, stop;
    CUDA_CHECK(cudaEventCreate(&start));
    CUDA_CHECK(cudaEventCreate(&stop));

    // warmup
    matrixMultiplyTiled<<<grid, block>>>(dA, dB, dC, N);
    CUDA_CHECK(cudaDeviceSynchronize());

    float total_ms = 0.0f;
    for (int r=0; r<REPEAT; r++) {
        CUDA_CHECK(cudaEventRecord(start));
        matrixMultiplyTiled<<<grid, block>>>(dA, dB, dC, N);
        CUDA_CHECK(cudaEventRecord(stop));
        CUDA_CHECK(cudaEventSynchronize(stop));
        float ms;
        CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop));
        total_ms += ms;
    }

    float avg_ms = total_ms / REPEAT;
    printf("N=%d, TILE=%d, avg kernel time = %.3f ms\n", N, TILE_WIDTH, avg_ms);

    CUDA_CHECK(cudaFree(dA));
    CUDA_CHECK(cudaFree(dB));
    CUDA_CHECK(cudaFree(dC));
    return 0;
}
