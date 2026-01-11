git init
git remote add origin https://github.com/comfyanonymous/ComfyUI.git
git fetch
git checkout -t origin/master

uv venv .venv --python 3.13

call .venv\Scripts\activate.bat

uv pip install --index-url https://rocm.nightlies.amd.com/v2/gfx110X-dgpu/ "rocm[libraries,devel]"

uv pip install --index-url https://rocm.nightlies.amd.com/v2/gfx110X-dgpu/ --pre torch torchaudio torchvision

uv pip install -r requirements.txt --link-mode=copy

cd custom_nodes

:: Manager, fundamental to install more things

git clone https://github.com/Comfy-Org/ComfyUI-Manager.git

:: Very convenient type nodes

git clone https://github.com/M1kep/ComfyLiterals

:: Necessary to save workflows

git clone https://github.com/fuselayer/comfyui-minimal-workflow-image



cd ..

uv run main.py --use-pytorch-cross-attention