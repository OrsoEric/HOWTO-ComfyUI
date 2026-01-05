#!/bin/bash
# sudo chmod +x install_ComfyUI-SparkTTS.sh
# ./install_ComfyUI-SparkTTS.sh
#
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
git clone https://github.com/1038lab/ComfyUI-SparkTTS
#Install dependencies
cd ComfyUI-SparkTTS
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 