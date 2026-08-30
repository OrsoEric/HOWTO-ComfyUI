# Zimage 

Strong fast model, it works amazingly well

| MODEL | CLIP | VAE | First Load [s] | Second Repeat [s] | Third Change Prompt [s] |
|-|-|-|-|-|-|
| Q4 GGUF | Q4 GGUF | SAFETENSOR | 30s | 16s | 18s |
| INT8 CONVROT SAFETENSOR | INT8 CONVROT SAFETENSOR | SAFETENSOR | N.A. | N.A. | N.A. |


GGUF

![](/workflow-png/Zimage-txt2img-gguf.png)

SAFETENSOR INT8 CONVROT

![](/workflow-png/Zimage-txt2img-safetensor.png)


<details>
<summary>Performance</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22392.36 MB usable, 7672.25 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 22296.06 MB usable, 4834.06 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.39s/it]
Requested to load AutoencodingEngine
loaded completely; 11319.68 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 28.92 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 22392.36 MB usable, 7672.25 MB loaded, full load: True
Requested to load Lumina2
loaded completely; 22296.06 MB usable, 4834.06 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.40s/it]
Requested to load AutoencodingEngine
loaded completely; 11319.68 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 19.32 seconds
got prompt
Requested to load Lumina2
loaded completely; 22296.06 MB usable, 4834.06 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
Requested to load AutoencodingEngine
loaded completely; 11319.68 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 15.71 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 22392.36 MB usable, 7672.25 MB loaded, full load: True
Requested to load Lumina2
loaded completely; 22296.06 MB usable, 4834.06 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.40s/it]
Requested to load AutoencodingEngine
loaded completely; 11319.68 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 19.17 seconds
```

</details>

## INT8 Convrot

Now int8convrot models work

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load ZImageTEModel_
[INFO] loaded completely; 21656.09 MB usable, 4303.51 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: convrot_w4a4, asym_w4a8_int8, int8_tensorwise , emulated ops: float8_e5m2, float8_e4m3fn, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Lumina2
[INFO] loaded completely; 21559.79 MB usable, 6007.20 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.04s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] loaded completely; 10583.41 MB usable, 159.87 MB loaded, full load: True
[INFO] Prompt executed in 26.35 seconds
[INFO] got prompt
[INFO] Requested to load Lumina2
[INFO] loaded completely; 21617.13 MB usable, 6007.20 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.05s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] loaded completely; 11326.66 MB usable, 159.87 MB loaded, full load: True
[INFO] Prompt executed in 12.91 seconds
```