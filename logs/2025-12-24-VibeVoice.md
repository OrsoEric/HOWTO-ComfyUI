# Abbstract

https://www.youtube.com/watch?v=Frn1Lpd6TMU

https://huggingface.co/FabioSarracino/VibeVoice-Large-Q8/tree/main




## TEST


<details>
<summary>CMD Line Output</summary>

```cmd
To see the GUI go to: http://127.0.0.1:8188
FETCH ComfyRegistry Data: 5/115
FETCH ComfyRegistry Data: 10/115
FETCH ComfyRegistry Data: 15/115
FETCH ComfyRegistry Data: 20/115
FETCH ComfyRegistry Data: 25/115
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /extensions/core/groupNode.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[VibeVoice] Created vibevoice models directory: F:\ComfyUI-Windows\models\vibevoice
[VibeVoice] No LoRA adapters found in ComfyUI/models/vibevoice/loras
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/buttonGroup.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
[DEPRECATION WARNING] Detected import of deprecated legacy API: /scripts/ui/components/button.js. This is likely caused by a custom node extension using outdated APIs. Please update your extensions or contact the extension author for an updated version.
FETCH ComfyRegistry Data: 30/115
FETCH ComfyRegistry Data: 35/115
FETCH ComfyRegistry Data: 40/115
FETCH ComfyRegistry Data: 45/115
FETCH ComfyRegistry Data: 50/115
FETCH ComfyRegistry Data: 55/115
FETCH ComfyRegistry Data: 60/115
FETCH ComfyRegistry Data: 65/115
FETCH ComfyRegistry Data: 70/115
FETCH ComfyRegistry Data: 75/115
FETCH ComfyRegistry Data: 80/115
FETCH ComfyRegistry Data: 85/115
FETCH ComfyRegistry Data: 90/115
FETCH ComfyRegistry Data: 95/115
FETCH ComfyRegistry Data: 100/115
FETCH ComfyRegistry Data: 105/115
FETCH ComfyRegistry Data: 110/115
FETCH ComfyRegistry Data: 115/115
FETCH ComfyRegistry Data [DONE]
[ComfyUI-Manager] default cache updated: https://api.comfy.org/nodes
FETCH DATA from: https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/main/custom-node-list.json [DONE]
[ComfyUI-Manager] All startup tasks have been completed.
got prompt
[VibeVoice] No valid models found in vibevoice directory
[VibeVoice] Please download models to: F:\ComfyUI-Windows\models\vibevoice
Failed to validate prompt for output 4:
* LoadAudio 3:
  - Custom validation failed for node: audio - Invalid audio file: sample man voice demo.mp3
* VibeVoiceSingleSpeakerNode 2:
  - Value not in list: model: 'VibeVoice-Q8' not in ['No models found']
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
got prompt
Failed to validate prompt for output 4:
* LoadAudio 3:
  - Custom validation failed for node: audio - Invalid audio file: sample man voice demo.mp3
Output will be ignored
invalid prompt: {'type': 'prompt_outputs_failed_validation', 'message': 'Prompt outputs failed validation', 'details': '', 'extra_info': {}}
got prompt
APEX FusedRMSNorm not available, using native implementation
[VibeVoice] Using embedded VibeVoice from F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\vvembed
[VibeVoice] Found model files at: F:\ComfyUI-Windows\models\vibevoice\VibeVoice-Q8
[VibeVoice] Found model files at: F:\ComfyUI-Windows\models\vibevoice\VibeVoice-Q8
[VibeVoice] Detected 8bit quantization
[VibeVoice] Loading 8-bit quantized model with bitsandbytes...
[VibeVoice] Using auto attention implementation selection
[VibeVoice] Loading model from: F:\ComfyUI-Windows\models\vibevoice\VibeVoice-Q8
[VibeVoice] Loading 8bit quantized model...
Could not detect ROCm GPU architecture: [WinError 2] The system cannot find the file specified

ROCm GPU architecture detection failed despite ROCm being available.

Could not detect ROCm warp size: [WinError 2] The system cannot find the file specified. Defaulting to 64. (some 4-bit functions may not work!)

ROCm warp size detection failed despite ROCm being available.

bitsandbytes library load error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll
Traceback (most recent call last):
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\cextension.py", line 320, in <module>
    lib = get_native_library()
          ^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\cextension.py", line 288, in get_native_library
    raise RuntimeError(f"Configured {BNB_BACKEND} binary not found at {cuda_binary_path}")
RuntimeError: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll
Loading checkpoint shards: 100%|█████████████████████████████████████████████████████| 3/3 [00:06<00:00,  2.15s/it]
[VibeVoice] Model loaded in 9.60 seconds
[VibeVoice] Loading VibeVoice processor...
[VibeVoice] Found Qwen tokenizer in: F:\ComfyUI-Windows\models\vibevoice\tokenizer
[VibeVoice] Found complete tokenizer at: F:\ComfyUI-Windows\models\vibevoice\tokenizer
[VibeVoice] Standard from_pretrained failed: expected str, bytes or os.PathLike object, not NoneType
[VibeVoice] Trying with allow remote files...
[VibeVoice] Quantized model already mapped to device via device_map
[VibeVoice] Processing text segment 1 (15 words)
[VibeVoice] Starting audio generation with 20 diffusion steps...
[VibeVoice] Generating audio with 20 diffusion steps...
[VibeVoice] Note: Progress bar shows max possible tokens, not actual needed (~42 estimated)
[VibeVoice] The generation will stop automatically when audio is complete
[VibeVoice] VibeVoice generation failed:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()
[VibeVoice] Single speaker speech generation failed: VibeVoice generation failed:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()
!!! Exception during processing !!! Error generating speech: VibeVoice generation failed:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()
Traceback (most recent call last):
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\nodes\base_vibevoice.py", line 1681, in _generate_with_vibevoice
    output = self.model.generate(
             ^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\utils\_contextlib.py", line 120, in decorate_context
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\vvembed\modular\modeling_vibevoice_inference.py", line 598, in generate
    outputs = self(
              ^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\vvembed\modular\modeling_vibevoice_inference.py", line 323, in forward
    outputs = self.model(
              ^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\vvembed\modular\modeling_vibevoice.py", line 223, in forward
    outputs = self.language_model(
              ^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\utils\generic.py", line 1072, in wrapper
    outputs = func(self, *args, **kwargs)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\models\qwen2\modeling_qwen2.py", line 384, in forward
    hidden_states = decoder_layer(
                    ^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\modeling_layers.py", line 94, in __call__
    return super().__call__(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\utils\deprecation.py", line 172, in wrapped_func
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\models\qwen2\modeling_qwen2.py", line 234, in forward
    hidden_states, _ = self.self_attn(
                       ^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\utils\deprecation.py", line 172, in wrapped_func
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\transformers\models\qwen2\modeling_qwen2.py", line 153, in forward
    query_states = self.q_proj(hidden_states).view(hidden_shape).transpose(1, 2)
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1775, in _wrapped_call_impl
    return self._call_impl(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\nn\modules\module.py", line 1786, in _call_impl
    return forward_call(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\nn\modules.py", line 1094, in forward
    out = bnb.matmul(x, self.weight, bias=self.bias, state=self.state)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\autograd\_functions.py", line 366, in matmul
    return MatMul8bitLt.apply(A, B, out, bias, state)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\autograd\function.py", line 581, in apply
    return super().apply(*args, **kwargs)  # type: ignore[misc]
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\autograd\_functions.py", line 134, in forward
    CA, SCA, outlier_cols = F.int8_vectorwise_quant(A.to(torch.float16), threshold=state.threshold)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\functional.py", line 1962, in int8_vectorwise_quant
    return torch.ops.bitsandbytes.int8_vectorwise_quant.default(A, threshold)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\_ops.py", line 841, in __call__
    return self._op(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\_compile.py", line 53, in inner
    return disable_fn(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\_dynamo\eval_frame.py", line 1044, in _fn
    return fn(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\torch\library.py", line 731, in func_no_dynamo
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\backends\cuda\ops.py", line 151, in _
    lib.cint8_vector_quant(
  File "F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\cextension.py", line 269, in throw_on_call
    raise RuntimeError(f"{self.formatted_error}Native code method attempted to call: lib.{name}()")
RuntimeError:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\nodes\single_speaker_node.py", line 204, in generate_speech
    segment_audio = self._generate_with_vibevoice(
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\nodes\base_vibevoice.py", line 1728, in _generate_with_vibevoice
    raise Exception(f"VibeVoice generation failed: {str(e)}")
Exception: VibeVoice generation failed:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "F:\ComfyUI-Windows\execution.py", line 516, in execute
    output_data, output_ui, has_subgraph, has_pending_tasks = await get_output_data(prompt_id, unique_id, obj, input_data_all, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\execution.py", line 330, in get_output_data
    return_values = await _async_map_node_over_list(prompt_id, unique_id, obj, input_data_all, obj.FUNCTION, allow_interrupt=True, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "F:\ComfyUI-Windows\execution.py", line 304, in _async_map_node_over_list
    await process_inputs(input_dict, i)
  File "F:\ComfyUI-Windows\execution.py", line 292, in process_inputs
    result = f(**inputs)
             ^^^^^^^^^^^
  File "F:\ComfyUI-Windows\custom_nodes\VibeVoice-ComfyUI\nodes\single_speaker_node.py", line 258, in generate_speech
    raise Exception(f"Error generating speech: {str(e)}")
Exception: Error generating speech: VibeVoice generation failed:
🚨 Forgot to compile the bitsandbytes library? 🚨
1. You're not using the package but checked-out the source code
2. You MUST compile from source

Attempted to use bitsandbytes native library functionality but it's not available.

This typically happens when:
1. bitsandbytes doesn't ship with a pre-compiled binary for your ROCm version
2. The library wasn't compiled properly during installation from source

To make bitsandbytes work, the compiled library version MUST exactly match the linked ROCm version.
If your ROCm version doesn't have a pre-compiled binary, you MUST compile from source.

You can COMPILE FROM SOURCE as mentioned here:
   https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu
Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

🔍 Run this command for detailed diagnostics:
python -m bitsandbytes

If you've tried everything and still have issues:
1. Include ALL version info (operating system, bitsandbytes, pytorch, rocm, python)
2. Describe what you've tried in detail
3. Open an issue with this information:
   https://github.com/bitsandbytes-foundation/bitsandbytes/issues

Native code method attempted to call: lib.cint8_vector_quant()

```

