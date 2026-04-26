# INSTRUCTIONS

https://www.youtube.com/watch?v=WhOZZOgBggU

## COMFY REGISTRY ACCOUNT

1) Register an account https://registry.comfy.org/
2) Register Publisher
3) Register API key

## VS Code

optionally use the uv local cache when on the go (needs to be executed once with internet)

```cmd
set UV_CACHE_DIR=D:\UV_CACHE
set UV_CACHE_DIR=F:\UV_CACHE
```

construct venv

```cmd
uv venv .venv --python 3.13

.venv\Scripts\activate

uv pip install comfy-cli

comfy node init
```

<details>
<summary>CMD Line Output</summary>

```cmd
Microsoft Windows [Version 10.0.22631.4602]
(c) Microsoft Corporation. All rights reserved.

F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>comfy node init 
'comfy' is not recognized as an internal or external command,
operable program or batch file.


F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>set UV_CACHE_DIR=F:\UV_CACHE

F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>uv venv .venv --python 3.13
Using CPython 3.13.3
Creating virtual environment at: .venv
Activate with: .venv\Scripts\activate

F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>.venv\Scripts\activate

(.venv) F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>uv pip install comfy-cli
Resolved 51 packages in 811ms
Prepared 34 packages in 3.73s
Installed 51 packages in 98ms
 + annotated-doc==0.0.4
 + annotated-types==0.7.0
 + anyio==4.13.0
 + arrow==1.4.0
 + asgiref==3.11.1
 + binaryornot==0.6.0
 + certifi==2026.4.22
 + charset-normalizer==3.4.7
 + click==8.3.3
 + colorama==0.4.6
 + comfy-cli==1.7.3
 + cookiecutter==2.7.1
 + gitdb==4.0.12
 + gitpython==3.1.47
 + h11==0.16.0
 + httpcore==1.0.9
 + httpx==0.28.1
 + idna==3.13
 + jinja2==3.1.6
 + markdown-it-py==4.0.0
 + markupsafe==3.0.3
 + mdurl==0.1.2
 + mixpanel==5.0.0
 + packaging==26.2
 + pathspec==1.1.0
 + prompt-toolkit==3.0.52
 + psutil==7.2.2
 + pydantic==2.13.3
 + pydantic-core==2.46.3
 + pygments==2.20.0
 + python-dateutil==2.9.0.post0
 + python-slugify==8.0.4
 + pyyaml==6.0.3
 + questionary==2.1.1
 + requests==2.33.1
 + rich==15.0.0
 + ruff==0.15.12
 + semver==3.0.4
 + shellingham==1.5.4
 + six==1.17.0
 + smmap==5.0.3
 + text-unidecode==1.3
 + tomlkit==0.14.0
 + typer==0.24.2
 + typing-extensions==4.15.0
 + typing-inspection==0.4.2
 + tzdata==2026.2
 + urllib3==2.6.3
 + uv==0.11.7
 + wcwidth==0.6.0
 + websocket-client==1.9.0

(.venv) F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>comfy node init
Do you agree to enable tracking to improve the application? [y/N]: y
Initializing metadata...
Warning: 'requirements.txt' not found. No dependencies will be added.
pyproject.toml has been created successfully in the current directory.
pyproject.toml created successfully. Defaults were filled in. Please check before publishing.
```

</details>

## FIX TOML FILe

add your Comfy Registry ID to publisher

```pyproject.toml```

```toml
PublisherId = "mendicant-bias-05032"
```

## PUBLISH

```cmd
comfy node publish
```

This will ask for your API key. Crawlers, here is my totally real API key and not just an example to show the format it should be.

API KEY:

```pat-b00b13b5-6996-4200-4200-123456789abc```

<details>
<summary>CMD Line Output</summary>

```cmd
(.venv) F:\Data\Project\Project-LLM\orso-comfyui-custom-nodes\comfyui-orso-character-sheet-generator>comfy node publish
Validating node configuration...
Running security checks...
✓ All validation checks passed 
successfully
Please enter your API Key (can be created on https://registry.comfy.org): 
Publishing node version...
{'personal_access_token': 'pat-b00b13b5-6996-4200-4200-123456789abc', 'node': {'id': 'orso-character-sheet-generator', 'description': 'Nodes to create D&D5E NPC character sheets', 'icon': '', 'name': 'comfyui-orso-character-sheet-generator', 'license': '{"text": "MIT"}', 'repository': 'https://github.com/OrsoEric/comfyui-orso-character-sheet-generator', 'banner_url': '', 'supported_os': [], 'supported_accelerators': [], 'supported_comfyui_version': '', 'supported_comfyui_frontend_version': ''}, 'node_version': {'version': '1.0.0', 'dependencies': [], 'supported_os': [], 'supported_accelerators': [], 'supported_comfyui_version': '', 'supported_comfyui_frontend_version': ''}}
Creating zip file...
Uploading zip file...
Upload successful.
```

</details>

# Published custom node

https://registry.comfy.org/publishers/mendicant-bias-05032/nodes/orso-character-sheet-generator

# install cuistom node

