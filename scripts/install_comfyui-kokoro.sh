#!/bin/bash
#sudo chmod +x install_comfyui-kokoro.sh
#setup safety
set -euo pipefail
#go into ComfyUI
cd
cd ComfyUI
#Activate UV
source Dreamy/bin/activate
#Go to the extensions
cd custom_nodes
#Clone the repo
git clone https://github.com/stavsap/comfyui-kokoro
#Install dependencies
cd comfyui-kokoro
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 