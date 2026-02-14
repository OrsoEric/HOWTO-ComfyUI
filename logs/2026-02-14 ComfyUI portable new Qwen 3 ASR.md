# ComfyUi portable

Download

https://github.com/Comfy-Org/ComfyUI/releases/tag/v0.13.0

Link external folder

```extra_model_paths.yaml```
```yaml
comfyui:
    base_path: ..\..\ComfyUI-Models
    # You can use is_default to mark that these folders should be listed first, and used as the default dirs for eg downloads
    checkpoints: checkpoints\
    clip: clip\
    clip_vision: clip_vision\
    text_encoders: text_encoders\
    configs: configs\
    controlnet: controlnet\
    diffusion_models: |
                diffusion_models
                unet
    embeddings: embeddings\
    loras: loras\
    upscale_models: upscale_models\
    vae: vae\
    # custom vibevoice node dumps here
    vibevoice: vibevoice\
    Janus-Pro: Janus-Pro\
```

Script to download custom nodes

```cmd
:: --- Install custom nodes ---
cd ComfyUI

cd custom_nodes

git clone https://github.com/Comfy-Org/ComfyUI-Manager.git
git clone https://github.com/M1kep/ComfyLiterals
git clone https://github.com/fuselayer/comfyui-minimal-workflow-image
git clone https://github.com/city96/ComfyUI-GGUF.git
::uv pip install gguf --link-mode=copy
```

Since python is incompetently designed, I need to be careful to do the pip install on the embedded python. By default pip ovverrides to the system python, that is useless.

```cmd
cd F:\comfyui-rocm72-2026-02-14\python_embeded
python.exe get-pip.py
python.exe -m pip install gguf
:: for audio node 
python.exe -m pip install librosa
```


<details>
<summary>Install Log</summary>

