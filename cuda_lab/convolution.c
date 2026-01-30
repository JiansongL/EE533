#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image.h"
#include "stb_image_write.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

static double now_seconds(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
}

// --------------------------- utilities ------------------------------
static unsigned char* load_gray_u8(const char* path, int* W, int* H) {
    int n;
    unsigned char* img = stbi_load(path, W, H, &n, 1);
    if (!img) return NULL;
    return img; // 8-bit grayscale
}

static int save_gray_png(const char* path, const unsigned char* img, int W, int H) {
    return stbi_write_png(path, W, H, 1, img, W) != 0;
}

// Crop center square (returns new MxM buffer)
static unsigned char* crop_center_square_u8(const unsigned char* src, int W, int H, int* pM) {
    int M = (W < H) ? W : H;
    int x0 = (W - M) / 2;
    int y0 = (H - M) / 2;
    unsigned char* out = (unsigned char*)malloc((size_t)M*(size_t)M);
    if (!out) return NULL;
    for (int y=0; y<M; ++y) {
        memcpy(out + y*M, src + (y0+y)*W + x0, (size_t)M);
    }
    *pM = M;
    return out;
}

// --------------------------- padding modes -------------------------
typedef enum {
    PAD_ZERO = 0,
    PAD_REPLICATE = 1,
    PAD_REFLECT = 2
} pad_t;

static pad_t parse_pad(const char* s) {
    if (!s) return PAD_REFLECT;
    if (!strcmp(s, "zero")) return PAD_ZERO;
    if (!strcmp(s, "replicate")) return PAD_REPLICATE;
    if (!strcmp(s, "reflect")) return PAD_REFLECT;
    return PAD_REFLECT;
}

static int clampi(int v, int lo, int hi) {
    if (v < lo) return lo;
    if (v > hi) return hi;
    return v;
}

static int map_index(int i, int n, pad_t mode) {
    switch (mode) {
        case PAD_ZERO:
            return (i < 0 || i >= n) ? -1 : i;
        case PAD_REPLICATE:
            return clampi(i, 0, n-1);
        case PAD_REFLECT: {
            if (n <= 1) return 0;
            int period = 2*(n-1);
            int i2 = i % period; if (i2 < 0) i2 += period;
            if (i2 >= n) i2 = period - i2;
            return i2;
        }
        default:
            return (i < 0 || i >= n) ? -1 : i;
    }
}

// --------------------------- convolution ---------------------------
// img: MxM (u8), kernel: N x N (float), output u8
static unsigned char* convolve_u8(const unsigned char* img, int M,
                                  const float* K, int N,
                                  pad_t pad, int normalize, int post_abs) {
    if (!img || !K || M <= 0 || N <= 0 || (N%2)==0) return NULL;
    unsigned char* out = (unsigned char*)malloc((size_t)M*(size_t)M);
    if (!out) return NULL;

    // Precompute normalization factor
    float sum = 0.0f;
    if (normalize) {
        for (int i=0;i<N*N;i++) sum += K[i];
        if (sum == 0.0f) sum = 1.0f;
    } else {
        sum = 1.0f;
    }

    int r = N / 2;
    for (int y=0; y<M; ++y) {
        for (int x=0; x<M; ++x) {
            double acc = 0.0;
            for (int ky=0; ky<N; ++ky) {
                int iy_m = map_index(y + ky - r, M, pad);
                for (int kx=0; kx<N; ++kx) {
                    int ix_m = map_index(x + kx - r, M, pad);
                    int p = 0;
                    if (ix_m >= 0 && iy_m >= 0) p = img[iy_m * M + ix_m];
                    acc += (double)p * (double)K[ky*N + kx];
                }
            }
            if (normalize) acc /= (double)sum;
            if (post_abs) acc = fabs(acc);
            int v = (int)llround(acc);
            if (v < 0) v = 0;
            if (v > 255) v = 255;
            out[y*M + x] = (unsigned char)v;
        }
    }
    return out;
}

// --------------------------- kernels -------------------------------
typedef struct {
    float* data;
    int N;
    int normalize; // 1 => divide by sum(K)
    int post_abs;  // 1 => abs() result (e.g., gradient magnitude approx)
} kernel_desc;

static void free_kernel(kernel_desc* kd) {
    if (!kd) return;
    if (kd->data) free(kd->data);
    kd->data = NULL;
}

// Fixed small kernels
static const float K_SOBEL_GX[9] = {
    -1, 0, 1,
    -2, 0, 2,
    -1, 0, 1
};
static const float K_SOBEL_GY[9] = {
    -1, -2, -1,
     0,  0,  0,
     1,  2,  1
};
static const float K_PREWITT_GX[9] = {
    -1, 0, 1,
    -1, 0, 1,
    -1, 0, 1
};
static const float K_PREWITT_GY[9] = {
    -1, -1, -1,
     0,  0,  0,
     1,  1,  1
};
static const float K_LAPLACE4[9] = {
     0,-1, 0,
    -1, 4,-1,
     0,-1, 0
};
static const float K_LAPLACE8[9] = {
    -1,-1,-1,
    -1, 8,-1,
    -1,-1,-1
};

