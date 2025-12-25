# Abstract

Flash attention promises to give a 3X speedup on ROCm ComfyUI

# Sources

Here they speak of a module, it needs modifying ComfyUI

## Aule Flashattention

Can't make it work, it detects Vulkan and CPU, but no Triton/ROCm

https://www.reddit.com/r/ROCm/comments/1pg9vwh/pip_install_flashattention/

https://github.com/AuleTechnologies/Aule-Attention

https://github.com/AuleTechnologies/Aule-Attention/issues/6

##


https://www.reddit.com/r/ROCm/comments/1m7jy5w/the_state_of_flash_attention_on_rocm/

## UV

Bakcup

```cmd 
uv pip freeze > 2025-12-24_requirements_backup.txt
```


# Benchmark pre install

```cmd
got prompt
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load FluxClipModel_
loaded completely; 95367431640625005117571072.00 MB usable, 4777.54 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
loaded completely; 15881.25 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.39s/it]
Requested to load AutoencodingEngine
Unloaded partially: 565.34 MB freed, 10784.77 MB remains loaded, 81.03 MB buffer reserved, lowvram patches: 0
loaded completely; 5140.62 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 47.95 seconds
got prompt
loaded completely; 15295.81 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.37s/it]
Requested to load AutoencodingEngine
Unloaded partially: 592.35 MB freed, 10757.76 MB remains loaded, 81.03 MB buffer reserved, lowvram patches: 0
loaded completely; 5142.25 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 30.13 seconds
```

# UPDATE COMFYUI

First do a git pull

start comfy ui

Then update all repos via comfyui manager

restart comfuy ui

## Update Comfy UI using "update all" button

<details>
<summary>CMD Line Output</summary>