```cmd

F:\comfyui-rocm72-2026-02-14>.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build
Adding extra search path checkpoints F:\ComfyUI-Models\checkpoints
Adding extra search path clip F:\ComfyUI-Models\clip
Adding extra search path clip_vision F:\ComfyUI-Models\clip_vision
Adding extra search path text_encoders F:\ComfyUI-Models\text_encoders
Adding extra search path configs F:\ComfyUI-Models\configs
Adding extra search path controlnet F:\ComfyUI-Models\controlnet
Adding extra search path diffusion_models F:\ComfyUI-Models\diffusion_models
Adding extra search path diffusion_models F:\ComfyUI-Models\unet
Adding extra search path embeddings F:\ComfyUI-Models\embeddings
Adding extra search path loras F:\ComfyUI-Models\loras
Adding extra search path upscale_models F:\ComfyUI-Models\upscale_models
Adding extra search path vae F:\ComfyUI-Models\vae
Adding extra search path vibevoice F:\ComfyUI-Models\vibevoice
Adding extra search path Janus-Pro F:\ComfyUI-Models\Janus-Pro
[START] Security scan
[DONE] Security scan
## ComfyUI-Manager: installing dependencies done.
** ComfyUI startup time: 2026-02-14 12:06:37.453
** Platform: Windows
** Python version: 3.12.10 (tags/v3.12.10:0cc8128, Apr  8 2025, 12:21:36) [MSC v.1943 64 bit (AMD64)]
** Python executable: F:\comfyui-rocm72-2026-02-14\python_embeded\python.exe
** ComfyUI Path: F:\comfyui-rocm72-2026-02-14\ComfyUI
** ComfyUI Base Folder Path: F:\comfyui-rocm72-2026-02-14\ComfyUI
** User directory: F:\comfyui-rocm72-2026-02-14\ComfyUI\user
** ComfyUI-Manager config path: F:\comfyui-rocm72-2026-02-14\ComfyUI\user\__manager\config.ini
** Log path: F:\comfyui-rocm72-2026-02-14\ComfyUI\user\comfyui.log

Prestartup times for custom nodes:
   1.4 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-Manager

Fatal error in launcher: Unable to create process using '"D:\a\ComfyUI\python_embeded\python.exe"  "F:\comfyui-rocm72-2026-02-14\python_embeded\Scripts\offload-arch.exe" ': The system cannot find the file specified.

[WARNING] offload-arch failed with return code 1
[stderr]
Checkpoint files will always be loaded safely.
Found comfy_kitchen backend cuda: {'available': True, 'disabled': True, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8']}
Found comfy_kitchen backend eager: {'available': True, 'disabled': False, 'unavailable_reason': None, 'capabilities': ['apply_rope', 'apply_rope1', 'dequantize_nvfp4', 'dequantize_per_tensor_fp8', 'quantize_nvfp4', 'quantize_per_tensor_fp8', 'scaled_mm_nvfp4']}
Found comfy_kitchen backend triton: {'available': False, 'disabled': True, 'unavailable_reason': "ImportError: No module named 'triton'", 'capabilities': []}
Total VRAM 24560 MB, total RAM 65367 MB
pytorch version: 2.9.1+rocmsdk20260116
Set: torch.backends.cudnn.enabled = False for better AMD performance.
AMD arch: gfx1100
ROCm version: (7, 2)
Set vram state to: NORMAL_VRAM
Device: cuda:0 AMD Radeon RX 7900 XTX : native
Using async weight offloading with 2 streams
Enabled pinned memory 29414.0
Using pytorch attention
Python version: 3.12.10 (tags/v3.12.10:0cc8128, Apr  8 2025, 12:21:36) [MSC v.1943 64 bit (AMD64)]
ComfyUI version: 0.13.0
ComfyUI frontend version: 1.38.13
[Prompt Server] web root: F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\comfyui_frontend_package\static
Failed to find comfy root automatically, please copy the folder F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyLiterals\web manually in the web/extensions folder of ComfyUI
ComfyUI-GGUF: Allowing full torch compile
### Loading: ComfyUI-Manager (V3.39.2)
[ComfyUI-Manager] network_mode: public
[ComfyUI-Manager] ComfyUI per-queue preview override detected (PR #11261). Manager's preview method feature is disabled. Use ComfyUI's --preview-method CLI option or 'Settings > Execution > Live preview method'.
### ComfyUI Revision: 150 [6648ab68] *DETACHED | Released on '2026-02-10'
Skip F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\comfyui-minimal-workflow-image module for custom nodes due to the lack of NODE_CLASS_MAPPINGS or NODES_LIST (need one).
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/alter-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/model-list.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/github-stats.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/extension-node-map.json
[ComfyUI-Manager] default cache updated: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json

Import times for custom nodes:
   0.0 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\websocket_image_save.py
   0.0 seconds (IMPORT FAILED): F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\comfyui-minimal-workflow-image
   0.0 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyLiterals
   0.0 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-GGUF
   0.1 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-Manager
   2.3 seconds: F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR

Context impl SQLiteImpl.
Will assume non-transactional DDL.
Assets scan(roots=['models']) completed in 0.022s (created=0, skipped_existing=51, orphans_pruned=0, total_seen=51)
Starting server

To see the GUI go to: http://127.0.0.1:8188
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 5/125
FETCH ComfyRegistry Data: 10/125
FETCH ComfyRegistry Data: 15/125
FETCH ComfyRegistry Data: 20/125
FETCH ComfyRegistry Data: 25/125
FETCH ComfyRegistry Data: 30/125
FETCH ComfyRegistry Data: 35/125
FETCH ComfyRegistry Data: 40/125
FETCH ComfyRegistry Data: 45/125
FETCH ComfyRegistry Data: 50/125
FETCH ComfyRegistry Data: 55/125
FETCH ComfyRegistry Data: 60/125
FETCH ComfyRegistry Data: 65/125
FETCH ComfyRegistry Data: 70/125
FETCH ComfyRegistry Data: 75/125
FETCH ComfyRegistry Data: 80/125
FETCH ComfyRegistry Data: 85/125
FETCH ComfyRegistry Data: 90/125
FETCH ComfyRegistry Data: 95/125
FETCH ComfyRegistry Data: 100/125
FETCH ComfyRegistry Data: 105/125
FETCH ComfyRegistry Data: 110/125
FETCH ComfyRegistry Data: 115/125
FETCH ComfyRegistry Data: 120/125
FETCH ComfyRegistry Data: 125/125
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
got prompt
HTTP Request: GET https://huggingface.co/api/models/Qwen/Qwen3-ASR-1.7B/revision/main "HTTP/1.1 200 OK"
Fetching 12 files:   0%|                                                                        | 0/12 [00:00<?, ?it/s]HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/config.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/config.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/generation_config.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/README.md "HTTP/1.1 307 Temporary Redirect"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/config.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/README.md "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/generation_config.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/model-00002-of-00002.safetensors "HTTP/1.1 302 Found"
Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/merges.txt "HTTP/1.1 307 Temporary Redirect"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/model-00001-of-00002.safetensors "HTTP/1.1 302 Found"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/generation_config.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/README.md "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/merges.txt "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/chat_template.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/merges.txt "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/chat_template.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/chat_template.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/.gitattributes "HTTP/1.1 307 Temporary Redirect"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/.gitattributes "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/model.safetensors.index.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: GET https://huggingface.co/api/models/Qwen/Qwen3-ASR-1.7B/xet-read-token/7278e1e70fe206f11671096ffdd38061171dd6e5 "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/models/Qwen/Qwen3-ASR-1.7B/xet-read-token/7278e1e70fe206f11671096ffdd38061171dd6e5 "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/preprocessor_config.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/.gitattributes "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/tokenizer_config.json "HTTP/1.1 307 Temporary Redirect"
Fetching 12 files:   8%|█████▎                                                          | 1/12 [00:00<00:03,  3.12it/s]HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/model.safetensors.index.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/preprocessor_config.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/tokenizer_config.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/model.safetensors.index.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/preprocessor_config.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/tokenizer_config.json "HTTP/1.1 200 OK"
HTTP Request: HEAD https://huggingface.co/Qwen/Qwen3-ASR-1.7B/resolve/7278e1e70fe206f11671096ffdd38061171dd6e5/vocab.json "HTTP/1.1 307 Temporary Redirect"
HTTP Request: HEAD https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/vocab.json "HTTP/1.1 200 OK"
HTTP Request: GET https://huggingface.co/api/resolve-cache/models/Qwen/Qwen3-ASR-1.7B/7278e1e70fe206f11671096ffdd38061171dd6e5/vocab.json "HTTP/1.1 200 OK"
Fetching 12 files: 100%|███████████████████████████████████████████████████████████████| 12/12 [05:32<00:00, 27.74s/it]

```

