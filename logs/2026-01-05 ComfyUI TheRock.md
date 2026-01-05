# ComfyUI The Rock

[This comment](https://www.reddit.com/r/ROCm/comments/1no2apl/how_to_install_comfyui_comfyuimanager_on_windows/)

# The Rock Wheels

https://rocm.nightlies.amd.com/v2/

My GPU 7900XTX is the GX1100 so I go for 

[GX1100 Wheels](https://rocm.nightlies.amd.com/v2/gfx110X-dgpu/)


# RUN

```cmd
.venv\Scripts\activate
python main.py --listen --use-pytorch-cross-attention 
```

# Zimage test

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
Unloaded partially: 7672.25 MB freed, 0.00 MB remains loaded, 2320.62 MB buffer reserved, lowvram patches: 0
loaded completely; 18672.24 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1445.79 MB freed, 10293.77 MB remains loaded, 225.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5480.24 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 27.11 seconds
got prompt
loaded completely; 18198.10 MB usable, 11739.54 MB loaded, full load: True
 67%|████████████████████████████████████████████████████████                            | 6/9 [00:37<00:18,  6.28s/it]Interrupting prompt b9dc32f1-0a93-4bad-a534-03cc1eefcad4
 78%|█████████████████████████████████████████████████████████████████▎                  | 7/9 [00:44<00:12,  6.30s/it]
Processing interrupted
Prompt executed in 44.53 seconds
got prompt
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22557.99 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18463.99 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.03s/it]
Requested to load AutoencodingEngine
Unloaded partially: 770.79 MB freed, 10968.77 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
loaded completely; 5141.77 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 25.27 seconds
loaded completely; 18051.10 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.11s/it]
Unloaded partially: 742.67 MB freed, 10996.89 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 11.55 seconds
```

# PYTHON CROSS ATTENTION FLAG (BETTER)

Performance improved 

```
.venv\Scripts\activate
python main.py --listen --use-pytorch-cross-attention
```

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 14985.34 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:46<00:00,  5.13s/it]
Requested to load AutoencodingEngine
Unloaded partially: 630.17 MB freed, 11109.39 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
loaded completely; 5142.77 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 60.99 seconds
got prompt
loaded completely; 22251.60 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.09s/it]
Unloaded partially: 630.17 MB freed, 11109.39 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 11.27 seconds
got prompt
loaded completely; 22251.60 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.03s/it]
Unloaded partially: 630.17 MB freed, 11109.39 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 10.64 seconds
got prompt
loaded completely; 22251.60 MB usable, 11739.54 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.03s/it]
Unloaded partially: 630.17 MB freed, 11109.39 MB remains loaded, 84.38 MB buffer reserved, lowvram patches: 0
Prompt executed in 10.63 seconds
```

# Triton

[Wheels](https://rocm.nightlies.amd.com/v2/gfx110X-dgpu/pytorch-triton-rocm/)

I'm going for ROCm 7.1 Windows Python 3.12 wheels

There are no windows wheels... At all...


# FLAG

```cmd
setx TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL 1

SUCCESS: Specified value was saved.
```

reboot command