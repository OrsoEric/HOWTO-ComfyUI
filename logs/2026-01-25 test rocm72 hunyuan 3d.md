# Driver 26.1.1 - ROCm 7.2 - Python 3.12

uv run main.py --windows-standalone-build --disable-smart-memory

# Zimage

<details>
<summary>Zimage Q4</summary>

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 22622.68 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.44s/it]
Requested to load AutoencodingEngine
loaded completely; 11463.56 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 29.05 seconds
got prompt
Requested to load Lumina2
loaded completely; 22402.31 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.40s/it]
Requested to load AutoencodingEngine
loaded completely; 11425.93 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 15.41 seconds
got prompt
Requested to load Lumina2
loaded completely; 22402.31 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.40s/it]
Requested to load AutoencodingEngine
loaded completely; 11425.93 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 15.48 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 22498.61 MB usable, 7672.25 MB loaded, full load: True
Requested to load Lumina2
loaded completely; 22402.31 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
Requested to load AutoencodingEngine
loaded completely; 11425.93 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 19.40 seconds
```

</details>


# Hunyuan 3D



<details>
<summary>Hunyuan 3D</summary>

Parameters tuned way up

```cmd
got prompt
Cache check: Missing model files: config.json, model.safetensors, birefnet.py, BiRefNet_config.py
Downloading required model files...
Downloading RMBG-2.0 model files...
Downloading config.json...
Downloading model.safetensors...
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Downloading birefnet.py...
Downloading BiRefNet_config.py...
Model files downloaded successfully
F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\timm\models\registry.py:4: FutureWarning: Importing from timm.models.registry is deprecated, please import via timm.models
  warnings.warn(f"Importing from {__name__} is deprecated, please import via timm.models", FutureWarning)
model weight dtype torch.float16, manual cast: None
model_type FLOW
VAE load device: cuda:0, offload device: cpu, dtype: torch.float16
Requested to load Dinov2Model
loaded completely; 21852.66 MB usable, 577.86 MB loaded, full load: True
Requested to load Hunyuan3Dv2_1
loaded completely; 21724.41 MB usable, 5818.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 100/100 [02:31<00:00,  1.51s/it]
Requested to load ShapeVAE
loaded completely; 21652.35 MB usable, 624.88 MB loaded, full load: True
Volume Decoding: 100%|███████████████████████████████████████████████████████████| 3858/3858 [00:01<00:00, 2902.10it/s]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1514988643_custom-node-list.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\832903789_extras.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1742899825_extension-node-map.json [DONE]
Prompt executed in 473.18 seconds
```

Parameters tuned down

```
got prompt
model weight dtype torch.float16, manual cast: None
model_type FLOW
VAE load device: cuda:0, offload device: cpu, dtype: torch.float16
Requested to load Dinov2Model
loaded completely; 21852.66 MB usable, 577.86 MB loaded, full load: True
Requested to load Hunyuan3Dv2_1
loaded completely; 21724.41 MB usable, 5818.86 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 50/50 [00:44<00:00,  1.13it/s]
Requested to load ShapeVAE
loaded completely; 21652.35 MB usable, 624.88 MB loaded, full load: True
Volume Decoding: 100%|███████████████████████████████████████████████████████████| 2283/2283 [00:00<00:00, 2652.59it/s]
Prompt executed in 128.82 seconds
```



</details>


# Voxel Viewer

I want to view the voxels generated by Hunyuan 3D

https://github.com/DanielHabib/ComfyUI-Voxels

```
uv pip install trimesh
uv pip install pyvista


```

It's not the same structure, and doesn't work

I would also like to do a VAE encode and reprocess






---

# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>