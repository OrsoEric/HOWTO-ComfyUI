# ComfyUI

The scope of this repository is to document how to run Comfy UI with ROCm acceleration with a AMD 7900XTX under Windows.

## Value Proposition

Nvidia and CUDA works better. But Nvidia makes you pay a significant premium for VRAM, and VRAM is critical to machine learning.

When choosing how to upgrade in 2025-01 my choices were
- AMD 7900XTX 24GB: 940€
- Nvidia 3090 24GB 4 years old used: 750€
- Nvidia 4090 24GB: 2500 €
- Nvidia 5090 32GB: 3500 €

In my region the 7900XTX still goes for 850€ to 950€ at the time of update 2025-12-09, and in my opinion this is amazing value to accelerate ComfyUI generation and local LLMs.

16GB cards are more affordable, but those 8GB extra go a long way in inference.

## Hardware 

- AMD RX 7900 XTX 24GB <--- The GOAT
- Intel 13700F
- DDR5 4x16GB 64GB 6400 CL32

## ComfyUI vs AMD ROCm

The achille's heel of AMD card, is the stack. It's bad. As of 2026-01-25 ROCm has windows binaries for pytorch that works to an extent with decent performance with ComfyUI.

[Now it works with the default driver 26.1.1](https://www.amd.com/en/resources/support-articles/release-notes/RN-RAD-WIN-26-1-1.html) Make sure you install Pytorch option in the AI tab of adrenaline.

[ComfyUI has a portable release ROCm 7.1](https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.10.0).

[Building it pip works better for me, as I can build with ROCm 7.2](/install-comfyui-adrenaline26_1_1-rocm7_2-p3_12.bat.bat). Read the script and what it does.

Launching ComfyUI needs two extra flags,

```uv run main.py  --windows-standalone-build  --use-pytorch-cross-attention```


## EXTERNAL MODEL FOLDER

The environment can brick easily. 

It is convenient to move the models outside the ComfyUI folder, so that when I rebuild, the models are all there. This also allows multiple local env to all access models without duplication.


```extra_model_paths.yaml```

```yaml
comfyui:
    # Go up to the parent folder, and look for the model folder there
    base_path: ..\ComfyUI-Models
    # Model Folder
    checkpoints: checkpoints\
    clip: clip\
    clip_vision: clip_vision\
    text_encoders: text_encoders\
    configs: configs\
    controlnet: controlnet\
    diffusion_models: |
                diffusion_models
                unet
    embeddings: embeddings\
    loras: loras\
    upscale_models: upscale_models\
    vae: vae\
    # custom vibevoice node dumps here
    vibevoice: vibevoice\
```

# WORKFLOWS

## Hunyuan 3D 2.0 MV

This workflow uses A background removal model, followed by Qwen Edit Q4 to generate the back, followed by Hunyuan 2.0 multiview to generate the 3D model

![](/workflow-png/HY20MV-img2stl.png)

![](/workflow-png/HY20MV-QE-img2stl.png)

[Logs](/logs/2026-01-25-T1300-Hunyuan3D%2020.log)






# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>