</details>

# bitsandbytes

Original error: Configured ROCm binary not found at F:\ComfyUI-Windows\.venv\Lib\site-packages\bitsandbytes\libbitsandbytes_rocm71.dll

https://huggingface.co/docs/bitsandbytes/main/en/installation?backend=AMD+ROCm#amd-gpu


FAIL
```
uv pip install --force-reinstall https://github.com/bitsandbytes-foundation/bitsandbytes/releases/download/continuous-release_main/bitsandbytes-1.33.7.preview-py3-none-win_amd64.whl
```

Just try to install it?

```
(.venv) F:\ComfyUI-Windows>uv pip install bitsandbytes
Resolved 13 packages in 99ms
░░░░░░░░░░░░░░░░░░░░ [0/1] Installing wheels...                                                                     warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
Installed 1 package in 55ms
 + bitsandbytes==0.49.0
```


<details>
<summary>CMD Line Output</summary>

```cmd
uv pip install --force-reinstall https://github.com/bitsandbytes-foundation/bitsandbytes/releases/download/continuous-release_main/bitsandbytes-1.33.7.preview-py3-none-win_amd64.whl
Resolved 13 packages in 1.90s
Prepared 13 packages in 17.43s
Uninstalled 13 packages in 1.13s
░░░░░░░░░░░░░░░░░░░░ [0/13] Installing wheels...                                                                    warning: Failed to hardlink files; falling back to full copy. This may lead to degraded performance.
         If the cache and target directories are on different filesystems, hardlinking may not be supported.
         If this is intentional, set `export UV_LINK_MODE=copy` or use `--link-mode=copy` to suppress this warning.
error: Failed to install: bitsandbytes-1.33.7rc0-py3-none-win_amd64.whl (bitsandbytes==1.33.7rc0 (from https://github.com/bitsandbytes-foundation/bitsandbytes/releases/download/continuous-release_main/bitsandbytes-1.33.7.preview-py3-none-win_amd64.whl))
  Caused by: Wheel version does not match filename: 0.49.1.dev0 != 1.33.7rc0
```