```cmd
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] Updating ComfyUI: v0.3.76-47-gfd271ded -> v0.6.0
Install: pip packages
Line is comment...skipping
ComfyUI is updated to latest stable version.
Updating: comfyui-managerCUSTOM NODE PULL: Success
Install: pip packages
Updating: comfyui-rmbgInstallation reserved: comfyui-rmbg
Updating: minimal-workflow-image
[ComfyUI-Manager] Queued works are completed.
{'update-comfyui': 1, 'update-main': 4}

After restarting ComfyUI, please refresh the browser.

Restarting... [Legacy Mode]


Command: ['"F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe"', '"main.py"']
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-24 10:18:09.345
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows
** ComfyUI Base Folder Path: F:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

#######################################################################
[ComfyUI-Manager] Starting dependency installation/(de)activation for the extension


## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-frontend-package==1.34.9']

## Execute management script for 'F:\ComfyUI-Windows'

F:\ComfyUI-Windows>[!] Resolved 1 package in 425ms
[!] Downloading comfyui-frontend-package (18.1MiB)
[!]  Downloaded comfyui-frontend-package
[!] Prepared 1 package in 1.76s
[!] Uninstalled 1 package in 19ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 71ms
[!]  - comfyui-frontend-package==1.33.13
[!]  + comfyui-frontend-package==1.34.9

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-workflow-templates==0.7.63']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Resolved 6 packages in 137ms
[!] Downloading comfyui-workflow-templates-media-video (37.5MiB)
[!] Downloading comfyui-workflow-templates-media-image (8.4MiB)
[!] Downloading comfyui-workflow-templates-media-api (54.6MiB)
[!] Downloading comfyui-workflow-templates-media-other (12.4MiB)
[!]  Downloaded comfyui-workflow-templates-media-image
[!]  Downloaded comfyui-workflow-templates-media-other
[!]  Downloaded comfyui-workflow-templates-media-video
[!]  Downloaded comfyui-workflow-templates-media-api
[!] Prepared 6 packages in 10.75s
[!] Uninstalled 6 packages in 26ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 6 packages in 62ms
[!]  - comfyui-workflow-templates==0.7.54
[!]  + comfyui-workflow-templates==0.7.63
[!]  - comfyui-workflow-templates-core==0.3.27
[!]  + comfyui-workflow-templates-core==0.3.58
[!]  - comfyui-workflow-templates-media-api==0.3.20
[!]  + comfyui-workflow-templates-media-api==0.3.31
[!]  - comfyui-workflow-templates-media-image==0.3.27
[!]  + comfyui-workflow-templates-media-image==0.3.43
[!]  - comfyui-workflow-templates-media-other==0.3.40
[!]  + comfyui-workflow-templates-media-other==0.3.61
[!]  - comfyui-workflow-templates-media-video==0.3.15
[!]  + comfyui-workflow-templates-media-video==0.3.22

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-embedded-docs==0.3.1']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 4ms
[SKIP] Downgrading pip package isn't allowed: numpy (cur=2.2.6)
[SKIP] Downgrading pip package isn't allowed: transformers (cur=4.57.3)
[SKIP] Downgrading pip package isn't allowed: tokenizers (cur=0.22.1)
[SKIP] Downgrading pip package isn't allowed: safetensors (cur=0.7.0)
[SKIP] Downgrading pip package isn't allowed: aiohttp (cur=3.13.2)
[SKIP] Downgrading pip package isn't allowed: yarl (cur=1.22.0)
[SKIP] Downgrading pip package isn't allowed: av (cur=16.0.1)
[SKIP] Downgrading pip package isn't allowed: kornia (cur=0.8.2)

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'pydantic-settings~=2.0']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 6ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'matrix-nio']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-manager'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 10ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'huggingface-hub']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-manager'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 6ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'typing-extensions']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-manager'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 3ms
100%|█████████████████████████████████████████████████████████████████████████████| 1.97M/1.97M [00:00<00:00, 9.26MB/s]
Extracted zip file to F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg
'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg' is moved to 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
Install: pip packages for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 5ms
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 14ms
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 4ms
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 11ms
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 4ms
[SKIP] Downgrading pip package isn't allowed: onnxruntime (cur=1.23.2)
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 6ms
[SKIP] Downgrading pip package isn't allowed: protobuf (cur=5.29.5)
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 4ms
[SKIP] Downgrading pip package isn't allowed: iopath (cur=0.1.10)
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 2 packages in 69ms
[!] Prepared 2 packages in 62ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 2 packages in 9ms
[!]  + ftfy==6.3.1
[!]  + wcwidth==0.2.14

[ComfyUI-Manager] Startup script completed.
#######################################################################

[ComfyUI-Manager] Restarting to reapply dependency installation.
Command: ['"F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe"', '"main.py"']
--------------------------------------------------------------------------

[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-24 10:18:26.208
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows
** ComfyUI Base Folder Path: F:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

Prestartup times for custom nodes:
   0.5 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Using sub quadratic optimization for attention, if you have memory or speed issues try using: --use-split-cross-attention
Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.6.0
ComfyUI frontend version: 1.34.9
[Prompt Server] web root: F:\ComfyUI-Windows\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Failed to find comfy root automatically, please copy the folder F:\ComfyUI-Windows\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
### Loading: ComfyUI-Manager (V3.39)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 4431 [e4c61d75] *DETACHED | Released on '2025-12-23'
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
F:\ComfyUI-Windows\.venv\Lib\site-packages\timm\models\layers\__init__.py:48: FutureWarning: Importing from timm.models.layers is deprecated, please import via timm.layers
  warnings.warn(f"Importing from {__name__} is deprecated, please import via timm.layers", FutureWarning)
Error loading AILab_SAM3Segment.py: No module named 'triton'
Warning: diffusers/transformers not available. SDMatte functionality will be limited.
[ComfyUI-RMBG] v2.9.6 | 32 nodes Loaded
Skip F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\ComfyLiterals
   0.3 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager
   0.9 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg

Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/115
FETCH ComfyRegistry Data: 10/115
FETCH ComfyRegistry Data: 15/115
FETCH ComfyRegistry Data: 20/115
FETCH ComfyRegistry Data: 25/115
FETCH ComfyRegistry Data: 30/115
```

