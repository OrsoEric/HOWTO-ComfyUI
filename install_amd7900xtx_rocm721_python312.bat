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
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/rocm_sdk_core-7.2.1-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/rocm_sdk_devel-7.2.1-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/rocm_sdk_libraries_custom-7.2.1-py3-none-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/rocm-7.2.1.tar.gz --link-mode=copy

uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/torch-2.9.1%2Brocm7.2.1-cp312-cp312-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/torchaudio-2.9.1%2Brocm7.2.1-cp312-cp312-win_amd64.whl --link-mode=copy
uv pip install --no-cache-dir https://repo.radeon.com/rocm/windows/rocm-rel-7.2.1/torchvision-0.24.1%2Brocm7.2.1-cp312-cp312-win_amd64.whl --link-mode=copy

:: --- Install ComfyUI dependencies ---
uv pip install -r requirements.txt --link-mode=copy

:: --- Install custom nodes ---
cd custom_nodes

git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
git clone https://github.com/M1kep/ComfyLiterals
git clone https://github.com/fuselayer/comfyui-minimal-workflow-image
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
uv run main.py
