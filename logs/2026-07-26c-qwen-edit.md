# Fix

I'm using another gguf nodem for the rest it works fine

```cmd
set COMFYUI_ENABLE_MIOPEN=1
set MIOPEN_FIND_MODE=2
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-api-nodes
```

```cmd
[INFO] got prompt
gguf qtypes: Q6_K (29), F32 (141), Q4_K (169)
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for 'qwen25-vl-7b-instruct-q4.gguf'.
gguf qtypes: F32 (291), F16 (228)
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load WanVAE
[INFO] loaded completely; 20269.32 MB usable, 242.03 MB loaded, full load: True
[INFO] Requested to load QwenImageTEModel_
[INFO] loaded completely; 22468.61 MB usable, 7114.77 MB loaded, full load: True
[INFO] Requested to load QwenImage
[INFO] loaded completely; 22102.28 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:28<00:00,  7.20s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18883.56 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 51.18 seconds
[INFO] got prompt
[INFO] Requested to load QwenImage
[INFO] loaded completely; 22102.28 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:25<00:00,  6.40s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18883.56 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 32.56 seconds
```

# --use-pytorch-cross-attention

```cmd
set COMFYUI_ENABLE_MIOPEN=1
set MIOPEN_FIND_MODE=2
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-api-nodes --use-pytorch-cross-attention
```

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\gguf\pig.py:365: UserWarning: The given NumPy array is not writable, and PyTorch does not support non-writable tensors. This means writing to this tensor will result in undefined behavior. You may want to copy the array to protect its data or make it writable before converting it to a tensor. This type of warning will be suppressed for the rest of this program. (Triggered internally at C:\b\pytorch\torch\csrc\utils\tensor_numpy.cpp:212.)
  torch_tensor = torch.from_numpy(tensor.data)
gguf qtypes: Q6_K (29), F32 (141), Q4_K (169)
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for 'qwen25-vl-7b-instruct-q4.gguf'.
gguf qtypes: F32 (291), F16 (228)
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load WanVAE
[INFO] loaded completely; 20692.79 MB usable, 242.03 MB loaded, full load: True
[INFO] Requested to load QwenImageTEModel_
[INFO] loaded completely; 22648.49 MB usable, 7114.77 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:58: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
gguf qtypes: F32 (1088), BF16 (6), Q6_K (258), Q8_0 (2), Q5_K (20), Q4_K (560)
[INFO] model weight dtype torch.bfloat16, manual cast: None
[INFO] model_type FLUX
[INFO] Requested to load QwenImage
[INFO] loaded completely; 22030.90 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:25<00:00,  6.50s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18799.56 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 49.07 seconds
[INFO] got prompt
[INFO] Requested to load QwenImage
[INFO] loaded completely; 22018.28 MB usable, 12738.98 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [00:26<00:00,  6.60s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18799.56 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 34.07 seconds
```