</details>


## Update COmfyUI git

```
F:\ComfyUI-Windows>git status
HEAD detached at v0.6.0
nothing to commit, working tree clean

F:\ComfyUI-Windows>git branch
* (HEAD detached at v0.6.0)
  master

F:\ComfyUI-Windows>git checkout master
Previous HEAD position was e4c61d75 ComfyUI v0.6.0
Switched to branch 'master'
Your branch is behind 'origin/master' by 88 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

F:\ComfyUI-Windows>git pull
Updating fd271ded..650e716d
Fast-forward
 .ci/update_windows/update.py                       |  10 +
 .github/workflows/test-ci.yml                      |   1 +
 .github/workflows/test-execution.yml               |   4 +-
 .github/workflows/test-launch.yml                  |   4 +-
 .github/workflows/test-unit.yml                    |   4 +-
 .github/workflows/update-version.yml               |   1 +
 README.md                                          |   3 +
 api_server/routes/internal/internal_routes.py      |   7 +-
 comfy/cli_args.py                                  |   7 +
 comfy/context_windows.py                           |  15 +-
 comfy/k_diffusion/sampling.py                      |  30 +-
 comfy/ldm/chroma_radiance/model.py                 |  20 +-
 comfy/ldm/hunyuan_video/model.py                   |   3 +-
 comfy/ldm/lumina/controlnet.py                     |  95 ++-
 comfy/ldm/lumina/model.py                          |  21 +-
 comfy/ldm/qwen_image/model.py                      | 115 ++-
 comfy/ldm/wan/model.py                             |  21 +-
 comfy/ldm/wan/model_animate.py                     |   3 +
 comfy/ldm/wan/vae.py                               |  11 +-
 comfy/lora.py                                      |   1 +
 comfy/model_base.py                                |   2 +-
 comfy/model_detection.py                           |  14 +-
 comfy/model_management.py                          |   7 +-
 comfy/model_patcher.py                             |  33 +-
 comfy/ops.py                                       |  35 +-
 comfy/quant_ops.py                                 |   5 +-
 comfy/sampler_helpers.py                           |   8 +-
 comfy/samplers.py                                  |  23 +-
 comfy/sd.py                                        |  66 +-
 comfy/sd1_clip.py                                  |   6 +-
 comfy/supported_models.py                          |  25 +-
 comfy/text_encoders/jina_clip_2.py                 | 219 ++++++
 comfy/text_encoders/llama.py                       |  16 +-
 comfy/text_encoders/lumina2.py                     |   7 +-
 comfy/text_encoders/newbie.py                      |  62 ++
 comfy/utils.py                                     |  13 +-
 comfy_api/feature_flags.py                         |  10 +-
 comfy_api/internal/api_registry.py                 |  10 +-
 comfy_api/internal/async_to_sync.py                |  14 +-
 comfy_api/internal/singleton.py                    |   6 +-
 comfy_api/latest/__init__.py                       |   4 +-
 comfy_api/latest/_input/basic_types.py             |   4 +-
 comfy_api/latest/_io.py                            |  14 +-
 comfy_api/latest/_ui.py                            |  27 +-
 comfy_api/version_list.py                          |   3 +-
 comfy_api_nodes/apis/bytedance_api.py              |   6 +-
 comfy_api_nodes/apis/gemini_api.py                 |   1 +
 comfy_api_nodes/apis/kling_api.py                  |  28 +-
 comfy_api_nodes/apis/openai_api.py                 |  52 ++
 comfy_api_nodes/apis/pika_api.py                   | 100 ---
 comfy_api_nodes/apis/tripo_api.py                  |  46 +-
 comfy_api_nodes/nodes_bfl.py                       |  68 +-
 comfy_api_nodes/nodes_bytedance.py                 |  16 +-
 comfy_api_nodes/nodes_gemini.py                    |  24 +-
 comfy_api_nodes/nodes_kling.py                     | 189 ++++-
 comfy_api_nodes/nodes_openai.py                    | 215 ++---
 comfy_api_nodes/nodes_pika.py                      | 575 --------------
 comfy_api_nodes/nodes_topaz.py                     |  35 +-
 comfy_api_nodes/nodes_tripo.py                     |  86 +-
 comfy_api_nodes/nodes_wan.py                       | 186 +++--
 comfy_api_nodes/util/conversions.py                |   2 +-
 comfy_execution/jobs.py                            | 291 +++++++
 comfy_extras/nodes_custom_sampler.py               |  47 +-
 comfy_extras/nodes_dataset.py                      |  96 ++-
 comfy_extras/nodes_flux.py                         |   3 +-
 comfy_extras/nodes_latent.py                       |  43 +
 comfy_extras/nodes_model_patch.py                  | 134 +++-
 comfy_extras/nodes_post_processing.py              |  11 +-
 comfy_extras/nodes_qwen.py                         |  29 +-
 comfy_extras/nodes_torch_compile.py                |   4 +-
 comfy_extras/nodes_train.py                        | 864 +++++++++++++++------
 comfy_extras/nodes_wanmove.py                      | 535 +++++++++++++
 comfyui_version.py                                 |   2 +-
 execution.py                                       |   3 +
 latent_preview.py                                  |  10 +
 main.py                                            |  66 +-
 manager_requirements.txt                           |   2 +-
 nodes.py                                           |  10 +-
 pyproject.toml                                     |   2 +-
 requirements.txt                                   |   4 +-
 server.py                                          | 135 +++-
 .../execution_test/preview_method_override_test.py | 352 +++++++++
 tests/execution/test_execution.py                  | 134 ++++
 tests/execution/test_jobs.py                       | 361 +++++++++
 tests/execution/test_preview_method.py             | 358 +++++++++
 85 files changed, 4665 insertions(+), 1469 deletions(-)
 create mode 100644 comfy/text_encoders/jina_clip_2.py
 create mode 100644 comfy/text_encoders/newbie.py
 create mode 100644 comfy_api_nodes/apis/openai_api.py
 delete mode 100644 comfy_api_nodes/apis/pika_api.py
 delete mode 100644 comfy_api_nodes/nodes_pika.py
 create mode 100644 comfy_execution/jobs.py
 create mode 100644 comfy_extras/nodes_wanmove.py
 create mode 100644 tests-unit/execution_test/preview_method_override_test.py
 create mode 100644 tests/execution/test_jobs.py
 create mode 100644 tests/execution/test_preview_method.py
```

