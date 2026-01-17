# Old table

| Configuration | Workaround           | Size        | Max VRAM | Time  | Result  |
|---------------|----------------------|-------------|----------|-------|---------|
| 6.3.4 WSL     | —                    | 1024 × 1024 | 10.2 GB  | N.A.  | SUCCESS |
| 6.3.4 WSL     | —                    | 1536 × 1536 | 23.3 GB  | N.A.  | CRASH   |
| 6.3.4 WSL     | MIOPEN_FIND_MODE=2   | 2048 × 2048 | 18.5 GB  | 42.3s | SUCCESS |
| 6.3.4 WSL     | MIOPEN_FIND_MODE=3   | 1536 × 1536 | N.A.     | N.A.  | SUCCESS |
| 6.3.4 WSL     | MIOPEN_FIND_MODE=3   | 2048 × 2048 | 19 GB    | N.A.  | CRASH   |
| 7.11          | —                    | 2048 × 2048 | 23GB     | 15.0s | SUCCESS |

# New Tests

| Configuration | Workaround           | Size        | Max VRAM | Time  | Result  |
|---------------|----------------------|-------------|----------|-------|---------|
|  ROCm 7.11 - Torch 2.10 - Python 3.13 - Driver      | —                    | 1024 × 1024 | 10.2 GB  | N.A.  | SUCCESS |


# VAE Decode Bug workflow

This workflow isolates the VAE encode and decode stage.

I have a noise injection to force the image to be different each time

![](/workflow-png/VAEBUG.png)

### Flux VAE 

<details>
<summary>Detail Timings</summary>

```cmd
Encoded base64 images generated.
Prompt executed in 7.78 seconds
got prompt
0 models unloaded.
0 models unloaded.
Encoded base64 images generated.
Prompt executed in 7.69 seconds
got prompt
0 models unloaded.
0 models unloaded.
Encoded base64 images generated.
Prompt executed in 7.52 seconds
```

</details>

### Zimage Turbo VAE

<details>
<summary>Detail Timings</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely; 9712.95 MB usable, 159.87 MB loaded, full load: True
0 models unloaded.
Encoded base64 images generated.
Prompt executed in 7.85 seconds
got prompt
0 models unloaded.
0 models unloaded.
Encoded base64 images generated.
Prompt executed in 7.85 seconds
```

</details>

### Qwen Edit VAE

Without flag
<details>
<summary>Detail Timings</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 11582.38 MB usable, 242.03 MB loaded, full load: True
Encoded base64 images generated.
Prompt executed in 48.59 seconds
```
</details>

With flag
<details>
<summary>Detail Timings</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 11711.28 MB usable, 242.03 MB loaded, full load: True
Encoded base64 images generated.
Prompt executed in 49.09 seconds
got prompt
0 models unloaded.
Unloaded partially: 242.03 MB freed, 0.00 MB remains loaded, 22.78 MB buffer reserved, lowvram patches: 0
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Encoded base64 images generated.
Prompt executed in 237.19 seconds
```

</details>

Second execution keeps freezing the system and runs really badly

![](/images/2026-01-17/Screenshot%202026-01-17%20101205%20qwen%20image%20vae%20crash%20second%20execution.png)

# Update COmfyUI from 0.8.2 -> 0.9.2

Behavior has imptoved significantly

[log](/logs/2026-01-17-T1020%20Update%20ComfyUI.md)

![](/images/2026-01-17/Screenshot%202026-01-17%20102258%20qwen%20image%20update%20comfyui.png)

# https://github.com/iGavroche/rocm-ninodes

- BF16 36.61 seconds
- FP32 110.51 seconds
- FP16 44.54 seconds
- FP16 55.81 seconds with freezes



```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 11711.28 MB usable, 242.03 MB loaded, full load: True
🔍 Detected WAN VAE model (causal decoding requires full video processing)
🛡️ WAN VAE detected - disabling chunking to preserve causal decoding chain
🎬 Processing video: 1 frames, 256x256 resolution
📹 WAN VAE detected - using full video processing (causal decoding requires full sequence)
🎯 Processing entire WAN VAE video at once (causal decoding): 1 frames
Encoded base64 images generated.
Prompt executed in 36.61 seconds
got prompt
0 models unloaded.
Unloaded partially: 242.03 MB freed, 0.00 MB remains loaded, 22.78 MB buffer reserved, lowvram patches: 0
🔍 Detected WAN VAE model (causal decoding requires full video processing)
🛡️ WAN VAE detected - disabling chunking to preserve causal decoding chain
🎬 Processing video: 1 frames, 256x256 resolution
📹 WAN VAE detected - using full video processing (causal decoding requires full sequence)
🎯 Processing entire WAN VAE video at once (causal decoding): 1 frames
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Encoded base64 images generated.
Prompt executed in 110.51 seconds
got prompt
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
🔍 Detected WAN VAE model (causal decoding requires full video processing)
🛡️ WAN VAE detected - disabling chunking to preserve causal decoding chain
🎬 Processing video: 1 frames, 256x256 resolution
📹 WAN VAE detected - using full video processing (causal decoding requires full sequence)
🎯 Processing entire WAN VAE video at once (causal decoding): 1 frames
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Encoded base64 images generated.
Prompt executed in 44.54 seconds
got prompt
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
🔍 Detected WAN VAE model (causal decoding requires full video processing)
🛡️ WAN VAE detected - disabling chunking to preserve causal decoding chain
🎬 Processing video: 1 frames, 256x256 resolution
📹 WAN VAE detected - using full video processing (causal decoding requires full sequence)
🎯 Processing entire WAN VAE video at once (causal decoding): 1 frames
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Encoded base64 images generated.
Prompt executed in 55.81 seconds
```
Tiled doesn't work at all

```
got prompt
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
🔍 Detected WAN VAE model (causal decoding requires full video processing)
🛡️ WAN VAE detected - disabling chunking to preserve causal decoding chain
🎬 Processing video: 1 frames, 256x256 resolution
📹 WAN VAE detected - using full video processing (causal decoding requires full sequence)
🎯 Processing entire WAN VAE video at once (causal decoding): 1 frames
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\comfyui-image-compare\__init__.py:32: RuntimeWarning: invalid value encountered in cast
  255).clip(0, 255).astype(numpy.uint8)
