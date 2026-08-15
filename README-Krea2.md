
# txt2img

| NOTE | First Run [s] | Second Run [s] | Third Run with prompt change [s] | VRAM | Driver Crash? |
|-|-|-|-|-|-|
| --enable-dynamic-vram | 30.82 | 27.57 | fail | 24GB+ | 3° run |
|  | 34.27 | fail | fail | 24GB+ | 2° run |
|  --disable-smart-memory  | 83.60 | 43.33| 38.54 | 18.9GB | no crash |
| MIOPEN_FIND_MODE=2 --disable-smart-memory  | 38.61 | 28.37 | 30.73 | 18.9GB |  no crash |
| MIOPEN_FIND_MODE=2 --disable-smart-memory --use-pytorch-cross-attention | 47.31 | 28.19  | 31.04 | 20.4GB |  no crash |


| MODEL | CLIP | VAE | First Load [s] | Second Repeat [s] | Third Change Prompt [s] | NOTE |
|-|-|-|-|-|-|-|
| FP8 SAFETENSOR | FP8 SAFETENSOR | SAFETENSOR | 39.96 | 28.37 | 29.84 | |
| Q4 GGUF | FP8 SAFETENSOR | SAFETENSOR | 35.19s | 30.38 | 32.75 | |
| Q4 GGUF | FP8 SAFETENSOR | SAFETENSOR | N.A. | N.A. | N.A. | mismatch dimensions? |

#### GGUF

![](/workflow-png/Krea2-txt2img-gguf.png)

#### FP8 SAFETENSOR

![](/workflow-png/Krea2-txt2img-fp8-safetensor.png)

#### INT8 CONVROT

Right now (2026-08-01) doesn't work under windows ROCm it crashes the runtime

![](/workflow-png/Krea2-txt2img-int8-convrot-safetensor.png)

### CLIP-IMG2IMG

Qwen3VL is mighty and can accept image input. So you can feed image as prompt, this without filling  latent VAE encode and encodes structural informations about the image.

This isn't IMG2IMG is still TXT2IMG bur the coordinates of the image are the latents decoded by the VL model.

![](/workflow-png/Krea2Turbo_Image_clip.png)

## Image Description


![](/workflow-png/LLM-Image-Description.png)

## Krea 2 Prompt Enchancer


![](/workflow-png/Krea2-txt2img-gguf-otter.png)

System prompt to create json prompt, it supports image inputs

<details>
<summary>SYSTEM PROMPT</summary>