<details>
<summary>CMD Line Output</summary>

```cmd
F:\ComfyUI-Windows>git status
HEAD detached at v0.6.0
nothing to commit, working tree clean

F:\ComfyUI-Windows>git branch
* (HEAD detached at v0.6.0)
  master

F:\ComfyUI-Windows>git checkout master
Previous HEAD position was e4c61d75 ComfyUI v0.6.0
Switched to branch 'master'
Your branch is behind 'origin/master' by 88 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)

F:\ComfyUI-Windows>git pull
Updating fd271ded..650e716d
Fast-forward
 .ci/update_windows/update.py                       |  10 +
 .github/workflows/test-ci.yml                      |   1 +
 .github/workflows/test-execution.yml               |   4 +-
 .github/workflows/test-launch.yml                  |   4 +-
 .github/workflows/test-unit.yml                    |   4 +-
 .github/workflows/update-version.yml               |   1 +
 README.md                                          |   3 +
 api_server/routes/internal/internal_routes.py      |   7 +-
 comfy/cli_args.py                                  |   7 +
 comfy/context_windows.py                           |  15 +-
 comfy/k_diffusion/sampling.py                      |  30 +-
 comfy/ldm/chroma_radiance/model.py                 |  20 +-
 comfy/ldm/hunyuan_video/model.py                   |   3 +-
 comfy/ldm/lumina/controlnet.py                     |  95 ++-
 comfy/ldm/lumina/model.py                          |  21 +-
 comfy/ldm/qwen_image/model.py                      | 115 ++-
 comfy/ldm/wan/model.py                             |  21 +-
 comfy/ldm/wan/model_animate.py                     |   3 +
 comfy/ldm/wan/vae.py                               |  11 +-
 comfy/lora.py                                      |   1 +
 comfy/model_base.py                                |   2 +-
 comfy/model_detection.py                           |  14 +-
 comfy/model_management.py                          |   7 +-
 comfy/model_patcher.py                             |  33 +-
 comfy/ops.py                                       |  35 +-
 comfy/quant_ops.py                                 |   5 +-
 comfy/sampler_helpers.py                           |   8 +-
 comfy/samplers.py                                  |  23 +-
 comfy/sd.py                                        |  66 +-
 comfy/sd1_clip.py                                  |   6 +-
 comfy/supported_models.py                          |  25 +-
 comfy/text_encoders/jina_clip_2.py                 | 219 ++++++
 comfy/text_encoders/llama.py                       |  16 +-
 comfy/text_encoders/lumina2.py                     |   7 +-
 comfy/text_encoders/newbie.py                      |  62 ++
 comfy/utils.py                                     |  13 +-
 comfy_api/feature_flags.py                         |  10 +-
 comfy_api/internal/api_registry.py                 |  10 +-
 comfy_api/internal/async_to_sync.py                |  14 +-
 comfy_api/internal/singleton.py                    |   6 +-
 comfy_api/latest/__init__.py                       |   4 +-
 comfy_api/latest/_input/basic_types.py             |   4 +-
 comfy_api/latest/_io.py                            |  14 +-
 comfy_api/latest/_ui.py                            |  27 +-
 comfy_api/version_list.py                          |   3 +-
 comfy_api_nodes/apis/bytedance_api.py              |   6 +-
 comfy_api_nodes/apis/gemini_api.py                 |   1 +
 comfy_api_nodes/apis/kling_api.py                  |  28 +-
 comfy_api_nodes/apis/openai_api.py                 |  52 ++
 comfy_api_nodes/apis/pika_api.py                   | 100 ---
 comfy_api_nodes/apis/tripo_api.py                  |  46 +-
 comfy_api_nodes/nodes_bfl.py                       |  68 +-
 comfy_api_nodes/nodes_bytedance.py                 |  16 +-
 comfy_api_nodes/nodes_gemini.py                    |  24 +-
 comfy_api_nodes/nodes_kling.py                     | 189 ++++-
 comfy_api_nodes/nodes_openai.py                    | 215 ++---
 comfy_api_nodes/nodes_pika.py                      | 575 --------------
 comfy_api_nodes/nodes_topaz.py                     |  35 +-
 comfy_api_nodes/nodes_tripo.py                     |  86 +-
 comfy_api_nodes/nodes_wan.py                       | 186 +++--
 comfy_api_nodes/util/conversions.py                |   2 +-
 comfy_execution/jobs.py                            | 291 +++++++
 comfy_extras/nodes_custom_sampler.py               |  47 +-
 comfy_extras/nodes_dataset.py                      |  96 ++-
 comfy_extras/nodes_flux.py                         |   3 +-
 comfy_extras/nodes_latent.py                       |  43 +
 comfy_extras/nodes_model_patch.py                  | 134 +++-
 comfy_extras/nodes_post_processing.py              |  11 +-
 comfy_extras/nodes_qwen.py                         |  29 +-
 comfy_extras/nodes_torch_compile.py                |   4 +-
 comfy_extras/nodes_train.py                        | 864 +++++++++++++++------
 comfy_extras/nodes_wanmove.py                      | 535 +++++++++++++
 comfyui_version.py                                 |   2 +-
 execution.py                                       |   3 +
 latent_preview.py                                  |  10 +
 main.py                                            |  66 +-
 manager_requirements.txt                           |   2 +-
 nodes.py                                           |  10 +-
 pyproject.toml                                     |   2 +-
 requirements.txt                                   |   4 +-
 server.py                                          | 135 +++-
 .../execution_test/preview_method_override_test.py | 352 +++++++++
 tests/execution/test_execution.py                  | 134 ++++
 tests/execution/test_jobs.py                       | 361 +++++++++
 tests/execution/test_preview_method.py             | 358 +++++++++
 85 files changed, 4665 insertions(+), 1469 deletions(-)
 create mode 100644 comfy/text_encoders/jina_clip_2.py
 create mode 100644 comfy/text_encoders/newbie.py
 create mode 100644 comfy_api_nodes/apis/openai_api.py
 delete mode 100644 comfy_api_nodes/apis/pika_api.py
 delete mode 100644 comfy_api_nodes/nodes_pika.py
 create mode 100644 comfy_execution/jobs.py
 create mode 100644 comfy_extras/nodes_wanmove.py
 create mode 100644 tests-unit/execution_test/preview_method_override_test.py
 create mode 100644 tests/execution/test_jobs.py
 create mode 100644 tests/execution/test_preview_method.py

F:\ComfyUI-Windows>uv run main.py
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-24 10:59:16.909
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows
** ComfyUI Base Folder Path: F:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

Prestartup times for custom nodes:
   0.5 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Using sub quadratic optimization for attention, if you have memory or speed issues try using: --use-split-cross-attention
Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.6.0
________________________________________________________________________
WARNING WARNING WARNING WARNING WARNING

Installed frontend version 1.34.9 is lower than the recommended version 1.35.9.

Please install the updated requirements.txt file by running:
F:\ComfyUI-Windows\.venv\Scripts\python.exe -m pip install -r F:\ComfyUI-Windows\requirements.txt
If you are on the portable package you can run: update\update_comfyui.bat to solve this problem.

This error is happening because the ComfyUI frontend is no longer shipped as part of the main repo but as a pip package instead.
________________________________________________________________________
[Prompt Server] web root: F:\ComfyUI-Windows\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Failed to find comfy root automatically, please copy the folder F:\ComfyUI-Windows\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
### Loading: ComfyUI-Manager (V3.39)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Version: v0.6.0-1-g650e716d | Released on '2025-12-23'
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
F:\ComfyUI-Windows\.venv\Lib\site-packages\timm\models\layers\__init__.py:48: FutureWarning: Importing from timm.models.layers is deprecated, please import via timm.layers
  warnings.warn(f"Importing from {__name__} is deprecated, please import via timm.layers", FutureWarning)
Error loading AILab_SAM3Segment.py: No module named 'triton'
Warning: diffusers/transformers not available. SDMatte functionality will be limited.
[ComfyUI-RMBG] v2.9.6 | 32 nodes Loaded
Skip F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\ComfyLiterals
   0.3 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager
   0.8 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg

Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
________________________________________________________________________
WARNING WARNING WARNING WARNING WARNING

Installed frontend version 1.34.9 is lower than the recommended version 1.35.9.

Please install the updated requirements.txt file by running:
F:\ComfyUI-Windows\.venv\Scripts\python.exe -m pip install -r F:\ComfyUI-Windows\requirements.txt
If you are on the portable package you can run: update\update_comfyui.bat to solve this problem.

This error is happening because the ComfyUI frontend is no longer shipped as part of the main repo but as a pip package instead.
________________________________________________________________________
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/115
FETCH ComfyRegistry Data: 10/115
FETCH ComfyRegistry Data: 15/115
FETCH ComfyRegistry Data: 20/115
FETCH ComfyRegistry Data: 25/115
FETCH ComfyRegistry Data: 30/115
FETCH ComfyRegistry Data: 35/115
FETCH ComfyRegistry Data: 40/115
FETCH ComfyRegistry Data: 45/115
FETCH ComfyRegistry Data: 50/115
FETCH ComfyRegistry Data: 55/115
FETCH ComfyRegistry Data: 60/115
FETCH ComfyRegistry Data: 65/115
FETCH ComfyRegistry Data: 70/115
FETCH ComfyRegistry Data: 75/115
FETCH ComfyRegistry Data: 80/115
FETCH ComfyRegistry Data: 85/115
FETCH ComfyRegistry Data: 90/115
FETCH ComfyRegistry Data: 95/115
FETCH ComfyRegistry Data: 100/115
FETCH ComfyRegistry Data: 105/115
FETCH ComfyRegistry Data: 110/115
FETCH ComfyRegistry Data: 115/115
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] Updating ComfyUI: nightly -> v0.6.0
Install: pip packages
Line is comment...skipping
ComfyUI is updated to latest stable version.
Updating: minimal-workflow-image
[ComfyUI-Manager] Queued works are completed.
{'update-comfyui': 1, 'update-main': 4}

After restarting ComfyUI, please refresh the browser.

Restarting... [Legacy Mode]


Command: ['"F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe"', '"main.py"']

F:\ComfyUI-Windows>[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-24 11:01:39.122
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows
** ComfyUI Base Folder Path: F:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

#######################################################################
[ComfyUI-Manager] Starting dependency installation/(de)activation for the extension


## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-frontend-package==1.34.9']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 3ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-workflow-templates==0.7.63']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 3ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'comfyui-embedded-docs==0.3.1']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 3ms
[SKIP] Downgrading pip package isn't allowed: numpy (cur=2.2.6)
[SKIP] Downgrading pip package isn't allowed: transformers (cur=4.57.3)
[SKIP] Downgrading pip package isn't allowed: tokenizers (cur=0.22.1)
[SKIP] Downgrading pip package isn't allowed: safetensors (cur=0.7.0)
[SKIP] Downgrading pip package isn't allowed: aiohttp (cur=3.13.2)
[SKIP] Downgrading pip package isn't allowed: yarl (cur=1.22.0)
[SKIP] Downgrading pip package isn't allowed: av (cur=16.0.1)
[SKIP] Downgrading pip package isn't allowed: kornia (cur=0.8.2)

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'pydantic-settings~=2.0']

## Execute management script for 'F:\ComfyUI-Windows'
[!] Audited 1 package in 4ms

[ComfyUI-Manager] Startup script completed.
#######################################################################

[ComfyUI-Manager] Restarting to reapply dependency installation.
Command: ['"F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe"', '"main.py"']
--------------------------------------------------------------------------

[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-24 11:01:39.884
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: F:\ComfyUI-Windows
** ComfyUI Base Folder Path: F:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

Prestartup times for custom nodes:
   0.5 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

Checkpoint files will always be loaded safely.
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Using sub quadratic optimization for attention, if you have memory or speed issues try using: --use-split-cross-attention
Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.6.0
ComfyUI frontend version: 1.34.9
[Prompt Server] web root: F:\ComfyUI-Windows\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
Failed to find comfy root automatically, please copy the folder F:\ComfyUI-Windows\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
### Loading: ComfyUI-Manager (V3.39)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 4431 [e4c61d75] *DETACHED | Released on '2025-12-23'
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
F:\ComfyUI-Windows\.venv\Lib\site-packages\timm\models\layers\__init__.py:48: FutureWarning: Importing from timm.models.layers is deprecated, please import via timm.layers
  warnings.warn(f"Importing from {__name__} is deprecated, please import via timm.layers", FutureWarning)
Error loading AILab_SAM3Segment.py: No module named 'triton'
Warning: diffusers/transformers not available. SDMatte functionality will be limited.
[ComfyUI-RMBG] v2.9.6 | 32 nodes Loaded
Skip F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\ComfyLiterals
   0.2 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager
   0.8 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg

Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/115
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 10/115
FETCH ComfyRegistry Data: 15/115
FETCH ComfyRegistry Data: 20/115
FETCH ComfyRegistry Data: 25/115
FETCH ComfyRegistry Data: 30/115
FETCH ComfyRegistry Data: 35/115
FETCH ComfyRegistry Data: 40/115
FETCH ComfyRegistry Data: 45/115
FETCH ComfyRegistry Data: 50/115
FETCH ComfyRegistry Data: 55/115
FETCH ComfyRegistry Data: 60/115
FETCH ComfyRegistry Data: 65/115
FETCH ComfyRegistry Data: 70/115
FETCH ComfyRegistry Data: 75/115
FETCH ComfyRegistry Data: 80/115
FETCH ComfyRegistry Data: 85/115
FETCH ComfyRegistry Data: 90/115
FETCH ComfyRegistry Data: 95/115
FETCH ComfyRegistry Data: 100/115
FETCH ComfyRegistry Data: 105/115
FETCH ComfyRegistry Data: 110/115
FETCH ComfyRegistry Data: 115/115
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
```

