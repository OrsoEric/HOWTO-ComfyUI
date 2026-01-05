import os
import importlib.util

import torch
print("PyTorch location:", os.path.dirname(importlib.util.find_spec("torch").origin))

import triton
print("Triton location:", os.path.dirname(importlib.util.find_spec("triton").origin))

import triton.language as tl

@triton.jit
def add_kernel(x_ptr, y_ptr, out_ptr, n, BLOCK: tl.constexpr):
    pid = tl.program_id(0)
    offs = pid * BLOCK + tl.arange(0, BLOCK)
    mask = offs < n
    tl.store(out_ptr + offs, tl.load(x_ptr + offs, mask=mask) + tl.load(y_ptr + offs, mask=mask), mask=mask)

x = torch.randn(1024, device='cuda')
y = torch.randn(1024, device='cuda')
out = torch.empty_like(x)
add_kernel[(1,)](x, y, out, 1024, BLOCK=1024)
print("✓ Triton works!" if torch.allclose(out, x + y) else "✗ Triton failed")
