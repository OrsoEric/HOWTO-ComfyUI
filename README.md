# HOWTO-ComfyUI
This repo documents my workflows and stack to run comfy ui GenANI assist under windows

## Hardware 
- AMD RX 7900 XTX
- Intel 13700F
- DDR5 4x16GB 64GB 6400


# Flux

## Flux FP8

High performance model from for Forests Labs

<details>
<summary>Workflow+Sample Image+CMD Output</summary>

![FLUX-txt2img](/workflows/FLUX-txt2img.png)
*PNG workflow for FLUX-txt2img. Drag and Drop to CpomfyUI to load the workflow*

```
got prompt
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
Requested to load FluxClipModel_
loaded completely 9.5367431640625e+25 4777.53759765625 True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
loaded partially 9680.918730468751 9680.772521972656 0
100%|███████████████████████████████████████████████████████████████████████████████████| 20/20 [00:43<00:00,  2.19s/it]
Requested to load AutoencodingEngine
loaded completely 3786.4232421875004 319.7467155456543 True
[Tiled VAE]: input_size: torch.Size([1, 16, 128, 128]), tile_size: 128, padding: 11
[Tiled VAE]: split to 1x1 = 1 tiles. Optimal tile size 128x128, original tile size 128x128
[Tiled VAE]: Fast mode enabled, estimating group norm parameters on 128 x 128 image
[Tiled VAE]: Executing Decoder Task Queue: 100%|█████████████████████████████████████| 123/123 [00:00<00:00, 284.70it/s]
[Tiled VAE]: Done in 1.279s, max VRAM alloc 12694.351 MB
Prompt executed in 59.29 seconds
got prompt
loaded partially 11184.261076660157 11184.255920410156 0
100%|███████████████████████████████████████████████████████████████████████████████████| 20/20 [00:39<00:00,  1.97s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 3662.3070312500004 319.7467155456543 True
[Tiled VAE]: input_size: torch.Size([1, 16, 128, 128]), tile_size: 128, padding: 11
[Tiled VAE]: split to 1x1 = 1 tiles. Optimal tile size 128x128, original tile size 128x128
[Tiled VAE]: Fast mode enabled, estimating group norm parameters on 128 x 128 image
[Tiled VAE]: Executing Decoder Task Queue: 100%|████████████████████████████████████| 123/123 [00:00<00:00, 5941.42it/s]
[Tiled VAE]: Done in 1.088s, max VRAM alloc 10879.680 MB
Prompt executed in 44.08 seconds

```
</details>

NOTE: I have a 16.8GB fp8 model but I can't find the source,now fp8 models seems to be around 12GB.


## Flux UNET GGUF

<details>
<summary>Flux UNET GGUF Workflow</summary>

