#!/bin/bash
# sudo chmod +x install_ComfyUI-Whisper.sh
# ./install_ComfyUI-Whisper.sh
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
git clone https://github.com/yuvraj108c/ComfyUI-Whisper
#Install dependencies
cd ComfyUI-Whisper
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#https://github.com/yuvraj108c/ComfyUI-Whisper/issues/13
#dependency on triton==3.2.0
uv pip install triton==3.2.0 --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 