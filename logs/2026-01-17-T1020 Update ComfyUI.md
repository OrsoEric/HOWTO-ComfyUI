```
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] Updating ComfyUI: v0.8.2-20-g2f642d5d -> v0.9.2
Install: pip packages
Line is comment...skipping
ComfyUI is updated to latest stable version.
Updating: ComfyUI-GGUFInstallation reserved: ComfyUI-GGUF
Updating: comfyui-managerCUSTOM NODE PULL: Success
Install: pip packages
Updating: minimal-workflow-image
[ComfyUI-Manager] Queued works are completed.
{'update-comfyui': 1, 'update-main': 5}

After restarting ComfyUI, please refresh the browser.

Stopped server
Terminate batch job (Y/N)? y

F:\ComfyUI-Windows-P313-T210-2026-01-11>run_comfyui.bat

F:\ComfyUI-Windows-P313-T210-2026-01-11>uv run main.py  --use-pytorch-cross-attention
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
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-17 10:13:39.398
** Platform: Windows
** Python version: 3.13.3 (main, Apr  9 2025, 04:04:49) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** ComfyUI Base Folder Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** User directory: F:\ComfyUI-Windows-P313-T210-2026-01-11\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\comfyui.log

#######################################################################
[ComfyUI-Manager] Starting dependency installation/(de)activation for the extension


## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-frontend-package==1.36.14']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11'
[!] Resolved 1 package in 460ms
[!] Downloading comfyui-frontend-package (18.5MiB)
[!]  Downloaded comfyui-frontend-package
[!] Prepared 1 package in 1.81s
[!] Uninstalled 1 package in 45ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 84ms
[!]  - comfyui-frontend-package==1.36.13
[!]  + comfyui-frontend-package==1.36.14

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-workflow-templates==0.8.4']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11'
[!] Resolved 6 packages in 147ms
[!] Downloading comfyui-workflow-templates-media-other (16.9MiB)
[!] Downloading comfyui-workflow-templates-media-api (67.3MiB)
[!] Downloading comfyui-workflow-templates-media-video (52.1MiB)
[!] Downloading comfyui-workflow-templates-media-image (13.8MiB)
[!]  Downloaded comfyui-workflow-templates-media-image
[!]  Downloaded comfyui-workflow-templates-media-other
[!]  Downloaded comfyui-workflow-templates-media-video
[!]  Downloaded comfyui-workflow-templates-media-api
[!] Prepared 6 packages in 14.39s
[!] Uninstalled 6 packages in 65ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 6 packages in 87ms
[!]  - comfyui-workflow-templates==0.7.69
[!]  + comfyui-workflow-templates==0.8.4
[!]  - comfyui-workflow-templates-core==0.3.77
[!]  + comfyui-workflow-templates-core==0.3.88
[!]  - comfyui-workflow-templates-media-api==0.3.34
[!]  + comfyui-workflow-templates-media-api==0.3.39
[!]  - comfyui-workflow-templates-media-image==0.3.50
[!]  + comfyui-workflow-templates-media-image==0.3.55
[!]  - comfyui-workflow-templates-media-other==0.3.68
[!]  + comfyui-workflow-templates-media-other==0.3.80
[!]  - comfyui-workflow-templates-media-video==0.3.33
[!]  + comfyui-workflow-templates-media-video==0.3.38

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-embedded-docs==0.4.0']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11'
[!] Audited 1 package in 3ms
[SKIP] Downgrading pip package isn't allowed: numpy (cur=2.3.2)
[SKIP] Downgrading pip package isn't allowed: transformers (cur=4.57.3)
[SKIP] Downgrading pip package isn't allowed: tokenizers (cur=0.22.2)
[SKIP] Downgrading pip package isn't allowed: safetensors (cur=0.7.0)
[SKIP] Downgrading pip package isn't allowed: aiohttp (cur=3.13.3)
[SKIP] Downgrading pip package isn't allowed: yarl (cur=1.22.0)
[SKIP] Downgrading pip package isn't allowed: av (cur=16.1.0)

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfy-kitchen>=0.2.6']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11'
[!] Resolved 1 package in 106ms
[!] Prepared 1 package in 89ms
[!] Uninstalled 1 package in 5ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 8ms
[!]  - comfy-kitchen==0.2.5
[!]  + comfy-kitchen==0.2.7
[SKIP] Downgrading pip package isn't allowed: kornia (cur=0.8.2)

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'pydantic-settings~=2.0']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11'
[!] Audited 1 package in 5ms
100%|█████████████████████████████████████████████████████████████████████████| 36.0k/36.0k [00:00<00:00, 2.10MB/s]
Extracted zip file to F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF
'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF' is moved to 'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF'
Install: pip packages for 'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF'
[SKIP] Downgrading pip package isn't allowed: gguf (cur=0.17.1)

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'matrix-nio']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager'
[!] Using Python 3.13.3 environment at: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv
[!] Audited 1 package in 12ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'huggingface-hub']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager'
[!] Using Python 3.13.3 environment at: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv
[!] Audited 1 package in 8ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'typing-extensions']

## Execute management script for 'F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager'
[!] Using Python 3.13.3 environment at: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv
[!] Audited 1 package in 2ms

[ComfyUI-Manager] Startup script completed.
#######################################################################

[ComfyUI-Manager] Restarting to reapply dependency installation.
Command: ['"F:\\ComfyUI-Windows-P313-T210-2026-01-11\\.venv\\Scripts\\python.exe"', '"main.py"', '--use-pytorch-cross-attention']
--------------------------------------------------------------------------


F:\ComfyUI-Windows-P313-T210-2026-01-11>Adding extra search path checkpoints F:\ComfyUI-Models\checkpoints
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
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-01-17 10:14:01.055
** Platform: Windows
** Python version: 3.13.3 (main, Apr  9 2025, 04:04:49) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** ComfyUI Base Folder Path: F:\ComfyUI-Windows-P313-T210-2026-01-11
** User directory: F:\ComfyUI-Windows-P313-T210-2026-01-11\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows-P313-T210-2026-01-11\user\comfyui.log

Prestartup times for custom nodes:
   0.4 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.10.0a0+rocm7.10.0a20251120
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 10)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
Found comfy_kitchen backend eager: {'available': True, 'disabled': False, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8', 'scaled_mm_nvfp4']}
Found comfy_kitchen backend triton: {'available': False, 'disabled': True, 'unavailable_reason': "ImportError: No module named 'triton'", 'capabilities': []}
Found comfy_kitchen backend cuda: {'available': True, 'disabled': True, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8']}
Using pytorch attention
Python version: 3.13.3 (main, Apr  9 2025, 04:04:49) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.9.2
ComfyUI frontend version: 1.36.14
[Prompt Server] web root: F:\ComfyUI-Windows-P313-T210-2026-01-11\.venv\Lib\site-packages\comfyui_frontend_package\static
Failed to find comfy root automatically, please copy the folder F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
ComfyUI-GGUF: Allowing full torch compile
### Loading: ComfyUI-Manager (V3.39.2)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 4551 [8f40b43e] *DETACHED | Released on '2026-01-15'
Skip F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\websocket_image_save.py
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\comfyui-image-compare
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyLiterals
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-GGUF
   0.3 seconds: F:\ComfyUI-Windows-P313-T210-2026-01-11\custom_nodes\ComfyUI-Manager

Context impl SQLiteImpl.
Will assume non-transactional DDL.
Assets scan(roots=['models']) completed in 0.045s (created=0, skipped_existing=40, total_seen=40)
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
Starting server

To see the GUI go to: http://127.0.0.1:8188
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
FETCH ComfyRegistry Data: 5/119
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 10/119
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 15/119
FETCH ComfyRegistry Data: 20/119
FETCH ComfyRegistry Data: 25/119
FETCH ComfyRegistry Data: 30/119
FETCH ComfyRegistry Data: 35/119
FETCH ComfyRegistry Data: 40/119
FETCH ComfyRegistry Data: 45/119
FETCH ComfyRegistry Data: 50/119
FETCH ComfyRegistry Data: 55/119
FETCH ComfyRegistry Data: 60/119
FETCH ComfyRegistry Data: 65/119
FETCH ComfyRegistry Data: 70/119
FETCH ComfyRegistry Data: 75/119
FETCH ComfyRegistry Data: 80/119
FETCH ComfyRegistry Data: 85/119
FETCH ComfyRegistry Data: 90/119
FETCH ComfyRegistry Data: 95/119
FETCH ComfyRegistry Data: 100/119
FETCH ComfyRegistry Data: 105/119
FETCH ComfyRegistry Data: 110/119
FETCH ComfyRegistry Data: 115/119
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
```