#!/bin/bash
#sudo chmod +x install_ComfyUI-ComfyUI-WanVideoStartEndFrames.sh
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
#git clone https://github.com/if-ai/ComfyUI-IF_MemoAvatar
git clone https://github.com/jax-explorer/ComfyUI-IF_MemoAvatar
#Install dependencies
cd ComfyUI-IF_MemoAvatar
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#I need a dependency on moviepy old
uv pip uninstall moviepy
uv pip install moviepy==1.0.3 --constraint $HOME/ComfyUI/constraint.txt
#Stuck on xformers that doesn't work onAMD
#Return
cd 