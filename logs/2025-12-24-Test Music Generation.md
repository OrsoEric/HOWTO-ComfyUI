# Sources

Default workflow

[Tutorial](https://www.youtube.com/watch?v=dDe-LA567D8)


[Model](https://huggingface.co/Comfy-Org/ACE-Step_ComfyUI_repackaged/blob/main/all_in_one/ace_step_v1_3.5b.safetensors)

# Workflow

It's very fast 6 seconds to generate 30 seconds of audio with lyrics

<details>
<summary>CMD Line Output</summary>

```cmd
got prompt
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load AceT5Model
loaded completely; 22544.30 MB usable, 537.61 MB loaded, full load: True
Requested to load ACEStep
loaded completely; 21263.69 MB usable, 6304.31 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████| 50/50 [00:13<00:00,  3.63it/s]
Requested to load MusicDCAE
loaded completely; 95367431640625005117571072.00 MB usable, 495.50 MB loaded, full load: True
Prompt executed in 24.39 seconds
got prompt
Requested to load ACEStep
100%|██████████████████████████████████████████████████████████████████████████████| 50/50 [00:08<00:00,  6.15it/s]
Prompt executed in 10.48 seconds
got prompt
Requested to load ACEStep
100%|██████████████████████████████████████████████████████████████████████████████| 50/50 [00:04<00:00, 10.57it/s]
Prompt executed in 5.93 seconds
got prompt
Requested to load ACEStep
100%|██████████████████████████████████████████████████████████████████████████████| 50/50 [00:04<00:00, 10.59it/s]
Prompt executed in 5.95 seconds
```

</details>