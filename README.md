# HOWTO-ComfyUI
This repo documents my workflows and stack to run comfy ui GenANI assist under windows

## Hardware 
- AMD RX 7900 XTX
- Intel 13700F
- DDR5 4x16GB 64GB 6400

## Stack

1) Windows 11
2) Adrenaline
3) HIP
4) WSL2
5) ROCm
6) Comfy UI

## Move files WSL VM <-> Host machine

Move models inside WSL

```
cp /mnt/f/SD-Zluda/ComfyUI/models/checkpoints/RMSD-XL-Aries-Fantasy.safetensors /home/soraka/ComfyUI/models/checkpoints
```

Move outputs to Host

```
cp /ComfyUI/output /mnt/f/downloads
```

## Front End

When updating Comfy UI, front end is not updated automatically

```
WARNING WARNING WARNING WARNING WARNING

Installed frontend version 1.14.5 is lower than the recommended version 1.18.6.

Please install the updated requirements.txt file by running:
/usr/bin/python3 -m pip install -r /home/soraka/ComfyUI/requirements.txt

This error is happening because the ComfyUI frontend is no longer shipped as part of the main repo but as a pip package instead.

If you are on the portable package you can run: update\update_comfyui.bat to solve this problem
```

#### Update Frontend with no Virtual Environment

To update, go into the folder, and install requirements. Not like the commandline suggested.


``` 
cd ComfyUI/
pip install -r requirements.txt
```

<details>
<summary>Output</summary>

```
soraka@TowerOfBabel:~$ cd ComfyUI/

soraka@TowerOfBabel:~/ComfyUI$ pip install -r requirements.txt

Defaulting to user installation because normal site-packages is not writeable
Collecting comfyui-frontend-package==1.18.6
  Downloading comfyui_frontend_package-1.18.6-py3-none-any.whl (9.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 9.0/9.0 MB 8.0 MB/s eta 0:00:00
Collecting comfyui-workflow-templates==0.1.3
  Downloading comfyui_workflow_templates-0.1.3-py3-none-any.whl (32.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 32.7/32.7 MB 8.0 MB/s eta 0:00:00
Requirement already satisfied: torch in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 3)) (2.4.0+rocm6.3.4.git7cecbf6d)
Requirement already satisfied: torchsde in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 4)) (0.2.6)
Requirement already satisfied: torchvision in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 5)) (0.19.0+rocm6.3.4.gitfab84886)
Requirement already satisfied: torchaudio in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 6)) (2.4.0+rocm6.3.4.git69d40773)
Requirement already satisfied: numpy>=1.25.0 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 7)) (1.26.4)
Requirement already satisfied: einops in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 8)) (0.8.1)
Requirement already satisfied: transformers>=4.28.1 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 9)) (4.49.0)
Requirement already satisfied: tokenizers>=0.13.3 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 10)) (0.21.0)
Requirement already satisfied: sentencepiece in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 11)) (0.2.0)
Requirement already satisfied: safetensors>=0.4.2 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 12)) (0.5.3)
Requirement already satisfied: aiohttp>=3.11.8 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 13)) (3.11.13)
Requirement already satisfied: yarl>=1.18.0 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 14)) (1.18.3)
Requirement already satisfied: pyyaml in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 15)) (6.0.2)
Requirement already satisfied: Pillow in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 16)) (11.1.0)
Requirement already satisfied: scipy in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 17)) (1.15.2)
Requirement already satisfied: tqdm in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 18)) (4.67.1)
Requirement already satisfied: psutil in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 19)) (7.0.0)
Requirement already satisfied: kornia>=0.7.1 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 22)) (0.8.0)
Requirement already satisfied: spandrel in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 23)) (0.4.1)
Requirement already satisfied: soundfile in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 24)) (0.13.1)
Requirement already satisfied: av>=14.2.0 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 25)) (14.2.0)
Requirement already satisfied: pydantic~=2.0 in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 26)) (2.10.6)
Requirement already satisfied: pytorch-triton-rocm==3.0.0+rocm6.3.4.git75cc27c2 in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (3.0.0+rocm6.3.4.git75cc27c2)
Requirement already satisfied: sympy<=1.12.1 in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (1.12.1)
Requirement already satisfied: typing-extensions>=4.8.0 in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (4.12.2)
Requirement already satisfied: networkx in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (3.4.2)
Requirement already satisfied: fsspec in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (2024.12.0)
Requirement already satisfied: filelock in /home/soraka/.local/lib/python3.10/site-packages (from torch->-r requirements.txt (line 3)) (3.17.0)
Requirement already satisfied: jinja2 in /usr/lib/python3/dist-packages (from torch->-r requirements.txt (line 3)) (3.0.3)
Requirement already satisfied: trampoline>=0.1.2 in /home/soraka/.local/lib/python3.10/site-packages (from torchsde->-r requirements.txt (line 4)) (0.1.2)
Requirement already satisfied: requests in /home/soraka/.local/lib/python3.10/site-packages (from transformers>=4.28.1->-r requirements.txt (line 9)) (2.32.3)
Requirement already satisfied: regex!=2019.12.17 in /home/soraka/.local/lib/python3.10/site-packages (from transformers>=4.28.1->-r requirements.txt (line 9)) (2024.11.6)
Requirement already satisfied: huggingface-hub<1.0,>=0.26.0 in /home/soraka/.local/lib/python3.10/site-packages (from transformers>=4.28.1->-r requirements.txt (line 9)) (0.29.2)
Requirement already satisfied: packaging>=20.0 in /home/soraka/.local/lib/python3.10/site-packages (from transformers>=4.28.1->-r requirements.txt (line 9)) (24.2)
Requirement already satisfied: multidict<7.0,>=4.5 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (6.1.0)
Requirement already satisfied: async-timeout<6.0,>=4.0 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (5.0.1)
Requirement already satisfied: aiohappyeyeballs>=2.3.0 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (2.5.0)
Requirement already satisfied: attrs>=17.3.0 in /usr/lib/python3/dist-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (21.2.0)
Requirement already satisfied: frozenlist>=1.1.1 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (1.5.0)
Requirement already satisfied: aiosignal>=1.1.2 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (1.3.2)
Requirement already satisfied: propcache>=0.2.0 in /home/soraka/.local/lib/python3.10/site-packages (from aiohttp>=3.11.8->-r requirements.txt (line 13)) (0.3.0)
Requirement already satisfied: idna>=2.0 in /usr/lib/python3/dist-packages (from yarl>=1.18.0->-r requirements.txt (line 14)) (3.3)
Requirement already satisfied: kornia_rs>=0.1.0 in /home/soraka/.local/lib/python3.10/site-packages (from kornia>=0.7.1->-r requirements.txt (line 22)) (0.1.8)
Requirement already satisfied: cffi>=1.0 in /home/soraka/.local/lib/python3.10/site-packages (from soundfile->-r requirements.txt (line 24)) (1.17.1)
Requirement already satisfied: annotated-types>=0.6.0 in /home/soraka/.local/lib/python3.10/site-packages (from pydantic~=2.0->-r requirements.txt (line 26)) (0.7.0)
Requirement already satisfied: pydantic-core==2.27.2 in /home/soraka/.local/lib/python3.10/site-packages (from pydantic~=2.0->-r requirements.txt (line 26)) (2.27.2)
Requirement already satisfied: pycparser in /home/soraka/.local/lib/python3.10/site-packages (from cffi>=1.0->soundfile->-r requirements.txt (line 24)) (2.22)
Requirement already satisfied: mpmath<1.4.0,>=1.1.0 in /home/soraka/.local/lib/python3.10/site-packages (from sympy<=1.12.1->torch->-r requirements.txt (line 3)) (1.3.0)
Requirement already satisfied: urllib3<3,>=1.21.1 in /home/soraka/.local/lib/python3.10/site-packages (from requests->transformers>=4.28.1->-r requirements.txt (line 9)) (1.26.20)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/soraka/.local/lib/python3.10/site-packages (from requests->transformers>=4.28.1->-r requirements.txt (line 9)) (3.4.1)
Requirement already satisfied: certifi>=2017.4.17 in /usr/lib/python3/dist-packages (from requests->transformers>=4.28.1->-r requirements.txt (line 9)) (2020.6.20)
Installing collected packages: comfyui-workflow-templates, comfyui-frontend-package
  Attempting uninstall: comfyui-frontend-package
    Found existing installation: comfyui_frontend_package 1.14.5
    Uninstalling comfyui_frontend_package-1.14.5:
      Successfully uninstalled comfyui_frontend_package-1.14.5
Successfully installed comfyui-frontend-package-1.18.6 comfyui-workflow-templates-0.1.3
```