</details>


<details>
<summary>Error</summary>

```cmd
got prompt
Unrecognized keys in `rope_parameters` for 'rope_type'='default': {'mrope_interleaved', 'mrope_section', 'interleaved'}
!!! Exception during processing !!! 'default'
Traceback (most recent call last):
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 530, in execute
    output_data, output_ui, has_subgraph, has_pending_tasks = await get_output_data(prompt_id, unique_id, obj, input_data_all, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 334, in get_output_data
    return_values = await _async_map_node_over_list(prompt_id, unique_id, obj, input_data_all, obj.FUNCTION, allow_interrupt=True, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 308, in _async_map_node_over_list
    await process_inputs(input_dict, i)
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 296, in process_inputs
    result = f(**inputs)
             ^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\AILab_QwenASR.py", line 561, in transcribe
    model = _load_cached_model(model_path, dtype, device, "auto", "")
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\AILab_QwenASR.py", line 393, in _load_cached_model
    model = Qwen3ASRModel.from_pretrained(model_path, **model_kwargs)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\qwen3_asr.py", line 206, in from_pretrained
    model = AutoModel.from_pretrained(pretrained_model_name_or_path, **kwargs)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\transformers\models\auto\auto_factory.py", line 372, in from_pretrained
    return model_class.from_pretrained(
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\transformers\modeling_utils.py", line 4072, in from_pretrained
    model = cls(config, *model_args, **model_kwargs)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\core\transformers_backend\modeling_qwen3_asr.py", line 1318, in __init__
    self.thinker = Qwen3ASRThinkerForConditionalGeneration._from_config(config.thinker_config)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\transformers\modeling_utils.py", line 1508, in _from_config
    model = cls(config, **kwargs)
            ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\core\transformers_backend\modeling_qwen3_asr.py", line 1084, in __init__
    self.model = Qwen3ASRThinkerTextModel._from_config(config.text_config)
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\transformers\modeling_utils.py", line 1508, in _from_config
    model = cls(config, **kwargs)
            ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\core\transformers_backend\modeling_qwen3_asr.py", line 980, in __init__
    self.rotary_emb = Qwen3ASRThinkerTextRotaryEmbedding(config)
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\core\transformers_backend\modeling_qwen3_asr.py", line 794, in __init__
    self.rope_init_fn = ROPE_INIT_FUNCTIONS[self.rope_type]
                        ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
KeyError: 'default'

Prompt executed in 0.04 seconds
```

</details>

Changing config doesn't work

Updating transformer

<details>
<summary>Performance</summary>

