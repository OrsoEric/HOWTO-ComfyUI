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
#Install ROCm xformers
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 