</details>



#### Update Frontend with Virtual Environment

Now I'm using sh scripts, this way when I have to redo it, I can use the lesson learned in the scripts. I do use a constraint file to enforce use of the correct ROCm binaries, preventing it to be bricked

``` 
#!/bin/bash
#	sudo chmod +x update_comfyui_frontend.sh
#	./update_comfyui_frontend.sh
#setup safety
set -euo pipefail
#go into ComfyUI
cd
cd ComfyUI
#Activate UV
source Dreamy/bin/activate
#Install ComfyUI requirements, along frontend that is a requirement
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 
```

<details>
<summary>Update frontend log</summary>

eridia@TowerOfBabel:~/ComfyUI$ sudo chmod +x update_comfyui_frontend.sh
[sudo] password for meridia:
meridia@TowerOfBabel:~/ComfyUI$ ./update_comfyui_frontend.sh
Using Python 3.12.10 environment at: Dreamy
Resolved 56 packages in 472ms
Prepared 2 packages in 11.13s
Uninstalled 2 packages in 13ms
Installed 2 packages in 27ms
 - comfyui-frontend-package==1.19.9
 + comfyui-frontend-package==1.20.7
 - comfyui-workflow-templates==0.1.14
 + comfyui-workflow-templates==0.1.22

</details>

## BUG: VAE defaults to FP32 instead of BF16

At 2048x2048 Ksampler just needs around 19GB VRAM and completes successfully.
At 2048x2048 the VAE decode far exceeed the 24GB VRAM buffer even at 1280x1280 resolution causing Adrenaline to crash into a blackscreen.
Ofter Adrenaline can recover, but at times, the computer freezes needing reboot.

<details>
<summary>VAE Adrenaline Crash</summary>
This is a minimum workflow meant to isolate the VAE bug. It loads an image, resize it, then VAE encode and VAE decode it.

At 1024px The VAE encode and decode stages work using 10.2GB

At 1536px the VAE encode succeed at around 13GB, but the VAE decode climbs to 24GB, adrenaline crashes, then the driver recovers with bug report, and after a couple of minutes, the VAE decode actually finishes rendering at around 19GB of VRAM used

![VAE Adrenaline Crash](/workflows/bug-vae-decode-adrenaline-crash.png)

got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
Requested to load AutoencodingEngine
loaded completely 10972.8359375 319.7467155456543 True
Prompt executed in 0.77 seconds
got prompt
0 models unloaded.
Prompt executed in 142.60 seconds
</details>

### MIOPEN_FIND_MODE