- [UNET GGUF](https://civitai.com/api/download/models/1532293?type=Model&format=GGUF&size=full&fp=fp8)
- [CLIP](https://civitai.com/api/download/models/1466488?type=Model&format=SafeTensor&size=full&fp=fp8)
- [Flux Text Encoder - default](https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/t5xxl_fp8_e4m3fn.safetensors)
- [Flux VAE - default](https://huggingface.co/black-forest-labs/FLUX.1-dev/blob/main/ae.safetensors)


![](/workflows/FLUX-gguf-txt2img.png)

</details>

## Flux NF4 Quantization

>!!! Exception during processing !!! 'NoneType' object has no attribute 'cdequantize_blockwise_bf16_nf4'

7900XTX does not support NF4 quantization

<details>
<summary>Flux NF4 Workflow</summary>

Model Links:
- [Flux NF4 lllyasviel](https://huggingface.co/lllyasviel/flux1-dev-bnb-nf4/tree/main)
- [VAE](https://huggingface.co/black-forest-labs/FLUX.1-schnell/blob/main/ae.safetensors)


![](/workflows/FLUX-NF4-txt2img.png)

</details>

# 3D WORKFLOW HUNYUAN

This workflow generate printable stl from images.

Download:
- [Model](https://huggingface.co/tencent/Hunyuan3D-2mini/blob/main/hunyuan3d-dit-v2-mini-turbo/model.fp16.safetensors)
- [VAE](https://huggingface.co/tencent/Hunyuan3D-2mini/blob/main/hunyuan3d-vae-v2-mini-turbo/model.fp16.safetensors) 

Workflow

![Workflow Hunyuan 3D](/workflows/Hunyuan-img2stl-background-remove.png)

Example Output

[Download STL](/stl/Candle-good.stl)

![](/images/Candle-3D-good.png)







<details>
<summary>Hunyuan 3D Workflow</summary>

CMD output

Mini Turbo model
```
got prompt
HiDream: ComfyUI is unloading all models, cleaning HiDream cache...
HiDream: Cleaning up all cached models...
HiDream: Cache cleared
image shape torch.Size([1, 3, 1024, 1024])
guidance:  tensor([9.], device='cuda:0', dtype=torch.float16)
Diffusion Sampling:: 100%|██████████████████████████████████████████████████████████| 75/75 [00:48<00:00,  1.56it/s]
latents shape:  torch.Size([1, 3072, 64])
Allocated memory: memory=1.434 GB
Max allocated memory: max_memory=6.207 GB
Max reserved memory: max_reserved=10.521 GB
Volume Decoding: 100%|██████████████████████████████████████████████████████████| 4501/4501 [00:59<00:00, 75.89it/s]
MC Surface Extractor
Decoded mesh with 752601 vertices and 1505220 faces
Removed floaters, resulting in 752601 vertices and 1505198 faces
Removed degenerate faces, resulting in 752601 vertices and 1505198 faces
Reduced faces, resulting in 25002 vertices and 50000 faces
Hy3DMeshInfo: Mesh has 25002 vertices and 50000 faces
Hy3DMeshInfo: Mesh has 752601 vertices and 1505220 faces
Prompt executed in 126.74 seconds
```

Initial Model
```
got prompt
/home/soraka/.local/lib/python3.10/site-packages/transparent_background/Remover.py:92: FutureWarning: You are using `torch.load` with `weights_only=False` (the current default value), which uses the default pickle module implicitly. It is possible to construct malicious pickle data which will execute arbitrary code during unpickling (See https://github.com/pytorch/pytorch/blob/main/SECURITY.md#untrusted-models for more details). In a future release, the default value for `weights_only` will be flipped to `True`. This limits the functions that could be executed during unpickling. Arbitrary objects will no longer be allowed to be loaded via this mode unless they are explicitly allowlisted by the user via `torch.serialization.add_safe_globals`. We recommend you start setting `weights_only=True` for any use case where you don't have full control of the loaded file. Please open an issue on GitHub for any issues related to this experimental feature.
  torch.load(os.path.join(ckpt_dir, ckpt_name), map_location="cpu"),
Settings -> Mode=base, Device=cuda:0, Torchscript=enabled
HiDream: ComfyUI is unloading all models, cleaning HiDream cache...
HiDream: Cleaning up all cached models...
HiDream: Cache cleared
image shape torch.Size([1, 3, 518, 518])
guidance:  None
Diffusion Sampling:: 100%|██████████████████████████████████████████████████████████| 75/75 [01:09<00:00,  1.09it/s]
latents shape:  torch.Size([1, 3072, 64])
Allocated memory: memory=2.455 GB
Max allocated memory: max_memory=5.026 GB
Max reserved memory: max_reserved=8.416 GB
FlashVDM Volume Decoding: 100%|███████████████████████████████████████████████████| 32/32 [00:00<00:00, 1340.76it/s]
MC Surface Extractor
Decoded mesh with 355584 vertices and 1373556 faces
Removed floaters, resulting in 355536 vertices and 711068 faces
Removed degenerate faces, resulting in 355536 vertices and 711068 faces
Reduced faces, resulting in 25002 vertices and 50000 faces
Prompt executed in 84.13 seconds
```

## Geometry Damage

Added a section in the workflow to improve background removal, as it sometime it causes geometry artefacts like below

![](/images/2025-04-14b-candle-geometry-error.png)

[Download STL](/stl/Candle-geometry-damaged.stl.stl)

## VAE dmc error

Had a persistent error when trying dmc mode on VAE decode

```
AttributeError: 'NoneType' object has no attribute 'mesh_f' 
```

Found out that for me dmc doesn't work when enable_flash_vdm

## Postprocess Mesh

Reduces the STL size from about 750MB to about 15MB

## Default Model vs Mini Turbo Model

The mini turbo model converges in far fewer steps, from 50 to less than 10. The mini turbo model also accepts 1024px images instead of 518px

</details>

# EOL