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