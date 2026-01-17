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



# EOL

<details>
<summary>Detail Timings</summary>

```cmd
xxx
```
</details>