```cmd

F:\comfyui-rocm72-2026-02-14\python_embeded>python.exe -m pip install --upgrade transformers
Requirement already satisfied: transformers in .\Lib\site-packages (5.0.0)
Collecting transformers
  Downloading transformers-5.1.0-py3-none-any.whl.metadata (31 kB)
Requirement already satisfied: huggingface-hub<2.0,>=1.3.0 in .\Lib\site-packages (from transformers) (1.3.4)
Requirement already satisfied: numpy>=1.17 in .\Lib\site-packages (from transformers) (2.3.5)
Requirement already satisfied: packaging>=20.0 in .\Lib\site-packages (from transformers) (26.0)
Requirement already satisfied: pyyaml>=5.1 in .\Lib\site-packages (from transformers) (6.0.3)
Requirement already satisfied: regex!=2019.12.17 in .\Lib\site-packages (from transformers) (2026.1.15)
Requirement already satisfied: tokenizers<=0.23.0,>=0.22.0 in .\Lib\site-packages (from transformers) (0.22.2)
Requirement already satisfied: typer-slim in .\Lib\site-packages (from transformers) (0.21.1)
Requirement already satisfied: safetensors>=0.4.3 in .\Lib\site-packages (from transformers) (0.7.0)
Requirement already satisfied: tqdm>=4.27 in .\Lib\site-packages (from transformers) (4.67.1)
Requirement already satisfied: filelock in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (3.20.3)
Requirement already satisfied: fsspec>=2023.5.0 in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (2026.1.0)
Requirement already satisfied: hf-xet<2.0.0,>=1.2.0 in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (1.2.0)
Requirement already satisfied: httpx<1,>=0.23.0 in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (0.28.1)
Requirement already satisfied: shellingham in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (1.5.4)
Requirement already satisfied: typing-extensions>=4.1.0 in .\Lib\site-packages (from huggingface-hub<2.0,>=1.3.0->transformers) (4.15.0)
Requirement already satisfied: anyio in .\Lib\site-packages (from httpx<1,>=0.23.0->huggingface-hub<2.0,>=1.3.0->transformers) (4.12.1)
Requirement already satisfied: certifi in .\Lib\site-packages (from httpx<1,>=0.23.0->huggingface-hub<2.0,>=1.3.0->transformers) (2026.1.4)
Requirement already satisfied: httpcore==1.* in .\Lib\site-packages (from httpx<1,>=0.23.0->huggingface-hub<2.0,>=1.3.0->transformers) (1.0.9)
Requirement already satisfied: idna in .\Lib\site-packages (from httpx<1,>=0.23.0->huggingface-hub<2.0,>=1.3.0->transformers) (3.11)
Requirement already satisfied: h11>=0.16 in .\Lib\site-packages (from httpcore==1.*->httpx<1,>=0.23.0->huggingface-hub<2.0,>=1.3.0->transformers) (0.16.0)
Requirement already satisfied: colorama in .\Lib\site-packages (from tqdm>=4.27->transformers) (0.4.6)
Requirement already satisfied: click>=8.0.0 in .\Lib\site-packages (from typer-slim->transformers) (8.3.1)
Downloading transformers-5.1.0-py3-none-any.whl (10.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 10.3/10.3 MB 10.0 MB/s  0:00:01
Installing collected packages: transformers
  Attempting uninstall: transformers
    Found existing installation: transformers 5.0.0
    Uninstalling transformers-5.0.0:
      Successfully uninstalled transformers-5.0.0
  WARNING: The script transformers.exe is installed in 'F:\comfyui-rocm72-2026-02-14\python_embeded\Scripts' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed transformers-5.1.0

```


https://github.com/1038lab/ComfyUI-QwenASR/issues/1

```
@check_model_inputs()
@auto_docstring
def forward(
```


```
@check_model_inputs
@auto_docstring
def forward(
```


<details>
<summary>Error</summary>