static const float K_SHARPEN3[9] = {
     0,-1, 0,
    -1, 5,-1,
     0,-1, 0
};

// --------------------------- dynamic kernels --------------------------
// Box kernel N×N (all ones; normalization handled later if needed)
static float* make_boxN(int N) {
    float* K = (float*)malloc((size_t)N*(size_t)N*sizeof(float));
    if (!K) return NULL;
    for (int i=0;i<N*N;i++) K[i]=1.0f;
    return K;
}

// 5x5 Gaussian (normalized 1/256 * Pascal rows)
static float* make_gauss5(void) {
    static const int G[25] = {
         1,  4,  6,  4, 1,
         4, 16, 24, 16, 4,
         6, 24, 36, 24, 6,
         4, 16, 24, 16, 4,
         1,  4,  6,  4, 1
    };
    float* K = (float*)malloc(25*sizeof(float));
    if (!K) return NULL;
    for (int i=0;i<25;i++) K[i] = G[i] / 256.0f;
    return K;
}

static kernel_desc pick_kernel(const char* name) {
    kernel_desc kd = {0};
    if (!name) return kd;

    if (!strcmp(name,"sobelx3")) { kd.data=(float*)K_SOBEL_GX; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"sobely3")) { kd.data=(float*)K_SOBEL_GY; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"prewittx3")) { kd.data=(float*)K_PREWITT_GX; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"prewitty3")) { kd.data=(float*)K_PREWITT_GY; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"lap4")) { kd.data=(float*)K_LAPLACE4; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"lap8")) { kd.data=(float*)K_LAPLACE8; kd.N=3; kd.normalize=0; kd.post_abs=1; return kd; }
    if (!strcmp(name,"sharpen3")) { kd.data=(float*)K_SHARPEN3; kd.N=3; kd.normalize=0; kd.post_abs=0; return kd; }

    if (!strcmp(name,"box3")) {
        kd.data = make_boxN(3); kd.N=3; kd.normalize=1; kd.post_abs=0; return kd;
    }
    if (!strcmp(name,"box5")) {
        kd.data = make_boxN(5); kd.N=5; kd.normalize=1; kd.post_abs=0; return kd;
    }
    if (!strcmp(name,"gauss5")) {
        kd.data = make_gauss5(); kd.N=5; kd.normalize=0; kd.post_abs=0; return kd;
    }

    // If we got here and still NULL, return kd with NULL to signal error.
    return kd;
}

// --------------------------- main & CLI ------------------------------
static void usage(const char* prog) {
    fprintf(stderr,
        "Usage:\n"
        "  %s synth <M> <out.png> <kernel> [zero|replicate|reflect]\n"
        "  %s apply <in.png> <out.png> <kernel> [zero|replicate|reflect]\n"
        "  %s bench <in.png> <kernel> <iters> [zero|replicate|reflect]\n"
        "\nKernels:\n"
        "  sobelx3, sobely3, prewittx3, prewitty3, lap4, lap8, sharpen3,\n"
        "  box3, box5, gauss5\n",
        prog, prog, prog);
}

