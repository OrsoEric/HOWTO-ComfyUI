# Research Links



https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/windows/install-pytorch.html


# Instructions

## Compatibility Matricies

[Compatibility Matricies](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/compatibility/compatibilityrad/windows/windows_compatibility.html)

My 7900XTX is called GFX1100 (???) and is supported under windows, so I can progress

## Adrenaline Pytorch Preview Driver

First I need a AMD preview driver that has Pytorch under windows

**Difference from before:** This is enormous, because the regular AMD driver cannot possibly run pytorch because there aren't any binaries there. Nothing binds the pytorch calls to the driver. Worse, unless extreme care is taken with pip, pip will desperately want to pull the CUDA pytorch binaries and brick everything, so before I had to really choke force pip with custom requirement ands exclusion files and redo all custom instructions under WSL, and still most of pytorch didn't work, e.g. xformers, sage attention, etc.. were a lost cause

### Uninstall AMD Driver

[AMD Driver Cleanup](https://www.amd.com/en/resources/support-articles/faqs/GPU-601.html)

### Install AMD Preview Driver

[AMD Software: PyTorch on Windows Edition 7.1.1 Driver for Windows® 11](https://www.amd.com/en/resources/support-articles/release-notes/RN-AMDGPU-WINDOWS-PYTORCH-7-1-1.html)


![](/images/Adrenaline%20Preview%20Driver%2025%2020%2001%2017.png)

## Pytorch and Pip

[Instructions](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/windows/install-pytorch.html)

This only works with python 3.12

```cmd
C:\Users\FatherOfMachines>python --version
Python 3.10.11
```


```cmd
pip install --no-cache-dir ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_core-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_devel-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_libraries_custom-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz
```


**NOTES:** This is wrong. It does it system wide with a system python, that is WRONG. I'll follow the guides, but I'd have to do it properly with UV to make a fully local python installation for it to have any chance of working...

I'll redo the instructions using UV PIP that has some chance of working at least.

First create a folder, and an uv venv with the right python, so you have a chance of it working.

Second, do the pip through UV

```
cd f:\ComfyUI-Windows

uv venv .venv --python 3.12

.venv\Scripts\activate

uv pip install --no-cache-dir ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_core-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_devel-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_libraries_custom-0.1.dev0-py3-none-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz

uv pip install --no-cache-dir ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torch-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchaudio-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl ^
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchvision-0.24.0+rocmsdk20251116-cp312-cp312-win_amd64.whl

```

<details>
<summary>CMD Line Output</summary>

```cmd
F:\ComfyUI-Windows>uv venv .venv --python 3.12
Using CPython 3.12.10
Creating virtual environment at: .venv
Activate with: .venv\Scripts\activate

f:\ComfyUI-Windows>.venv\Scripts\activate

(.venv) f:\ComfyUI-Windows>uv pip install --no-cache-dir ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_core-0.1.dev0-py3-none-win_amd64.whl ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_devel-0.1.dev0-py3-none-win_amd64.whl ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_libraries_custom-0.1.dev0-py3-none-win_amd64.whl ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz
Resolved 4 packages in 642ms
      Built rocm @ https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz
Prepared 4 packages in 6m 42s
░░░░░░░░░░░░░░░░░░░░ [0/4] Installing wheels...                                                                         warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 4 packages in 4.70s
 + rocm==0.1.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz)
 + rocm-sdk-core==0.1.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_core-0.1.dev0-py3-none-win_amd64.whl)
 + rocm-sdk-devel==0.1.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_devel-0.1.dev0-py3-none-win_amd64.whl)
 + rocm-sdk-libraries-custom==0.1.dev0 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_libraries_custom-0.1.dev0-py3-none-win_amd64.whl)

(.venv) f:\ComfyUI-Windows>uv pip install --no-cache-dir ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torch-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchaudio-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl ^
More?     https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchvision-0.24.0+rocmsdk20251116-cp312-cp312-win_amd64.whl
Resolved 17 packages in 1.10s
Prepared 14 packages in 1m 25s
░░░░░░░░░░░░░░░░░░░░ [0/14] Installing wheels...                                                                        warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 14 packages in 3.22s
 + filelock==3.20.0
 + fsspec==2025.12.0
 + jinja2==3.1.6
 + markupsafe==3.0.3
 + mpmath==1.3.0
 + networkx==3.6
 + numpy==2.3.5
 + pillow==12.0.0
 + setuptools==80.9.0
 + sympy==1.14.0
 + torch==2.9.0+rocmsdk20251116 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torch-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl)
 + torchaudio==2.9.0+rocmsdk20251116 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchaudio-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl)
 + torchvision==0.24.0+rocmsdk20251116 (from https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchvision-0.24.0+rocmsdk20251116-cp312-cp312-win_amd64.whl)
 + typing-extensions==4.15.0

```

</details>

### Verify Pytorch

```cmd
python -c "import torch" 2>nul && echo Success || echo Failure

python -c "import torch; print(torch.cuda.is_available())"

python -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"

python -m torch.utils.collect_env
```

<details>
<summary>CMD Line Output</summary>

```cmd
(.venv) f:\ComfyUI-Windows>python -c "import torch" 2>nul && echo Success || echo Failure
Success

(.venv) f:\ComfyUI-Windows>python -c "import torch; print(torch.cuda.is_available())"
True

(.venv) f:\ComfyUI-Windows>python -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"
device name [0]: AMD Radeon RX 7900 XTX

(.venv) f:\ComfyUI-Windows>python -m torch.utils.collect_env
<frozen runpy>:128: RuntimeWarning: 'torch.utils.collect_env' found in sys.modules after import of package 'torch.utils', but prior to execution of 'torch.utils.collect_env'; this may result in unpredictable behaviour
Collecting environment information...
PyTorch version: 2.9.0+rocmsdk20251116
Is debug build: False
CUDA used to build PyTorch: N/A
ROCM used to build PyTorch: 7.1.52802-561cc400e1

OS: Microsoft Windows 11 Pro (10.0.22631 64-bit)
GCC version: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r8) 13.2.0
Clang version: 19.0.0git (git@github.amd.com:Compute-Mirrors/llvm-project 5353ca3e0e5ae54a31eeebe223da212fa405567a)
CMake version: version 3.29.2
Libc version: N/A

Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)] (64-bit runtime)
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
[pip3] Could not collect
[conda] Could not collect
```

</details>


## ComfyUI

Clone Comfy UI

Move the files to the .venv generated because I did the VENV before cloning, it's fine to do comfy UI first than venv

```cmd
git clone https://github.com/comfyanonymous/ComfyUI.git

uv pip install -r requirements.txt
```

<details>
<summary>CMD Line Output</summary>

```cmd
(.venv) f:\ComfyUI-Windows>uv pip install -r requirements.txt
Resolved 67 packages in 591ms
Prepared 38 packages in 21.89s
░░░░░░░░░░░░░░░░░░░░ [0/50] Installing wheels...                                                                        warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 50 packages in 1.08s
 + aiohappyeyeballs==2.6.1
 + aiohttp==3.13.2
 + aiosignal==1.4.0
 + alembic==1.17.2
 + annotated-types==0.7.0
 + attrs==25.4.0
 + av==16.0.1
 + certifi==2025.11.12
 + charset-normalizer==3.4.4
 + colorama==0.4.6
 + comfyui-embedded-docs==0.3.1
 + comfyui-frontend-package==1.33.10
 + comfyui-workflow-templates==0.7.51
 + comfyui-workflow-templates-core==0.3.23
 + comfyui-workflow-templates-media-api==0.3.19
 + comfyui-workflow-templates-media-image==0.3.26
 + comfyui-workflow-templates-media-other==0.3.37
 + comfyui-workflow-templates-media-video==0.3.13
 + einops==0.8.1
 + frozenlist==1.8.0
 + greenlet==3.3.0
 + huggingface-hub==0.36.0
 + idna==3.11
 + kornia==0.8.2
 + kornia-rs==0.1.10
 + mako==1.3.10
 + multidict==6.7.0
 + packaging==25.0
 + propcache==0.4.1
 + psutil==7.1.3
 + pydantic==2.12.5
 + pydantic-core==2.41.5
 + pydantic-settings==2.12.0
 + python-dotenv==1.2.1
 + pyyaml==6.0.3
 + regex==2025.11.3
 + requests==2.32.5
 + safetensors==0.7.0
 + scipy==1.16.3
 + sentencepiece==0.2.1
 + spandrel==0.4.1
 + sqlalchemy==2.0.44
 + tokenizers==0.22.1
 + torchsde==0.2.6
 + tqdm==4.67.1
 + trampoline==0.1.2
 + transformers==4.57.3
 + typing-inspection==0.4.2
 + urllib3==2.6.0
 + yarl==1.22.0

(.venv) f:\ComfyUI-Windows>python main.py
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
ComfyUI version: 0.3.76
****** User settings have been changed to be stored on the server instead of browser storage. ******
****** For multi-user setups add the --multi-user CLI argument to enable multiple user profiles. ******
ComfyUI frontend version: 1.33.10
[Prompt Server] web root: F:\ComfyUI-Windows\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py

Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
Starting server

To see the GUI go to: http://127.0.0.1:8188

```

</details>



**difference from before:** WOW it did not overwrite ROCm with CUDA???? WOOOOW AMD actually did something useful here! Doing the install before was a nightmare becuse pip tried its everything to brick rocm with CUDA and I had to do lots of work to force,force, force harder pip to use what little acceleration ROCm was providing

### Custom Node Manager

If you want to do anything, you'll need the node manager extension.

**NOTE:** It'll make opening ComfyUI much slower, it needs to load the custom nodes that take time. It's worth it because it can detect missing custom nodes.

```
cd custom_nodes/
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd ..
```

<details>
<summary>CMD Line Output</summary>

```cmd
(.venv) f:\ComfyUI-Windows>cd custom_nodes

(.venv) f:\ComfyUI-Windows\custom_nodes>git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
Cloning into 'comfyui-manager'...
remote: Enumerating objects: 26710, done.
remote: Counting objects: 100% (2773/2773), done.
remote: Compressing objects: 100% (364/364), done.
remote: Total 26710 (delta 2615), reused 2418 (delta 2409), pack-reused 23937 (from 3)
Receiving objects: 100% (26710/26710), 102.83 MiB | 9.99 MiB/s, done.
Resolving deltas: 100% (19779/19779), done.

(.venv) f:\ComfyUI-Windows\custom_nodes>cd ..

(.venv) f:\ComfyUI-Windows>python main.py
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using standalone `uv` for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies. (GitPython)
Resolved 59 packages in 585ms
Prepared 24 packages in 2.97s
░░░░░░░░░░░░░░░░░░░░ [0/33] Installing wheels...                                                                        warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 33 packages in 169ms
 + aiofiles==24.1.0
 + aiohttp-socks==0.10.2
 + cffi==2.0.0
 + chardet==5.2.0
 + click==8.3.1
 + cryptography==46.0.3
 + gitdb==4.0.12
 + gitpython==3.1.45
 + h11==0.16.0
 + h2==4.3.0
 + hpack==4.1.0
 + hyperframe==6.1.0
 + jsonschema==4.25.1
 + jsonschema-specifications==2025.9.1
 + markdown-it-py==4.0.0
 + matrix-nio==0.25.2
 + mdurl==0.1.2
 + pycparser==2.23
 + pycryptodome==3.23.0
 + pygithub==2.8.1
 + pygments==2.19.2
 + pyjwt==2.10.1
 + pynacl==1.6.1
 + python-socks==2.7.3
 + referencing==0.37.0
 + rich==14.2.0
 + rpds-py==0.30.0
 + shellingham==1.5.4
 + smmap==5.0.2
 + toml==0.10.2
 + typer==0.20.0
 + unpaddedbase64==2.1.0
 + uv==0.9.16
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-08 11:07:19.240
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: f:\ComfyUI-Windows
** ComfyUI Base Folder Path: f:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

Prestartup times for custom nodes:
   4.2 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

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
ComfyUI version: 0.3.76
ComfyUI frontend version: 1.33.10
[Prompt Server] web root: F:\ComfyUI-Windows\.venv\Lib\site-packages\comfyui_frontend_package\static
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.0+rocmsdk20251116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 1)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Enabled pinned memory 29414.0
### Loading: ComfyUI-Manager (V3.38.1)
[ComfyUI-Manager] network_mode: public
### ComfyUI Version: v0.3.76-47-gfd271ded | Released on '2025-12-08'

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py
   0.5 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/110
FETCH ComfyRegistry Data: 10/110
FETCH ComfyRegistry Data: 15/110
FETCH ComfyRegistry Data: 20/110
FETCH ComfyRegistry Data: 25/110
FETCH ComfyRegistry Data: 30/110
FETCH ComfyRegistry Data: 35/110
FETCH ComfyRegistry Data: 40/110
FETCH ComfyRegistry Data: 45/110
FETCH ComfyRegistry Data: 50/110
FETCH ComfyRegistry Data: 55/110
FETCH ComfyRegistry Data: 60/110
FETCH ComfyRegistry Data: 65/110
FETCH ComfyRegistry Data: 70/110
FETCH ComfyRegistry Data: 75/110
FETCH ComfyRegistry Data: 80/110
FETCH ComfyRegistry Data: 85/110
FETCH ComfyRegistry Data: 90/110
FETCH ComfyRegistry Data: 95/110
FETCH ComfyRegistry Data: 100/110
FETCH ComfyRegistry Data: 105/110
FETCH ComfyRegistry Data: 110/110
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'title': 'Img Label Tools', 'id': 'Img-Label-Tools', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'install_type': 'git-clone', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.'}
[ComfyUI-Manager] All startup tasks have been completed.

```

</details>


### EXPORT PNG

This allows exporting the workflow as png that can be imported as workflow

<details>
<summary>CMD Line Output</summary>

```cmd
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'title': 'Img Label Tools', 'id': 'Img-Label-Tools', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'install_type': 'git-clone', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.'}
[ComfyUI-Manager] All startup tasks have been completed.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1514988643_custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.', 'id': 'Img-Label-Tools', 'install_type': 'git-clone', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'title': 'Img Label Tools'}
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extras.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1742899825_extension-node-map.json [DONE]
100%|█████████████████████████████████████████████████████████████████████████████| 24.2k/24.2k [00:00<00:00, 1.41MB/s]
Extracted zip file to F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image

[ComfyUI-Manager] Queued works are completed.
{'install': 1}

After restarting ComfyUI, please refresh the browser.

Restarting... [Legacy Mode]

```

</details>

### ComfyLiterals

This custom node has numbers nodes, it's convenient to set resolution and such

https://github.com/M1kep/ComfyLiterals


### Remove Background

[ComfyUI-RMBG](https://github.com/1038lab/ComfyUI-RMBG)

<details>
<summary>DETAILS</summary>

[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1514988643_custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.', 'id': 'Img-Label-Tools', 'install_type': 'git-clone', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'title': 'Img Label Tools'}
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\832903789_extras.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1742899825_extension-node-map.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1742899825_extension-node-map.json [DONE]
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1514988643_custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.', 'id': 'Img-Label-Tools', 'install_type': 'git-clone', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'title': 'Img Label Tools'}
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\832903789_extras.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1742899825_extension-node-map.json [DONE]
100%|█████████████████████████████████████████████████████████████████████████████| 1.97M/1.97M [00:00<00:00, 9.09MB/s]
Extracted zip file to F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg
Install: pip packages

[ComfyUI-Manager] Queued works are completed.
{'install': 1}

After restarting ComfyUI, please refresh the browser.

Restarting... [Legacy Mode]


Command: ['"F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe"', '"main.py"']
[START] Security scan
[ComfyUI-Manager] `python -m pip` not available. Falling back to `uv`.
[ComfyUI-Manager] Using `uv` as Python module for pip operations.
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-12-08 15:01:49.073
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: f:\ComfyUI-Windows
** ComfyUI Base Folder Path: f:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

#######################################################################
[ComfyUI-Manager] Starting dependency installation/(de)activation for the extension


## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'huggingface-hub>=0.19.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 14ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'transparent-background>=1.1.2']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 51 packages in 1.24s
[!] Downloading timm (2.4MiB)
[!] Downloading llvmlite (36.4MiB)
[!] Downloading numba (2.6MiB)
[!] Downloading opencv-python (37.2MiB)
[!] Downloading opencv-python-headless (37.1MiB)
[!]  Downloaded timm
[!]  Downloaded numba
[!]  Downloaded llvmlite
[!]  Downloaded opencv-python-headless
[!]  Downloaded opencv-python
[!] Prepared 16 packages in 12.11s
[!] Uninstalled 1 package in 63ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 18 packages in 340ms
[!]  + albucore==0.0.24
[!]  + albumentations==2.0.8
[!]  + beautifulsoup4==4.14.3
[!]  + easydict==1.13
[!]  + gdown==5.2.0
[!]  + llvmlite==0.45.1
[!]  + numba==0.62.1
[!]  - numpy==2.3.5
[!]  + numpy==2.2.6
[!]  + opencv-python==4.12.0.88
[!]  + opencv-python-headless==4.12.0.88
[!]  + pymatting==1.1.14
[!]  + pysocks==1.7.1
[!]  + simsimd==6.5.3
[!]  + soupsieve==2.8
[!]  + stringzilla==4.4.0
[!]  + timm==1.0.22
[!]  + transparent-background==1.3.4
[!]  + wget==3.2

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'segment-anything>=1.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 1 package in 99ms
[!] Prepared 1 package in 22ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 11ms
[!]  + segment-anything==1.0

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'groundingdino-py>=0.4.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 46 packages in 1.13s
[!]    Building groundingdino-py==0.4.0
[!] Downloading matplotlib (7.7MiB)
[!] Downloading fonttools (2.2MiB)
[!]       Built groundingdino-py==0.4.0
[!]  Downloaded fonttools
[!]  Downloaded matplotlib
[!] Prepared 11 packages in 1.16s
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 14 packages in 137ms
[!]  + addict==2.4.0
[!]  + contourpy==1.3.3
[!]  + cycler==0.12.1
[!]  + fonttools==4.61.0
[!]  + groundingdino-py==0.4.0
[!]  + kiwisolver==1.4.9
[!]  + matplotlib==3.10.7
[!]  + platformdirs==4.5.1
[!]  + pycocotools==2.0.10
[!]  + pyparsing==3.2.5
[!]  + python-dateutil==2.9.0.post0
[!]  + six==1.17.0
[!]  + supervision==0.6.0
[!]  + yapf==0.43.0

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'opencv-python>=4.7.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 4ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'onnxruntime>=1.15.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 10 packages in 220ms
[!] Downloading onnxruntime (12.8MiB)
[!]  Downloaded onnxruntime
[!] Prepared 2 packages in 2.57s
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 6 packages in 70ms
[!]  + coloredlogs==15.0.1
[!]  + flatbuffers==25.9.23
[!]  + humanfriendly==10.0
[!]  + onnxruntime==1.23.2
[!]  + protobuf==6.33.2
[!]  + pyreadline3==3.5.4

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'onnxruntime-gpu>=1.15.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 10 packages in 113ms
[!] Downloading onnxruntime-gpu (233.2MiB)
[!]  Downloaded onnxruntime-gpu
[!] Prepared 1 package in 25.41s
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 129ms
[!]  + onnxruntime-gpu==1.23.2

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'protobuf>=3.20.2,<6.0.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 1 package in 53ms
[!] Uninstalled 1 package in 2ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 25ms
[!]  - protobuf==6.33.2
[!]  + protobuf==5.29.5

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'hydra-core>=1.3.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 5 packages in 132ms
[!]    Building antlr4-python3-runtime==4.9.3
[!]       Built antlr4-python3-runtime==4.9.3
[!] Prepared 2 packages in 650ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 3 packages in 34ms
[!]  + antlr4-python3-runtime==4.9.3
[!]  + hydra-core==1.3.2
[!]  + omegaconf==2.3.0

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'omegaconf>=2.3.0']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Audited 1 package in 5ms

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'iopath>=0.1.9']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 6 packages in 695ms
[!]    Building iopath==0.1.10
[!] Downloading pywin32 (9.1MiB)
[!]       Built iopath==0.1.10
[!]  Downloaded pywin32
[!] Prepared 3 packages in 907ms
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 3 packages in 111ms
[!]  + iopath==0.1.10
[!]  + portalocker==3.2.0
[!]  + pywin32==311

## ComfyUI-Manager: EXECUTE => ['F:\\ComfyUI-Windows\\.venv\\Scripts\\python.exe', '-m', 'uv', 'pip', 'install', 'decord']

## Execute management script for 'F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg'
[!] Using Python 3.12.10 environment at: F:\ComfyUI-Windows\.venv
[!] Resolved 2 packages in 98ms
[!] Downloading decord (23.6MiB)
[!]  Downloaded decord
[!] Prepared 1 package in 2.53s
[!] warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
[!]          If the cache and target directories are on different filesystems, hardlinking may not be supported.
[!]          If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
[!] Installed 1 package in 26ms
[!]  + decord==0.6.0

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
** ComfyUI startup time: 2025-12-08 15:02:40.620
** Platform: Windows
** Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\ComfyUI-Windows\.venv\Scripts\python.exe
** ComfyUI Path: f:\ComfyUI-Windows
** ComfyUI Base Folder Path: f:\ComfyUI-Windows
** User directory: F:\ComfyUI-Windows\user
** ComfyUI-Manager config path: F:\ComfyUI-Windows\user\__manager\config.ini
** Log path: F:\ComfyUI-Windows\user\comfyui.log

Prestartup times for custom nodes:
   0.6 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager

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
ComfyUI version: 0.3.76
ComfyUI frontend version: 1.33.10
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
### Loading: ComfyUI-Manager (V3.38.1)
[ComfyUI-Manager] network_mode: public
### ComfyUI Version: v0.3.76-47-gfd271ded | Released on '2025-12-08'
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
F:\ComfyUI-Windows\.venv\Lib\site-packages\timm\models\layers\__init__.py:48: FutureWarning: Importing from timm.models.layers is deprecated, please import via timm.layers
  warnings.warn(f"Importing from {__name__} is deprecated, please import via timm.layers", FutureWarning)
F:\ComfyUI-Windows\.venv\Lib\site-packages\groundingdino\models\GroundingDINO\utils.py:61: SyntaxWarning: invalid escape sequence '\s'
  - memory: bs, \sum{hw}, d_model
Error loading AILab_SAM3Segment.py: No module named 'triton'
Warning: diffusers/transformers not available. SDMatte functionality will be limited.
[ComfyUI-RMBG] v2.9.4 | 32 nodes Loaded
Skip F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).

Import times for custom nodes:
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\ComfyUI-Windows\custom_nodes\minimal-workflow-image
   0.0 seconds: F:\ComfyUI-Windows\custom_nodes\ComfyLiterals
   0.3 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-manager
   2.6 seconds: F:\ComfyUI-Windows\custom_nodes\comfyui-rmbg

Context impl SQLiteImpl.
Will assume non-transactional DDL.
No target revision found.
Starting server

To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/110
FETCH ComfyRegistry Data: 10/110
FETCH ComfyRegistry Data: 15/110
FETCH ComfyRegistry Data: 20/110
FETCH ComfyRegistry Data: 25/110
FETCH ComfyRegistry Data: 30/110
FETCH ComfyRegistry Data: 35/110
FETCH ComfyRegistry Data: 40/110
FETCH ComfyRegistry Data: 45/110
FETCH ComfyRegistry Data: 50/110
FETCH ComfyRegistry Data: 55/110
FETCH ComfyRegistry Data: 60/110
FETCH ComfyRegistry Data: 65/110
FETCH ComfyRegistry Data: 70/110
FETCH ComfyRegistry Data: 75/110
FETCH ComfyRegistry Data: 80/110
FETCH ComfyRegistry Data: 85/110
FETCH ComfyRegistry Data: 90/110
FETCH ComfyRegistry Data: 95/110
FETCH ComfyRegistry Data: 100/110
FETCH ComfyRegistry Data: 105/110
FETCH ComfyRegistry Data: 110/110
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'title': 'Img Label Tools', 'id': 'Img-Label-Tools', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'install_type': 'git-clone', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.'}
[ComfyUI-Manager] All startup tasks have been completed.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[ComfyUI-Manager] The ComfyRegistry cache update is still in progress, so an outdated cache is being used.
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1514988643_custom-node-list.json [DONE]
[ComfyUI-Manager] broken item:{'author': 'rjgoif', 'description': 'Tools to help annotate images for sharing on Reddit, Discord, etc.', 'id': 'Img-Label-Tools', 'install_type': 'git-clone', 'reference': 'https://github.com/rjgoif/ComfyUI-Img-Label-Tools', 'title': 'Img Label Tools'}
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\746607195_github-stats.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\832903789_extras.json [DONE]
FETCH DATA from: F:\ComfyUI-Windows\user\__manager\cache\1742899825_extension-node-map.json [DONE]
got prompt
Failed to validate prompt for output 8:
* LoadImage 20:
  - Custom validation failed for node: image - Invalid image file: 2025-04-14a-candle.png
* AILab_ImageCompare 3:
  - Required input is missing: image1
Output will be ignored
Failed to validate prompt for output 10:
Output will be ignored
Failed to validate prompt for output 9:
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
got prompt
Failed to validate prompt for output 8:
* LoadImage 20:
  - Custom validation failed for node: image - Invalid image file: 2025-04-14a-candle.png
Output will be ignored
Failed to validate prompt for output 10:
Output will be ignored
Failed to validate prompt for output 9:
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
got prompt
Failed to validate prompt for output 8:
* LoadImage 20:
  - Custom validation failed for node: image - Invalid image file: 2025-04-14a-candle.png
Output will be ignored
Failed to validate prompt for output 10:
Output will be ignored
Failed to validate prompt for output 9:
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
got prompt
Downloading GroundingDINO_SwinT_OGC.cfg.py from https://huggingface.co/1038lab/GroundingDINO/resolve/main/GroundingDINO_SwinT_OGC.cfg.py ...
100%|█████████████████████████████████████████████████████████████████████████████████████| 0.98k/0.98k [00:00<?, ?B/s]
Downloading groundingdino_swint_ogc.pth from https://huggingface.co/1038lab/GroundingDINO/resolve/main/groundingdino_swint_ogc.pth ...
100%|███████████████████████████████████████████████████████████████████████████████| 662M/662M [01:08<00:00, 10.2MB/s]
F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\functional.py:505: UserWarning: torch.meshgrid: in an upcoming release, it will be required to pass the indexing argument. (Triggered internally at C:/b/pytorch/aten/src/ATen/native/TensorShape.cpp:4319.)
  return _VF.meshgrid(tensors, **kwargs)  # type: ignore[attr-defined]
final text_encoder_type: bert-base-uncased
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Downloading sam_vit_h.pth from https://huggingface.co/1038lab/sam/resolve/main/sam_vit_h.pth ...
100%|█████████████████████████████████████████████████████████████████████████████| 2.39G/2.39G [04:19<00:00, 9.90MB/s]
F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\modeling_utils.py:1621: FutureWarning: The `device` argument is deprecated and will be removed in v5 of Transformers.
  warnings.warn(
F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\_dynamo\eval_frame.py:1044: UserWarning: torch.utils.checkpoint: the use_reentrant parameter should be passed explicitly. Starting in PyTorch 2.9, calling checkpoint without use_reentrant will raise an exception. use_reentrant=False is recommended, but if you need to preserve the current default behavior, you can pass use_reentrant=True. Refer to docs for more details on the differences between the two variants.
  return fn(*args, **kwargs)
F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\utils\checkpoint.py:85: UserWarning: None of the inputs have requires_grad=True. Gradients will be None
  warnings.warn(
F:\ComfyUI-Windows\.venv\Lib\site-packages\groundingdino\models\GroundingDINO\transformer.py:862: FutureWarning: `torch.cuda.amp.autocast(args...)` is deprecated. Please use `torch.amp.autocast('cuda', args...)` instead.
  with torch.cuda.amp.autocast(enabled=False):
Prompt executed in 382.01 seconds

</details>



---

# GENERATIONS

Time to see what ROCm 7.1 is made off

This prompt stresses hand generation, pose generation and ability to retain many different elements in the image with different colors.

```
Realistic, masterpiece. A sorrowful elf girl with white braided hair. She is wearing a tattered white dress and a red blindfold fully covering her eyes. She is kneeling at an ancient stone altar in a field of black roses. She is weaving a long tapestry with runes. Sunny blue sky, wind tousling her long hair
```

## SD1.5

SD1.5 is an old model it is wonky on anatomy, and doesn't have good prompt adherence. It is very fast, and has control nets. Kernel is 512px in size, it creates mirroring artefact when trying to make bigger images.

| Field        | SD1.5       |
|--------------|-------------|
| Size         | 512 x 512   |
| Sampler      | euler       |
| Scheduler    | simple      |
| Steps        | 20          |
| Cfg          | 8.0         |
| First run    | 4.41        |
| Second run   | 1.40        |
| Max VRAM     | 9 GB        |
| Max power    | 388 W       |

The hello world of Comfy UI

<details>
<summary>SD1.5 DETAILS</summary>

**WORKFLOW**

![Workflow](/workflows/2025-12-08-txt2img-SD15.png)

**IMAGE OUTPUT (best of 2)**

![](/outputs/2025-12-08-T1214-SD15-txt2img-benchmark.png)

**CMD LINE OUTPUT**

```cmd
got prompt
model weight dtype torch.float16, manual cast: None
model_type EPS
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load SD1ClipModel
loaded completely; 22892.08 MB usable, 235.84 MB loaded, full load: True
Requested to load BaseModel
loaded completely; 22406.89 MB usable, 1639.41 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 12.22it/s]
Requested to load AutoencoderKL
loaded completely; 18554.06 MB usable, 159.56 MB loaded, full load: True
Prompt executed in 4.41 seconds

got prompt
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 17.32it/s]
Prompt executed in 1.40 seconds
```

**RESOURCE MONITOR**

![](/images/2025-12-08-T1101%20SD15%20Utilization.png)

</details>


4.4s first run

1.4s second run

looks competent, I had listed 2s on previous build, it could be faster. but this is easy. The VAE decode is what ROCm really struggles with.

## Flux Dev FP8

Flux Dev has been a solid model for many months, it has good prompt adherence, good image output.

I'm using a FP8 16.8GB dev safetensor with CLIP and VAE all in one, I don't remember the download link

| Field        | FLUX        |
|--------------|-------------|
| Size         | 1024 x 1024 |
| Sampler      | euler       |
| Scheduler    | simple      |
| Steps        | 20          |
| First run    | 50.7s       |
| Second run   | 33.01s      |
| Max VRAM     | 22 GB       |
| Max power    | 388 W       |


<details>
<summary>FLUX DETAILS</summary>


**WORKFLOW**

Model, I'm not sure it's this one I used

[Flux Dev FP8 CLIP+DIFFUSION+VAE](https://huggingface.co/wangkanai/flux-dev-fp8/blob/main/checkpoints/flux1-dev-fp8.safetensors)

Place in the checkpoint folder

```
F:\ComfyUI-Windows\models\checkpoints\Flux-dev-fp8-16G8.safetensors
```

![](/workflows/2025-12-08-T1157-FLUX-txt2img.png)


**IMAGE OUTPUT (best of 2)**

![](/outputs/2025-12-08-T1152-FLUX-T2I-DEMO.png)

**CMD LINE OUTPUT**

Tiled VEA Decoding (shouldn't be needed if you can make VAE work properly)

```
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
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:28<00:00,  1.41s/it]
Requested to load AutoencodingEngine
Unloaded partially: 511.32 MB freed, 10838.79 MB remains loaded, 27.01 MB buffer reserved, lowvram patches: 0
loaded completely; 5118.21 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 50.27 seconds
got prompt
invalid prompt: {'type': 'invalid_prompt', 'message': 'Cannot execute because a node is missing the class_type property.', 'details': "Node ID '#96'", 'extra_info': {}}
got prompt
loaded completely; 15293.81 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.38s/it]
Requested to load AutoencodingEngine
Unloaded partially: 565.34 MB freed, 10784.77 MB remains loaded, 27.01 MB buffer reserved, lowvram patches: 0
loaded completely; 5131.04 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 33.01 seconds
```

VAE Decoding

```
got prompt
Requested to load FluxClipModel_
loaded completely; 22537.17 MB usable, 4777.54 MB loaded, full load: True
Requested to load Flux
loaded completely; 15739.81 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.36s/it]
Requested to load AutoencodingEngine
Unloaded partially: 247.23 MB freed, 11102.87 MB remains loaded, 9.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5111.80 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 35.25 seconds
got prompt
loaded completely; 15545.81 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.38s/it]
Requested to load AutoencodingEngine
Unloaded partially: 247.23 MB freed, 11102.87 MB remains loaded, 9.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5111.80 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 30.20 seconds
```

**RESOURCE MONITOR**

![](/images/2025-12-08-T1138%20Flux%20Dev%201024.png)

</details>


## HiDream


## Z Image Turbo

The new kid on the block, as a turbo model it's trained to converge a lot faster, so the steps are more expensive, but there are fewer of them

- diffusion_models: z_image_turbo_bf16_12G0.safetensors
- text_encoders: qwen3_4b_7G8.safetensors
- vae: z_image_turbo_vae_0G3.safetensors

| Field        | Z Image Turbo | Notes |
|--------------|-------------|-|
| Size         | 1024 x 1024 | |
| Shift        | 3 |  high: focus on composition, low focus on details |
| Sampler      | res_sample  | |
| Scheduler    | simple      ||
| Steps        | 9          ||
| First run    | 64.7s       ||
| Second run   | 37.59s      ||
| Max VRAM     | 23 GB       ||
| Max power    | 280 W       | This workflow drinks less juice then Flux|

Holy Glob this model is strong! 

<details>
<summary>DETAILS</summary>

**WORKFLOW** 

![](/workflows/2025-12-08-T1309-zit-txt2img.png)

**IMAGE OUTPUT (best of 2)**

![](/outputs/2025-12-08-T1238-ZIT-txt2img.png.png)

**CMD LINE OUTPUT**

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22469.61 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
unet missing: ['norm_final.weight']
Requested to load Lumina2
Unloaded partially: 6170.37 MB freed, 1501.88 MB remains loaded, 47.50 MB buffer reserved, lowvram patches: 0
loaded completely; 17117.77 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:35<00:00,  3.89s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1895.80 MB freed, 9843.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5584.32 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 53.94 seconds
got prompt
loaded completely; 18769.76 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.04s/it]
Unloaded partially: 714.55 MB freed, 11025.02 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
Prompt executed in 11.94 seconds
```

**RESOURCE MONITOR**

![](/images/2025-12-08-T1239.png)

</details>



## BACKGROUND REMOVAL

There are strong models to remove background and do segmentation of images and more

[Custom Node](https://github.com/1038lab/ComfyUI-RMBG/tree/main)

![](/workflows/2025-12-08-T1528-background-img2img.png)

<details>
<summary>DETAILS</summary>

```cmd
got prompt
Cache check: Missing model files: config.json, model.safetensors, birefnet.py, BiRefNet_config.py
Downloading required model files...
Downloading RMBG-2.0 model files...
Downloading config.json...
Downloading model.safetensors...
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Xet Storage is enabled for this repo, but the 'hf_xet' package is not installed. Falling back to regular HTTP download. For better performance, install the package with: `pip install huggingface_hub[hf_xet]` or `pip install hf_xet`
Downloading birefnet.py...
Downloading BiRefNet_config.py...
Model files downloaded successfully
Prompt executed in 96.50 seconds
```

</details>






# EOL
 ---

xxx



<details>
<summary>DETAILS</summary>

**WORKFLOW** 

**IMAGE OUTPUT (best of 2)**

**CMD LINE OUTPUT**

**RESOURCE MONITOR**

</details>


EOL
