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
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
#Install dependencies
cd ComfyUI-VideoHelperSuite
uv pip install -r requirements.txt --constraint $HOME/ComfyUI/constraint.txt
#Return
cd 