int main(int argc, char** argv) {
    if (argc < 2) { usage(argv[0]); return 1; }
    const char* cmd = argv[1];

    // -------- synth: generate a random image and filter it -------------
    if (!strcmp(cmd,"synth")) {
        if (argc < 5) { usage(argv[0]); return 1; }
        int M = atoi(argv[2]);
        const char* outpath = argv[3];
        const char* kname   = argv[4];
        pad_t pad = (argc>=6) ? parse_pad(argv[5]) : PAD_REFLECT;

        unsigned char* img = (unsigned char*)malloc((size_t)M*(size_t)M);
        if (!img) { fprintf(stderr,"oom\n"); return 1; }
        for (int i=0;i<M*M;i++) img[i] = (unsigned char)(rand()%256);

        kernel_desc kd = pick_kernel(kname);
        if (!kd.data) { fprintf(stderr,"unknown kernel '%s'\n", kname); free(img); return 1; }

        double t0 = now_seconds();
        unsigned char* out = convolve_u8(img, M, kd.data, kd.N, pad, kd.normalize, kd.post_abs);
        double t1 = now_seconds();
        if (!out) { fprintf(stderr,"convolve fail\n"); free(img); free_kernel(&kd); return 1; }
        double ms = (t1 - t0)*1000.0;

        free(img);
        if (!save_gray_png(outpath, out, M, M)) { fprintf(stderr,"save fail\n"); free(out); free_kernel(&kd); return 1; }
        free(out);

        printf("Time: %.3f ms (M=%d, N=%d)\n", ms, M, kd.N);
        printf("Saved: %s (%dx%d), kernel=%s (N=%d), pad=%s\n",
               outpath, M, M, kname, kd.N,
               (pad==PAD_ZERO?"zero":(pad==PAD_REPLICATE?"replicate":"reflect")));
        free_kernel(&kd);
        return 0;
    }

    // -------- apply: filter an image -------------------------
    if (!strcmp(cmd,"apply")) {
        if (argc < 5) { usage(argv[0]); return 1; }
        const char* inpath  = argv[2];
        const char* outpath = argv[3];
        const char* kname   = argv[4];
        pad_t pad = (argc>=6) ? parse_pad(argv[5]) : PAD_REFLECT;

        int W,H;
        unsigned char* src = load_gray_u8(inpath,&W,&H);
        if (!src) { fprintf(stderr,"load fail: %s\n", inpath); return 1; }

        int M;
        unsigned char* img = crop_center_square_u8(src, W, H, &M);
        stbi_image_free(src);
        if (!img) { fprintf(stderr,"crop fail\n"); return 1; }

        kernel_desc kd = pick_kernel(kname);
        if (!kd.data) { fprintf(stderr,"unknown kernel '%s'\n", kname); free(img); return 1; }

        double t0_apply = now_seconds();
        unsigned char* out = convolve_u8(img, M, kd.data, kd.N, pad, kd.normalize, kd.post_abs);
        double t1_apply = now_seconds();
        double ms_apply = (t1_apply - t0_apply) * 1000.0;
        free(img);
        if (!out) { fprintf(stderr,"convolve fail\n"); free_kernel(&kd); return 1; }

        if (!save_gray_png(outpath, out, M, M)) { fprintf(stderr,"save fail\n"); free(out); free_kernel(&kd); return 1; }
        free(out);
        printf("Time: %.3f ms (M=%d, N=%d, pad=%s)\n",
               ms_apply, M, kd.N,
               (pad==PAD_ZERO?"zero":(pad==PAD_REPLICATE?"replicate":"reflect")));
        printf("Saved: %s (%dx%d), kernel=%s (N=%d), pad=%s\n",
               outpath, M, M, kname, kd.N,
               (pad==PAD_ZERO?"zero":(pad==PAD_REPLICATE?"replicate":"reflect")));
        free_kernel(&kd);
        return 0;
    }

    // -------- bench: measure performance ---------------------
    if (!strcmp(cmd,"bench")) {
        if (argc < 5) { usage(argv[0]); return 1; }
        const char* inpath = argv[2];
        const char* kname  = argv[3];
        int iters = atoi(argv[4]);
        if (iters < 1) iters = 1;
        pad_t pad = (argc>=6) ? parse_pad(argv[5]) : PAD_REFLECT;

        int W,H;
        unsigned char* src = load_gray_u8(inpath,&W,&H);
        if (!src) { fprintf(stderr,"load fail: %s\n", inpath); return 1; }

        int M;
        unsigned char* img = crop_center_square_u8(src, W, H, &M);
        stbi_image_free(src);
        if (!img) { fprintf(stderr,"crop fail\n"); return 1; }

        kernel_desc kd = pick_kernel(kname);
        if (!kd.data) { fprintf(stderr,"unknown kernel '%s'\n", kname); free(img); return 1; }

        // warm-up
        unsigned char* tmp = convolve_u8(img, M, kd.data, kd.N, pad, kd.normalize, kd.post_abs);
        if (!tmp) { fprintf(stderr,"convolve fail\n"); free(img); free_kernel(&kd); return 1; }
        free(tmp);

        double sum_ms = 0.0;
        for (int i=0;i<iters;i++) {
            double s = now_seconds();
            unsigned char* o = convolve_u8(img, M, kd.data, kd.N, pad, kd.normalize, kd.post_abs);
            double e = now_seconds();
            if (!o) { fprintf(stderr,"convolve fail (iter)\n"); free(img); free_kernel(&kd); return 1; }
            free(o);
            double ms_i = (e - s) * 1000.0;
            sum_ms += ms_i;
            printf("iter %d: %.3f ms\n", i+1, ms_i);
        }

        double avg_ms = sum_ms / (double)iters;
        double mpix_s = ((double)M*(double)M) / (avg_ms/1000.0) / 1e6;
        double gmac_s = ((double)M*(double)M*(double)kd.N*(double)kd.N) / (avg_ms/1000.0) / 1e9;

        printf("M=%d, N=%d, iters=%d, avg=%.3f ms, throughput=%.3f Mpix/s, ~%.3f GMAC/s\n",
               M, kd.N, iters, avg_ms, mpix_s, gmac_s);

        free(img);
        free_kernel(&kd);
        return 0;
    }

    usage(argv[0]);
    return 1;
}
