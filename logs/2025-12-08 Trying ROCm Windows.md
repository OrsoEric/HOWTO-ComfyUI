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

[AMD Software: PyTorch on Windows Edition 7.1.1 Driver for Windows® 11](https://drivers.amd.com/drivers/amd-software-adrenalin-edition-25.20.01.17-win11-pytorch-combined.exe)


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

If you want to do anything, you'll need the node manager extension

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


## Models

### SD1.5

The hello world of Comfy UI

**SD1.5 512px**


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

Time to see what ROCm is made off

![](/images/2025-12-08-T1101%20SD15%20Utilization.png)

![](/images/2025-12-08-T1101%20SD15%20UOutput.png)

### Flux

```
F:\ComfyUI-Windows\models\checkpoints\Flux-dev-fp8-16G8.safetensors

```
