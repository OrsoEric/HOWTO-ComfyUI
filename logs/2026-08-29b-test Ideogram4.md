## First run

```
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22686.42 MB usable, 10097.97 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:95: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise, asym_w4a8_int8, convrot_w4a4 , emulated ops: float8_e4m3fn, float8_e5m2, nvfp4, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise, asym_w4a8_int8, convrot_w4a4 , emulated ops: float8_e4m3fn, float8_e5m2, nvfp4, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22509.68 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22509.68 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:51<00:00,  5.55s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 10994.14 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 137.52 seconds
```

it's a poster 


## Second Run

I tried the prompt ecnhancer on my benchmark and it's bad, it's like alkpha of AOE2 characters

```
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22073.54 MB usable, 10097.97 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise, asym_w4a8_int8, convrot_w4a4 , emulated ops: float8_e4m3fn, float8_e5m2, nvfp4, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: int8_tensorwise, asym_w4a8_int8, convrot_w4a4 , emulated ops: float8_e4m3fn, float8_e5m2, nvfp4, mxfp8
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21935.04 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21935.04 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:31<00:00,  4.57s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 10495.95 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 120.44 seconds
```

![](/images/Ideogram4/Ideogram4%20(2).jpg)

## Third Run

My benchmark prompt bare

```
[INFO] got prompt
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 21661.53 MB usable, 10097.97 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21530.46 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21530.46 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:26<00:00,  4.34s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 10588.85 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 102.64 seconds
```

# PROMPT

```json
{"aspect_ratio":"1024:1024","bbox":[0,0,1024,1024],"high_level_description":"A sorrowful elf girl with white braided hair, wearing a tattered white dress and blue blindfold, kneels at an ancient stone altar in a field of black roses, weaving a long tapestry with runes under a sunny blue sky with wind tousling her hair"}

"compositional_deconstruction":{"background":"Sunny blue sky with scattered wispy clouds. Wind-blown grasses and wildflowers in the foreground. Ancient weathered stone altar with mossy texture, positioned centrally. Field of dense black roses surrounding the altar.","elements":[{"type":"obj","bbox":[250,300,750,800],"desc":"Sorrowful elf girl with shoulder-length white braided hair, pale skin tone, tattered white dress with frayed hem, blue blindfold fully covering eyes. Kneeling on one knee, hands actively weaving a long tapestry with glowing runes embedded within the fabric. Long hair flowing dynamically from wind movement."},{"type":"obj","bbox":[400,600,600,900],"desc":"Ancient stone altar with rough-hewn surface, moss-covered base, engraved runes along its front edge. Positioned centrally in the frame, surrounded by black roses. The primary background element."},{"type":"obj","bbox":[100,500,900,800],"desc":"Field of dense black roses with dark petals and thorny stems, stretching across the midground around the altar. Each rose head detailed with subtle dew drops reflecting ambient light. The primary background element."}]}
```

## PROMPT FIXED

```
{"aspect_ratio":"1024:1024","bbox":[0,0,1024,1024],"high_level_description":"A sorrowful elf girl with white braided hair, wearing a tattered white dress and blue blindfold, kneels at an ancient stone altar in a field of black roses, weaving a long tapestry with runes under a sunny blue sky with wind tousling her hair"}

"compositional_deconstruction":{"background":"Sunny blue sky with scattered wispy clouds. Wind-blown grasses and wildflowers in the foreground. Ancient weathered stone altar with mossy texture, positioned centrally. Field of dense black roses surrounding the altar.","elements":[{"type":"obj","bbox":[250,300,750,800],"desc":"Sorrowful elf girl with shoulder-length white braided hair, pale skin tone, tattered white dress with frayed hem, blue blindfold fully covering eyes. Kneeling on one knee, hands actively weaving a long tapestry with glowing runes embedded within the fabric. Long hair flowing dynamically from wind movement."},{"type":"obj","bbox":[400,600,600,900],"desc":"Ancient stone altar with rough-hewn surface, moss-covered base, engraved runes along its front edge. Positioned centrally in the frame, surrounded by black roses. The primary background element."},{"type":"obj","bbox":[100,500,900,800],"desc":"Field of dense black roses with dark petals and thorny stems, stretching across the midground around the altar. Each rose head detailed with subtle dew drops reflecting ambient light. The primary background element."}]}
```

![](/images/Ideogram4/Ideogram4%20(1).jpg)

## Ideogram 4 

```
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22684.11 MB usable, 10097.97 MB loaded, full load: True
Generating tokens:  40%|████████████████████████                                    | 820/2048 [01:15<01:52, 10.92it/s]
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: asym_w4a8_int8, convrot_w4a4, int8_tensorwise , emulated ops: float8_e4m3fn, float8_e5m2, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: asym_w4a8_int8, convrot_w4a4, int8_tensorwise , emulated ops: float8_e4m3fn, float8_e5m2, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22523.12 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22523.12 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:50<00:00,  5.50s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 11071.58 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 208.95 seconds
[INFO] got prompt
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22073.54 MB usable, 10097.97 MB loaded, full load: True
Generating tokens:  38%|██████████████████████▌                                     | 772/2048 [01:19<02:10,  9.76it/s]
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21935.04 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21935.04 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:52<00:00,  5.60s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 10907.95 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 213.76 seconds
```