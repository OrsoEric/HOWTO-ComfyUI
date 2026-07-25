# ComfyUI Portable

Rebuilding from uv pip no longer works

The portable is working fine

https://github.com/Comfy-Org/ComfyUI#installing

# ComfyUI Manager

It needs two lines. One run on the root is to install dependencies

```cmd
.\python_embeded\python.exe -m pip install -r ComfyUI\manager_requirements.txt
```

Second is to launch with comfyui manager. it's a lot faster loading, before it loaded the registry before going forward

```cmd
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --enable-dynamic-vram --enable-manager
pause
```

# Test Zimage

There is another gguf package, I try that with Zimage, before I was going with city96

https://github.com/calcuis/gguf

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load ZImageTEModel_
[INFO] Model ZImageTEModel_ prepared for dynamic VRAM loading. 7671MB Staged. 0 patches attached. Force pre-loaded 145 weights: 383 KB.
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\gguf\pig.py:365: UserWarning: The given NumPy array is not writable, and PyTorch does not support non-writable tensors. This means writing to this tensor will result in undefined behavior. You may want to copy the array to protect its data or make it writable before converting it to a tensor. This type of warning will be suppressed for the rest of this program. (Triggered internally at C:\b\pytorch\torch\csrc\utils\tensor_numpy.cpp:212.)
  torch_tensor = torch.from_numpy(tensor.data)
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
[INFO] model weight dtype torch.bfloat16, manual cast: None
[INFO] model_type FLOW
[INFO] Requested to load Lumina2
[INFO] loaded completely; 14909.73 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:13<00:00,  1.46s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] Unloaded partially: 1523.36 MB freed, 3311.75 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 31.40 seconds
[INFO] FETCH ComfyRegistry Data [DONE]
[INFO] [ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: F:\ComfyUI_windows_portable_amd\ComfyUI\user\__manager\cache\1514988643_custom-node-list.json [DONE]
[INFO] [ComfyUI-Manager] All startup tasks have been completed.
[INFO] got prompt
[INFO] loaded completely; 14592.29 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.44s/it]
[INFO] Unloaded partially: 1544.45 MB freed, 3290.66 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 19.36 seconds
```

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load ZImageTEModel_
[INFO] Model ZImageTEModel_ prepared for dynamic VRAM loading. 7671MB Staged. 0 patches attached. Force pre-loaded 145 weights: 383 KB.
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\gguf\pig.py:365: UserWarning: The given NumPy array is not writable, and PyTorch does not support non-writable tensors. This means writing to this tensor will result in undefined behavior. You may want to copy the array to protect its data or make it writable before converting it to a tensor. This type of warning will be suppressed for the rest of this program. (Triggered internally at C:\b\pytorch\torch\csrc\utils\tensor_numpy.cpp:212.)
  torch_tensor = torch.from_numpy(tensor.data)
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
[INFO] model weight dtype torch.bfloat16, manual cast: None
[INFO] model_type FLOW
[INFO] Requested to load Lumina2
[INFO] loaded completely; 14909.73 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:14<00:00,  1.58s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] Unloaded partially: 1523.36 MB freed, 3311.75 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 22.29 seconds
[INFO] got prompt
[INFO] loaded completely; 14592.29 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:14<00:00,  1.59s/it]
[INFO] Unloaded partially: 1544.45 MB freed, 3290.66 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 16.21 seconds
[INFO] got prompt
[INFO] Model ZImageTEModel_ prepared for dynamic VRAM loading. 7671MB Staged. 0 patches attached. Force pre-loaded 145 weights: 383 KB.
[INFO] loaded completely; 14593.20 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:14<00:00,  1.59s/it]
[INFO] Unloaded partially: 1565.55 MB freed, 3269.56 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 16.53 seconds
```


## GGUF VAE DECODE

