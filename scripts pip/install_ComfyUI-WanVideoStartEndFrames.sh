#!/bin/bash
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
git clone https://github.com/raindrop313/ComfyUI-WanVideoStartEndFrames
#Install dependencies
cd ComfyUI-WanVideoStartEndFrames
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 