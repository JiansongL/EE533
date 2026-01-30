#!/usr/bin/env python3


from __future__ import annotations


import argparse
import subprocess
import time
from typing import Tuple


import numpy as np


# Import helpers from gpu_conv
from gpu_conv import (
    load_lib,
    load_gray,
    BORDER_CODES,
    normalize_border_name,
    kernel_gauss5,
    kernel_box5,
    kernel_lap4,
    kernel_sharpen3,
    kernel_sobel,
    kernel_prewitt,
    _run_conv,
)




OPS = ("gauss5", "box5", "lap4", "sharpen3", "sobel", "prewitt")




def select_kernel(op: str):
    if op == "gauss5":
        return kernel_gauss5()
    if op == "box5":
        return kernel_box5()
    if op == "lap4":
        return kernel_lap4()
    if op == "sharpen3":
        return kernel_sharpen3()
    if op == "sobel":
        return kernel_sobel()  # returns (gx, gy)
    if op == "prewitt":
        return kernel_prewitt()  # returns (gx, gy)
    raise ValueError(f"Unsupported op: {op}")




def run_python_cuda(img_path: str, size: int | None, iters: int, border: str, op: str) -> float:
    lib = load_lib()
    img = load_gray(img_path, size=size)
    border = normalize_border_name(border)


    # Sobel/Prewitt: do gradient magnitude with two passes; else single kernel
    if op in ("sobel", "prewitt"):
        gx, gy = select_kernel(op)
        # Warm-up both passes
        _run_conv(lib, "cuda", img, gx, border)
        _run_conv(lib, "cuda", img, gy, border)
        t0 = time.perf_counter()
        for _ in range(iters):
            _run_conv(lib, "cuda", img, gx, border)
            _run_conv(lib, "cuda", img, gy, border)
        ms = (time.perf_counter() - t0) * 1000.0 / iters
        return ms
    else:
        ker = select_kernel(op)
        # Warm-up
        _run_conv(lib, "cuda", img, ker, border)
        t0 = time.perf_counter()
        for _ in range(iters):
            _run_conv(lib, "cuda", img, ker, border)
        ms = (time.perf_counter() - t0) * 1000.0 / iters
        return ms




def parse_avg_ms_from_conv_demo(output: str) -> float:
    # Expect final summary line like: M=1024, N=5, iters=5, avg=XX.XXX ms, ...
    lines = [line.strip() for line in output.strip().splitlines() if line.strip()]
    for line in reversed(lines):
        if "avg=" in line and " ms" in line:
            try:
                return float(line.split('avg=')[1].split(' ms')[0])
            except Exception:
                continue
    # Fallback: try last line numeric extraction
    last = lines[-1]
    return float(last.split('avg=')[1].split(' ms')[0])




def run_c(img_path: str, iters: int, border: str, op: str) -> float:
    # Map ops to conv_demo kernel names
    kmap = {
        "gauss5": "gauss5",
        "box5": "box5",
        "lap4": "lap4",
        "sharpen3": "sharpen3",
        # For sobel/prewitt, use x-kernel only for apples-to-apples single-pass
        "sobel": "sobelx3",
        "prewitt": "prewittx3",
    }
    kname = kmap[op]
    cmd = ["./conv_demo", "bench", img_path, kname, str(iters), border]
    out = subprocess.check_output(cmd, stderr=subprocess.STDOUT, text=True)
    return parse_avg_ms_from_conv_demo(out)




def run_cuda_exe(img_path: str, iters: int, border: str, op: str) -> float:
    kmap = {
        "gauss5": "gauss5",
        "box5": "box5",
        "lap4": "lap4",
        "sharpen3": "sharpen3",
        "sobel": "sobelx3",
        "prewitt": "prewittx3",
    }
    kname = kmap[op]
    cmd = ["./conv_demo_cuda", "bench", img_path, kname, str(iters), border, "cuda"]
    out = subprocess.check_output(cmd, stderr=subprocess.STDOUT, text=True)
    return parse_avg_ms_from_conv_demo(out)




def main():
    ap = argparse.ArgumentParser(description="Compare Python+CUDA vs C vs CUDA executable for convolution")
    ap.add_argument("--image", type=str, default="checker_1024.png")
    ap.add_argument("--size", type=int, default=None, help="Optional resize/crop to size x size")
    ap.add_argument("--op", type=str, default="gauss5", choices=OPS)
    ap.add_argument("--iters", type=int, default=10)
    ap.add_argument("--border", type=str, default="reflect", choices=["zero","replicate","reflect","clamp"])
    args = ap.parse_args()


    # Run comparisons
    ms_py_cuda = run_python_cuda(args.image, args.size, args.iters, args.border, args.op)
    ms_c       = run_c(args.image, args.iters, args.border, args.op)
    ms_cuda    = run_cuda_exe(args.image, args.iters, args.border, args.op)


    print("Results (avg ms over", args.iters, "iters):")
    print(f"  Python + CUDA lib: {ms_py_cuda:.3f} ms  (op={args.op})")
    print(f"  C program:         {ms_c:.3f} ms  (conv_demo)")
    print(f"  CUDA executable:   {ms_cuda:.3f} ms  (conv_demo_cuda)")
    print()
    print("Speedups (higher is better):")
    print(f"  Python+CUDA vs C:    {ms_c / ms_py_cuda:.2f}x")
    print(f"  Python+CUDA vs CUDA: {ms_cuda / ms_py_cuda:.2f}x")




if __name__ == "__main__":
    main()