It's faster :O

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] loaded completely; 14721.38 MB usable, 4835.08 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.43s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] Unloaded partially: 1607.73 MB freed, 3227.38 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Model AutoencodingEngine prepared for dynamic VRAM loading. 159MB Staged. 0 patches attached. Force pre-loaded 108 weights: 182 KB.
[INFO] Prompt executed in 16.52 seconds
```


First load
Second repeat same prompt
Third change prompt
```
|            | 2026-01-25                 | 2026-07-25                 |
|------------|----------------------------|----------------------------|
| GPU        | 7900XTX (gfx1100)          |                            |
| OS         | Windows-11                 | Windows-11-10.0.22631-SP0  |
| Driver     | Adrenaline 26.1.1          | Adrenaline 26.6.4          |
| Pytorch    |                            | 2.9.1+rocm7.2.1            |
|------------|----------------------------|----------------------------|
| Model      | Q4 4.8 GB                  |                            |
| Clip       | 7.8GB                      |                            |
| VAE        | 327MB                      |                            |
|------------|----------------------------|----------------------------|
| FLAG       |  --disable-smart-memory    | --enable-dynamic-vram      |
|------------|----------------------------|----------------------------|
| Size [px]  | 1024 x 1024                | 1024 x 1024                |
| First [s]  | 29                         | 22.29                      |
| Second [s] | 16                         | 16.21                      |
| Third [s]  | 19                         | 16.53                      |
|------------|----------------------------|----------------------------|
```



# Krea 2


```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Model Krea2TEModel_ prepared for dynamic VRAM loading. 4999MB Staged. 0 patches attached. Force pre-loaded 249 weights: 627 KB.
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise , emulated ops: float8_e5m2, nvfp4, float8_e4m3fn, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2
[INFO] Model Krea2 prepared for dynamic VRAM loading. 12530MB Staged. 0 patches attached. Force pre-loaded 160 weights: 2824 KB.
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.43s/it]
[INFO] Requested to load WanVAE
[INFO] Model WanVAE prepared for dynamic VRAM loading. 241MB Staged. 0 patches attached. Force pre-loaded 60 weights: 61 KB.
[INFO] Prompt executed in 30.82 seconds
[INFO] got prompt
[INFO] Model Krea2 prepared for dynamic VRAM loading. 12530MB Staged. 0 patches attached. Force pre-loaded 160 weights: 2824 KB.
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:22<00:00,  2.86s/it]
[INFO] Model WanVAE prepared for dynamic VRAM loading. 241MB Staged. 0 patches attached. Force pre-loaded 60 weights: 61 KB.
[INFO] Prompt executed in 27.57 seconds
```

had a system crash on third use

## Performance

markdown isn't showing table in exporters

```
|            | 2026-07-25                 |
|------------|----------------------------|
| GPU        | 7900XTX (gfx1100)          |
| OS         | Windows-11-10.0.22631-SP0  |
| Driver     | Adrenaline 26.6.4          |
| Pytorch    | 2.9.1+rocm7.2.1            |
|------------|----------------------------|
| Model      | FP8 12.8 GB                |
| Clip       | FP8 5.1 GB                 |
| VAE        | 247.8MB                    |
|------------|----------------------------|
| FLAG       | --enable-dynamic-vram      |
|------------|----------------------------|
| Size [px]  | 1024 x 1024                |
| First [s]  | 40.13                      |
| Second [s] | 27.57                      |
|------------|----------------------------|
```


### ROCm issues

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise , emulated ops: mxfp8, float8_e5m2, float8_e4m3fn, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22892.08 MB usable, 4999.47 MB loaded, full load: True
Generating tokens:   0%|                                                                       | 0/512 [00:00<?, ?it/s]F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
Generating tokens:  18%|███████████▍                                                  | 94/512 [00:07<00:33, 12.57it/s]
[INFO] Requested to load Krea2
[INFO] loaded completely; 17626.88 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.48s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 2580.70 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 42.47 seconds
[INFO] got prompt
 38%|███████████████████████████████▌                                                    | 3/8 [00:56<01:39, 19.87s/it][INFO] Interrupting prompt 51ecae9c-f336-439d-8595-c6dc051111d2
[INFO] Interrupting prompt 51ecae9c-f336-439d-8595-c6dc051111d2
[INFO] Interrupting prompt 51ecae9c-f336-439d-8595-c6dc051111d2
 38%|███████████████████████████████▌                                                    | 3/8 [01:24<02:20, 28.13s/it]
[INFO] Processing interrupted
[INFO] Prompt executed in 84.63 seconds
```