</details>





## Benchmark Zimage

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
unet missing: ['norm_final.weight']
Requested to load Lumina2
Unloaded partially: 7672.25 MB freed, 0.00 MB remains loaded, 2225.62 MB buffer reserved, lowvram patches: 0
loaded completely; 18677.30 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.07s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1295.80 MB freed, 10443.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5418.82 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 33.64 seconds
got prompt
loaded completely; 18194.79 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:37<00:00,  4.16s/it]
Unloaded partially: 545.80 MB freed, 11193.77 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
Prompt executed in 39.28 seconds
```

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
unet missing: ['norm_final.weight']
Requested to load Lumina2
Unloaded partially: 7672.25 MB freed, 0.00 MB remains loaded, 2225.62 MB buffer reserved, lowvram patches: 0
loaded completely; 18677.30 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.03s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1295.80 MB freed, 10443.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5418.82 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 41.83 seconds
got prompt
loaded completely; 18194.79 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.02s/it]
Unloaded partially: 545.80 MB freed, 11193.77 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
Prompt executed in 10.84 seconds
```

# FLASH ATTENTION

## INSTALL

https://www.reddit.com/r/ROCm/comments/1pg9vwh/pip_install_flashattention/

https://github.com/AuleTechnologies/Aule-Attention

```cmd
F:\ComfyUI-Windows>uv pip install aule-attention
Resolved 2 packages in 588ms
Prepared 1 package in 514ms
░░░░░░░░░░░░░░░░░░░░ [0/1] Installing wheels...                                                                     warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 1 package in 9ms
 + aule-attention==0.5.0
```

## TEST

```python
from aule import get_available_backends, print_backend_info

# List available backends
backends = get_available_backends()
print(f"Available backends: {backends}")

# Display detailed backend information
print_backend_info()
```

```cmd
F:\ComfyUI-Windows>uv run flash_attention_check_backend.py
DEBUG: Loading library from F:\ComfyUI-Windows\.venv\Lib\site-packages\aule\lib\aule.dll
Available backends: ['vulkan', 'cpu']
============================================================
AULE-ATTENTION v0.5.0
============================================================

Available backends: ['vulkan', 'cpu']

aule_init: initializing...
aule_init: complete
[1] VULKAN
    GPU: AMD Radeon RX 7900 XTX
    Status: Vulkan compute shader

[2] CPU
    Status: NumPy fallback

============================================================
```

[ISSUE TRACKING](https://github.com/AuleTechnologies/Aule-Attention/issues/6)

