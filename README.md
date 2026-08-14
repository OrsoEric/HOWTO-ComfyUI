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

[ComfyUI has a portable release ROCm 7.1](https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.10.0).

[Building it pip works better for me, as I can build with ROCm 7.2](/install-comfyui-adrenaline26_1_1-rocm7_2-p3_12.bat.bat). Read the script and what it does.


## ROCm under Windows is bad

The achille's heel of AMD card, is the stack. It's bad. As of  ROCm has windows binaries for pytorch that works to an extent with decent performance with ComfyUI.

AMD ROCm is Linux first, and barely even works under windows.

ROCm barely even works, if you have access to Vulkan accelerated runtimes they work a lot better, it'll be often faster than the ROCm runtimes because the Adrenaline team knows what they are doing and are windows first.

The first Windows binaries were released in 2026-01-25, before that, windows required WSL to do Linux emulation of the drivers with passthrough and catastrophic penalties

[First windows binaries in Driver 26.1.1](https://www.amd.com/en/resources/support-articles/release-notes/RN-RAD-WIN-26-1-1.html) Make sure you install Pytorch option in the AI tab of adrenaline.

To underscore how incompetent and unfit for duty ROCm is, my new Intel laptop with 358H and B390 with LPCAMM2 100GB/s can pull 1/3 of the speed of my 7900XTX ROCm, despite having 1/9 of compute and bandwidth. It's an humiliating difference, especially considering Intel is much newer to the whole AI stack, and it has much more competent binaries and painless installation.

Multiple times I regret not spending 4X the price to get a Nvidia card that would just work painlessly.

You CAN get models to accelerate. Some things will work out of the box, if they are older, and the binaries happens to accelerate them vaguely well. It's just you need to be prepared for the Linux experience of having to be a degree of developer to get it to work. it is Linux first, and this include the typical Linux thing of having a deep understanding of the underlying substrate to get it to work.

## ROCm FLAGS

ROCm does not and cannot handle memory properly, you need to test and add mitigations to get it to run twice in a row [2026-07-26 testing](/logs/2026-07-26b-dynamic-memory-flag.md)

ROCm is useless at Conv3D, which makes a big difference on the VAE Decode stages. An operation that is nearly instant under CUDA, will take time and crash the driver for OOM without proper flags

```--windows-standalone-build``` core flag to make ROCm work

```--disable-api-nodes``` remove the useless node that need cloud APIs to work

```--enable-dynamic-vram``` weird interaction with ROCm, on big models cause timeouts

```--enable-manager``` core flag to enable the manager. can omit it to load somewhat faster

```--use-pytorch-cross-attention``` ??? I think it's not needed as it's already inside

```--disable-smart-memory``` Important, ComfyUI crashes on repeated executions without it

# INSTALLATION

## INSTALLATION WSL

Before 2026, AMD didn't even have pytorch binaries for windows.

It was barely possible to run ComfyUI using WSL Linux emulation, it took months of effort to configure it.

Zluda had a fork to do a translation layer that lost half performance on top of ROCm and AMD performance losses.

It was incredibly brittle, with extreme limitations. I advise against using it.

## INSTALLATION PIP

In 2026-01-25 released the first binaries for pytorch. They are bad, lots of primitives still crash the drivers and are incredibly slow, lots of optimization and libraries aren't there, and never will be. But it's possible to build a pytorch environment that gets something running at some performance

This installation requires:
- setting up a UV Python
- installing the PIP ROCm packages
- the ComfyUI dependencies

[INSTRUCTIONS UV PIP](/README-PIP.md)

## INSTALLATION PORTABLE

At some point AMD took ComfyUI somewhat more seriously, and contributes to make a portable version.

This is fairly easy to run, download the zip, expand it, and run the scripts and it will start and diffuse.

You still need to do some work to install the manager, and add extensions to the scripts since the defaults will make the driver crash if you vaguely push it. ROCm is still brittle and incompetently made it needs care to run without crashing the driver or run multiple times.

[INSTRUCTIONS PORTABLE](/README-PIP.md)

# ComfyUI Improvements

## External Model Folder 

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

## ComfyUI manager

Have two scripts, one to launch ComfyUI without manager, one with.

The manager lets you install missing nodes and look for nodes conveniently

Follow the instruction in the appropriate readme to make the two scripts that will launch ComfyUI with the performance flags and manager

# Diffusion Components

Diffusion have two dimensions, first the model, then the type of workflow

## VAE

Think of VAE as image compression, it's an auto encoder.

The VAE encode will translate a RGB(A) image into a latent image.

The VAE decode will reverse translate a latent image into RGB(A).

VAE can be fine tuned to have different color palette, or resolve the latents with more or less sharpness and so on.

The diffusion model works on the latent image, some models may have separated diffusion and refiner stages.

## CLIP

Model that takes care of translating text into latent coordinates

## txt2img

This is the simplest workflow.

It works by having a CLIP translate a text into a latent coordinates.

After that, a ksampler will load the diffusion model, take an empty latent image, and diffuse using the coordinates as guidance 

The resulting latent image is reverse translated into RGB by the VAE decode stage

## img2txt

CLIP models can reverse translate image into a description of the image

Newer models just use LLMs like Qwen 3 VL


## img2img

It is possible to feed input images to diffusion and have them be modified, images can be fed at several points in the pipeline

### img2img - Input Latent

You feed an input image through a VAE Encode

The model starts from the existing latent image, and will diffuse through a new image. Denoise controls how much of the original image is preserved.

### img2img - Input Clip

Stronger models use LLM that support input images in the toikenizer stage.

You feed the image to the CLIP

### img2img - Control net

Some models support control nets, that allow to guide the diffusion according to a control net

- control net depth: feed a depth map of the image 
- control net pose: feed poses, the model will try to diffuse characters complying with the pose

---

# WORKFLOWS


## Test VAE Decode

VAE Decode stage is hideously bugged under ROCm Windows on the 7900XTX. This is a convenient workflow to test it and debug which flags can let you run it at all.

![](/workflow-png/ZTEST-VAE-DECODE.png)

## Background Removal

It's a small model native to ComfyUI now, doesn't need third party packages

![](/workflow-png/Remove-Background-IMG2IMG.png)


## Zimage

| MODEL | SIZE |
|-|-|
| [qwen_3_4b.safetensors](https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors) | |
| [Zimage Q4 GGUF](https://huggingface.co/jayn7/Z-Image-Turbo-GGUF/resolve/main/z_image_turbo-Q4_K_M.gguf) | |
| [ae.safetensors](https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors) | |


| MODEL | CLIP | VAE | First Load [s] | Second Repeat [s] | Third Change Prompt [s] |
|-|-|-|-|-|-|
| Q4 GGUF | Q4 GGUF | SAFETENSOR | 30s | 16s | 18s |
| INT8 CONVROT SAFETENSOR | INT8 CONVROT SAFETENSOR | SAFETENSOR | N.A. | N.A. | N.A. |

[Zimage](/README-Zimage.md)

## Qwen Edit 2511

Editing models are great at complying with editing instructions.

Qwen Edit 2511 Relies on an older Qwen 2.5 LLM as CLIP

| | BF16 Safetensor | INT8 SAFETENSOR | Q8 GGUF | Q4 GGUF |
|-|-|-|-|-|
| Diffusion Model | | | [Qwen Image Edit 2511](https://huggingface.co/unsloth/Qwen-Image-Edit-2511-GGUF/resolve/main/qwen-image-edit-2511-Q8_0.gguf) |  ||
| Turbo Lora | [4 Step Turbo Lora BF16](https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors) | |
| CLIP | | | [Qwen 2.5 VL 7B](https://huggingface.co/lmstudio-community/Qwen2.5-VL-7B-Instruct-GGUF/resolve/main/Qwen2.5-VL-7B-Instruct-Q8_0.gguf) | [Qwen 2.5 V -7B](https://huggingface.co/PatataAliena/Qwen2.5-VL-7B-Instruct-Q4_K_M-GGUF/resolve/main/qwen2.5-vl-7b-instruct-q4_k_m.gguf)|
| VAE | [Qwen Image VAE](https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors) | | |

[Qwen Edit](/README-QwenEdit.md)

## Krea 2



| | BF16 Safetensor | FP8 Saferensor | INT8 Safetensor | Q8 GGUF | Q2 GGUF |
| - | - | - | - | - | - |
| Model | . | [Krea Turbo FP8 12.8 GB](https://huggingface.co/Abiray/Krea-2-Turbo-FP8-NVFP4/resolve/main/krea2_turbo_fp8_scaled.safetensors?download=true) | . | . | [Krea 2 Turbo 4.55 GB](https://huggingface.co/vantagewithai/Krea-2-Turbo-GGUF/resolve/800cc2c83658fdb0fcb33577d546143dc42cb5bb/krea2_turbo-Q2_K.gguf?download=true) |
| [CLIP](https://huggingface.co/Comfy-Org/Qwen3-VL/tree/main/text_encoders) | . | [Qwen 3 VL 4B 5.1 GB](https://huggingface.co/Comfy-Org/Qwen3-VL/resolve/8bb77f7ad334bc594cd68c0c48e868abd1e0f719/text_encoders/qwen3vl_4b_fp8_scaled.safetensors) | . | . | . |
| VAE | [Qwen Image VAE 254 MB](https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/blob/main/split_files/vae/qwen_image_vae.safetensors) | . | . | . | . |

### [>>>Krea 2 Workflows<<<](/README-Krea2.md)


## Hunyuan 3D

[Hunyuan 3D](/README-Hunyuan3D.md)

## D&D NPC Card Node 

Sample

[D&D Workflows](/README-DnD-Workflows.md)

# EOL



<details>
<summary>Performance</summary>

```cmd
xxx
```

| | BF16 Safetensor | FP8 Saferensor | INT8 Safetensor | Q8 GGUF | Q4 GGUF |
| - | - | - | - | - | - |
| Model | . | . | . | . | . |
| CLIP | . | . | . | . | . |
| VAE | . | . | . | . | . |

</details>