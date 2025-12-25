#

```cmd
uv pip install aule-attention --link-mode=copy
```

<details>
<summary>CMD Line Output</summary>

```cmd
F:\ComfyUI-Wondows-2025-12-24>uv pip install aule-attention
Resolved 2 packages in 155ms
░░░░░░░░░░░░░░░░░░░░ [0/1] Installing wheels...                                                                         warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 1 package in 12ms
 + aule-attention==0.5.0
```

</details>

# TEST SCRIPT

```python
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
```

```cmd
F:\ComfyUI-Wondows-2025-12-24>uv run verify_triton.py
PyTorch location: F:\ComfyUI-Wondows-2025-12-24\.venv\Lib\site-packages\torch
Traceback (most recent call last):
  File "F:\ComfyUI-Wondows-2025-12-24\verify_triton.py", line 8, in <module>
    import triton
ModuleNotFoundError: No module named 'triton'
```

# Remove aule flash attention

```cmd
F:\ComfyUI-Wondows-2025-12-24>uv pip uninstall aule-attention
Uninstalled 1 package in 3ms
 - aule-attention==0.5.0
```


# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>