Encoded base64 images generated.
Prompt executed in 119.53 seconds
```

# Trying Zimage

Since updating ComfyUI I check Zimage Q8 as sanity check.

VRAM use has gone signigicantly down to 7GB

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 4423.44 MB offloaded, 2276.09 MB buffer reserved, lowvram patches: 0
Attempting to release mmap (145)
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 6973.32 MB offloaded, 337.50 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:17<00:00,  1.93s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 159.87 MB offloaded, 13.50 MB buffer reserved, lowvram patches: 0
Prompt executed in 65.88 seconds
got prompt
Requested to load Lumina2
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 6973.32 MB offloaded, 337.50 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:16<00:00,  1.84s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 159.87 MB offloaded, 13.50 MB buffer reserved, lowvram patches: 0
Prompt executed in 17.41 seconds
got prompt
Requested to load Lumina2
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 6973.32 MB offloaded, 337.50 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:16<00:00,  1.84s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 159.87 MB offloaded, 13.50 MB buffer reserved, lowvram patches: 0
Prompt executed in 17.44 seconds
```

![](/images/2026-01-17/Screenshot%202026-01-17%20105616%20zimage%20Q8.png)

# Qwen Edit

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Found quantization metadata version 1
Using MixedPrecisionOps for text encoder
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Requested to load QwenImageTEModel_
1 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 7909.89 MB offloaded, 3248.00 MB buffer reserved, lowvram patches: 0
gguf qtypes: F32 (1088), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 267.26 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:29<00:00,  7.31s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 72.33 seconds
got prompt
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 224.60 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:34<00:00,  8.70s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 36.52 seconds
```

# Qwen Edit CLIP GGUF

First, download a Q8 CLIP

[Qwen2.5-VL-7B](https://huggingface.co/unsloth/Qwen2.5-VL-7B-Instruct-GGUF/blob/main/Qwen2.5-VL-7B-Instruct-UD-Q8_K_XL.gguf)

Attenpting to find mmproj file for text encoder...
Error: Can't find mmproj file for 'Qwen2.5-VL-7B-Instruct-UD-Q8_K_XL.gguf' (matching:'qwen2.5-vl-7b-instruct')! Qwen-Image-Edit will be broken!

Try another quant

[Qwen2.5-VL-7B](https://huggingface.co/cxtb/Qwen2.5-VL-7B-Instruct-Q8_0-GGUF/tree/main)

It's not the quant, I need a mproj. 

[Qwen2.5-VL-7B](https://huggingface.co/lmstudio-community/Qwen2.5-VL-7B-Instruct-GGUF/tree/main)

rename the file to ```qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16```


# Qwen Edit Workflow

Kind of works, I get coherent images at CFG1, but performance is monkey. It oscillates from 55s to 520s

![](/workflow-png/QWENEDIT-img2img-gguf.png)


```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20711.28 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22533.88 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
Unloaded partially: 2816.28 MB freed, 6130.47 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 15984.57 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [01:26<00:00, 21.69s/it]
Requested to load WanVAE
Unloaded partially: 1031.95 MB freed, 5098.52 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2358.60 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 131.12 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:26<00:00,  6.53s/it]
Prompt executed in 34.93 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:24<00:00,  6.20s/it]
Prompt executed in 33.89 seconds
got prompt
loaded completely; 9211.00 MB usable, 8946.75 MB loaded, full load: True
Unloaded partially: 704.36 MB freed, 8242.38 MB remains loaded, 41.79 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [02:20<00:00, 35.00s/it]
Requested to load WanVAE
Unloaded partially: 3419.05 MB freed, 4823.33 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2468.68 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 244.53 seconds
got prompt
loaded completely; 9243.00 MB usable, 8946.75 MB loaded, full load: True
Unloaded partially: 2816.28 MB freed, 6130.47 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [02:00<00:00, 30.24s/it]
Requested to load WanVAE
Unloaded partially: 963.16 MB freed, 5167.31 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2331.08 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 158.54 seconds
got prompt
loaded completely; 9243.00 MB usable, 8946.75 MB loaded, full load: True
Unloaded partially: 2816.28 MB freed, 6130.47 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [03:22<00:00, 50.59s/it]
Requested to load WanVAE
Unloaded partially: 963.16 MB freed, 5167.31 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2331.08 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 250.59 seconds
got prompt
loaded completely; 9243.00 MB usable, 8946.75 MB loaded, full load: True
Unloaded partially: 2816.28 MB freed, 6130.47 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [03:36<00:00, 54.04s/it]
Requested to load WanVAE
Unloaded partially: 963.16 MB freed, 5167.31 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2331.08 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 266.61 seconds
got prompt
loaded completely; 9243.00 MB usable, 8946.75 MB loaded, full load: True
Unloaded partially: 2816.28 MB freed, 6130.47 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 5/5 [07:50<00:00, 94.06s/it]
Requested to load WanVAE
Unloaded partially: 963.16 MB freed, 5167.31 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 2331.08 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 527.40 seconds
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20265.94 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22216.13 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
Unloaded partially: 3985.82 MB freed, 4960.92 MB remains loaded, 481.58 MB buffer reserved, lowvram patches: 0
loaded completely; 16536.34 MB usable, 12738.98 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████| 4/4 [07:00<00:00, 105.10s/it]
Requested to load WanVAE
loaded completely; 2424.84 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 472.42 seconds
got prompt
Requested to load QwenImage
loaded completely; 21495.77 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 5/5 [00:43<00:00,  8.63s/it]
Requested to load WanVAE
loaded completely; 6203.52 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 55.01 seconds
```

# Flag --async-offload

I don't notice effects

# Performance

```cmd
got prompt
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21495.77 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████| 4/4 [08:00<00:00, 120.00s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 319
loaded completely; 2137.18 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 546.49 seconds
got prompt
loaded partially; 20638.76 MB usable, 20590.34 MB loaded, 271.14 MB offloaded, 67.72 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [02:28<00:00, 37.11s/it]
Requested to load WanVAE
Unloaded partially: 2977.58 MB freed, 17612.75 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 630
loaded completely; 2191.53 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 160.30 seconds
```

# DISABLE --disable-pinned-memory

This increases consistency of execution

### Qwen Edit 2511
```
Prompt executed in 498.90 seconds
Prompt executed in 141.94 seconds
Prompt executed in 142.00 seconds
```




<details>
<summary>Qwen Image Edit 2511 GGUF Q8</summary>

```cmd
F:\ComfyUI-Windows-P313-T210-2026-01-11>uv run main.py  --use-pytorch-cross-attention --async-offload --disable-pinned-memory
Adding extra search path checkpoints F:\ComfyUI-Models\checkpoints
Adding extra search path clip F:\ComfyUI-Models\clip
Adding extra search path clip_vision F:\ComfyUI-Models\clip_vision
Adding extra search path text_encoders F:\ComfyUI-Models\text_encoders
Adding extra search path configs F:\ComfyUI-Models\configs
Adding extra search path controlnet F:\ComfyUI-Models\controlnet
Adding extra search path diffusion_models F:\ComfyUI-Models\diffusion_models
Adding extra search path diffusion_models F:\ComfyUI-Models\unet
Adding extra search path embeddings F:\ComfyUI-Models\embeddings
Adding extra search path loras F:\ComfyUI-Models\loras
Adding extra search path upscale_models F:\ComfyUI-Models\upscale_models
Adding extra search path vae F:\ComfyUI-Models\vae
Adding extra search path vibevoice F:\ComfyUI-Models\vibevoice
Adding extra search path Janus-Pro F:\ComfyUI-Models\Janus-Pro
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-17 14:44:01.492
** Platform: Windows
** Python version: 3.13.3 (main, Apr  9 2025, 04:04:49) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** ComfyUI Base Folder Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** User directory: F:\ComfyUI-Windows-P313-T210-2026-01-11\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\comfyui.log

Prestartup times for custom nodes:
   0.4 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.10.0a0+rocm7.10.0a20251120
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 10)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Found comfy_kitchen backend eager: {'available': True, 'disabled': False, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8', 'scaled_mm_nvfp4']}
Found comfy_kitchen backend triton: {'available': False, 'disabled': True, 'unavailable_reason': "ImportError: No module named 'triton'", 'capabilities': []}
Found comfy_kitchen backend cuda: {'available': True, 'disabled': True, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8']}
Using pytorch attention
Python version: 3.13.3 (main, Apr  9 2025, 04:04:49) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.9.2
ComfyUI frontend version: 1.36.14
[Prompt Server] web root: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv\Lib\site-packages\comfyui_frontend_package\static
Failed to find comfy root automatically, please copy the folder F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
ComfyUI-GGUF: Allowing full torch compile
### Loading: ComfyUI-Manager (V3.39.2)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 4551 [8f40b43e] *DETACHED | Released on '2026-01-15'
Skip F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).
[INFO] ComfyUI-GGUF not found, using our implementation
[ROCm Ninodes] Successfully loaded from rocm_nodes package

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\websocket_image_save.py
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\comfyui-image-compare
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyLiterals
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\rocm-ninodes
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF
   0.1 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager

Context impl SQLiteImpl.
Will assume non-transactional DDL.
Assets scan(roots=['models']) completed in 0.021s (created=0, skipped_existing=43, total_seen=43)
Starting server

To see the GUI go to: http://127.0.0.1:8188
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
FETCH ComfyRegistry Data: 5/120
FETCH ComfyRegistry Data: 10/120
FETCH ComfyRegistry Data: 15/120
FETCH ComfyRegistry Data: 20/120
FETCH ComfyRegistry Data: 25/120
FETCH ComfyRegistry Data: 30/120
FETCH ComfyRegistry Data: 35/120
FETCH ComfyRegistry Data: 40/120
FETCH ComfyRegistry Data: 45/120
FETCH ComfyRegistry Data: 50/120
FETCH ComfyRegistry Data: 55/120
FETCH ComfyRegistry Data: 60/120
FETCH ComfyRegistry Data: 65/120
FETCH ComfyRegistry Data: 70/120
FETCH ComfyRegistry Data: 75/120
FETCH ComfyRegistry Data: 80/120
FETCH ComfyRegistry Data: 85/120
FETCH ComfyRegistry Data: 90/120
FETCH ComfyRegistry Data: 95/120
FETCH ComfyRegistry Data: 100/120
FETCH ComfyRegistry Data: 105/120
FETCH ComfyRegistry Data: 110/120
FETCH ComfyRegistry Data: 115/120
FETCH ComfyRegistry Data: 120/120
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20711.28 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22533.88 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21585.02 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████| 4/4 [07:02<00:00, 105.65s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 319
loaded completely; 2294.88 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 498.90 seconds
got prompt
loaded completely; 21033.01 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [02:09<00:00, 32.39s/it]
Requested to load WanVAE
Unloaded partially: 2913.63 MB freed, 17947.89 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 619
loaded completely; 2218.62 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 141.94 seconds
got prompt
loaded completely; 21022.26 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [02:10<00:00, 32.72s/it]
Requested to load WanVAE
Unloaded partially: 2913.63 MB freed, 17947.89 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 919
loaded completely; 2218.62 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 142.00 seconds
```

</details>

### Zimage
```
Prompt executed in 30.86 seconds
Prompt executed in 11.27 seconds
Prompt executed in 11.16 seconds
```


<details>
<summary>Zimage Details</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22450.99 MB usable, 4424.19 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 17825.68 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:10<00:00,  1.15s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1133.64 MB freed, 3290.55 MB remains loaded, 176.64 MB buffer reserved, lowvram patches: 0
loaded completely; 5184.25 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 30.86 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:10<00:00,  1.15s/it]
Prompt executed in 11.27 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:10<00:00,  1.15s/it]
Prompt executed in 11.16 seconds
```
</details>

# EOL

<details>
<summary>Detail Timings</summary>

```cmd
xxx
```
</details>