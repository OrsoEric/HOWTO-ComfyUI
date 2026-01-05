# Github

[Developers worked on the flash attention module](https://github.com/AuleTechnologies/Aule-Attention/issues/6)

I'm giving another attempt

# INSTALL

[Install Instruction](https://github.com/AuleTechnologies/Aule-Attention#installation)

```cmd
.venv\Scripts\activate

uv pip install aule-attention --link-mode=copy
```

```cmd
(.venv) F:\ComfyUI-Windows-2026-01-04>uv pip install aule-attention
Resolved 2 packages in 195ms
░░░░░░░░░░░░░░░░░░░░ [0/1] Installing wheels...                                                                         warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 1 package in 11ms
 + aule-attention==0.5.0
```

# DEMO

The python script this time around loads and run flash attention

```python
import os
import importlib.util

print("Aule Flash Attention location:", os.path.dirname(importlib.util.find_spec("aule").origin))

from aule import flash_attention

print("PyTorch location:", os.path.dirname(importlib.util.find_spec("torch").origin))

from aule import get_available_backends, print_backend_info

# List available backends
backends = get_available_backends()
print(f"Available backends: {backends}")

# Display detailed backend information
print_backend_info()

import torch

# Create input tensors [batch, heads, seq_len, head_dim]
q = torch.randn(1, 8, 512, 64, device='cuda')
k = torch.randn(1, 8, 512, 64, device='cuda')
v = torch.randn(1, 8, 512, 64, device='cuda')

# Compute attention with causal masking
output = flash_attention(q, k, v, causal=True)
```

### OUTPUT

```cmd
(.venv) F:\ComfyUI-Windows-2026-01-04>uv run verify_aule_flash_attention.py
Aule Flash Attention location: F:\ComfyUI-Windows-2026-01-04\.venv\Lib\site-packages\aule
DEBUG: Loading library from F:\ComfyUI-Windows-2026-01-04\.venv\Lib\site-packages\aule\lib\aule.dll
PyTorch location: F:\ComfyUI-Windows-2026-01-04\.venv\Lib\site-packages\torch
Available backends: ['vulkan', 'cpu']
============================================================
AULE-ATTENTION v0.5.0
============================================================

Available backends: ['vulkan', 'cpu']

aule_init: initializing...
aule_init: complete
[1] VULKAN
    GPU: AMD Radeon RX 7900 XTX
    Status: Vulkan compute shader

[2] CPU
    Status: NumPy fallback

============================================================
AttentionEngine.createTensor: shape { 1, 8, 512, 64 }
GpuTensor.init: shape len 4
BufferManager.createBuffer: size 1048576
AttentionEngine.createTensor: shape { 1, 8, 512, 64 }
GpuTensor.init: shape len 4
BufferManager.createBuffer: size 1048576
AttentionEngine.createTensor: shape { 1, 8, 512, 64 }
GpuTensor.init: shape len 4
BufferManager.createBuffer: size 1048576
AttentionEngine.createTensor: shape { 1, 8, 512, 64 }
GpuTensor.init: shape len 4
BufferManager.createBuffer: size 1048576
```

# Diffusion

First test no difference

```
got prompt
model weight dtype torch.float16, manual cast: None
model_type EPS
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load SD1ClipModel
loaded completely; 22892.08 MB usable, 235.84 MB loaded, full load: True
Requested to load BaseModel
loaded completely; 22406.89 MB usable, 1639.41 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 12.68it/s]
Requested to load AutoencoderKL
loaded completely; 18554.06 MB usable, 159.56 MB loaded, full load: True
Prompt executed in 4.08 seconds
got prompt
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 17.51it/s]
Prompt executed in 1.35 seconds
```

<details>
<summary>CMD Line Output</summary>

```cmd
(.venv) F:\ComfyUI-Windows-2026-01-04>uv run main.py
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-05 11:19:03.943
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows-2026-01-04\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows-2026-01-04
** ComfyUI Base Folder Path: F:\ComfyUI-Windows-2026-01-04
** User directory: F:\ComfyUI-Windows-2026-01-04\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows-2026-01-04\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows-2026-01-04\user\comfyui.log

Prestartup times for custom nodes:
   0.5 seconds: F:\ComfyUI-Windows-2026-01-04\custom_nodes\comfyui-manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
Using sub quadratic optimization for attention, if you have memory or speed issues try using: --use-split-cross-attention
Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.7.0
ComfyUI frontend version: 1.35.9
[Prompt Server] web root: F:\ComfyUI-Windows-2026-01-04\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
### Loading: ComfyUI-Manager (V3.39)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Version: v0.7.0-13-gacbf08cd | Released on '2026-01-03'

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows-2026-01-04\custom_nodes\websocket_image_save.py
   0.3 seconds: F:\ComfyUI-Windows-2026-01-04\custom_nodes\comfyui-manager

[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/117
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 10/117
FETCH ComfyRegistry Data: 15/117
FETCH ComfyRegistry Data: 20/117
FETCH ComfyRegistry Data: 25/117
FETCH ComfyRegistry Data: 30/117
FETCH ComfyRegistry Data: 35/117
FETCH ComfyRegistry Data: 40/117
FETCH ComfyRegistry Data: 45/117
FETCH ComfyRegistry Data: 50/117
FETCH ComfyRegistry Data: 55/117
FETCH ComfyRegistry Data: 60/117
FETCH ComfyRegistry Data: 65/117
FETCH ComfyRegistry Data: 70/117
FETCH ComfyRegistry Data: 75/117
FETCH ComfyRegistry Data: 80/117
FETCH ComfyRegistry Data: 85/117
FETCH ComfyRegistry Data: 90/117
FETCH ComfyRegistry Data: 95/117
FETCH ComfyRegistry Data: 100/117
FETCH ComfyRegistry Data: 105/117
FETCH ComfyRegistry Data: 110/117
FETCH ComfyRegistry Data: 115/117
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
got prompt
model weight dtype torch.float16, manual cast: None
model_type EPS
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load SD1ClipModel
loaded completely; 22892.08 MB usable, 235.84 MB loaded, full load: True
Requested to load BaseModel
loaded completely; 22406.89 MB usable, 1639.41 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 12.68it/s]
Requested to load AutoencoderKL
loaded completely; 18554.06 MB usable, 159.56 MB loaded, full load: True
Prompt executed in 4.08 seconds
got prompt
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 17.51it/s]
Prompt executed in 1.35 seconds

```

</details>



# Zimage with Aule Flash Attention

```
got prompt
Requested to load ZImageTEModel_
loaded completely; 22556.67 MB usable, 7672.25 MB loaded, full load: True
Requested to load Lumina2
loaded completely; 18462.67 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:08<00:00,  1.02it/s]
Requested to load AutoencodingEngine
Unloaded partially: 1108.29 MB freed, 10631.27 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
loaded completely; 5305.04 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 18.14 seconds
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22556.67 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
Unloaded partially: 7672.25 MB freed, 0.00 MB remains loaded, 2320.62 MB buffer reserved, lowvram patches: 0
loaded completely; 18462.67 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.00s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1520.79 MB freed, 10218.77 MB remains loaded, 225.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5500.44 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 24.11 seconds
got prompt
loaded completely; 18197.79 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:34<00:00,  3.88s/it]
Unloaded partially: 602.04 MB freed, 11137.52 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 36.67 seconds
got prompt
loaded completely; 18193.79 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:35<00:00,  3.96s/it]
Unloaded partially: 602.04 MB freed, 11137.52 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 37.23 seconds
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22556.67 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18462.67 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.06s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1520.79 MB freed, 10218.77 MB remains loaded, 225.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5500.44 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 41.71 seconds
got prompt
Requested to load Lumina2
loaded completely; 18462.67 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.05s/it]
Requested to load AutoencodingEngine
Unloaded partially: 602.04 MB freed, 11137.52 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
loaded completely; 5135.34 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 15.14 seconds
got prompt
loaded completely; 18203.79 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.02s/it]
Unloaded partially: 573.92 MB freed, 11165.64 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 13.79 seconds
```

Execution time is very inconsistent

# Triton

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

```
(.venv) F:\ComfyUI-Windows-2026-01-04>uv run verify_triton.py
PyTorch location: F:\ComfyUI-Windows-2026-01-04\.venv\Lib\site-packages\torch
Traceback (most recent call last):
  File "F:\ComfyUI-Windows-2026-01-04\verify_triton.py", line 7, in <module>
    import triton
ModuleNotFoundError: No module named 'triton'
```

## Install Triton ?

```
(.venv) F:\ComfyUI-Windows-2026-01-04>uv pip install triton
  x No solution found when resolving dependencies:
  `-> Because only the following versions of triton are available:
          triton==0.4.1
          triton==0.4.2
          triton==1.0.0
          triton==1.1.0
          triton==1.1.1
          triton==2.0.0
          triton==2.1.0
          triton==2.2.0
          triton==2.3.0
          triton==2.3.1
          triton==3.0.0
          triton==3.1.0
          triton==3.2.0
          triton==3.3.0
          triton==3.3.1
          triton==3.4.0
          triton==3.5.0
          triton==3.5.1
      and triton<=2.1.0 has no wheels with a matching Python ABI tag (e.g., `cp312`), we can conclude that
      triton<=2.1.0 cannot be used.
      And because triton>=2.2.0 has no wheels with a matching platform tag (e.g., `win_amd64`) and you require triton,
      we can conclude that your requirements are unsatisfiable.

      hint: You require CPython 3.12 (`cp312`), but we only found wheels for `triton` (v2.1.0) with the following
      Python ABI tags: `cp37m`, `cp38`, `cp39`, `cp310`, `cp311`, `pypy37_pp73`, `pypy38_pp73`, `pypy39_pp73`

      hint: Wheels are available for `triton` (v3.5.1) on the following platforms: `manylinux_2_27_aarch64`,
      `manylinux_2_27_x86_64`, `manylinux_2_28_aarch64`, `manylinux_2_28_x86_64`
```

I don't have wheels for triton


# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>