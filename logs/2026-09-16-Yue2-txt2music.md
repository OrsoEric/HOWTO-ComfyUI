## ATTEMPT 1

```
[INFO] got prompt
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops:  , emulated ops: nvfp4, int8_tensorwise, mxfp8, asym_w4a8_int8, float8_e4m3fn, convrot_w4a4, float8_e5m2
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] VAE load device: xpu:0, offload device: cpu, dtype: torch.float16
[INFO] Found quantization metadata version 1
[INFO] Requested to load YuE2TEModel_
[INFO] loaded completely;  2069.34 MB loaded, full load: True
[INFO] CLIP/text encoder model load device: xpu:0, offload device: cpu, current: xpu:0, dtype: torch.float16
YuE2 ABC sampling:  21%|██████████▌                                      | 1759/8192 [42:27<2:35:18,  1.45s/token]
YuE2 music sampling:  39%|███████████████████▏                             | 1176/3000 [25:38<39:46,  1.31s/token]
[ERROR] !!! Exception during processing !!! level_zero backend failed with error: 20 (UR_RESULT_ERROR_DEVICE_LOST)
[ERROR] Traceback (most recent call last):
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\execution.py", line 547, in execute
    output_data, output_ui, has_subgraph, has_pending_tasks = await get_output_data(prompt_id, unique_id, obj, input_data_all, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\execution.py", line 352, in get_output_data
    return_values = await _async_map_node_over_list(prompt_id, unique_id, obj, input_data_all, obj.FUNCTION, allow_interrupt=True, execution_block_cb=execution_block_cb, pre_execute_cb=pre_execute_cb, v3_data=v3_data)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\execution.py", line 326, in _async_map_node_over_list
    await process_inputs(input_dict, i)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\execution.py", line 314, in process_inputs
    result = f(**inputs)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy_api\internal\__init__.py", line 149, in wrapped_func
    return method(locked_class, **inputs)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy_api\latest\_io.py", line 2051, in EXECUTE_NORMALIZED
    to_return = cls.execute(*args, **kwargs)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy_extras\nodes_yue2.py", line 72, in execute
    conditioning = clip.encode_from_tokens_scheduled(tokens)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\sd.py", line 343, in encode_from_tokens_scheduled
    pooled_dict = self.encode_from_tokens(tokens, return_pooled=return_pooled, return_dict=True)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\sd.py", line 412, in encode_from_tokens
    o = self.cond_stage_model.encode_token_weights(tokens)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\text_encoders\yue2.py", line 259, in encode_token_weights
    semantic, semantic_truncated = self._generate(
                                   ~~~~~~~~~~~~~~^
        prefix, tokens["seed"], max_tokens, "semantic", dtype,
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    ...<3 lines>...
        min_tokens=min(200, max_tokens),
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\text_encoders\yue2.py", line 176, in _generate
    scores = distribution(guided, history, step, phase, legacy_off=legacy_off, **sampling)
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\text_encoders\yue2.py", line 42, in distribution
    recent = torch.tensor([history[-penalty_window:]], dtype=torch.long, device=scores.device)
RuntimeError: level_zero backend failed with error: 20 (UR_RESULT_ERROR_DEVICE_LOST)

[INFO] Prompt executed in 01:08:24
Exception in thread Thread-1 (prompt_worker):
Traceback (most recent call last):
  File "threading.py", line 1044, in _bootstrap_inner
  File "threading.py", line 995, in run
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\main.py", line 403, in prompt_worker
    comfy.model_management.soft_empty_cache()
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^
  File "D:\ComfyUI_windows_portable_intel\ComfyUI\comfy\model_management.py", line 2087, in soft_empty_cache
    torch.xpu.synchronize()
    ~~~~~~~~~~~~~~~~~~~~~^^
  File "D:\ComfyUI_windows_portable_intel\python_embeded\Lib\site-packages\torch\xpu\__init__.py", line 702, in synchronize
    return torch._C._xpu_synchronize(device)
           ~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
RuntimeError: level_zero backend failed with error: 20 (UR_RESULT_ERROR_DEVICE_LOST)
```

## Update

Update comfyui
Update dependencies
Update Intel graphics driver

## Attempt 2

Skip ABC 20 second music

Successful and decent if simple tune.

Didn't comply with the 20s limit

Is LLM based the sampler

Input:

```
Upbeat indie pop with warm female vocals, bright electric guitars, punchy drums, melodic bass, and subtle synth layers. Catchy and energetic, with an uplifting summer atmosphere, a memorable chorus, and polished modern production.
```

```
[Verse]
Morning light across the window
City waking down below
I can hear the streets are calling
Feels like somewhere we should go

[Chorus]
Run with me into the sunlight
Leave the shadows far behind
We don't need to know tomorrow
Tonight the whole world feels alive

[Verse]
Radio playing through the open door
Laughing like we did before
Every mile becomes a memory
And I just want a little more

[Chorus]
Run with me into the sunlight
Leave the shadows far behind
We don't need to know tomorrow
Tonight the whole world feels alive
```