[MIOPEN_FIND_MODE](https://rocmdocs.amd.com/projects/MIOpen/en/latest/how-to/find-and-immediate.html#find-modes)

There are flags that can be exported before running ComfyUI that perhaps help

E.g. with mode 2, the standalone workflow no longer crashes even at 2048px

<details>
<summary>MIOPEN_FIND_MODE=2</summary>

```
soraka@TowerOfBabel:~$ export MIOPEN_FIND_MODE=2
soraka@TowerOfBabel:~$ python3 ComfyUI/main.py
```

```
[START] Security scan
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-05-09 12:24:57.498
** Platform: Linux
** Python version: 3.10.12 (main, Feb  4 2025, 14:57:36) [GCC 11.4.0]
** Python executable: /usr/bin/python3
** ComfyUI Path: /home/soraka/ComfyUI
** ComfyUI Base Folder Path: /home/soraka/ComfyUI
** User directory: /home/soraka/ComfyUI/user
** ComfyUI-Manager config path: /home/soraka/ComfyUI/user/default/ComfyUI-Manager/config.ini
** Log path: /home/soraka/ComfyUI/user/comfyui.log

Prestartup times for custom nodes:
   1.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-manager

Checkpoint files will always be loaded safely.
Total VRAM 24514 MB, total RAM 32012 MB
pytorch version: 2.4.0+rocm6.3.4.git7cecbf6d
/home/soraka/.local/lib/python3.10/site-packages/torch/cuda/__init__.py:645: UserWarning: Can't initialize amdsmi - Error code: 34
  warnings.warn(f"Can't initialize amdsmi - Error code: {e.err_code}")
AMD arch: gfx1100
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using sub quadratic optimization for attention, if you have memory or speed issues try using: --use-split-cross-attention
Python version: 3.10.12 (main, Feb  4 2025, 14:57:36) [GCC 11.4.0]
ComfyUI version: 0.3.31
ComfyUI frontend version: 1.18.6
[Prompt Server] web root: /home/soraka/.local/lib/python3.10/site-packages/comfyui_frontend_package/static
[Crystools INFO] Crystools version: 1.22.1
[Crystools INFO] CPU: 13th Gen Intel(R) Core(TM) i7-13700F - Arch: x86_64 - OS: Linux 5.15.167.4-microsoft-standard-WSL2
[Crystools ERROR] Could not init pynvml (Nvidia).NVML Shared Library Not Found
[Crystools WARNING] No GPU with CUDA detected.
Could not load bitsandbytes native library: 'NoneType' object has no attribute 'split'
Traceback (most recent call last):
  File "/home/soraka/.local/lib/python3.10/site-packages/bitsandbytes/cextension.py", line 85, in <module>
    lib = get_native_library()
  File "/home/soraka/.local/lib/python3.10/site-packages/bitsandbytes/cextension.py", line 64, in get_native_library
    cuda_specs = get_cuda_specs()
  File "/home/soraka/.local/lib/python3.10/site-packages/bitsandbytes/cuda_specs.py", line 39, in get_cuda_specs
    cuda_version_string=(get_cuda_version_string()),
  File "/home/soraka/.local/lib/python3.10/site-packages/bitsandbytes/cuda_specs.py", line 29, in get_cuda_version_string
    major, minor = get_cuda_version_tuple()
  File "/home/soraka/.local/lib/python3.10/site-packages/bitsandbytes/cuda_specs.py", line 24, in get_cuda_version_tuple
    major, minor = map(int, torch.version.cuda.split("."))
AttributeError: 'NoneType' object has no attribute 'split'

CUDA Setup failed despite CUDA being available. Please run the following command to get more information:

python -m bitsandbytes

Inspect the output of the command and see if you can locate CUDA libraries. You might need to add them
to your LD_LIBRARY_PATH. If you suspect a bug, please take the information from python -m bitsandbytes
and open an issue at: https://github.com/bitsandbytes-foundation/bitsandbytes/issues

xFormers not available
xFormers not available
Flash attention 2 is not installed
Web extensions folder found at /home/soraka/ComfyUI/web/extensions/ComfyLiterals
WAS Node Suite: OpenCV Python FFMPEG support is enabled
WAS Node Suite Warning: `ffmpeg_bin_path` is not set in `/home/soraka/ComfyUI/custom_nodes/was-node-suite-comfyui/was_suite_config.json` config file. Will attempt to use system ffmpeg binaries if available.
WAS Node Suite: Finished. Loaded 220 nodes successfully.

        "Your work is going to fill a large part of your life, and the only way to be truly satisfied is to do what you believe is great work." - Steve Jobs

[nltk_data] Downloading package punkt_tab to /home/soraka/nltk_data...
[nltk_data]   Package punkt_tab is already up-to-date!
### Loading: ComfyUI-Manager (V3.31.9)
[ComfyUI-Manager] network_mode: public
### ComfyUI Revision: 3428 [76899171] *DETACHED | Released on '2025-05-03'

Import times for custom nodes:
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/websocket_image_save.py
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-inpaint-cropandstitch
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/ComfyUI-TiledDiffusion
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-custom-scripts
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-depthanythingv2
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyliterals
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/gguf
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui_essentials
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-web-viewer
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui_ttp_toolset
   0.0 seconds: /home/soraka/ComfyUI/custom_nodes/ComfyUI_bnb_nf4_fp4_Loaders
   0.1 seconds: /home/soraka/ComfyUI/custom_nodes/ComfyUI-Whisper
   0.1 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-kokoro
   0.1 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-florence2
   0.1 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-manager
   0.2 seconds: /home/soraka/ComfyUI/custom_nodes/ComfyUI-Crystools
   0.2 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-if_ai_wishperspeechnode
   0.2 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui_parlertts
   0.3 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-hunyan3dwrapper
   0.4 seconds: /home/soraka/ComfyUI/custom_nodes/was-node-suite-comfyui

WARNING: Found example workflow folder 'examples' for custom node 'comfyui_ttp_toolset', consider renaming it to 'example_workflows'
Starting server

To see the GUI go to: http://127.0.0.1:8188
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json
FETCH ComfyRegistry Data: 5/84
FETCH ComfyRegistry Data: 10/84
FETCH ComfyRegistry Data: 15/84
FETCH ComfyRegistry Data: 20/84
FETCH ComfyRegistry Data: 25/84
FETCH ComfyRegistry Data: 30/84
FETCH ComfyRegistry Data: 35/84
FETCH ComfyRegistry Data: 40/84
FETCH ComfyRegistry Data: 45/84
FETCH ComfyRegistry Data: 50/84
FETCH ComfyRegistry Data: 55/84
FETCH ComfyRegistry Data: 60/84
FETCH ComfyRegistry Data: 65/84
FETCH ComfyRegistry Data: 70/84
FETCH ComfyRegistry Data: 75/84
FETCH ComfyRegistry Data: 80/84
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
Requested to load AutoencodingEngine
loaded completely 8881.178125 319.7467155456543 True
Prompt executed in 2.72 seconds
got prompt
0 models unloaded.
0 models unloaded.
Prompt executed in 42.79 seconds
```

</details>

Sometimes it doesn't find the GPU with this flag active

<details>
<summary>MIOPEN_FIND_MODE GPU not found</summary>

```
soraka@TowerOfBabel:~$ export MIOPEN_FIND_MODE=FAST
soraka@TowerOfBabel:~$ python3 ComfyUI/main.py
[START] Security scan
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2025-05-09 11:35:48.625
** Platform: Linux
** Python version: 3.10.12 (main, Feb  4 2025, 14:57:36) [GCC 11.4.0]
** Python executable: /usr/bin/python3
** ComfyUI Path: /home/soraka/ComfyUI
** ComfyUI Base Folder Path: /home/soraka/ComfyUI
** User directory: /home/soraka/ComfyUI/user
** ComfyUI-Manager config path: /home/soraka/ComfyUI/user/default/ComfyUI-Manager/config.ini
** Log path: /home/soraka/ComfyUI/user/comfyui.log

Prestartup times for custom nodes:
   1.0 seconds: /home/soraka/ComfyUI/custom_nodes/comfyui-manager

Checkpoint files will always be loaded safely.
Traceback (most recent call last):
  File "/home/soraka/ComfyUI/main.py", line 137, in <module>
    import execution
  File "/home/soraka/ComfyUI/execution.py", line 13, in <module>
    import nodes
  File "/home/soraka/ComfyUI/nodes.py", line 22, in <module>
    import comfy.diffusers_load
  File "/home/soraka/ComfyUI/comfy/diffusers_load.py", line 3, in <module>
    import comfy.sd
  File "/home/soraka/ComfyUI/comfy/sd.py", line 7, in <module>
    from comfy import model_management
  File "/home/soraka/ComfyUI/comfy/model_management.py", line 221, in <module>
    total_vram = get_total_memory(get_torch_device()) / (1024 * 1024)
  File "/home/soraka/ComfyUI/comfy/model_management.py", line 172, in get_torch_device
    return torch.device(torch.cuda.current_device())
  File "/home/soraka/.local/lib/python3.10/site-packages/torch/cuda/__init__.py", line 882, in current_device
    _lazy_init()
  File "/home/soraka/.local/lib/python3.10/site-packages/torch/cuda/__init__.py", line 314, in _lazy_init
    torch._C._cuda_init()
RuntimeError: No HIP GPUs are available
```
</details>

# Quantization

Models exist in a variety of quants

- FP16/BF16: two bytes per parameter, uncompressed, undistilled
- FP8: one byte per parameter. 7900XTX seems to not support it, promoting it to BF16, but it will still run a lot faster than FP16
- NF4: half a byte per parameter. 7900XTX will refuse to run it at all
- Q8: GGUF models one byte per parameter
- Q4KS: GGUF model, half a byte per parameter. the 7900XTX will run it.

# IMAGE MODELS

- SD15 Stable Diffusion 1.5: 512px model 2s rendering time
- SDXL-Turbo: 768px model 6s rendering time
- Flux: high performance model capable of text, 60s rendering time
- HiDream: High performance model, 90s renering time

# TXT2IMG, IMG2IMG: SD1.5

It's an old model that is very fast and small 2GB. It's not very good at following prompts, it has a base sampling of 512px, meaning on large images it tends to create warped mirrored prompts.

Being small, it can run easily on smaller cards, it's easier to fine tune and it's easier to run control nets and tiled upscale workflows, it can be worth it depending on the task.

## Control Net: SD1.5 Depth

Depth starts with generating a depth map of the input image, then using that as guidance to create an output image that conforms to the depth map.

This is useful to create images that have the same structure as the input image, but completely different styles and colors.

![Workflow](/workflows/img2img-sd15-depth.png)

Example: convert an image to black and white ink drawing

![Input](/images/img2img-sd15-depth-in.jpg)
![Output](/images/img2img-sd15-depth-out.png)

# TXT2IMG, IMG2IMG: SDXL

It's the architecture after SD1.5, is't a 7GB model that is more capable, and there are turbo variants that converge a lot faster. It's a step up from SD1.5, with bigger training image.

It is divided in two, a base model, and a refiner model, default is to do 20 step of base, and 5 step of refiner.

## Control Net: SDXL Depth

Like for SD1.5 there are depth control nets that works the same. You use the same depth map generation, but use a SDXL depth control net.

![Workflow](/workflows/img2img-sdxl-depth.png)

![Input](/images/img2img-sd15-depth-in.jpg)
![Output](/images/img2img-sdxl-depth-out.png)




# TXT2IMG, IMG2IMG: FLUX

Flux is a 12B parameter model. There are quants available. It is composed of a model, two clips, and the VAE.

### Difference beween quants

There are quants for the model, quants for the text encoder

- FP8 quant will run at around 60/45s at 1024px with 20GB used
- FP16 quant will run at around 90/70s at 1024px with 20GB used
- NF4 quant will not run at all

>!!! Exception during processing !!! 'NoneType' object has no attribute 'cdequantize_blockwise_bf16_nf4'

<details>
<summary>Flux NF4 Workflow</summary>

![Workflow](/workflows/FLUX-NF4-txt2img.png)
*PNG workflow for FLUX-txt2img. Drag and Drop to ComfyUI to load the workflow*

Model Links:
- [Flux NF4 lllyasviel](https://huggingface.co/lllyasviel/flux1-dev-bnb-nf4/tree/main)
- [VAE](https://huggingface.co/black-forest-labs/FLUX.1-schnell/blob/main/ae.safetensors)
</details>


## txt2img Flux FP16

Highest performance and processing.

![Workflow](/workflows/txt2img-flux-fp16.png)
*PNG workflow. Drag and Drop to ComfyUI to load the workflow. Download links inside the workflow*

## txt2img Flux FP8

Combining the Flux FP8 model with the FP16 text encoder seems to give the best results. The text encoder helps make a better image and better rendered texts while losing no speed.

![FLUX-txt2img](/workflows/txt2img-flux-fp8.png)
*PNG workflow for FLUX-txt2img. Drag and Drop to ComfyUI to load the workflow*

<details>
<summary>Workflow+Sample Image+CMD Output</summary>

FP8 model FP8 text encoder, default MIOPEN_FIND_MODE 
```
got prompt
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
Requested to load FluxClipModel_
loaded completely 9.5367431640625e+25 4777.53759765625 True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
loaded partially 9680.918730468751 9680.772521972656 0
100%|███████████████████████████████████████████████████████████████████████████████████| 20/20 [00:43<00:00,  2.19s/it]
Requested to load AutoencodingEngine
loaded completely 3786.4232421875004 319.7467155456543 True
[Tiled VAE]: input_size: torch.Size([1, 16, 128, 128]), tile_size: 128, padding: 11
[Tiled VAE]: split to 1x1 = 1 tiles. Optimal tile size 128x128, original tile size 128x128
[Tiled VAE]: Fast mode enabled, estimating group norm parameters on 128 x 128 image
[Tiled VAE]: Executing Decoder Task Queue: 100%|█████████████████████████████████████| 123/123 [00:00<00:00, 284.70it/s]
[Tiled VAE]: Done in 1.279s, max VRAM alloc 12694.351 MB
Prompt executed in 59.29 seconds
got prompt
loaded partially 11184.261076660157 11184.255920410156 0
100%|███████████████████████████████████████████████████████████████████████████████████| 20/20 [00:39<00:00,  1.97s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 3662.3070312500004 319.7467155456543 True
[Tiled VAE]: input_size: torch.Size([1, 16, 128, 128]), tile_size: 128, padding: 11
[Tiled VAE]: split to 1x1 = 1 tiles. Optimal tile size 128x128, original tile size 128x128
[Tiled VAE]: Fast mode enabled, estimating group norm parameters on 128 x 128 image
[Tiled VAE]: Executing Decoder Task Queue: 100%|████████████████████████████████████| 123/123 [00:00<00:00, 5941.42it/s]
[Tiled VAE]: Done in 1.088s, max VRAM alloc 10879.680 MB
Prompt executed in 44.08 seconds
```
FP8 model FP16 text encoder, MIOPEN_FIND_MODE=2
```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
Requested to load FluxClipModel_
loaded completely 9.5367431640625e+25 9319.23095703125 True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
clip missing: ['text_projection.weight']
Warning, This is not a checkpoint file, trying to load it as a diffusion model only.
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
WARNING: No VAE weights detected, VAE not initalized.
Requested to load Flux
loaded partially 8782.539824218751 8777.140747070312 0
100%|███████████████████████████████████████████████████████████████████████████████| 20/20 [01:19<00:00,  3.95s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 3676.5796875 319.7467155456543 True
Prompt executed in 109.48 seconds
got prompt
loaded partially 10044.137480468751 10037.293090820312 0
100%|███████████████████████████████████████████████████████████████████████████████| 20/20 [01:10<00:00,  3.54s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 3647.0281250000003 319.7467155456543 True
Prompt executed in 70.80 seconds
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
clip missing: ['text_projection.weight']
Requested to load FluxClipModel_
loaded completely 12782.8859375 9319.23095703125 True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load Flux
loaded partially 6707.31326171875 6707.133850097656 0
100%|███████████████████████████████████████████████████████████████████████████████| 20/20 [00:50<00:00,  2.54s/it]
Requested to load AutoencodingEngine
loaded completely 4315.430273437501 319.7467155456543 True
Prompt executed in 66.36 seconds
got prompt
loaded partially 10663.866545410157 10663.591857910156 0
100%|███████████████████████████████████████████████████████████████████████████████| 20/20 [00:41<00:00,  2.06s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 2551.1234375000004 319.7467155456543 True
Prompt executed in 42.56 seconds
```

</details>

NOTE: I have a 16.8GB fp8 model but I can't find the source,now fp8 models seems to be around 12GB.

## txt2img - Flux GGUF

This model uses the gguf loader instead of the safetensor loader. There are a number of quants, starting Q8 and going lower.

It understood black roses, but lost the elf ears, it's a different look, more photorealistic, and about same speed as FP8 model.

![Workflow](/workflows/txt2img-flux-gguf-q8.png)
*PNG workflow. Drag and Drop to ComfyUI to load the workflow. Download links inside the workflow*

<details>
<summary>Flux UNET GGUF Workflow</summary>

- [UNET GGUF](https://civitai.com/api/download/models/1532293?type=Model&format=GGUF&size=full&fp=fp8)
- [CLIP](https://civitai.com/api/download/models/1466488?type=Model&format=SafeTensor&size=full&fp=fp8)
- [Flux Text Encoder - default](https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/t5xxl_fp8_e4m3fn.safetensors)
- [Flux VAE - default](https://huggingface.co/black-forest-labs/FLUX.1-dev/blob/main/ae.safetensors)

</details>

## img2img - Flux

![Workflow](/workflows/img2img-flux.png)
*PNG workflow. Drag and Drop to ComfyUI to load the workflow. Download links inside the workflow*

## Control Net Flux Depth

![Workflow](/workflows/img2img-flux-depth.png)


# txt2img: Hidream

HiDream seems to have superior prompt adherence

![Workflow](/workflows/txt2img-hidream.png)

<details>
<summary>Hidream Settings</summary>
I tried Q4, Q5 and Q8 quants and all work on my 7900XTX
LCM/normal works
DEIS/SGM is slower but has much better results
LCM/simple, Euler and other combination give unimpressive details

For generation times I'm around 160s for first generation and 100s for second generation using around 19GB of VRAM

Having fixed the VAE issue, I can now directly generate 2048px images directly! Perhaps higher.
</details>

<details>
<summary>Hidream Model Download Links</summary>

[HiDream Dev Q4](https://huggingface.co/city96/HiDream-I1-Dev-gguf/tree/main)

[HiDream Clip L](https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/blob/main/split_files/text_encoders/clip_l_hidream.safetensors)

[HiDream CLIP G](https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/blob/main/split_files/text_encoders/clip_g_hidream.safetensors)

[Flux Text Encoder](https://huggingface.co/comfyanonymous/flux_text_encoders/blob/main/t5xxl_fp8_e4m3fn_scaled.safetensors)

[Hidream Text Encoder](https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/tree/main/split_files/text_encoders)

[HiDream LLM](https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/blob/main/split_files/text_encoders/llama_3.1_8b_instruct_fp8_scaled.safetensors)

[HiDream VAE](https://huggingface.co/Comfy-Org/HiDream-I1_ComfyUI/tree/main/split_files/vae)

</details>

<details>
<summary>CMD Line Output</summary>

```
got prompt
Requested to load HiDreamTEModel_
loaded partially 10597.60078125 10597.600215911865 0
Requested to load HiDream
loaded partially 4728.3201171875 4728.315673828125 0
100%|███████████████████████████████████████████████████████████████████████████████████| 30/30 [02:39<00:00,5.33s/it]

Requested to load AutoencodingEngine
0 models unloaded.
loaded completely 5629.887500000001 319.7467155456543 True
[Tiled VAE]: input_size: torch.Size([1, 16, 160, 160]), tile_size: 160, padding: 11
[Tiled VAE]: split to 1x1 = 1 tiles. Optimal tile size 160x160, original tile size 160x160
[Tiled VAE]: Fast mode enabled, estimating group norm parameters on 160 x 160 image
[Tiled VAE]: Executing Decoder Task Queue: 100%|████████████████████████████████████| 123/123 [00:00<00:00, 5947.10it/s]
[Tiled VAE]: Done in 1.670s, max VRAM alloc 5956.383 MB
Prompt executed in 165.04 seconds
```

</details>

# IMG TO STL - 3D WORKFLOW HUNYUAN

This workflow generate printable stl from images.

Download:
- [Model](https://huggingface.co/tencent/Hunyuan3D-2mini/blob/main/hunyuan3d-dit-v2-mini-turbo/model.fp16.safetensors)
- [VAE](https://huggingface.co/tencent/Hunyuan3D-2mini/blob/main/hunyuan3d-vae-v2-mini-turbo/model.fp16.safetensors) 

Workflow

![Workflow Hunyuan 3D](/workflows/Hunyuan-img2stl-background-remove.png)

Example Output

[Download STL](/stl/Candle-good.stl)

![](/images/Candle-3D-good.png)

## D&D Miniature

I used Hunyuan to make a prize for one of my PC. It took about two hours as I went back and forth with various poses and tried different geometries.

The thin mantle took some care to get right, it requires a really nice starting image that helps Hunyuan do it.

![](/stl/2025-04-14_KJho-Victorious.jpg)

[Download STL](/stl/2025-04-14-KJho-Victorious.stl)


<details>
<summary>Hunyuan 3D Workflow</summary>

CMD output

Mini Turbo model
```
got prompt
HiDream: ComfyUI is unloading all models, cleaning HiDream cache...
HiDream: Cleaning up all cached models...
HiDream: Cache cleared
image shape torch.Size([1, 3, 1024, 1024])
guidance:  tensor([9.], device='cuda:0', dtype=torch.float16)
Diffusion Sampling:: 100%|██████████████████████████████████████████████████████████| 75/75 [00:48<00:00,  1.56it/s]
latents shape:  torch.Size([1, 3072, 64])
Allocated memory: memory=1.434 GB
Max allocated memory: max_memory=6.207 GB
Max reserved memory: max_reserved=10.521 GB
Volume Decoding: 100%|██████████████████████████████████████████████████████████| 4501/4501 [00:59<00:00, 75.89it/s]
MC Surface Extractor
Decoded mesh with 752601 vertices and 1505220 faces
Removed floaters, resulting in 752601 vertices and 1505198 faces
Removed degenerate faces, resulting in 752601 vertices and 1505198 faces
Reduced faces, resulting in 25002 vertices and 50000 faces
Hy3DMeshInfo: Mesh has 25002 vertices and 50000 faces
Hy3DMeshInfo: Mesh has 752601 vertices and 1505220 faces
Prompt executed in 126.74 seconds
```

Initial Model
```
got prompt
/home/soraka/.local/lib/python3.10/site-packages/transparent_background/Remover.py:92: FutureWarning: You are using `torch.load` with `weights_only=False` (the current default value), which uses the default pickle module implicitly. It is possible to construct malicious pickle data which will execute arbitrary code during unpickling (See https://github.com/pytorch/pytorch/blob/main/SECURITY.md#untrusted-models for more details). In a future release, the default value for `weights_only` will be flipped to `True`. This limits the functions that could be executed during unpickling. Arbitrary objects will no longer be allowed to be loaded via this mode unless they are explicitly allowlisted by the user via `torch.serialization.add_safe_globals`. We recommend you start setting `weights_only=True` for any use case where you don't have full control of the loaded file. Please open an issue on GitHub for any issues related to this experimental feature.
  torch.load(os.path.join(ckpt_dir, ckpt_name), map_location="cpu"),
Settings -> Mode=base, Device=cuda:0, Torchscript=enabled
HiDream: ComfyUI is unloading all models, cleaning HiDream cache...
HiDream: Cleaning up all cached models...
HiDream: Cache cleared
image shape torch.Size([1, 3, 518, 518])
guidance:  None
Diffusion Sampling:: 100%|██████████████████████████████████████████████████████████| 75/75 [01:09<00:00,  1.09it/s]
latents shape:  torch.Size([1, 3072, 64])
Allocated memory: memory=2.455 GB
Max allocated memory: max_memory=5.026 GB
Max reserved memory: max_reserved=8.416 GB
FlashVDM Volume Decoding: 100%|███████████████████████████████████████████████████| 32/32 [00:00<00:00, 1340.76it/s]
MC Surface Extractor
Decoded mesh with 355584 vertices and 1373556 faces
Removed floaters, resulting in 355536 vertices and 711068 faces
Removed degenerate faces, resulting in 355536 vertices and 711068 faces
Reduced faces, resulting in 25002 vertices and 50000 faces
Prompt executed in 84.13 seconds
```

## Geometry Damage

Added a section in the workflow to improve background removal, as it sometime it causes geometry artefacts like below

![](/images/2025-04-14b-candle-geometry-error.png)

[Download STL](/stl/Candle-geometry-damaged.stl)

## VAE dmc error

Had a persistent error when trying dmc mode on VAE decode

```
AttributeError: 'NoneType' object has no attribute 'mesh_f' 
```

Found out that for me dmc doesn't work when enable_flash_vdm

## Postprocess Mesh

Reduces the STL size from about 750MB to about 15MB

## Default Model vs Mini Turbo Model

The mini turbo model converges in far fewer steps, from 50 to less than 10. The mini turbo model also accepts 1024px images instead of 518px

</details>

# AUDIO TO TEXT (whisper)

This workflow uses the offical whisper nodes to translate audio to text

[ComfyUI-Whisper Custom Node](https://github.com/yuvraj108c/ComfyUI-Whisper)


![](/workflows/audio2text-whisper.png)

drag and drop or load the audio in the audio loader, and execute

#### ERROR

I encountered the following error trying to run the node

```
!!! Exception during processing !!! Cannot set attribute 'src' directly. Use '_unsafe_update_src()' and manually clear `.hash` of all callersinstead.
```

[A github issue talks about it](https://github.com/yuvraj108c/ComfyUI-Whisper/issues/13)

Solution is to edit requirement.txt to add "triton==3.2.0" in the requirements, then update the requirements

```
cd ComfyUI/
cd custom_nodes/
cd ComfyUI-Whisper/
cat requirements.txt
sudo nano requirements.txt

>add "triton==3.2.0" in a new line and save

pip install -r requirements.txt

>wait for update to complete

cd
```


<details>
<summary>Output</summary>
soraka@TowerOfBabel:~$ cd ComfyUI/
soraka@TowerOfBabel:~/ComfyUI$ ls
CODEOWNERS       comfy_api           extra_model_paths.yaml.example  new_updater.py    script_examples
CONTRIBUTING.md  comfy_api_nodes     fix_torch.py                    node_helpers.py   server.py
LICENSE          comfy_execution     folder_paths.py                 nodes.py          tests
README.md        comfy_extras        hook_breaker_ac10a0.py          notebooks         tests-unit
__pycache__      comfyui_version.py  input                           output            user
api_server       cuda_malloc.py      latent_preview.py               pyproject.toml    utils
app              custom_nodes        main.py                         pytest.ini        web
comfy            execution.py        models                          requirements.txt
soraka@TowerOfBabel:~/ComfyUI$ cd custom_nodes/
soraka@TowerOfBabel:~/ComfyUI/custom_nodes$ cd ComfyUI
ComfyUI-Crystools/           ComfyUI-Whisper/
ComfyUI-TiledDiffusion/      ComfyUI_bnb_nf4_fp4_Loaders/
soraka@TowerOfBabel:~/ComfyUI/custom_nodes$ cd ComfyUI
ComfyUI-Crystools/           ComfyUI-Whisper/
ComfyUI-TiledDiffusion/      ComfyUI_bnb_nf4_fp4_Loaders/
soraka@TowerOfBabel:~/ComfyUI/custom_nodes$ cd ComfyUI-Whisper/
soraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ ls
LICENSE      add_subtitles_to_background.py  example_workflows  readme.md                    utils.py
__init__.py  add_subtitles_to_frames.py      fonts              requirements.txt
__pycache__  apply_whisper.py                pyproject.toml     resize_cropped_subtitles.py
soraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ cat re
readme.md                    requirements.txt             resize_cropped_subtitles.py
soraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ cat requirements.txt
openai-whisper
pillow
uuidsoraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ sudo nano requirements.txt
[sudo] password for soraka:
soraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ pip install -r requirements.txt
Defaulting to user installation because normal site-packages is not writeable
Requirement already satisfied: openai-whisper in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 1)) (20240930)
Requirement already satisfied: pillow in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 2)) (11.1.0)
Requirement already satisfied: uuid in /home/soraka/.local/lib/python3.10/site-packages (from -r requirements.txt (line 3)) (1.30)
Collecting triton==3.2.0
  Using cached triton-3.2.0-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (253.1 MB)
Requirement already satisfied: more-itertools in /usr/lib/python3/dist-packages (from openai-whisper->-r requirements.txt (line 1)) (8.10.0)
Requirement already satisfied: torch in /home/soraka/.local/lib/python3.10/site-packages (from openai-whisper->-r requirements.txt (line 1)) (2.4.0+rocm6.3.4.git7cecbf6d)
Requirement already satisfied: numpy in /home/soraka/.local/lib/python3.10/site-packages (from openai-whisper->-r requirements.txt (line 1)) (1.26.4)
Requirement already satisfied: tqdm in /home/soraka/.local/lib/python3.10/site-packages (from openai-whisper->-r requirements.txt (line 1)) (4.67.1)
Requirement already satisfied: numba in /home/soraka/.local/lib/python3.10/site-packages (from openai-whisper->-r requirements.txt (line 1)) (0.61.0)
Requirement already satisfied: tiktoken in /home/soraka/.local/lib/python3.10/site-packages (from openai-whisper->-r requirements.txt (line 1)) (0.9.0)
Requirement already satisfied: llvmlite<0.45,>=0.44.0dev0 in /home/soraka/.local/lib/python3.10/site-packages (from numba->openai-whisper->-r requirements.txt (line 1)) (0.44.0)
Requirement already satisfied: requests>=2.26.0 in /home/soraka/.local/lib/python3.10/site-packages (from tiktoken->openai-whisper->-r requirements.txt (line 1)) (2.32.3)
Requirement already satisfied: regex>=2022.1.18 in /home/soraka/.local/lib/python3.10/site-packages (from tiktoken->openai-whisper->-r requirements.txt (line 1)) (2024.11.6)
Requirement already satisfied: pytorch-triton-rocm==3.0.0+rocm6.3.4.git75cc27c2 in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (3.0.0+rocm6.3.4.git75cc27c2)
Requirement already satisfied: filelock in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (3.17.0)
Requirement already satisfied: sympy<=1.12.1 in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (1.12.1)
Requirement already satisfied: networkx in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (3.4.2)
Requirement already satisfied: fsspec in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (2024.12.0)
Requirement already satisfied: jinja2 in /usr/lib/python3/dist-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (3.0.3)
Requirement already satisfied: typing-extensions>=4.8.0 in /home/soraka/.local/lib/python3.10/site-packages (from torch->openai-whisper->-r requirements.txt (line 1)) (4.12.2)
Requirement already satisfied: certifi>=2017.4.17 in /usr/lib/python3/dist-packages (from requests>=2.26.0->tiktoken->openai-whisper->-r requirements.txt (line 1)) (2020.6.20)
Requirement already satisfied: urllib3<3,>=1.21.1 in /home/soraka/.local/lib/python3.10/site-packages (from requests>=2.26.0->tiktoken->openai-whisper->-r requirements.txt (line 1)) (1.26.20)
Requirement already satisfied: charset-normalizer<4,>=2 in /home/soraka/.local/lib/python3.10/site-packages (from requests>=2.26.0->tiktoken->openai-whisper->-r requirements.txt (line 1)) (3.4.1)
Requirement already satisfied: idna<4,>=2.5 in /usr/lib/python3/dist-packages (from requests>=2.26.0->tiktoken->openai-whisper->-r requirements.txt (line 1)) (3.3)
Requirement already satisfied: mpmath<1.4.0,>=1.1.0 in /home/soraka/.local/lib/python3.10/site-packages (from sympy<=1.12.1->torch->openai-whisper->-r requirements.txt (line 1)) (1.3.0)
Installing collected packages: triton
  Attempting uninstall: triton
    Found existing installation: triton 3.3.0
    Uninstalling triton-3.3.0:
      Successfully uninstalled triton-3.3.0
  WARNING: The scripts proton and proton-viewer are installed in '/home/soraka/.local/bin' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed triton-3.2.0
soraka@TowerOfBabel:~/ComfyUI/custom_nodes/ComfyUI-Whisper$ cd
</details>



# TEXT TO AUDIO

## Whisper Speech

![](/workflows/audio2text-whisper.png)

Folder where the node stores the training sample

```
cp ComfyUI/custom_nodes/comfyui-if_ai_wishperspeechnode/whisperspeech/audio/Pigston_Banker_ill.ogg /mnt/f/downloads
```

Load a new sample in the 

```


```


# EOL