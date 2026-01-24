# Installation

# Comfy UI Portable


https://github.com/Comfy-Org/ComfyUI/releases


I had to install the nodes by hand as the manager is not there

I had to modify the comfyui model folder as it's a subfolder

```cmd
F:\ComfyUI_windows_portable_amd>.\python_embeded\python.exe -s verify_rocm.py
Failed to load amdhip64.dll: amdhip64.dll: Can't open: The specified module could not be found.  (0x7E)
[WARNING] amdgpu-arch failed with return code 1
[stderr]
--- Torch Import ---
Success: torch imported successfully.

--- CUDA Availability ---
CUDA available: True

--- Device Name ---
Device name [0]: AMD Radeon RX 7900 XTX

--- Environment Info ---
PyTorch version: 2.9.0+rocmsdk20251116
Is debug build: False
CUDA used to build PyTorch: N/A
ROCM used to build PyTorch: 7.1.52802-561cc400e1

OS: Microsoft Windows 11 Pro (10.0.22631 64-bit)
GCC version: Could not collect
Clang version: 19.0.0git (git@github.amd.com:Compute-Mirrors/llvm-project 5353ca3e0e5ae54a31eeebe223da212fa405567a)
CMake version: version 4.2.1
Libc version: N/A

Python version: 3.12.10 (tags/v3.12.10:0cc8128, Apr  8 2025, 12:21:36) [MSC v.1943 64 bit (AMD64)] (64-bit runtime)
Python platform: Windows-11-10.0.22631-SP0
Is CUDA available: True
CUDA runtime version: Could not collect
CUDA_MODULE_LOADING set to:
GPU models and configuration: AMD Radeon RX 7900 XTX (gfx1100)
Nvidia driver version: Could not collect
cuDNN version: Could not collect
Is XPU available: False
HIP runtime version: 7.1.52802
MIOpen runtime version: 3.5.1
Is XNNPACK available: True

CPU:
Name: 13th Gen Intel(R) Core(TM) i7-13700F
Manufacturer: GenuineIntel
Family: 198
Architecture: 9
ProcessorType: 3
DeviceID: CPU0
CurrentClockSpeed: 2100
MaxClockSpeed: 2100
L2CacheSize: 24576
L2CacheSpeed: None
Revision: None

Versions of relevant libraries:
[pip3] numpy==2.3.5
[pip3] torch==2.9.0+rocmsdk20251116
[pip3] torchaudio==2.9.0+rocmsdk20251116
[pip3] torchsde==0.2.6
[pip3] torchvision==0.24.0+rocmsdk20251116
[conda] Could not collect
```

<details>
<summary>Install</summary>

```
F:\ComfyUI_windows_portable_amd>.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build
Adding extra search path checkpoints F:\ComfyUI-Models\checkpoints
Adding extra search path clip F:\ComfyUI-Models\clip
Adding extra search path clip_vision F:\ComfyUI-Models\clip_vision
Adding extra search path text_encoders F:\ComfyUI-Models\text_encoders
Adding extra search path configs F:\ComfyUI-Models\configs
Adding extra search path controlnet F:\ComfyUI-Models\controlnet
Adding extra search path diffusion_models F:\ComfyUI-Models\diffusion_models
Adding extra search path diffusion_models F:\ComfyUI-Models\unet
Adding extra search path embeddings F:\ComfyUI-Models\embeddings
Adding extra search path loras F:\ComfyUI-Models\loras
Adding extra search path upscale_models F:\ComfyUI-Models\upscale_models
Adding extra search path vae F:\ComfyUI-Models\vae
Adding extra search path vibevoice F:\ComfyUI-Models\vibevoice
Adding extra search path Janus-Pro F:\ComfyUI-Models\Janus-Pro
[START] Security scan
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-24 11:07:02.382
** Platform: Windows
** Python version: 3.12.10 (tags/v3.12.10:0cc8128, Apr  8 2025, 12:21:36) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI_windows_portable_amd\python_embeded\python.exe
** ComfyUI Path: F:\ComfyUI_windows_portable_amd\ComfyUI
** ComfyUI Base Folder Path: F:\ComfyUI_windows_portable_amd\ComfyUI
** User directory: F:\ComfyUI_windows_portable_amd\ComfyUI\user
** ComfyUI-Manager config path: F:\ComfyUI_windows_portable_amd\ComfyUI\user\__manager\config.ini
** Log path: F:\ComfyUI_windows_portable_amd\ComfyUI\user\comfyui.log

Prestartup times for custom nodes:
   1.2 seconds: F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\ComfyUI-Manager

Failed to load amdhip64.dll: amdhip64.dll: Can't open: The specified module could not be found.  (0x7E)
[WARNING] amdgpu-arch failed with return code 1
[stderr]
Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
Found comfy_kitchen backend cuda: {'available': True, 'disabled': True, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8']}
Found comfy_kitchen backend triton: {'available': False, 'disabled': True, 'unavailable_reason': "ImportError: No module named 'triton'", 'capabilities': []}
Found comfy_kitchen backend eager: {'available': True, 'disabled': False, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8', 'scaled_mm_nvfp4']}
Using pytorch attention
Python version: 3.12.10 (tags/v3.12.10:0cc8128, Apr  8 2025, 12:21:36) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.10.0
ComfyUI frontend version: 1.36.14
[Prompt Server] web root: F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfyui_frontend_package\static
Failed to find comfy root automatically, please copy the folder F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
ComfyUI-GGUF: Allowing full torch compile
### Loading: ComfyUI-Manager (V3.39.2)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 150 [9d273d3a] *DETACHED | Released on '2026-01-19'
Skip F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\comfyui-minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\websocket_image_save.py
   0.0 seconds: F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\ComfyLiterals
   0.0 seconds (IMPORT FAILED): F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\comfyui-minimal-workflow-image
   0.0 seconds: F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\ComfyUI-GGUF
   0.2 seconds: F:\ComfyUI_windows_portable_amd\ComfyUI\custom_nodes\ComfyUI-Manager

Context impl SQLiteImpl.
Will assume non-transactional DDL.
Assets scan(roots=['models']) completed in 0.016s (created=0, skipped_existing=48, total_seen=48)
Starting server

To see the GUI go to: http://127.0.0.1:8188
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 5/121
FETCH ComfyRegistry Data: 10/121
FETCH ComfyRegistry Data: 15/121
FETCH ComfyRegistry Data: 20/121
FETCH ComfyRegistry Data: 25/121
FETCH ComfyRegistry Data: 30/121
FETCH ComfyRegistry Data: 35/121
FETCH ComfyRegistry Data: 40/121
FETCH ComfyRegistry Data: 45/121
FETCH ComfyRegistry Data: 50/121
FETCH ComfyRegistry Data: 55/121
FETCH ComfyRegistry Data: 60/121
FETCH ComfyRegistry Data: 65/121
FETCH ComfyRegistry Data: 70/121
FETCH ComfyRegistry Data: 75/121
FETCH ComfyRegistry Data: 80/121
FETCH ComfyRegistry Data: 85/121
FETCH ComfyRegistry Data: 90/121
FETCH ComfyRegistry Data: 95/121
FETCH ComfyRegistry Data: 100/121
FETCH ComfyRegistry Data: 105/121
FETCH ComfyRegistry Data: 110/121
FETCH ComfyRegistry Data: 115/121
FETCH ComfyRegistry Data: 120/121
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
got prompt
Failed to validate prompt for output 105:
* UnetLoaderGGUF 114:
  - Value not in list: unet_name: 'None' not in ['qwen-image-edit-2511-Q4_K_M.gguf', 'qwen-image-edit-2511-Q8_0.gguf', 'z_image_turbo-Q4_K_M.gguf', 'z_image_turbo-Q8_0.gguf']
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
```