```
[INFO] got prompt
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops:  , emulated ops: mxfp8, int8_tensorwise, float8_e5m2, float8_e4m3fn, nvfp4, asym_w4a8_int8, convrot_w4a4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] VAE load device: xpu:0, offload device: cpu, dtype: torch.float16
[INFO] Found quantization metadata version 1
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] Requested to load YuE2TEModel_
[INFO] loaded completely;  2069.34 MB loaded, full load: True
[INFO] CLIP/text encoder model load device: xpu:0, offload device: cpu, current: xpu:0, dtype: torch.float16
YuE2 music sampling: 100%|███████████████████████████████████████████████████| 750/750 [16:20<00:00,  1.31s/token]
[WARNING] YuE2 semantic reached its token budget before the end token.
[INFO] Requested to load YuE2
[INFO] loaded completely; 13269.84 MB usable, 1351.33 MB loaded, full load: True
100%|█████████████████████████████████████████████████████████████████████████████| 32/32 [00:39<00:00,  1.23s/it]
[INFO] Requested to load AudioOobleckVAE
[INFO] loaded completely;  252.88 MB loaded, full load: True
[INFO] Prompt executed in 00:17:49
```

[](/outputs/2026-09-16T1810-YuE2-noABC.flac)


## Attempt 3

```
[INFO] got prompt
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops:  , emulated ops: mxfp8, int8_tensorwise, float8_e5m2, float8_e4m3fn, nvfp4, asym_w4a8_int8, convrot_w4a4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] VAE load device: xpu:0, offload device: cpu, dtype: torch.float16
[INFO] Found quantization metadata version 1
[INFO] Model storage policy: fast_disk=True paths=['D:\\LLM_Models\\ComfyUI_Models\\checkpoints\\yue2_3B_INT8CR_3G7.safetensors']
[INFO] Requested to load YuE2TEModel_
[INFO] loaded completely;  2069.34 MB loaded, full load: True
[INFO] CLIP/text encoder model load device: xpu:0, offload device: cpu, current: xpu:0, dtype: torch.float16
YuE2 music sampling: 100%|███████████████████████████████████████████████████| 750/750 [16:20<00:00,  1.31s/token]
[WARNING] YuE2 semantic reached its token budget before the end token.
[INFO] Requested to load YuE2
[INFO] loaded completely; 13269.84 MB usable, 1351.33 MB loaded, full load: True
100%|█████████████████████████████████████████████████████████████████████████████| 32/32 [00:39<00:00,  1.23s/it]
[INFO] Requested to load AudioOobleckVAE
[INFO] loaded completely;  252.88 MB loaded, full load: True
[INFO] Prompt executed in 00:17:49
[INFO] moving 'D:\ComfyUI_windows_portable_intel\ComfyUI\user\default\workflows\Yue2-text2music.json' -> 'D:\ComfyUI_windows_portable_intel\ComfyUI\user\default\workflows\ZZZTEST-Yue2-text2music.json'
[INFO] got prompt
YuE2 music sampling: 100%|███████████████████████████████████████████████████| 750/750 [15:52<00:00,  1.27s/token]
[WARNING] YuE2 semantic reached its token budget before the end token.
100%|█████████████████████████████████████████████████████████████████████████████| 32/32 [00:35<00:00,  1.10s/it]
[INFO] Prompt executed in 00:16:34
```


## Attempt 4

I need to test the ANC stage

```
Genre: Italian folk song
Vocals: A lone shouthern italian youthful female, sings in Sicilian italian accen, shortening the consonants
Language: Italian, sicilian accent
Tempo: 120 BPM, happy go merry 
Instruments: Flutes and Harmonica, whimsical summer happy tune accompaining the vocals, it's fast paced and reminds of a mazurca.
[Solo] Singer solo, Harmonica accentuates the beats, flute melody invoking summer
[Chorus] School boys and girls in a chorus accompaining the solo singer
```

```
[Solo]
Sopra la panca la capra canta
Sotto la panca la capra crepa
[Chorus]
Il mietitore prende la capra e la mangia
Il creatore prende la capra e la rivive
```

```
[INFO] got prompt
YuE2 music sampling: 100%|█████████████████████████████████████████████████| 1000/1000 [21:49<00:00,  1.31s/token]
[WARNING] YuE2 semantic reached its token budget before the end token.
100%|█████████████████████████████████████████████████████████████████████████████| 32/32 [00:38<00:00,  1.21s/it]
[INFO] Prompt executed in 00:22:40
```

[](/outputs/2026-09-16T1902-YuE2-noABC.mp3)

