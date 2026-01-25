I did testing 

# Portable ROCm 7.1

ComfyUI portable is built on ROCm 7.1 running on the new [driver 26.1.1](https://www.amd.com/en/resources/support-articles/release-notes/RN-RAD-WIN-26-1-1.html)

I tried the portable environment Flux FP8 dev performance with c_ustom nodes disabled_ runs competently 65s/35s

```.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-all-custom-nodes```

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
clip missing: ['text_projection.weight']
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load FluxClipModel_
loaded completely; 22892.08 MB usable, 9319.23 MB loaded, full load: True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load FluxClipModel_
loaded completely;  4777.54 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
loaded completely; 22492.00 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.40s/it]
Requested to load AutoencodingEngine
loaded completely; 11512.43 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 65.21 seconds
got prompt
Requested to load Flux
loaded completely; 22343.50 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:28<00:00,  1.42s/it]
Requested to load AutoencodingEngine
loaded completely; 11465.43 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 35.58 seconds
got prompt
Requested to load Flux
loaded completely; 22343.50 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:27<00:00,  1.39s/it]
Requested to load AutoencodingEngine
loaded completely; 11465.43 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 34.99 seconds
```


Zimage Q8 runs competently, it's a workflow I made to use GGUF nodes and plays better with the 7900XTX INT8 acceleration shaders 29s/11s

![](https://github.com/OrsoEric/HOWTO-ComfyUI/blob/Master/workflow-png/Zimage%20txt2img%20gguf.png?raw=true)

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 4424.19 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18061.50 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:10<00:00,  1.12s/it]
Requested to load AutoencodingEngine
Unloaded partially: 120.28 MB freed, 4303.91 MB remains loaded, 18.59 MB buffer reserved, lowvram patches: 0
loaded completely; 5114.58 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 29.19 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.10s/it]
Prompt executed in 10.51 seconds
got prompt
got prompt
  0%|                                                                                            | 0/9 [00:00<?, ?it/s]got prompt
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.27 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.28 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.09s/it]
Prompt executed in 10.36 seconds
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:09<00:00,  1.08s/it]
Prompt executed in 10.28 seconds
```

Qwen Image Edit does not, it uses lots more VRAM and stresses the allocation, it's incredibly slow and doesn't get faster on repeated execution 450s/470s

