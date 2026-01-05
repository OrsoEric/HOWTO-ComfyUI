#!/bin/bash
#	sudo chmod +x install_xformers.sh
#	./install_xformers.sh
#setup safety
set -euo pipefail
#go into ComfyUI
cd
cd ComfyUI
#Activate UV
source Dreamy/bin/activate
#Install ROCm xformers
uv pip install -U xformers --index-url https://download.pytorch.org/whl/rocm6.3 --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 