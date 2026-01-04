# SD1.5

## 512x512

#### 2025-12-25 

```cmd
got prompt
model weight dtype torch.float16, manual cast: None
model_type EPS
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load SD1ClipModel
loaded completely; 22892.08 MB usable, 235.84 MB loaded, full load: True
Requested to load BaseModel
loaded completely; 22406.89 MB usable, 1639.41 MB loaded, full load: True
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 13.26it/s]
Requested to load AutoencoderKL
loaded completely; 18554.06 MB usable, 159.56 MB loaded, full load: True
Prompt executed in 4.50 seconds
got prompt
100%|██████████████████████████████████████████████████████████████████████████████████| 20/20 [00:01<00:00, 17.18it/s]
Prompt executed in 1.38 seconds
```

# Zimage Turbo

There is quite the variance in speed

I have been trying a few samplers
- 

```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22487.86 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
unet missing: ['norm_final.weight']
Requested to load Lumina2
loaded completely; 18393.86 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:38<00:00,  4.22s/it]
Requested to load AutoencodingEngine
Unloaded partially: 995.80 MB freed, 10743.77 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
loaded completely; 5187.64 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 67.63 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 11269.09 MB usable, 7672.25 MB loaded, full load: True
loaded completely; 15618.14 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [01:55<00:00, 12.79s/it]
Requested to load AutoencodingEngine
Unloaded partially: 7370.80 MB freed, 4368.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 7818.47 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 143.58 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 17870.09 MB usable, 7672.25 MB loaded, full load: True
loaded completely; 15844.14 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [01:01<00:00,  6.84s/it]
Requested to load AutoencodingEngine
Unloaded partially: 7295.80 MB freed, 4443.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 7780.07 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 71.38 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 17774.09 MB usable, 7672.25 MB loaded, full load: True
loaded completely; 15823.14 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [01:00<00:00,  6.73s/it]
Requested to load AutoencodingEngine
Unloaded partially: 7370.80 MB freed, 4368.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 7818.47 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 70.78 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 17870.09 MB usable, 7672.25 MB loaded, full load: True
loaded completely; 15844.14 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:58<00:00,  6.55s/it]
Requested to load AutoencodingEngine
Unloaded partially: 7295.80 MB freed, 4443.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 7780.07 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 68.31 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 17776.09 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 7672.25 MB freed, 0.00 MB remains loaded, 2225.62 MB buffer reserved, lowvram patches: 0
loaded completely; 18280.74 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:31<00:00,  3.55s/it]
Requested to load AutoencodingEngine
Unloaded partially: 714.55 MB freed, 11025.02 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
loaded completely; 5115.17 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 42.84 seconds
got prompt
Unloaded partially: 2606.25 MB freed, 8418.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
Requested to load ZImageTEModel_
loaded completely; 13746.09 MB usable, 7672.25 MB loaded, full load: True
loaded completely; 15770.14 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [03:08<00:00, 20.97s/it]
Requested to load AutoencodingEngine
Unloaded partially: 7370.80 MB freed, 4368.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 7818.47 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 207.74 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 17872.09 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 6930.37 MB freed, 741.88 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
loaded completely; 17559.86 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:33<00:00,  3.71s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1445.80 MB freed, 10293.77 MB remains loaded, 75.00 MB buffer reserved, lowvram patches: 0
loaded completely; 5416.87 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 43.43 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 11868.34 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 6455.37 MB freed, 1216.88 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
loaded completely; 17005.86 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:51<00:00,  5.78s/it]
Requested to load AutoencodingEngine
Unloaded partially: 686.42 MB freed, 11053.14 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
loaded completely; 5113.12 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 59.91 seconds
got prompt
Requested to load ZImageTEModel_
loaded completely; 11106.96 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 6360.37 MB freed, 1311.88 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
loaded completely; 16910.86 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [01:26<00:00,  9.66s/it]
Requested to load AutoencodingEngine
Unloaded partially: 714.55 MB freed, 11025.02 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
loaded completely; 5124.37 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 94.45 seconds
got prompt
loaded completely; 18064.10 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:32<00:00,  3.60s/it]
Unloaded partially: 658.30 MB freed, 11081.27 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
Prompt executed in 36.01 seconds
got prompt
loaded completely; 18064.10 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:32<00:00,  3.66s/it]
Unloaded partially: 658.30 MB freed, 11081.27 MB remains loaded, 28.12 MB buffer reserved, lowvram patches: 0
Prompt executed in 36.55 seconds
```


# 2025-12-29

```
got prompt
Requested to load AutoencodingEngine
loaded completely; 5762.52 MB usable, 159.87 MB loaded, full load: True
Requested to load ZImageTEModel_
loaded completely; 9330.58 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 3130.37 MB freed, 4541.88 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:45<00:00,  5.09s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1282.50 MB freed, 3259.38 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
loaded completely; 3094.22 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 54.74 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:22<00:00,  2.53s/it]
Prompt executed in 26.64 seconds
got prompt
loaded completely; 9312.33 MB usable, 7672.25 MB loaded, full load: True
Unloaded partially: 3130.37 MB freed, 4541.88 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:55<00:00,  6.18s/it]
Requested to load AutoencodingEngine
Unloaded partially: 1282.50 MB freed, 3259.38 MB remains loaded, 142.50 MB buffer reserved, lowvram patches: 0
loaded completely; 3094.22 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 64.01 seconds
got prompt
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [00:06<00:00,  1.41it/s]
Prompt executed in 9.29 seconds
```


Zimage 1536x1536 9 step
```
got prompt
Using split attention in VAE
Using split attention in VAE
VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
Requested to load AutoencodingEngine
loaded completely; 9599.35 MB usable, 159.87 MB loaded, full load: True
CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
Requested to load ZImageTEModel_
loaded completely; 22323.17 MB usable, 7672.25 MB loaded, full load: True
model weight dtype torch.bfloat16, manual cast: None
model_type FLOW
unet missing: ['norm_final.weight']
Requested to load Lumina2
loaded completely; 12241.17 MB usable, 11739.55 MB loaded, full load: True
100%|████████████████████████████████████████████████████████████████████████████████████| 9/9 [07:14<00:00, 48.29s/it]
Requested to load AutoencodingEngine
0 models unloaded.
loaded completely; 9599.35 MB usable, 159.87 MB loaded, full load: True
Prompt executed in 475.64 seconds
```