```cmd
got prompt
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.86s/it]
The following generation flags are not valid and may be ignored: ['temperature']. Set `TRANSFORMERS_VERBOSITY=info` for more details.
!!! Exception during processing !!! Numba needs NumPy 2.3 or less. Got NumPy 2.4.
Traceback (most recent call last):
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 530, in execute
    output_data, output_ui, has_subgraph, has_pending_tasks = await get_output_data(prompt_id, unique_id, obj, input_data_all, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 334, in get_output_data
    return_values = await _async_map_node_over_list(prompt_id, unique_id, obj, input_data_all, obj.FUNCTION, allow_interrupt=True, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 308, in _async_map_node_over_list
    await process_inputs(input_dict, i)
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 296, in process_inputs
    result = f(**inputs)
             ^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\AILab_QwenASR.py", line 562, in transcribe
    results = model.transcribe(
              ^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\torch\utils\_contextlib.py", line 120, in decorate_context
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\qwen3_asr.py", line 338, in transcribe
    wavs = normalize_audios(audio)
           ^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\utils.py", line 206, in normalize_audios
    return [normalize_audio_input(a) for a in items]
            ^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\utils.py", line 199, in normalize_audio_input
    audio = librosa.resample(audio, orig_sr=sr, target_sr=SAMPLE_RATE).astype(np.float32)
            ^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\lazy_loader\__init__.py", line 83, in __getattr__
    attr = getattr(submod, name)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\lazy_loader\__init__.py", line 82, in __getattr__
    submod = importlib.import_module(submod_path)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "importlib\__init__.py", line 90, in import_module
  File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1331, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 935, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 999, in exec_module
  File "<frozen importlib._bootstrap>", line 488, in _call_with_frames_removed
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\librosa\core\audio.py", line 18, in <module>
    from numba import jit, stencil, guvectorize
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\numba\__init__.py", line 59, in <module>
    _ensure_critical_deps()
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\numba\__init__.py", line 45, in _ensure_critical_deps
    raise ImportError(msg)
ImportError: Numba needs NumPy 2.3 or less. Got NumPy 2.4.

Prompt executed in 4.52 seconds
```

</details>


librosa with no numpy dependency

```
python.exe -m pip install librosa==0.10.2.post1 --no-deps
```

<details>
<summary>Librosa needs Numpy 2.3</summary>

```cmd
got prompt
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.86s/it]
The following generation flags are not valid and may be ignored: ['temperature']. Set `TRANSFORMERS_VERBOSITY=info` for more details.
!!! Exception during processing !!! Numba needs NumPy 2.3 or less. Got NumPy 2.4.
Traceback (most recent call last):
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 530, in execute
    output_data, output_ui, has_subgraph, has_pending_tasks = await get_output_data(prompt_id, unique_id, obj, input_data_all, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 334, in get_output_data
    return_values = await _async_map_node_over_list(prompt_id, unique_id, obj, input_data_all, obj.FUNCTION, allow_interrupt=True, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 308, in _async_map_node_over_list
    await process_inputs(input_dict, i)
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\execution.py", line 296, in process_inputs
    result = f(**inputs)
             ^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\AILab_QwenASR.py", line 562, in transcribe
    results = model.transcribe(
              ^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\torch\utils\_contextlib.py", line 120, in decorate_context
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\qwen3_asr.py", line 338, in transcribe
    wavs = normalize_audios(audio)
           ^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\utils.py", line 206, in normalize_audios
    return [normalize_audio_input(a) for a in items]
            ^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\ComfyUI\custom_nodes\ComfyUI-QwenASR\qwen_asr\inference\utils.py", line 199, in normalize_audio_input
    audio = librosa.resample(audio, orig_sr=sr, target_sr=SAMPLE_RATE).astype(np.float32)
            ^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\lazy_loader\__init__.py", line 83, in __getattr__
    attr = getattr(submod, name)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\lazy_loader\__init__.py", line 82, in __getattr__
    submod = importlib.import_module(submod_path)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "importlib\__init__.py", line 90, in import_module
  File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1331, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 935, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 999, in exec_module
  File "<frozen importlib._bootstrap>", line 488, in _call_with_frames_removed
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\librosa\core\audio.py", line 18, in <module>
    from numba import jit, stencil, guvectorize
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\numba\__init__.py", line 59, in <module>
    _ensure_critical_deps()
  File "F:\comfyui-rocm72-2026-02-14\python_embeded\Lib\site-packages\numba\__init__.py", line 45, in _ensure_critical_deps
    raise ImportError(msg)
ImportError: Numba needs NumPy 2.3 or less. Got NumPy 2.4.

Prompt executed in 4.52 seconds
```

</details>





</details>

```
python.exe -m pip install "transformers==4.46.3"

```

# PERFORMANCE

```
got prompt
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.72s/it]
The following generation flags are not valid and may be ignored: ['temperature']. Set `TRANSFORMERS_VERBOSITY=info` for more details.
Setting `pad_token_id` to `eos_token_id`:151645 for open-end generation.
Prompt executed in 7.78 seconds
got prompt
Prompt executed in 0.00 seconds
got prompt
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████| 2/2 [00:03<00:00,  1.77s/it]
Setting `pad_token_id` to `eos_token_id`:151645 for open-end generation.
Prompt executed in 5.24 seconds
```

# EOL

<details>
<summary>Performance</summary>

```cmd
xxx
```

</details>