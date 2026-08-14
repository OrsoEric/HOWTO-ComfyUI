
Strong model that is very good at executing edit instructions and taking multiple reference images.

![](/workflow-png/QWENEDIT-img2img-gguf.png)


```uv run main.py --windows-standalone-build --disable-smart-memory```
- First execution: 60s
- Repeat: 46s

<details>
<summary>Performance</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load WanVAE
loaded completely; 20161.56 MB usable, 242.03 MB loaded, full load: True
Requested to load QwenImageTEModel_
loaded completely; 22392.36 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 22033.91 MB usable, 12738.98 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:25<00:00,  6.31s/it]
Requested to load WanVAE
loaded completely; 18811.56 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 58.36 seconds
got prompt
Requested to load QwenImage
loaded completely; 22033.91 MB usable, 12738.98 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:24<00:00,  6.24s/it]
Requested to load WanVAE
loaded completely; 18811.56 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 45.39 seconds
got prompt
Requested to load QwenImage
loaded completely; 22033.91 MB usable, 12738.98 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:25<00:00,  6.29s/it]
Requested to load WanVAE
loaded completely; 18811.56 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 43.96 seconds
got prompt
Requested to load QwenImage
loaded completely; 22033.91 MB usable, 12738.98 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:25<00:00,  6.29s/it]
Requested to load WanVAE
loaded completely; 18811.56 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 44.29 seconds
```

</details>

```uv run main.py --windows-standalone-build --use-pytorch-cross-attention```
- First execution: 98s
- Repeat: 32s

<details>
<summary>Performance</summary>

```cmd
got prompt
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:35<00:00,  8.79s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 98.22 seconds
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 224.60 MB buffer reserved, lowvram patches: 0
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:31<00:00,  7.82s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 31.98 seconds
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 224.60 MB buffer reserved, lowvram patches: 0
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:31<00:00,  7.80s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 31.91 seconds
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 224.60 MB buffer reserved, lowvram patches: 0
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:31<00:00,  7.84s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 32.06 seconds
Requested to load QwenImage
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 12738.98 MB offloaded, 224.60 MB buffer reserved, lowvram patches: 0
100%|███████████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:31<00:00,  7.83s/it]
Requested to load WanVAE
0 models unloaded.
loaded partially; 0.00 MB usable, 0.00 MB loaded, 242.00 MB offloaded, 22.78 MB buffer reserved, lowvram patches: 0
Prompt executed in 32.02 seconds
```

</details>