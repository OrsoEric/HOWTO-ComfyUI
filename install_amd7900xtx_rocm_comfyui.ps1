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
