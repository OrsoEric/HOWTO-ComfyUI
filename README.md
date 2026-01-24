# ComfyUI

The scope of this repository is to document how to run Comfy UI with ROCm acceleration with a AMD 7900XTX under Windows.

## Value Proposition

Nvidia and CUDA works better. But Nvidia makes you pay a significant premium for VRAM, and VRAM is critical to machine learning.

When choosing how to upgrade in 2025-01 my choices were
- AMD 7900XTX 24GB: 940€
- Nvidia 3090 24GB 4 years old used: 750€
- Nvidia 4090 24GB: 2500 €
- Nvidia 5090 32GB: 3500 €

Initially I wasn't very happy, it's cheaper but it took me six months and a dozen rebuilds to find a stack that consistently accelerates ROCm. I helped debug some workaround for issues like [OOM with VAE decode](https://github.com/ROCm/ROCm/issues/4729)

A year later, I'm feeling better and better about the purchase. Finally AMD has released windows drivers for ROCm, and ComfyUI works for me without issues, I even rebuilt with this instruction and it worked instantly. I guess I experienced the "fine wine" AMD is famous for.

In my region the 7900XTX still goes for 850€ to 950€ at the time of update 2025-12-09, and in my opinion this is amazing value to accelerate ComfyUI generation and local LLMs.

16GB cards are more affordable, but those 8GB go a long way in machine learning.

## Hardware 

- AMD RX 7900 XTX 24GB <--- The GOAT
- Intel 13700F
- DDR5 4x16GB 64GB 6400

## Software

- Windows 11
- [Adrenaline preview driver 25.20.01.17](https://github.com/ROCm/ROCm/issues/4729)
- ROCm 7.11

[ROCm 7.10.0 Preview Compatibility Matrix](https://rocm.docs.amd.com/en/7.10.0-preview/compatibility/compatibility-matrix.html)

[ROCm 7.10.0 Preview Installation](https://rocm.docs.amd.com/en/7.10.0-preview/install/rocm.html)

[ROCm 7.1.1 Preview Installation](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/install/installrad/windows/install-pytorch.html)

This is wrong, I need to use UV for this to have any chance of working, the env will brick a lot, and if I use a system python this is hopeless


# INSTALLATION

Try this at your own risk and danger, tough I'm a lot more confident and it worked painlessly for me.

## Compatibility Matricies

[Compatibility Matricies 7.1.1](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/compatibility/compatibilityrad/windows/windows_compatibility.html)

My 7900XTX is called GFX1100 and is supported under windows, so I can progress

## Install AMD Preview Driver

Follow the article. [AMD Software: PyTorch on Windows Edition 7.1.1 Driver for Windows® 11](https://www.amd.com/en/resources/support-articles/release-notes/RN-AMDGPU-WINDOWS-PYTORCH-7-1-1.html)


- Run the cleanup utility in safe mode, it does the restart itself, neat!

- After the cleanup go in normal mode and install the driver

- Reboot

![](/images/Adrenaline%20Preview%20Driver%2025%2020%2001%2017.png)

## INSTALL COMFYUI 

Create an empty folder, I name it ```ComfyUI-ROCm-Windows```

[Copy the following powershell script as ps1 and execute](install_amd7900xtx_rocm_comfyui.ps1) >>>DANGER<<<

READ THE SCRIPT I MADE BEFORE RUNNING IT, POWERSHELL IS NO JOKE, ITS AT YOUR RISK AND DANGER

```
# Ensure uv is installed
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "Installing uv..."
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/0.9.16/install.ps1 | iex"
} else {
    Write-Host "uv already installed."
}

# Clone ComfyUI into current directory
git init
git remote add origin https://github.com/comfyanonymous/ComfyUI.git
git fetch
git checkout -t origin/master

# Create venv with Python 3.12
uv venv .venv --python 3.12
.venv\Scripts\Activate.ps1

# Install ROCm SDK and libraries
uv pip install --no-cache-dir `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_core-0.1.dev0-py3-none-win_amd64.whl `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_devel-0.1.dev0-py3-none-win_amd64.whl `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm_sdk_libraries_custom-0.1.dev0-py3-none-win_amd64.whl `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/rocm-0.1.dev0.tar.gz

# Install ROCm-enabled PyTorch stack
uv pip install --no-cache-dir `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torch-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchaudio-2.9.0+rocmsdk20251116-cp312-cp312-win_amd64.whl `
    https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/torchvision-0.24.0+rocmsdk20251116-cp312-cp312-win_amd64.whl

# Verify installation
try {
    python -c "import torch" | Out-Null
    Write-Host "Torch import: Success"
} catch {
    Write-Host "Torch import: Failure"
}

Write-Host "CUDA available:" (python -c "import torch; print(torch.cuda.is_available())")
Write-Host "Device name:" (python -c "import torch; print(torch.cuda.get_device_name(0))")
python -m torch.utils.collect_env

# Install ComfyUI custom node manager
Set-Location custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
Set-Location ..

# Install ComfyUI requirements
uv pip install -r "requirements.txt"

# Run ComfyUI
uv run main.py  --use-pytorch-cross-attention
```

This take

## Wheels

[Wheels](https://repo.radeon.com/rocm/windows/rocm-rel-7.1.1/)

## UPDATE COMFYUI 

xxx

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


# Comfy UI Custom Nodes

## [EXPORT PNG](https://github.com/fuselayer/comfyui-minimal-workflow-image)

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

# Launch Script

doesn't work

```cmd
set MIOPEN_ENABLE_LOGGING=1
set MIOPEN_ENABLE_LOGGING_CMD=1
set MIOPEN_LOG_LEVEL=6

uv run main.py
```

```
if __name__ == "__main__":
    #NOTE: These do not do anything on core ComfyUI, they are for custom nodes.
    os.environ['HF_HUB_DISABLE_TELEMETRY'] = '1'
    os.environ['DO_NOT_TRACK'] = '1'
    os.environ['MIOPEN_ENABLE_LOGGING'] = '1'
    os.environ['MIOPEN_ENABLE_LOGGING_CMD'] = '1'
    os.environ['MIOPEN_LOG_LEVEL'] = '6'
```

## Workflow

Workflows are stored in ```\user\default\workflows```




## Performance






```
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.22it/s]
Prompt executed in 7.95 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.24it/s]
Prompt executed in 7.61 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.25it/s]
Prompt executed in 7.73 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.25it/s]
Prompt executed in 7.69 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.24it/s]
Prompt executed in 7.75 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.23it/s]
Prompt executed in 7.83 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.22it/s]
Prompt executed in 7.89 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.26it/s]
Prompt executed in 7.52 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:07<00:00,  1.26it/s]
Prompt executed in 7.53 seconds
```

txt2img 1350x1350 Zimage

```
got prompt
Requested to load ZImageTEModel_
loaded completely; 19843.76 MB usable, 4424.19 MB loaded, full load: True
loaded completely; 17154.40 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:18<00:00,  2.02s/it]
Unloaded partially: 4351.54 MB freed, 2621.80 MB remains loaded, 124.51 MB buffer reserved, lowvram patches: 0
Prompt executed in 40.76 seconds
got prompt
loaded completely; 21659.38 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:18<00:00,  2.05s/it]
Unloaded partially: 4351.54 MB freed, 2621.80 MB remains loaded, 124.51 MB buffer reserved, lowvram patches: 0
Prompt executed in 31.32 seconds
got prompt
loaded completely; 21659.38 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:18<00:00,  2.06s/it]
Unloaded partially: 4351.54 MB freed, 2621.80 MB remains loaded, 124.51 MB buffer reserved, lowvram patches: 0
Prompt executed in 29.89 seconds
```

# ROCm 7.2

```install-comfyui-rocm72-p312.bat```

```
:: --- Clone ComfyUI ---
git init
git remote add origin https://github.com/comfyanonymous/ComfyUI.git
git fetch
git checkout -t origin/master

:: --- Create venv with UV ---
uv venv .venv --python 3.12
call .venv\Scripts\activate.bat

:: --- CHECK PYTHON VERSION ---
echo === Verifying local Python ===
for /f "delims=" %%V in ('python --version') do set PYVER=%%V
echo %PYVER% | findstr "3.12" >nul || (
    echo ERROR: Python 3.12 not found. UV is incompetently designed, and will install the wrong python if it doesn't find the right one, so install the right python.exe on system then relaunch.
    exit /b 1
)

:: --- Install ROCm SDK components (UV works fine here) ---
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_core-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_devel-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm_sdk_libraries_custom-7.2.0.dev0-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/rocm-7.2.0.dev0.tar.gz --link-mode=copy

:: UV is incompetently designed, and there is no way to work around version name enforcement for experimental wheels
:: install pip and use that
python -m ensurepip
python -m pip install --upgrade pip
:: --- Install ROCm PyTorch wheels (UV cannot parse these; use pip directly) ---
python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torch-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl
python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchaudio-2.9.1+rocmsdk20260116-cp312-cp312-win_amd64.whl
python -m pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2/torchvision-0.24.1+rocmsdk20260116-cp312-cp312-win_amd64.whl

:: --- Install ComfyUI dependencies ---
uv pip install -r requirements.txt --link-mode=copy

:: --- Install custom nodes ---
cd custom_nodes

:: How is the manager not a core component of ComfyUI?
git clone https://github.com/Comfy-Org/ComfyUI-Manager.git

:: This is convenient for node with types
git clone https://github.com/M1kep/ComfyLiterals

:: This saves workflows as PNG, it has issue with image preview
git clone https://github.com/fuselayer/comfyui-minimal-workflow-image

:: GGUF nodes are godsends, they play much better with 7900XTX INT8 ALUs than FP8
git clone https://github.com/city96/ComfyUI-GGUF.git
uv pip install gguf --link-mode=copy

cd ..

:: --- Verify ROCm and Torch ---

echo === Torch ===
python -c "import torch" 2>nul && echo Success || echo Failure

echo === CUDA ===
python -c "import torch; print(torch.cuda.is_available())"

echo === GPU ===
python -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"

echo === ENV ===
python -m torch.utils.collect_env

:: --- Launch ComfyUI ---
uv run main.py --use-pytorch-cross-attention
```




# EOL

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>