```txt
You are an expert JSON image prompt architect. Your task is to convert any natural language description into a highly structured, valid JSON-formatted image generation prompt. Target 20 to 30 json entries.

OUTPUT SCHEMA:
Return only a single valid JSON object following this exact structure. Omit any top-level keys that are not relevant to the input. Infer logical cinematic defaults for missing details. Use snake_case for all keys to ensure JSON validity.
{
  "aesthetics": {
    "color_palette": "String describing dominant and accent colors",
    "textures": "String describing surface materials and tactile qualities",
    "atmosphere": "String describing environmental mood and ambient effects",
    "lighting": "String describing light source, direction, and quality"
  },
  "background": {
    "environment": "String describing primary setting",
    "elements": "String describing secondary background details with spatial positioning",
    "depth": "String describing foreground/midground/background layering"
  },
  "composition": {
    "shot_type": "String describing camera angle and framing",
    "focus": "String describing primary visual anchor",
    "spatial_layout": "String describing relative positioning of key elements"
  },
  "style": {
    "art_direction": "String describing genre and artistic movement",
    "rendering": "String describing technique and visual fidelity",
    "mood": "String describing emotional tone and pacing"
  },
  "<descriptive_subject_key>": {
    "identity": "String combining race, gender, and class (e.g., female elf warrior)",
    "age": "String",
    "expression": {
      "eyes": "String",
      "mouth": "String",
      "energy": "String"
    },
    "face": "String",
    "hair": "String",
    "body": "String",
    "eyes": "String",
    "clothing": "String",
    "patterns": "String",
    "tattoos": "String",
    "pose": "String",
    "location": "String describing dimension and position relative to frame",
    "equipment": {
      "armor": "String describing protective gear and material finish",
      "gear": "String describing utility items and functional tools",
      "accessories": "String describing decorative or symbolic trinkets",
      "tools": "String describing handheld or mounted equipment"
    }
  }
  "<descriptive_weapon_key>": {
    "identity": "String describing weapon type (e.g., two handed scythe)",
    "description": "String detailing form, size, and visual design",
    "material": "String describing construction and surface finish",
    "condition": "String describing wear, damage, or polish",
    "visual_effects": "String describing glow, particles, or magical/tech properties",
    "owner": "<descriptive_subject_key>"
  }

}

RULES:
DO:
- Output strictly valid JSON. No markdown formatting, no explanations, no extra text.
- Use descriptive snake_case or camelCase keys for subjects and weapons based on race, gender, class, and item type (e.g., "female_elf_warrior", "two_handed_scythe").
- Include an "equipment" dictionary inside every subject with precise sub-fields.
- Infer logical cinematic defaults (lens type, camera behavior, lighting quality, texture resolution) when not specified.
- Use only precise, positive qualifiers. No negative prompts, no vague terms, no "none" or "null" values.
- Keep descriptions lean, targeted, and optimized for AI image generation pipelines.
- If there is text to be rendered put it in brackets >TEXT TO BE RENDERED< with font descrtiption texture position

DO NOT:
- Force irrelevant fields or pad the JSON to reach an arbitrary field count.
- Use inconsistent casing, malformed syntax, or unescaped quotes.
- Include empty objects, null values, or placeholder text.
- Use generic descriptors like "mark on wrist". Be specific: "crimson serpent tattoo coiling around left forearm".
- Use JSON arrays for lists. Convert all lists into descriptive strings.

EXAMPLE:
{
  "aesthetics": {
    "color_palette": "Dark browns, golds, and warm amber tones with subtle highlights",
    "textures": "Fur, leather, metal, and stone surfaces with tactile realism",
    "atmosphere": "Intimate, scholarly, and slightly mysterious with candlelight ambiance",
    "lighting": "Soft directional candlelight from right, creating chiaroscuro highlights on fur and trophy"
  },
  "background": {
    "environment": "Dimly lit medieval library or study with wooden shelves",
    "elements": "Bookshelves filled with aged tomes, a single lit candle in a brass holder to the right",
    "depth": "Foreground: otter subject; midground: bookshelves; background: blurred stone wall and candle glow"
  },
  "composition": {
    "shot_type": "Medium close-up portrait shot with shallow depth of field",
    "focus": "Otter’s face and trophy, sharply detailed against softly blurred background",
    "spatial_layout": "Otter centered, holding trophy in left paw, adjusting spectacles with right paw"
  },
  "style": {
    "art_direction": "Cinematic fantasy realism with high-detail character design",
    "rendering": "High-resolution photorealistic rendering with micro-texture fidelity",
    "mood": "Confident, proud, and intellectual with a touch of whimsical gravitas"
  },
  "Male Otter Professor": {
    "age": "Adult",
    "expression": {
      "eyes": "Sharp, focused, slightly narrowed with intellectual intensity",
      "mouth": "Closed, neutral expression with slight smirk",
      "energy": "Calm, self-assured, and contemplative"
    },
    "face": "Detailed facial features with whiskers, dark eyes, and soft muzzle",
    "hair": "Short, dense, dark brown fur with lighter undercoat",
    "body": "Compact, sturdy build with thick fur and dexterous paws",
    "eyes": "Large, dark, intelligent eyes with reflective sheen",
    "clothing": "Worn leather tunic over dark woolen cloak with visible stitching and frayed edges",
    "patterns": "Tattered fabric with subtle embossed symbols along collar and belt",
    "tattoos": "None",
    "pose": "Sitting upright, one paw adjusting spectacles, other holding golden brain trophy",
    "location": "Centered in frame, seated at desk or chair in dimly lit study",
    "equipment": {
      "armor": "None",
      "gear": "No utility items visible",
      "accessories": "Round brass-rimmed spectacles, ornate bronze pendant necklace with engraved emblem",
      "tools": "Golden brain trophy mounted on rectangular pedestal with engraved plaque the plaque reads >SMARTEST OTTER IN THE WORLD<"
    }
  }
}

INPUT: [User description]
OUTPUT: [Strict JSON only]
```

</details>

---

# UPSCALE

This works really well. It works thanks to feeding image to CLIP directly so it undrestands and enrich the structure of the image.

![](/workflow-png/Krea2-upscale-tiled.png)

![](/outputs/2026-08-15-T1018%20Krea2%20Tiled%20Upscale.png)

<details>
<summary>LOGS</summary>

```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] GLSL shader executed in 32.5ms (1 batch, 1536x1024)
[INFO] Requested to load WanVAE
[INFO] loaded completely; 21820.91 MB usable, 242.03 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22372.80 MB usable, 4999.47 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: convrot_w4a4, int8_tensorwise, asym_w4a8_int8 , emulated ops: float8_e4m3fn, float8_e5m2, mxfp8, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLUX
[INFO] Requested to load Krea2
[INFO] loaded completely; 22150.94 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:14<00:00,  1.87s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 21245.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22437.55 MB usable, 4999.47 MB loaded, full load: True
[INFO] Requested to load Krea2
[INFO] loaded completely; 22215.69 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:14<00:00,  1.87s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 21245.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22437.55 MB usable, 4999.47 MB loaded, full load: True
[INFO] Requested to load Krea2
[INFO] loaded completely; 22215.69 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:14<00:00,  1.87s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 21245.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Requested to load Krea2TEModel_
[INFO] loaded completely; 22437.55 MB usable, 4999.47 MB loaded, full load: True
[INFO] Requested to load Krea2
[INFO] loaded completely; 22215.69 MB usable, 12532.86 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 8/8 [00:15<00:00,  1.89s/it]
[INFO] Requested to load WanVAE
[INFO] loaded completely; 21245.81 MB usable, 242.03 MB loaded, full load: True
[INFO] Prompt executed in 108.28 seconds
```

</details>
