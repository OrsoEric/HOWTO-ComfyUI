# Qwen Edit

My previous attempts with qwen edit were dreadful

[Huggingface GGUF Models](https://huggingface.co/unsloth/Qwen-Image-2512-GGUF/tree/main)

# custom nodes

## https://github.com/city96/ComfyUI-GGUF



# logs

It's really bad

### Q4

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 22892.08 MB usable, 242.03 MB loaded, full load: True
Found quantization metadata version 1
Using MixedPrecisionOps for text encoder
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22538.44 MB usable, 7910.29 MB loaded, full load: True
gguf qtypes: F32 (1087), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
Unloaded partially: 339.59 MB freed, 7570.70 MB remains loaded, 20.89 MB buffer reserved, lowvram patches: 0
loaded completely; 14668.55 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [03:31<00:00, 52.95s/it]
Requested to load WanVAE
loaded completely; 1584.25 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 251.19 seconds
```

### Q8

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 22892.08 MB usable, 242.03 MB loaded, full load: True
Found quantization metadata version 1
Using MixedPrecisionOps for text encoder
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22538.44 MB usable, 7910.29 MB loaded, full load: True
gguf qtypes: F32 (1087), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 22471.86 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [02:34<00:00, 38.63s/it]
Requested to load WanVAE
loaded completely; 1081.19 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 256.76 seconds
```

```cmd
got prompt
Requested to load QwenImage
loaded completely; 21747.77 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [04:30<00:00, 67.74s/it]
Prompt executed in 286.01 seconds
```

### 2511 FP8

Finally got a vaguely coherent output but is bad

```cmd
got prompt
Requested to load QwenImage
loaded completely; 21193.29 MB usable, 19483.95 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████| 4/4 [07:55<00:00, 118.97s/it]
Requested to load WanVAE
Unloaded partially: 1389.11 MB freed, 18094.87 MB remains loaded, 45.01 MB buffer reserved, lowvram patches: 152
loaded completely; 2226.39 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 587.73 seconds
```

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20711.28 MB usable, 242.03 MB loaded, full load: True
Found quantization metadata version 1
Using MixedPrecisionOps for text encoder
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22538.44 MB usable, 7910.29 MB loaded, full load: True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Requested to load QwenImage
loaded completely; 21585.59 MB usable, 19483.95 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [04:50<00:00, 72.60s/it]
Requested to load WanVAE
Unloaded partially: 1461.14 MB freed, 18022.85 MB remains loaded, 45.01 MB buffer reserved, lowvram patches: 160
loaded completely; 2189.60 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 463.89 seconds
```