![](https://github.com/OrsoEric/HOWTO-ComfyUI/blob/Master/workflow-png/QWENEDIT-img2img-gguf.png?raw=true)

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20711.28 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22769.05 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21584.01 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 4/4 [06:22<00:00, 95.58s/it]
Requested to load WanVAE
loaded completely; 18868.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 452.30 seconds
got prompt
Requested to load QwenImage
loaded completely; 21499.76 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████████| 4/4 [07:37<00:00, 114.47s/it]
Requested to load WanVAE
loaded completely; 18868.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 470.84 seconds
```

# ROCm 7.2 PIP

So I rebuilt using pip and ROCm 7.2


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

Without flag --use-pytorch-cross-attention it's really bad, but with it it works competently mostly.


```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
gguf qtypes: F32 (145), Q8_0 (253)
Dequantizing token_embd.weight to prevent runtime OOM.
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22892.08 MB usable, 4424.19 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q8_0 (180), BF16 (4)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 18109.68 MB usable, 6973.32 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.29s/it]
Requested to load AutoencodingEngine
Unloaded partially: 133.56 MB freed, 4290.63 MB remains loaded, 18.59 MB buffer reserved, lowvram patches: 0
loaded completely; 5114.67 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 30.42 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.28s/it]
Prompt executed in 12.12 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.26s/it]
Prompt executed in 11.93 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████| 9/9 [00:11<00:00,  1.26s/it]
Prompt executed in 12.01 seconds
```

Qwen Edit is more useable bit not great

```cmd
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load WanVAE
loaded completely; 20322.06 MB usable, 242.03 MB loaded, full load: True
gguf qtypes: Q8_0 (198), F32 (141)
Dequantizing token_embd.weight to prevent runtime OOM.
Attenpting to find mmproj file for text encoder...
Using mmproj 'qwen2.5-vl-7b-instruct-q8_0-mmproj-fp16.gguf' for text encoder 'qwen2.5-vl-7b-instruct-q8_0.gguf'.
gguf qtypes: F32 (291), F16 (228)
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load QwenImageTEModel_
loaded completely; 22259.69 MB usable, 8946.75 MB loaded, full load: True
gguf qtypes: F32 (1088), BF16 (6), Q8_0 (840)
model weight dtype torch.bfloat16, manual cast: None
model_type FLUX
Requested to load QwenImage
loaded completely; 21540.44 MB usable, 20861.48 MB loaded, full load: True
100%|███████████████████████████████████████████████████████████████████████████████| 4/4 [08:01<00:00, 120.31s/it]
Requested to load WanVAE
Unloaded partially: 2999.80 MB freed, 17861.72 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 309
loaded completely; 2337.76 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 540.51 seconds
got prompt
loaded completely; 21237.07 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [00:55<00:00, 13.76s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 628
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 61.09 seconds
got prompt
loaded completely; 21241.44 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [01:10<00:00, 17.51s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 947
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 75.18 seconds
got prompt
loaded completely; 21241.44 MB usable, 20861.48 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████| 4/4 [04:40<00:00, 70.09s/it]
Requested to load WanVAE
Unloaded partially: 3095.54 MB freed, 17765.98 MB remains loaded, 67.72 MB buffer reserved, lowvram patches: 1266
loaded completely; 2377.81 MB usable, 242.03 MB loaded, full load: True
Prompt executed in 288.45 seconds
```

There is still great instability in running Qwen Edit 

Flux FP8 runs badly

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
clip missing: ['text_projection.weight']
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load FluxClipModel_
loaded completely; 22892.08 MB usable, 9319.23 MB loaded, full load: True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load FluxClipModel_
loaded completely;  4777.54 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
Unloaded partially: 515.86 MB freed, 8803.38 MB remains loaded, 160.00 MB buffer reserved, lowvram patches: 0
loaded completely; 13685.75 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [04:28<00:00, 13.44s/it]
Requested to load AutoencodingEngine
Unloaded partially: 673.37 MB freed, 10676.73 MB remains loaded, 135.04 MB buffer reserved, lowvram patches: 0
loaded completely; 5181.26 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 304.13 seconds
```

# ROCm 7.2 PIP  --windows-standalone-build --disable-smart-memory

using the two flags Flux FP8 runs competently

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
clip missing: ['text_projection.weight']
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load FluxClipModel_
loaded completely; 22892.08 MB usable, 9319.23 MB loaded, full load: True
model weight dtype torch.float8_e4m3fn, manual cast: torch.bfloat16
model_type FLUX
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load FluxClipModel_
loaded completely;  4777.54 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cuda:0, dtype: torch.float16
Requested to load Flux
loaded completely; 22490.13 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:32<00:00,  1.60s/it]
Requested to load AutoencodingEngine
loaded completely; 11501.00 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 54.71 seconds
got prompt
Requested to load Flux
loaded completely; 22331.82 MB usable, 11350.07 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:31<00:00,  1.59s/it]
Requested to load AutoencodingEngine
loaded completely; 11453.75 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 39.04 seconds
```

Zimage Q4 runs competently

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22526.42 MB usable, 7672.25 MB loaded, full load: True
gguf qtypes: F32 (245), F16 (24), Q4_K (120), Q6_K (30), BF16 (4), Q5_K (30)
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
Requested to load Lumina2
loaded completely; 22391.43 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
Requested to load AutoencodingEngine
loaded completely; 11410.81 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 29.25 seconds
got prompt
Requested to load Lumina2
loaded completely; 22387.18 MB usable, 4834.06 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:12<00:00,  1.41s/it]
Requested to load AutoencodingEngine
loaded completely; 11410.81 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 16.01 seconds
```