</details>


[Install CMAKE and add to path](https://cmake.org/download/)


```
.venv\Scripts\activate

git clone https://github.com/bitsandbytes-foundation/bitsandbytes.git
cd bitsandbytes

cmake -DCOMPUTE_BACKEND=hip -S .



.venv\Scripts\activate
```


# BRICKED

```
F:\ComfyUI-Windows>uv pip install -r "requirements.txt"
Audited 27 packages in 9ms

F:\ComfyUI-Windows>uv run verify_rocm.py
--- Torch Import ---
Success: torch imported successfully.

--- CUDA Availability ---
CUDA available: False

--- Device Name ---
No CUDA device found.

--- Environment Info ---
PyTorch version: 2.9.1+cpu
Is debug build: False
CUDA used to build PyTorch: None
ROCM used to build PyTorch: N/A

OS: Microsoft Windows 11 Pro (10.0.22631 64-bit)
GCC version: Could not collect
Clang version: 19.0.0git (git@github.amd.com:Compute-Mirrors/llvm-project 5353ca3e0e5ae54a31eeebe223da212fa405567a)
CMake version: version 4.2.1
Libc version: N/A

Python version: 3.12.10 (main, Apr  9 2025, 04:06:22) [MSC v.1943 64 bit (AMD64)] (64-bit runtime)
Python platform: Windows-11-10.0.22631-SP0
Is CUDA available: False
CUDA runtime version: No CUDA
CUDA_MODULE_LOADING set to: N/A
GPU models and configuration: No CUDA
Nvidia driver version: No CUDA
cuDNN version: No CUDA
Is XPU available: False
HIP runtime version: N/A
MIOpen runtime version: N/A
Is XNNPACK available: True

CPU:
Name: 13th Gen Intel(R) Core(TM) i7-13700F
Manufacturer: GenuineIntel
Family: 198
Architecture: 9
ProcessorType: 3
DeviceID: CPU0
CurrentClockSpeed: 2100
MaxClockSpeed: 2100
L2CacheSize: 24576
L2CacheSpeed: None
Revision: None

Versions of relevant libraries:
[pip3] Could not collect
[conda] Could not collect
```










#

<details>
<summary>CMD Line Output</summary>

```cmd
xxx
```

</details>