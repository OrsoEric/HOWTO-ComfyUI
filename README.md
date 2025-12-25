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

# INSTALLATION

Try this at your own risk and danger, tough I'm a lot more confident and it worked painlessly for me.

## Compatibility Matricies

[Compatibility Matricies](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/docs/compatibility/compatibilityrad/windows/windows_compatibility.html)

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
uv run main.py
```

This take

## UPDATE COMFYUI 


