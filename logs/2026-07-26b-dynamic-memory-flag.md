# Zimage

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load ZImageTEModel_
[INFO] loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\gguf\pig.py:365: UserWarning: The given NumPy array is not writable, and PyTorch does not support non-writable tensors. This means writing to this tensor will result in undefined behavior. You may want to copy the array to protect its data or make it writable before converting it to a tensor. This type of warning will be suppressed for the rest of this program. (Triggered internally at C:\b\pytorch\torch\csrc\utils\tensor_numpy.cpp:212.)
  torch_tensor = torch.from_numpy(tensor.data)
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
[INFO] model weight dtype torch.bfloat16, manual cast: None
[INFO] model_type FLOW
[INFO] Requested to load Lumina2
[INFO] loaded completely; 14879.92 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.43s/it]
[INFO] Requested to load AutoencodingEngine
[INFO] Unloaded partially: 1353.59 MB freed, 3480.49 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] loaded completely; 5158.47 MB usable, 159.87 MB loaded, full load: True
[INFO] Prompt executed in 27.10 seconds
[INFO] got prompt
[INFO] loaded completely; 14541.90 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
[INFO] Unloaded partially: 1353.59 MB freed, 3480.49 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Prompt executed in 14.75 seconds
[INFO] got prompt
[INFO] loaded completely; 14547.90 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
[INFO] Unloaded partially: 1353.59 MB freed, 3480.49 MB remains loaded, 63.28 MB buffer reserved, lowvram patches: 0
[INFO] Prompt executed in 14.90 seconds
```

# Krea 2

First run got stuck, 8s first iteratoion 16s second and was freezing at 24GB VRAM pinned

reboot

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22892.08 MB usable, 4999.47 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise , emulated ops: float8_e5m2, mxfp8, float8_e4m3fn, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2
[INFO] loaded completely; 17685.88 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:18<00:00,  2.27s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 2603.00 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 34.27 seconds
[INFO] got prompt
 25%|█████████████████████                                                               | 2/8 [00:58<03:24, 34.06s/it]
```

first run work, second collapses

![](/logs/Screenshot%202026-07-26%20103529%20krea%202%20driver%20timeout%20on%20third%20run.png)

## Github Issue

https://github.com/Comfy-Org/ComfyUI/issues/14658


# --disable-smart-memory 

This no longer crashes, but degrades performance

```.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-api-nodes```

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22892.08 MB usable, 4999.47 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise , emulated ops: mxfp8, nvfp4, float8_e4m3fn, float8_e5m2
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2
[INFO] loaded completely; 22712.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.42s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 19010.25 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 83.60 seconds
[INFO] got prompt
[INFO] Requested to load Krea2
[INFO] loaded completely; 22566.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.38s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18983.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 43.33 seconds
[INFO] got prompt
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22564.61 MB usable, 4999.47 MB loaded, full load: True
[INFO] Requested to load Krea2
[INFO] loaded completely; 22566.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:18<00:00,  2.36s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18983.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 38.54 seconds
```

# Try to add find mode like the old fix

works better, it's even faster and pegs at 18.5GB

```cmd
set COMFYUI_ENABLE_MIOPEN=1
set MIOPEN_FIND_MODE=2
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-api-nodes
```

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22892.08 MB usable, 4999.47 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:60: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise , emulated ops: float8_e4m3fn, nvfp4, float8_e5m2, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2
[INFO] loaded completely; 22712.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.42s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 19010.25 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 38.61 seconds
[INFO] got prompt
[INFO] Requested to load Krea2
[INFO] loaded completely; 22534.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.38s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18951.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 28.37 seconds
[INFO] got prompt
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22532.61 MB usable, 4999.47 MB loaded, full load: True
[INFO] Requested to load Krea2
[INFO] loaded completely; 22534.61 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:19<00:00,  2.38s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 18951.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 30.73 seconds
```

![](/logs/Screenshot%202026-07-26%20113516%20krea2%20mimode%202.png)