</details>


```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 4424.19 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18061.50 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:10<00:00,  1.12s/it]
Requested to load AutoencodingEngine
Unloaded partially: 120.28 MB freed, 4303.91 MB remains loaded, 18.59 MB buffer reserved, lowvram patches: 0
loaded completely; 5114.58 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 29.19 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.10s/it]
Prompt executed in 10.51 seconds
got prompt
got prompt
  0%|                                                                                            | 0/9 [00:00<?, ?it/s]got prompt
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.27 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.28 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.09s/it]
Prompt executed in 10.36 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.28 seconds
```

Run the bat without memory fix

Qwen edit is bad

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20327.38 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22265.19 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21489.69 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [06:11<00:00, 92.85s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 319
loaded completely; 2290.31 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 444.04 seconds
got prompt
Requested to load QwenImageTEModel_
loaded partially; 3971.11 MB usable, 715.01 MB loaded, 8231.73 MB offloaded, 3256.09 MB buffer reserved, lowvram patches: 0
loaded completely; 20996.38 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [06:17<00:00, 94.46s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 638
loaded completely; 2280.58 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 403.91 seconds
```

## disable smart memory script

```cmd
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory
```

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20711.28 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22769.05 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21584.01 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [06:22<00:00, 95.58s/it]
Requested to load WanVAE
loaded completely; 18868.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 452.30 seconds
got prompt
Requested to load QwenImage
loaded completely; 21499.76 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████| 4/4 [07:37<00:00, 114.47s/it]
Requested to load WanVAE
loaded completely; 18868.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 470.84 seconds
```


# ComfyUI from PIP

[REPO](https://repo.radeon.com/rocm/windows/rocm-rel-7.2/)

https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/compatibility/compatibilityrad/windows/windows_compatibility.html



script



```install-comfyui-rocm72-p313.bat```



```bat
git init
git remote add origin https://github.com/comfyanonymous/ComfyUI.git
git fetch
git checkout -t origin/master

uv venv .venv --python 3.13

call .venv\Scripts\activate.bat

uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl   https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz --link-mode=copy

pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torch-2.9.1%2Brocmsdk20260116-cp312-cp312-win_amd64.whl https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchaudio-2.9.1%2Brocmsdk20260116-cp312-cp312-win_amd64.whl https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchvision-0.24.1%2Brocmsdk20260116-cp312-cp312-win_amd64.whl

uv pip install -r requirements.txt --link-mode=copy

cd custom_nodes

:: Not going anywhere without the node manager, no idea why it's not a core component
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git

:: Useful type nodes
git clone https://github.com/M1kep/ComfyLiterals

:: Useful save as png
git clone https://github.com/fuselayer/comfyui-minimal-workflow-image

:: GGUF nodes
git clone https://github.com/city96/ComfyUI-GGUF.git

cd ..

uv run main.py

```


<details>
<summary>INSTALL ROCM72 P312 (fail)</summary>

```cmd
Microsoft Windows [Version 10.0.22631.4602]
(c) Microsoft Corporation. All rights reserved.

F:\comfyui-rocm72-p312-2026-01-24>i
'i' is not recognized as an internal or external command,
operable program or batch file.

F:\comfyui-rocm72-p312-2026-01-24>install-comfyui-rocm72-p312.bat

F:\comfyui-rocm72-p312-2026-01-24>git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:   git branch -m <name>
hint:
hint: Disable this message with "git config set advice.defaultBranchName false"
Initialized empty Git repository in F:/comfyui-rocm72-p312-2026-01-24/.git/

F:\comfyui-rocm72-p312-2026-01-24>git remote add origin https://github.com/comfyanonymous/ComfyUI.git

F:\comfyui-rocm72-p312-2026-01-24>git fetch
remote: Enumerating objects: 30152, done.
remote: Counting objects: 100% (77/77), done.
remote: Compressing objects: 100% (56/56), done.
remote: Total 30152 (delta 45), reused 27 (delta 21), pack-reused 30075 (from 3)
Receiving objects: 100% (30152/30152), 76.36 MiB | 10.39 MiB/s, done.
Resolving deltas: 100% (20443/20443), done.
From https://github.com/comfyanonymous/ComfyUI
 * [new branch]        annoate_get_input_info  -> origin/annoate_get_input_info
 * [new branch]        asset-management        -> origin/asset-management
 * [new branch]        assets-api-tests-cbyrne -> origin/assets-api-tests-cbyrne
 * [new branch]        assets-redo-part2       -> origin/assets-redo-part2
 * [new branch]        autogrow-validation-fixes -> origin/autogrow-validation-fixes
 * [new branch]        base-path-env-var       -> origin/base-path-env-var
 * [new branch]        cache-index-json-locales -> origin/cache-index-json-locales
 * [new branch]        cb/video-slice-node     -> origin/cb/video-slice-node
 * [new branch]        chore/update-frontend-1.29.3 -> origin/chore/update-frontend-1.29.3
 * [new branch]        christian-byrne-patch-1 -> origin/christian-byrne-patch-1
 * [new branch]        christian-byrne-patch-2 -> origin/christian-byrne-patch-2
 * [new branch]        combo-output-fix        -> origin/combo-output-fix
 * [new branch]        dd                      -> origin/dd
 * [new branch]        deprecation-warning-adjust -> origin/deprecation-warning-adjust
 * [new branch]        desktop-release-apr222025 -> origin/desktop-release-apr222025
 * [new branch]        desktop-release-apr242025 -> origin/desktop-release-apr242025
 * [new branch]        desktop-release-may062025 -> origin/desktop-release-may062025
 * [new branch]        desktop-release-may292025 -> origin/desktop-release-may292025
 * [new branch]        feat/advanced-input-parameter -> origin/feat/advanced-input-parameter
 * [new branch]        feat/api-nodes/hunyuan3d -> origin/feat/api-nodes/hunyuan3d
 * [new branch]        feat/api-nodes/magnific -> origin/feat/api-nodes/magnific
 * [new branch]        feat/api-nodes/recraft-style -> origin/feat/api-nodes/recraft-style
 * [new branch]        feat/cache-provider-api -> origin/feat/cache-provider-api
 * [new branch]        feat/savevideo-dynamic-codec-options -> origin/feat/savevideo-dynamic-codec-options
 * [new branch]        fix-context-window-slicing -> origin/fix-context-window-slicing
 * [new branch]        flipflop-stream         -> origin/flipflop-stream
 * [new branch]        hack-hunter             -> origin/hack-hunter
 * [new branch]        huchenlei-patch-1       -> origin/huchenlei-patch-1
 * [new branch]        jk/node-replace-api     -> origin/jk/node-replace-api
 * [new branch]        jk/remove-unused-code   -> origin/jk/remove-unused-code
 * [new branch]        js/drafts/async_nodes   -> origin/js/drafts/async_nodes
 * [new branch]        js/drafts/async_nodes_v2 -> origin/js/drafts/async_nodes_v2
 * [new branch]        js/progress-crossover-fix -> origin/js/progress-crossover-fix
 * [new branch]        lora-node-refactor      -> origin/lora-node-refactor
 * [new branch]        master                  -> origin/master
 * [new branch]        model-paths-helper      -> origin/model-paths-helper
 * [new branch]        model_management        -> origin/model_management
 * [new branch]        model_manager           -> origin/model_manager
 * [new branch]        node-memory-reserve     -> origin/node-memory-reserve
 * [new branch]        openapi-spec            -> origin/openapi-spec
 * [new branch]        portable-manager-update -> origin/portable-manager-update
 * [new branch]        pysssss-model-db        -> origin/pysssss-model-db
 * [new branch]        pysssss/basic-glsl-shader-node -> origin/pysssss/basic-glsl-shader-node
 * [new branch]        pysssss/combo-hidden-index-output -> origin/pysssss/combo-hidden-index-output
 * [new branch]        rattus/prs/dynamic-vram -> origin/rattus/prs/dynamic-vram
 * [new branch]        release/v0.3.77         -> origin/release/v0.3.77
 * [new branch]        required_frontend_ver   -> origin/required_frontend_ver
 * [new branch]        revert-12013-resize-node-adjustments -> origin/revert-12013-resize-node-adjustments
 * [new branch]        rh-uvtest               -> origin/rh-uvtest
 * [new branch]        ric-yu/subgraph-blueprints -> origin/ric-yu/subgraph-blueprints
 * [new branch]        ric-yu/ui-output-types  -> origin/ric-yu/ui-output-types
 * [new branch]        search-aliases-audio-video -> origin/search-aliases-audio-video
 * [new branch]        search-aliases-model-misc -> origin/search-aliases-model-misc
 * [new branch]        si/sync-test            -> origin/si/sync-test
 * [new branch]        sortblock               -> origin/sortblock
 * [new branch]        template-static-iter    -> origin/template-static-iter
 * [new branch]        update-templates-3      -> origin/update-templates-3
 * [new branch]        v3-match-type           -> origin/v3-match-type
 * [new branch]        v3-nodes                -> origin/v3-nodes
 * [new branch]        v3-process-isolation    -> origin/v3-process-isolation
 * [new branch]        venv-management         -> origin/venv-management
 * [new branch]        video_output            -> origin/video_output
 * [new branch]        weight-zipper           -> origin/weight-zipper
 * [new branch]        worksplit-multigpu      -> origin/worksplit-multigpu
 * [new branch]        worksplit-multigpu-loaders -> origin/worksplit-multigpu-loaders
 * [new branch]        yo-add-precommit        -> origin/yo-add-precommit
 * [new branch]        yo-lora-trainer         -> origin/yo-lora-trainer
 * [new branch]        yoland68-more-owner-updates -> origin/yoland68-more-owner-updates
 * [new branch]        yoland68-patch-1        -> origin/yoland68-patch-1
 * [new branch]        yoland68-patch-2        -> origin/yoland68-patch-2
 * [new branch]        yoland68-patch-3        -> origin/yoland68-patch-3
 * [new branch]        yoland68-patch-4        -> origin/yoland68-patch-4
 * [new branch]        yoland68-patch-5        -> origin/yoland68-patch-5
 * [new tag]           v0.3.77                 -> v0.3.77
 * [new tag]           latest                  -> latest
 * [new tag]           v0.0.1                  -> v0.0.1
 * [new tag]           v0.0.2                  -> v0.0.2
 * [new tag]           v0.0.4                  -> v0.0.4
 * [new tag]           v0.0.5                  -> v0.0.5
 * [new tag]           v0.0.6                  -> v0.0.6
 * [new tag]           v0.0.7                  -> v0.0.7
 * [new tag]           v0.0.8                  -> v0.0.8
 * [new tag]           v0.1.0                  -> v0.1.0
 * [new tag]           v0.1.1                  -> v0.1.1
 * [new tag]           v0.1.2                  -> v0.1.2
 * [new tag]           v0.1.3                  -> v0.1.3
 * [new tag]           v0.10.0                 -> v0.10.0
 * [new tag]           v0.2.0                  -> v0.2.0
 * [new tag]           v0.2.1                  -> v0.2.1
 * [new tag]           v0.2.2                  -> v0.2.2
 * [new tag]           v0.2.3                  -> v0.2.3
 * [new tag]           v0.2.4                  -> v0.2.4
 * [new tag]           v0.2.5                  -> v0.2.5
 * [new tag]           v0.2.6                  -> v0.2.6
 * [new tag]           v0.2.7                  -> v0.2.7
 * [new tag]           v0.3.0                  -> v0.3.0
 * [new tag]           v0.3.1                  -> v0.3.1
 * [new tag]           v0.3.10                 -> v0.3.10
 * [new tag]           v0.3.11                 -> v0.3.11
 * [new tag]           v0.3.12                 -> v0.3.12
 * [new tag]           v0.3.13                 -> v0.3.13
 * [new tag]           v0.3.14                 -> v0.3.14
 * [new tag]           v0.3.15                 -> v0.3.15
 * [new tag]           v0.3.16                 -> v0.3.16
 * [new tag]           v0.3.17                 -> v0.3.17
 * [new tag]           v0.3.18                 -> v0.3.18
 * [new tag]           v0.3.19                 -> v0.3.19
 * [new tag]           v0.3.2                  -> v0.3.2
 * [new tag]           v0.3.20                 -> v0.3.20
 * [new tag]           v0.3.21                 -> v0.3.21
 * [new tag]           v0.3.22                 -> v0.3.22
 * [new tag]           v0.3.23                 -> v0.3.23
 * [new tag]           v0.3.24                 -> v0.3.24
 * [new tag]           v0.3.25                 -> v0.3.25
 * [new tag]           v0.3.26                 -> v0.3.26
 * [new tag]           v0.3.27                 -> v0.3.27
 * [new tag]           v0.3.28                 -> v0.3.28
 * [new tag]           v0.3.29                 -> v0.3.29
 * [new tag]           v0.3.3                  -> v0.3.3
 * [new tag]           v0.3.30                 -> v0.3.30
 * [new tag]           v0.3.31                 -> v0.3.31
 * [new tag]           v0.3.32                 -> v0.3.32
 * [new tag]           v0.3.33                 -> v0.3.33
 * [new tag]           v0.3.34                 -> v0.3.34
 * [new tag]           v0.3.35                 -> v0.3.35
 * [new tag]           v0.3.36                 -> v0.3.36
 * [new tag]           v0.3.37                 -> v0.3.37
 * [new tag]           v0.3.38                 -> v0.3.38
 * [new tag]           v0.3.39                 -> v0.3.39
 * [new tag]           v0.3.4                  -> v0.3.4
 * [new tag]           v0.3.40                 -> v0.3.40
 * [new tag]           v0.3.41                 -> v0.3.41
 * [new tag]           v0.3.42                 -> v0.3.42
 * [new tag]           v0.3.43                 -> v0.3.43
 * [new tag]           v0.3.44                 -> v0.3.44
 * [new tag]           v0.3.45                 -> v0.3.45
 * [new tag]           v0.3.46                 -> v0.3.46
 * [new tag]           v0.3.47                 -> v0.3.47
 * [new tag]           v0.3.48                 -> v0.3.48
 * [new tag]           v0.3.49                 -> v0.3.49
 * [new tag]           v0.3.5                  -> v0.3.5
 * [new tag]           v0.3.50                 -> v0.3.50
 * [new tag]           v0.3.51                 -> v0.3.51
 * [new tag]           v0.3.52                 -> v0.3.52
 * [new tag]           v0.3.53                 -> v0.3.53
 * [new tag]           v0.3.54                 -> v0.3.54
 * [new tag]           v0.3.55                 -> v0.3.55
 * [new tag]           v0.3.56                 -> v0.3.56
 * [new tag]           v0.3.57                 -> v0.3.57
 * [new tag]           v0.3.58                 -> v0.3.58
 * [new tag]           v0.3.59                 -> v0.3.59
 * [new tag]           v0.3.6                  -> v0.3.6
 * [new tag]           v0.3.60                 -> v0.3.60
 * [new tag]           v0.3.61                 -> v0.3.61
 * [new tag]           v0.3.62                 -> v0.3.62
 * [new tag]           v0.3.63                 -> v0.3.63
 * [new tag]           v0.3.64                 -> v0.3.64
 * [new tag]           v0.3.65                 -> v0.3.65
 * [new tag]           v0.3.66                 -> v0.3.66
 * [new tag]           v0.3.67                 -> v0.3.67
 * [new tag]           v0.3.68                 -> v0.3.68
 * [new tag]           v0.3.69                 -> v0.3.69
 * [new tag]           v0.3.7                  -> v0.3.7
 * [new tag]           v0.3.70                 -> v0.3.70
 * [new tag]           v0.3.71                 -> v0.3.71
 * [new tag]           v0.3.72                 -> v0.3.72
 * [new tag]           v0.3.73                 -> v0.3.73
 * [new tag]           v0.3.74                 -> v0.3.74
 * [new tag]           v0.3.75                 -> v0.3.75
 * [new tag]           v0.3.76                 -> v0.3.76
 * [new tag]           v0.3.8                  -> v0.3.8
 * [new tag]           v0.3.9                  -> v0.3.9
 * [new tag]           v0.4.0                  -> v0.4.0
 * [new tag]           v0.5.0                  -> v0.5.0
 * [new tag]           v0.5.1                  -> v0.5.1
 * [new tag]           v0.6.0                  -> v0.6.0
 * [new tag]           v0.7.0                  -> v0.7.0
 * [new tag]           v0.8.0                  -> v0.8.0
 * [new tag]           v0.8.1                  -> v0.8.1
 * [new tag]           v0.8.2                  -> v0.8.2
 * [new tag]           v0.9.0                  -> v0.9.0
 * [new tag]           v0.9.1                  -> v0.9.1
 * [new tag]           v0.9.2                  -> v0.9.2

F:\comfyui-rocm72-p312-2026-01-24>git checkout -t origin/master
branch 'master' set up to track 'origin/master'.
Already on 'master'

F:\comfyui-rocm72-p312-2026-01-24>uv venv .venv --python 3.12
Using CPython 3.12.10
Creating virtual environment at: .venv
Activate with: .venv\Scripts\activate

F:\comfyui-rocm72-p312-2026-01-24>call .venv\Scripts\activate.bat

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
Resolved 1 package in 272ms
Prepared 1 package in 59.47s
Installed 1 package in 444ms
 + rocm-sdk-core==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl  --link-mode=copy
Resolved 1 package in 197ms
Prepared 1 package in 2m 18s
Installed 1 package in 1.29s
 + rocm-sdk-devel==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
Resolved 1 package in 569ms
Prepared 1 package in 49.17s
Installed 1 package in 643ms
 + rocm-sdk-libraries-custom==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz --link-mode=copy
Resolved 2 packages in 231ms
      Built rocm @ https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz
Prepared 1 package in 1.38s
Installed 1 package in 5ms
 + rocm==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torch-2.9.1Brocmsdk20260116-cp312-cp312-win_amd64.whl --link-mode=copy
error: The wheel filename "torch-2.9.1Brocmsdk20260116-cp312-cp312-win_amd64.whl" has an invalid version: after parsing `2.9.1Br`, found `ocmsdk20260116`, which is not part of a valid version

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchaudio-2.9.1Brocmsdk20260116-cp312-cp312-win_amd64.whl --link-mode=copy
error: The wheel filename "torchaudio-2.9.1Brocmsdk20260116-cp312-cp312-win_amd64.whl" has an invalid version: after parsing `2.9.1Br`, found `ocmsdk20260116`, which is not part of a valid version

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchvision-0.24.1Brocmsdk20260116-cp312-cp312-win_amd64.whl --link-mode=copy
error: The wheel filename "torchvision-0.24.1Brocmsdk20260116-cp312-cp312-win_amd64.whl" has an invalid version: after parsing `0.24.1Br`, found `ocmsdk20260116`, which is not part of a valid version

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install -r requirements.txt --link-mode=copy
Resolved 65 packages in 109ms
Prepared 10 packages in 19.74s
Installed 65 packages in 2.74s
 + aiohappyeyeballs==2.6.1
 + aiohttp==3.13.3
 + aiosignal==1.4.0
 + alembic==1.18.1
 + annotated-types==0.7.0
 + attrs==25.4.0
 + av==16.1.0
 + certifi==2026.1.4
 + charset-normalizer==3.4.4
 + colorama==0.4.6
 + comfy-kitchen==0.2.7
 + comfyui-embedded-docs==0.4.0
 + comfyui-frontend-package==1.37.11
 + comfyui-workflow-templates==0.8.15
 + comfyui-workflow-templates-core==0.3.101
 + comfyui-workflow-templates-media-api==0.3.45
 + comfyui-workflow-templates-media-image==0.3.67
 + comfyui-workflow-templates-media-other==0.3.88
 + comfyui-workflow-templates-media-video==0.3.39
 + einops==0.8.1
 + filelock==3.20.3
 + frozenlist==1.8.0
 + fsspec==2026.1.0
 + greenlet==3.3.1
 + huggingface-hub==0.36.0
 + idna==3.11
 + jinja2==3.1.6
 + kornia==0.8.2
 + kornia-rs==0.1.10
 + mako==1.3.10
 + markupsafe==3.0.3
 + mpmath==1.3.0
 + multidict==6.7.0
 + networkx==3.6.1
 + numpy==2.4.1
 + packaging==26.0
 + pillow==12.1.0
 + propcache==0.4.1
 + psutil==7.2.1
 + pydantic==2.12.5
 + pydantic-core==2.41.5
 + pydantic-settings==2.12.0
 + python-dotenv==1.2.1
 + pyyaml==6.0.3
 + regex==2026.1.15
 + requests==2.32.5
 + safetensors==0.7.0
 + scipy==1.17.0
 + sentencepiece==0.2.1
 + setuptools==80.10.1
 + spandrel==0.4.1
 + sqlalchemy==2.0.46
 + sympy==1.14.0
 + tokenizers==0.22.2
 + torch==2.10.0
 + torchaudio==2.10.0
 + torchsde==0.2.6
 + torchvision==0.25.0
 + tqdm==4.67.1
 + trampoline==0.1.2
 + transformers==4.57.6
 + typing-extensions==4.15.0
 + typing-inspection==0.4.2
 + urllib3==2.6.3
 + yarl==1.22.0

(.venv) F:\comfyui-rocm72-p312-2026-01-24>cd custom_nodes

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
Cloning into 'ComfyUI-Manager'...
remote: Enumerating objects: 28091, done.
remote: Counting objects: 100% (666/666), done.
remote: Compressing objects: 100% (320/320), done.
remote: Total 28091 (delta 529), reused 357 (delta 346), pack-reused 27425 (from 4)
Receiving objects: 100% (28091/28091), 129.46 MiB | 10.28 MiB/s, done.
Resolving deltas: 100% (20819/20819), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/M1kep/ComfyLiterals
Cloning into 'ComfyLiterals'...
remote: Enumerating objects: 40, done.
remote: Counting objects: 100% (40/40), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 40 (delta 18), reused 27 (delta 9), pack-reused 0 (from 0)
Receiving objects: 100% (40/40), 12.54 KiB | 856.00 KiB/s, done.
Resolving deltas: 100% (18/18), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/fuselayer/comfyui-minimal-workflow-image
Cloning into 'comfyui-minimal-workflow-image'...
remote: Enumerating objects: 45, done.
remote: Counting objects: 100% (45/45), done.
remote: Compressing objects: 100% (43/43), done.
remote: Total 45 (delta 19), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (45/45), 446.81 KiB | 2.83 MiB/s, done.
Resolving deltas: 100% (19/19), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/city96/ComfyUI-GGUF.git
Cloning into 'ComfyUI-GGUF'...
remote: Enumerating objects: 814, done.
remote: Counting objects: 100% (508/508), done.
remote: Compressing objects: 100% (196/196), done.
remote: Total 814 (delta 458), reused 312 (delta 312), pack-reused 306 (from 2)
Receiving objects: 100% (814/814), 189.66 KiB | 2.71 MiB/s, done.
Resolving deltas: 100% (543/543), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>cd ..

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv run main.py
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using standalone `uv` for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies. (GitPython)
Resolved 59 packages in 103ms
░░░░░░░░░░░░░░░░░░░░ [0/33] Installing wheels...
warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 33 packages in 123ms
 + aiofiles==24.1.0
 + aiohttp-socks==0.11.0
 + cffi==2.0.0
 + chardet==5.2.0
 + click==8.3.1
 + cryptography==46.0.3
 + gitdb==4.0.12
 + gitpython==3.1.46
 + h11==0.16.0
 + h2==4.3.0
 + hpack==4.1.0
 + hyperframe==6.1.0
 + jsonschema==4.26.0
 + jsonschema-specifications==2025.9.1
 + markdown-it-py==4.0.0
 + matrix-nio==0.25.2
 + mdurl==0.1.2
 + pycparser==3.0
 + pycryptodome==3.23.0
 + pygithub==2.8.1
 + pygments==2.19.2
 + pyjwt==2.10.1
 + pynacl==1.6.2
 + python-socks==2.8.0
 + referencing==0.37.0
 + rich==14.2.0
 + rpds-py==0.30.0
 + shellingham==1.5.4
 + smmap==5.0.2
 + toml==0.10.2
 + typer==0.21.1
 + unpaddedbase64==2.1.0
 + uv==0.9.26
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-24 12:26:04.418
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\comfyui-rocm72-p312-2026-01-24\.venv\Scripts\python.exe
** ComfyUI Path: F:\comfyui-rocm72-p312-2026-01-24
** ComfyUI Base Folder Path: F:\comfyui-rocm72-p312-2026-01-24
** User directory: F:\comfyui-rocm72-p312-2026-01-24\user
** ComfyUI-Manager config path: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\config.ini
** Log path: F:\comfyui-rocm72-p312-2026-01-24\user\comfyui.log

Prestartup times for custom nodes:
   0.7 seconds: F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-Manager

Checkpoint files will always be loaded safely.
Traceback (most recent call last):
  File "F:\comfyui-rocm72-p312-2026-01-24\main.py", line 178, in <module>
    import execution
  File "F:\comfyui-rocm72-p312-2026-01-24\execution.py", line 15, in <module>
    import comfy.model_management
  File "F:\comfyui-rocm72-p312-2026-01-24\comfy\model_management.py", line 238, in <module>
    total_vram = get_total_memory(get_torch_device()) / (1024 * 1024)
                                  ^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-p312-2026-01-24\comfy\model_management.py", line 188, in get_torch_device
    return torch.device(torch.cuda.current_device())
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\torch\cuda\__init__.py", line 1094, in current_device
    _lazy_init()
  File "F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\torch\cuda\__init__.py", line 417, in _lazy_init
    raise AssertionError("Torch not compiled with CUDA enabled")
AssertionError: Torch not compiled with CUDA enabled

(.venv) F:\comfyui-rocm72-p312-2026-01-24>install-comfyui-rocm72-p312.bat

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python verify_rocm.bat
  File "F:\comfyui-rocm72-p312-2026-01-24\verify_rocm.bat", line 1
    call .venv\Scripts\activate.bat
               ^
SyntaxError: unexpected character after line continuation character

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python verify_rocm.py
--- Torch Import ---
Success: torch imported successfully.

--- CUDA Availability ---
CUDA available: False

--- Device Name ---
No CUDA device found.

--- Environment Info ---
PyTorch version: 2.10.0+cpu
Is debug build: False
CUDA used to build PyTorch: None
ROCM used to build PyTorch: N/A

OS: Microsoft Windows 11 Pro (10.0.22631 64-bit)
GCC version: Could not collect
Clang version: 19.0.0git (git@github.amd.com:Compute-Mirrors/llvm-project 5353ca3e0e5ae54a31eeebe223da212fa405567a)
CMake version: version 4.2.1
Libc version: N/A

Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)] (64-bit runtime)
Python platform: Windows-11-10.0.22631-SP0
Is CUDA available: False
CUDA runtime version: No CUDA
CUDA_MODULE_LOADING set to: N/A
GPU models and configuration: No CUDA
Nvidia driver version: No CUDA
cuDNN version: No CUDA
Is XPU available: False
HIP runtime version: N/A
MIOpen runtime version: N/A
Is XNNPACK available: True
Caching allocator config: N/A

CPU:
Name: 13th Gen Intel(R) Core(TM) i7-13700F
Manufacturer: GenuineIntel
Family: 198
Architecture: 9
ProcessorType: 3
DeviceID: CPU0
CurrentClockSpeed: 2100
MaxClockSpeed: 2100
L2CacheSize: 24576
L2CacheSpeed: None
Revision: None

Versions of relevant libraries:
[pip3] Could not collect
[conda] Could not collect

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -c "import torch" 2>nul && echo Success || echo Failure
Success

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -c "import torch; print(torch.cuda.is_available())"
False

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\torch\cuda\__init__.py", line 599, in get_device_name
    return get_device_properties(device).name
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\torch\cuda\__init__.py", line 632, in get_device_properties
    _lazy_init()  # will define _get_device_properties
    ^^^^^^^^^^^^
  File "F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\torch\cuda\__init__.py", line 417, in _lazy_init
    raise AssertionError("Torch not compiled with CUDA enabled")
AssertionError: Torch not compiled with CUDA enabled

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m torch.utils.collect_env
<frozen runpy>:128: RuntimeWarning: 'torch.utils.collect_env' found in sys.modules after import of package 'torch.utils', but prior to execution of 'torch.utils.collect_env'; this may result in unpredictable behaviour
Collecting environment information...
PyTorch version: 2.10.0+cpu
Is debug build: False
CUDA used to build PyTorch: None
ROCM used to build PyTorch: N/A

OS: Microsoft Windows 11 Pro (10.0.22631 64-bit)
GCC version: Could not collect
Clang version: 19.0.0git (git@github.amd.com:Compute-Mirrors/llvm-project 5353ca3e0e5ae54a31eeebe223da212fa405567a)
CMake version: version 4.2.1
Libc version: N/A

Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)] (64-bit runtime)
Python platform: Windows-11-10.0.22631-SP0
Is CUDA available: False
CUDA runtime version: No CUDA
CUDA_MODULE_LOADING set to: N/A
GPU models and configuration: No CUDA
Nvidia driver version: No CUDA
cuDNN version: No CUDA
Is XPU available: False
HIP runtime version: N/A
MIOpen runtime version: N/A
Is XNNPACK available: True
Caching allocator config: N/A

CPU:
Name: 13th Gen Intel(R) Core(TM) i7-13700F
Manufacturer: GenuineIntel
Family: 198
Architecture: 9
ProcessorType: 3
DeviceID: CPU0
CurrentClockSpeed: 2100
MaxClockSpeed: 2100
L2CacheSize: 24576
L2CacheSpeed: None
Revision: None

Versions of relevant libraries:
[pip3] Could not collect
```

</details>





UV was installing P3.13

<details>
<summary>INSTALL P3.12</summary>

```cmd
Microsoft Windows [Version 10.0.22631.4602]
(c) Microsoft Corporation. All rights reserved.

F:\comfyui-rocm72-p312-2026-01-24>install-comfyui-rocm72-p312.bat

F:\comfyui-rocm72-p312-2026-01-24>git init
Reinitialized existing Git repository in F:/comfyui-rocm72-p312-2026-01-24/.git/

F:\comfyui-rocm72-p312-2026-01-24>git remote add origin https://github.com/comfyanonymous/ComfyUI.git
error: remote origin already exists.

F:\comfyui-rocm72-p312-2026-01-24>git fetch

F:\comfyui-rocm72-p312-2026-01-24>git checkout -t origin/master
fatal: a branch named 'master' already exists

F:\comfyui-rocm72-p312-2026-01-24>uv venv .venv --python 3.12
Using CPython 3.12.10
Creating virtual environment at: .venv
Activate with: .venv\Scripts\activate

F:\comfyui-rocm72-p312-2026-01-24>call .venv\Scripts\activate.bat

(.venv) F:\comfyui-rocm72-p312-2026-01-24>echo === Verifying local Python ===
=== Verifying local Python ===

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python --version   | findstr "3.12"  1>nul

(.venv) F:\comfyui-rocm72-p312-2026-01-24>if 0 NEQ 0 (
echo ERROR: Python 3.12 not found. UV is incompetently designed, and will install the wrong python if it doesn't find the right one, so install the right python.exe on system then relaunch.
 exit /b 1
)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
Resolved 1 package in 295ms
Prepared 1 package in 1m 00s
Installed 1 package in 447ms
 + rocm-sdk-core==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
Resolved 1 package in 224ms
Prepared 1 package in 2m 17s
Installed 1 package in 1.39s
 + rocm-sdk-devel==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
Resolved 1 package in 319ms
Prepared 1 package in 47.25s
Installed 1 package in 691ms
 + rocm-sdk-libraries-custom==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz --link-mode=copy
Resolved 2 packages in 218ms
      Built rocm @ https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz
Prepared 1 package in 1.24s
Installed 1 package in 5ms
 + rocm==7.2.0.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz)

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m ensurepip
Looking in links: c:\Users\FATHER~1\AppData\Local\Temp\tmp9qw8dn5m
Processing c:\users\father~1\appdata\local\temp\tmp9qw8dn5m\pip-25.0.1-py3-none-any.whl
Installing collected packages: pip
Successfully installed pip-25.0.1

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m pip install --upgrade pip
Requirement already satisfied: pip in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (25.0.1)
Collecting pip
  Using cached pip-25.3-py3-none-any.whl.metadata (4.7 kB)
Using cached pip-25.3-py3-none-any.whl (1.8 MB)
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 25.0.1
    Uninstalling pip-25.0.1:
      Successfully uninstalled pip-25.0.1
Successfully installed pip-25.3

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torch-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl
Collecting torch==2.9.1+rocmsdk20260116
  Downloading https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torch-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl (821.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 821.2/821.2 MB 10.6 MB/s  0:01:18
Collecting filelock (from torch==2.9.1+rocmsdk20260116)
  Downloading filelock-3.20.3-py3-none-any.whl.metadata (2.1 kB)
Collecting typing-extensions>=4.10.0 (from torch==2.9.1+rocmsdk20260116)
  Downloading typing_extensions-4.15.0-py3-none-any.whl.metadata (3.3 kB)
Collecting setuptools (from torch==2.9.1+rocmsdk20260116)
  Downloading setuptools-80.10.1-py3-none-any.whl.metadata (6.7 kB)
Collecting sympy>=1.13.3 (from torch==2.9.1+rocmsdk20260116)
  Downloading sympy-1.14.0-py3-none-any.whl.metadata (12 kB)
Collecting networkx>=2.5.1 (from torch==2.9.1+rocmsdk20260116)
  Downloading networkx-3.6.1-py3-none-any.whl.metadata (6.8 kB)
Collecting jinja2 (from torch==2.9.1+rocmsdk20260116)
  Downloading jinja2-3.1.6-py3-none-any.whl.metadata (2.9 kB)
Collecting fsspec>=0.8.5 (from torch==2.9.1+rocmsdk20260116)
  Downloading fsspec-2026.1.0-py3-none-any.whl.metadata (10 kB)
Requirement already satisfied: rocm==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-core==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm==7.2.0.dev0->rocm[libraries]==7.2.0.dev0->torch==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-libraries-custom==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Collecting mpmath<1.4,>=1.1.0 (from sympy>=1.13.3->torch==2.9.1+rocmsdk20260116)
  Downloading mpmath-1.3.0-py3-none-any.whl.metadata (8.6 kB)
Collecting MarkupSafe>=2.0 (from jinja2->torch==2.9.1+rocmsdk20260116)
  Downloading markupsafe-3.0.3-cp312-cp312-win_amd64.whl.metadata (2.8 kB)
Downloading fsspec-2026.1.0-py3-none-any.whl (201 kB)
Downloading networkx-3.6.1-py3-none-any.whl (2.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB 11.6 MB/s  0:00:00
Downloading sympy-1.14.0-py3-none-any.whl (6.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 6.3/6.3 MB 9.7 MB/s  0:00:00
Downloading mpmath-1.3.0-py3-none-any.whl (536 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 536.2/536.2 kB 8.8 MB/s  0:00:00
Downloading typing_extensions-4.15.0-py3-none-any.whl (44 kB)
Downloading filelock-3.20.3-py3-none-any.whl (16 kB)
Downloading jinja2-3.1.6-py3-none-any.whl (134 kB)
Downloading markupsafe-3.0.3-cp312-cp312-win_amd64.whl (15 kB)
Downloading setuptools-80.10.1-py3-none-any.whl (1.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.1/1.1 MB 8.9 MB/s  0:00:00
Installing collected packages: mpmath, typing-extensions, sympy, setuptools, networkx, MarkupSafe, fsspec, filelock, jinja2, torch
Successfully installed MarkupSafe-3.0.3 filelock-3.20.3 fsspec-2026.1.0 jinja2-3.1.6 mpmath-1.3.0 networkx-3.6.1 setuptools-80.10.1 sympy-1.14.0 torch-2.9.1+rocmsdk20260116 typing-extensions-4.15.0

(.venv) F:\comfyui-rocm72-p312-2026-01-24>sdk20260116-cp312-cp312-win_amd64.whl
'sdk20260116-cp312-cp312-win_amd64.whl' is not recognized as an internal or external command,
operable program or batch file.

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchaudio-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl
Collecting torchaudio==2.9.1+rocmsdk20260116
  Downloading https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchaudio-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl (514 kB)
Requirement already satisfied: torch in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torchaudio==2.9.1+rocmsdk20260116) (2.9.1+rocmsdk20260116)
Requirement already satisfied: filelock in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (3.20.3)
Requirement already satisfied: typing-extensions>=4.10.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (4.15.0)
Requirement already satisfied: setuptools in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (80.10.1)
Requirement already satisfied: sympy>=1.13.3 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (1.14.0)
Requirement already satisfied: networkx>=2.5.1 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (3.6.1)
Requirement already satisfied: jinja2 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (3.1.6)
Requirement already satisfied: fsspec>=0.8.5 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchaudio==2.9.1+rocmsdk20260116) (2026.1.0)
Requirement already satisfied: rocm==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch->torchaudio==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-core==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm==7.2.0.dev0->rocm[libraries]==7.2.0.dev0->torch->torchaudio==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-libraries-custom==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch->torchaudio==2.9.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: mpmath<1.4,>=1.1.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from sympy>=1.13.3->torch->torchaudio==2.9.1+rocmsdk20260116) (1.3.0)
Requirement already satisfied: MarkupSafe>=2.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from jinja2->torch->torchaudio==2.9.1+rocmsdk20260116) (3.0.3)
Installing collected packages: torchaudio
Successfully installed torchaudio-2.9.1+rocmsdk20260116

(.venv) F:\comfyui-rocm72-p312-2026-01-24>python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchvision-0.24.1+rocmsdk20260116-cp312-cp312-win_amd64.whl
Collecting torchvision==0.24.1+rocmsdk20260116
  Downloading https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchvision-0.24.1+rocmsdk20260116-cp312-cp312-win_amd64.whl (1.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.9/1.9 MB 11.4 MB/s  0:00:00
Collecting numpy (from torchvision==0.24.1+rocmsdk20260116)
  Downloading numpy-2.4.1-cp312-cp312-win_amd64.whl.metadata (6.6 kB)
Requirement already satisfied: torch in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torchvision==0.24.1+rocmsdk20260116) (2.9.1+rocmsdk20260116)
Collecting pillow!=8.3.*,>=5.3.0 (from torchvision==0.24.1+rocmsdk20260116)
  Downloading pillow-12.1.0-cp312-cp312-win_amd64.whl.metadata (9.0 kB)
Requirement already satisfied: filelock in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (3.20.3)
Requirement already satisfied: typing-extensions>=4.10.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (4.15.0)
Requirement already satisfied: setuptools in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (80.10.1)
Requirement already satisfied: sympy>=1.13.3 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (1.14.0)
Requirement already satisfied: networkx>=2.5.1 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (3.6.1)
Requirement already satisfied: jinja2 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (3.1.6)
Requirement already satisfied: fsspec>=0.8.5 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from torch->torchvision==0.24.1+rocmsdk20260116) (2026.1.0)
Requirement already satisfied: rocm==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch->torchvision==0.24.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-core==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm==7.2.0.dev0->rocm[libraries]==7.2.0.dev0->torch->torchvision==0.24.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: rocm-sdk-libraries-custom==7.2.0.dev0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from rocm[libraries]==7.2.0.dev0->torch->torchvision==0.24.1+rocmsdk20260116) (7.2.0.dev0)
Requirement already satisfied: mpmath<1.4,>=1.1.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from sympy>=1.13.3->torch->torchvision==0.24.1+rocmsdk20260116) (1.3.0)
Requirement already satisfied: MarkupSafe>=2.0 in f:\comfyui-rocm72-p312-2026-01-24\.venv\lib\site-packages (from jinja2->torch->torchvision==0.24.1+rocmsdk20260116) (3.0.3)
Downloading pillow-12.1.0-cp312-cp312-win_amd64.whl (7.0 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 7.0/7.0 MB 8.8 MB/s  0:00:00
Downloading numpy-2.4.1-cp312-cp312-win_amd64.whl (12.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.3/12.3 MB 9.3 MB/s  0:00:01
Installing collected packages: pillow, numpy, torchvision
Successfully installed numpy-2.4.1 pillow-12.1.0 torchvision-0.24.1+rocmsdk20260116

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv pip install -r requirements.txt --link-mode=copy
Resolved 68 packages in 389ms
Installed 51 packages in 1.38s
 + aiohappyeyeballs==2.6.1
 + aiohttp==3.13.3
 + aiosignal==1.4.0
 + alembic==1.18.1
 + annotated-types==0.7.0
 + attrs==25.4.0
 + av==16.1.0
 + certifi==2026.1.4
 + charset-normalizer==3.4.4
 + colorama==0.4.6
 + comfy-kitchen==0.2.7
 + comfyui-embedded-docs==0.4.0
 + comfyui-frontend-package==1.37.11
 + comfyui-workflow-templates==0.8.15
 + comfyui-workflow-templates-core==0.3.101
 + comfyui-workflow-templates-media-api==0.3.45
 + comfyui-workflow-templates-media-image==0.3.67
 + comfyui-workflow-templates-media-other==0.3.88
 + comfyui-workflow-templates-media-video==0.3.39
 + einops==0.8.1
 + frozenlist==1.8.0
 + greenlet==3.3.1
 + huggingface-hub==0.36.0
 + idna==3.11
 + kornia==0.8.2
 + kornia-rs==0.1.10
 + mako==1.3.10
 + multidict==6.7.0
 + packaging==26.0
 + propcache==0.4.1
 + psutil==7.2.1
 + pydantic==2.12.5
 + pydantic-core==2.41.5
 + pydantic-settings==2.12.0
 + python-dotenv==1.2.1
 + pyyaml==6.0.3
 + regex==2026.1.15
 + requests==2.32.5
 + safetensors==0.7.0
 + scipy==1.17.0
 + sentencepiece==0.2.1
 + spandrel==0.4.1
 + sqlalchemy==2.0.46
 + tokenizers==0.22.2
 + torchsde==0.2.6
 + tqdm==4.67.1
 + trampoline==0.1.2
 + transformers==4.57.6
 + typing-inspection==0.4.2
 + urllib3==2.6.3
 + yarl==1.22.0

(.venv) F:\comfyui-rocm72-p312-2026-01-24>cd custom_nodes

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
Cloning into 'ComfyUI-Manager'...
remote: Enumerating objects: 28091, done.
remote: Counting objects: 100% (666/666), done.
remote: Compressing objects: 100% (320/320), done.
remote: Total 28091 (delta 529), reused 357 (delta 346), pack-reused 27425 (from 4)
Receiving objects: 100% (28091/28091), 129.46 MiB | 9.79 MiB/s, done.
Resolving deltas: 100% (20819/20819), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/M1kep/ComfyLiterals
Cloning into 'ComfyLiterals'...
remote: Enumerating objects: 40, done.
remote: Counting objects: 100% (40/40), done.
remote: Compressing objects: 100% (27/27), done.
remote: Total 40 (delta 18), reused 27 (delta 9), pack-reused 0 (from 0)
Receiving objects: 100% (40/40), 12.54 KiB | 713.00 KiB/s, done.
Resolving deltas: 100% (18/18), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/fuselayer/comfyui-minimal-workflow-image
Cloning into 'comfyui-minimal-workflow-image'...
remote: Enumerating objects: 45, done.
remote: Counting objects: 100% (45/45), done.
remote: Compressing objects: 100% (43/43), done.
remote: Total 45 (delta 19), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (45/45), 446.81 KiB | 2.44 MiB/s, done.
Resolving deltas: 100% (19/19), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>git clone https://github.com/city96/ComfyUI-GGUF.git
Cloning into 'ComfyUI-GGUF'...
remote: Enumerating objects: 814, done.
remote: Counting objects: 100% (508/508), done.
remote: Compressing objects: 100% (194/194), done.
remote: Total 814 (delta 457), reused 314 (delta 314), pack-reused 306 (from 2)
Receiving objects: 100% (814/814), 190.00 KiB | 2.79 MiB/s, done.
Resolving deltas: 100% (542/542), done.

(.venv) F:\comfyui-rocm72-p312-2026-01-24\custom_nodes>cd ..

(.venv) F:\comfyui-rocm72-p312-2026-01-24>uv run main.py
[START] Security scan
[DONE] Security scan
## ComfyUI-Manager: installing dependencies. (GitPython)
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-24 13:13:53.547
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\comfyui-rocm72-p312-2026-01-24\.venv\Scripts\python.exe
** ComfyUI Path: F:\comfyui-rocm72-p312-2026-01-24
** ComfyUI Base Folder Path: F:\comfyui-rocm72-p312-2026-01-24
** User directory: F:\comfyui-rocm72-p312-2026-01-24\user
** ComfyUI-Manager config path: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\config.ini
** Log path: F:\comfyui-rocm72-p312-2026-01-24\user\comfyui.log

Prestartup times for custom nodes:
   6.8 seconds: F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-Manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.1+rocmsdk20260116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 2)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
Found comfy_kitchen backend eager: {'available': True, 'disabled': False, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8', 'scaled_mm_nvfp4']}
Found comfy_kitchen backend cuda: {'available': True, 'disabled': True, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8']}
Found comfy_kitchen backend triton: {'available': False, 'disabled': True, 'unavailable_reason': "ImportError: No module named 'triton'", 'capabilities': []}
Using pytorch attention
Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.10.0
ComfyUI frontend version: 1.37.11
[Prompt Server] web root: F:\comfyui-rocm72-p312-2026-01-24\.venv\Lib\site-packages\comfyui_frontend_package\static
Failed to find comfy root automatically, please copy the folder F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
Traceback (most recent call last):
  File "F:\comfyui-rocm72-p312-2026-01-24\nodes.py", line 2215, in load_custom_node
    module_spec.loader.exec_module(module)
  File "<frozen importlib._bootstrap_external>", line 999, in exec_module
  File "<frozen importlib._bootstrap>", line 488, in _call_with_frames_removed
  File "F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-GGUF\__init__.py", line 7, in <module>
    from .nodes import NODE_CLASS_MAPPINGS
  File "F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-GGUF\nodes.py", line 16, in <module>
    from .ops import GGMLOps, move_patch_to_device
  File "F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-GGUF\ops.py", line 2, in <module>
    import gguf
ModuleNotFoundError: No module named 'gguf'

Cannot import F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-GGUF module for custom nodes: No module named 'gguf'
### Loading: ComfyUI-Manager (V3.39.2)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Version: v0.10.0-29-g4e6a1b66 | Released on '2026-01-23'
Skip F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\comfyui-minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\comfyui-minimal-workflow-image
   0.0 seconds: F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyLiterals
   0.0 seconds (IMPORT FAILED): F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-GGUF
   0.4 seconds: F:\comfyui-rocm72-p312-2026-01-24\custom_nodes\ComfyUI-Manager

Context impl SQLiteImpl.
Will assume non-transactional DDL.
Context impl SQLiteImpl.
Will assume non-transactional DDL.
Running upgrade  -> 0001_assets, Initial assets schema
Revision ID: 0001_assets
Revises: None
Create Date: 2025-12-10 00:00:00
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
Database upgraded from None to 0001_assets
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
Assets scan(roots=['models']) completed in 0.045s (created=11, skipped_existing=0, total_seen=11)
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/121
FETCH ComfyRegistry Data: 10/121
FETCH ComfyRegistry Data: 15/121
FETCH ComfyRegistry Data: 20/121
FETCH ComfyRegistry Data: 25/121
FETCH ComfyRegistry Data: 30/121
FETCH ComfyRegistry Data: 35/121
FETCH ComfyRegistry Data: 40/121
FETCH ComfyRegistry Data: 45/121
FETCH ComfyRegistry Data: 50/121
FETCH ComfyRegistry Data: 55/121
FETCH ComfyRegistry Data: 60/121
FETCH ComfyRegistry Data: 65/121
FETCH ComfyRegistry Data: 70/121
FETCH ComfyRegistry Data: 75/121
FETCH ComfyRegistry Data: 80/121
FETCH ComfyRegistry Data: 85/121
FETCH ComfyRegistry Data: 90/121
FETCH ComfyRegistry Data: 95/121
FETCH ComfyRegistry Data: 100/121
FETCH ComfyRegistry Data: 105/121
FETCH ComfyRegistry Data: 110/121
FETCH ComfyRegistry Data: 115/121
FETCH ComfyRegistry Data: 120/121
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1514988643_custom-node-list.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extras.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1742899825_extension-node-map.json [DONE]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1514988643_custom-node-list.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\832903789_extras.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1742899825_extension-node-map.json [DONE]
FETCH DATA from: F:\comfyui-rocm72-p312-2026-01-24\user\__manager\cache\1742899825_extension-node-map.json [DONE]
```

</details>

### Flux 

Issues of Flux, what garbage, I don't have the city96 gguf nodes :'(

```uv run main.py```

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
clip missing: ['text_projection.weight']
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load FluxClipModel_
loaded completely; 22892.08 MB usable, 9319.23 MB loaded, full load: True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load FluxClipModel_
loaded completely;  4777.54 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
Unloaded partially: 515.86 MB freed, 8803.38 MB remains loaded, 160.00 MB buffer reserved, lowvram patches: 0
loaded completely; 13685.75 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████| 20/20 [06:17<00:00, 18.85s/it]
Requested to load AutoencodingEngine
Unloaded partially: 673.37 MB freed, 10676.73 MB remains loaded, 135.04 MB buffer reserved, lowvram patches: 0
loaded completely; 5181.26 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 447.69 seconds
```

```uv run main.py --use-pytorch-cross-attention```

This is more like it

City96 just needed ```uv pip install gguf``` to work

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 4424.19 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18109.68 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.29s/it]
Requested to load AutoencodingEngine
Unloaded partially: 133.56 MB freed, 4290.63 MB remains loaded, 18.59 MB buffer reserved, lowvram patches: 0
loaded completely; 5114.67 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 30.42 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.28s/it]
Prompt executed in 12.12 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.26s/it]
Prompt executed in 11.93 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.26s/it]
Prompt executed in 12.01 seconds
```

Qwen Edit is more useable bit not great

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20322.06 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22259.69 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21540.44 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████| 4/4 [08:01<00:00, 120.31s/it]
Requested to load WanVAE
Unloaded partially: 2999.80 MB freed, 17861.72 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 309
loaded completely; 2337.76 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 540.51 seconds
got prompt
loaded completely; 21237.07 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:55<00:00, 13.76s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 628
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 61.09 seconds
got prompt
loaded completely; 21241.44 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [01:10<00:00, 17.51s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 947
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 75.18 seconds
got prompt
loaded completely; 21241.44 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [04:40<00:00, 70.09s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 1266
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 288.45 seconds
```


---

# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>