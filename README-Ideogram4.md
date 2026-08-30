# MODELS

| | FP32 Safetensor | BF16 Safetensor | FP8 Saferensor | INT8 Safetensor | Q8 GGUF | Q4 GGUF |
| - | - | - | - | - | - | - |
| CLIP | . | . | [Qwen3VL 8B (10.4GB)](https://huggingface.co/Comfy-Org/Qwen3-VL/resolve/main/text_encoders/qwen3vl_8b_fp8_scaled.safetensors) | . | . | . |
| Model 1 | . | . | [Ideogram4 (9.1GB)](https://huggingface.co/Comfy-Org/Ideogram-4/resolve/main/diffusion_models/ideogram4_fp8_scaled.safetensors) | . | . | . |
| Model 2 | . | . | [Ideogram4U (9.1GB)](https://huggingface.co/Comfy-Org/Ideogram-4/resolve/main/diffusion_models/ideogram4_unconditional_fp8_scaled.safetensors) | . | . | . |
| VAE | [Flux2 FP32 (336MB)](https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors) | . | . | . | . | . |

## Model Links
**text_encoders**

- [qwen3vl_8b_fp8_scaled.safetensors](https://huggingface.co/Comfy-Org/Qwen3-VL/resolve/main/text_encoders/qwen3vl_8b_fp8_scaled.safetensors)

**diffusion_models**

- [ideogram4_fp8_scaled.safetensors](https://huggingface.co/Comfy-Org/Ideogram-4/resolve/main/diffusion_models/ideogram4_fp8_scaled.safetensors)
- [ideogram4_unconditional_fp8_scaled.safetensors](https://huggingface.co/Comfy-Org/Ideogram-4/resolve/main/diffusion_models/ideogram4_unconditional_fp8_scaled.safetensors)

**vae**

- [flux2-vae.safetensors](https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors)


## Model Storage Location

```
📂 ComfyUI/
├── 📂 models/
│   ├── 📂 vae/
│   │   └── flux2-vae.safetensors
│   ├── 📂 diffusion_models/
│   │   ├── ideogram4_fp8_scaled.safetensors
│   │   └── ideogram4_unconditional_fp8_scaled.safetensors
│   └── 📂 text_encoders/
│       ├── qwen3vl_8b_fp8_scaled.safetensors
```

## Why Double Model

Ideogram 4 uses a model that is trained on prompt and image, and a model that replaces prompt with padding (unconditional). It uses the difference between the two to improve prompt adherence

You can run the conditional model on its own, but it works best with both.

## JSON

The model is trained on json prompt with bbox bounding boxes. Dimension is normalized 0 to 1000 indipendently from the actual pixels.

## CENSORSHIP

With few bounding boxes and simple prompt the model will output a gray cencorship alert on even neutral prompts, it is unable to render simple prompts at all.

Make sure you make a rich prompt with lots of bbox elements. The prompt enchancer can be a good way to see what that looks like. It can be powered by the model CLIP to reduced load times, since it's an LLM, but you can use other LLMs.

## CFG

Default workflow sets a very high cfg of 7 that overcooks the image. You can set much lower cfg that makes the image more natural. 3 seems a good compromise.

## STEP

Default worklfows uses step from 8 to 48, 20 seems good.

# WORKFLOWS

## Json Prompt Enchancer

Ideogram4 does't really work with regular prompts, it trips the censorship. You need to compose a json for it to work, and a system prompt combined with a text generator using the model own clip can achieve that.

![](/workflow-png/Ideogram4-safetensor-TXT2TXT-Json-Prompt-Enchancer.png)

### EXAMPLE

```
Photograph. Field of vibtrant black roses in a beautiful sunny summer day with fluffy clouds. A sorrowful elf girl occupying 60% of the image on the left, an ancient stone altar on the right. The girl has white braided hair, is wearing a tattered white dress and a blue blindfold fully covering her eyes. The girl is kneeling at the altar, weaving a long tapestry with magical runes using bone needles and golden threads. The wind tousling her long hair. 
```

```json
{"aspect_ratio":"16:9","high_level_description":"A photorealistic photograph of a sorrowful elf girl with white braided hair kneeling on the left in a field of vibrant black roses under a bright sunny summer sky with fluffy clouds, wearing a tattered white dress and blue blindfold while weaving a tapestry with bone needles and golden threads at an ancient stone altar on the right, captured in natural daylight with soft overcast diffusion, textured earthy ground beneath her knees, rich palette of deep black rose petals against creamy skin tones and warm gold thread highlights, shallow depth-of-field focus on subject.","compositional_deconstruction":{"background":"vibrant field of black roses stretching across lower frame underfoot, distant horizon line with fluffy white clouds drifting above, bright sunlit summer sky casting diffused even light, ancient stone altar positioned on right side occupying 20% of frame, textured grassy terrain beneath feet and altar base, wind-swept atmosphere implied by tousled hair and fabric motion","elements":[{"type":"obj","bbox":[0,0,480,768],"desc":"sorrowful elf girl with pale skin, long white braided hair tousled by wind, wearing tattered white dress stained with dirt, fully covered by royal blue blindfold obscuring eyes, kneeling on one knee facing altar, hands engaged in intricate tapestry-weaving motion using bone needles and shimmering golden threads, posture conveying quiet grief and focused ritual"},{"type":"obj","bbox":[520,100,1000,768],"desc":"ancient weathered stone altar with moss-covered surface, rough granite texture, carved runes etched into top slab, standing upright on uneven rocky base, positioned to right side of frame, partially illuminated by dappled sunlight filtering through canopy"},{"type":"text","bbox":[300,400,480,500],"text":"Weave magic with bone\nand golden thread\nin silence.","desc":"tapestry being woven with visible magical runes stitched in glowing gold thread, held taut between wooden warp rods, suspended horizontally across midground, partially obscured by girl’s arms and dress sleeves, text embroidered directly onto fabric surface"},{"type":"obj","bbox":[480,500,680,768],"desc":"bone needle with curved tip, translucent ivory color, threaded with luminous golden fiber, held between thumb and forefinger of girl's right hand, poised mid-stitch above tapestry surface, reflecting ambient light, resting against edge of altar stone"},{"type":"obj","bbox":[480,600,680,768],"desc":"golden thread spool mounted on small wooden dowel attached to altar backrest, wound tightly with radiant yellow-gold filament, slightly frayed end trailing down toward girl's fingers, casting subtle glint against stone texture, position aligned with weave direction"},{"type":"obj","bbox":[250,200,350,300],"desc":"wind-blown strands of girl's white braid whipping across upper-left quadrant, individual hairs catching sunlight, some lifted off scalp near temple, others cascading past shoulder, creating dynamic diagonal motion blur effect, enhancing sense of environmental movement"}]}}
```

Execution time scales with the tokens generated, length of the prompt. ComfyUI is not very fast in LLMs, it pulls 10TPS on this Qwen 3 8B VL FP8 model while LMStudio with Vulkan runtime pulls 100TPS on the Q4 model.

```cmd
[INFO] got prompt
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22073.54 MB usable, 10097.97 MB loaded, full load: True
Generating tokens:  16%|█████████▌                                                  | 327/2048 [00:29<02:36, 11.03it/s]
[INFO] Prompt executed in 35.84 seconds
```

## TXT2IMG with Prompt Enchancer

![](/workflow-png/Ideogram4-safetensor-txt2img-prompt-enchancer.png)

![](/images/Ideogram4/Ideogram4%20(4).jpg)

![](/images/Ideogram4/Ideogram4%20(5).jpg)

### Performance without prompt enchancer

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22073.54 MB usable, 10097.97 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: convrot_w4a4, asym_w4a8_int8, int8_tensorwise , emulated ops: float8_e5m2, float8_e4m3fn, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: convrot_w4a4, asym_w4a8_int8, int8_tensorwise , emulated ops: float8_e5m2, float8_e4m3fn, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22001.86 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22001.86 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:34<00:00,  4.72s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 11332.09 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 114.36 seconds
[INFO] got prompt
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21589.85 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 21589.85 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:35<00:00,  4.79s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 11332.09 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 103.86 seconds
```

### Performance with prompt enchancer

```cmd
[INFO] got prompt
[INFO] Requested to load Ideogram4Qwen3VLTEModel_
[INFO] loaded completely; 22073.54 MB usable, 10097.97 MB loaded, full load: True
Generating tokens:  33%|███████████████████▊                                        | 676/2048 [01:01<02:04, 11.03it/s]
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22001.86 MB usable, 8850.72 MB loaded, full load: True
[INFO] Requested to load Ideogram4
[INFO] loaded completely; 22001.86 MB usable, 8850.72 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [01:38<00:00,  4.91s/it]
[INFO] Requested to load AutoencoderKL
[INFO] loaded completely; 11744.10 MB usable, 160.31 MB loaded, full load: True
[INFO] Prompt executed in 175.77 seconds
```

