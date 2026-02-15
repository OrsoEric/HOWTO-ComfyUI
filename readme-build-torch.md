# BUILD TORCH

```
:: --- Create venv with UV ---
uv venv .venv --python 3.12
call .venv\Scripts\activate.bat

:: --- CHECK PYTHON VERSION ---
echo === Verifying local Python ===

for /f "delims=" %%V in ('python --version 2^>nul') do set PYVER=%%V

echo %PYVER% | findstr /r "3\.12\.[0-9][0-9]*" >nul
if errorlevel 1 (
    echo ERROR: Python 3.12.x not found.
    echo UV will install the wrong Python if the correct one is missing.
    echo Install a proper python.exe for 3.12.x, then relaunch.
    goto :EOF
)

echo Python version OK: %PYVER%


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

:: --- Verify ROCm and Torch ---

echo === Torch ===
python -c "import torch" 2>nul && echo Success || echo Failure

echo === CUDA ===
python -c "import torch; print(torch.cuda.is_available())"

echo === GPU ===
python -c "import torch; print(f'device name [0]:', torch.cuda.get_device_name(0))"

echo === ENV ===
python -m torch.utils.collect_env
```