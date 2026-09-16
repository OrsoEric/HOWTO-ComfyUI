https://github.com/0xShug0/audio.cpp/releases/tag/v0.8.0

##

```cmd
audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\yue2_3B_INT8CR_3G7.safetensors" --backend vulkan


```

# INT8 CONVROT

https://huggingface.co/Comfy-Org/YuE2/tree/main/checkpoints

```
D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\yue2_3B_INT8CR_3G7.safetensors" --backend vulkan
audiocpp_cli failed: missing Yue2 model config: D:\LLM_Models\ComfyUI_Models\checkpoints\sidecars\yue2-model-config.json
```

looks like I need to run the gguf, I can't easily use the safetensor


# GGUF

I use the Q8 GGUF quants that is same class as INT8

```
D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2_3B_Q8_3G7.gguf

audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2_3B_Q8_3G7.gguf" --backend vulkan
```

https://huggingface.co/scragnog/YuE2-GGUF/tree/main


Inspect

```
audiocpp_gguf.exe --inspect "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2_3B_Q8_3G7.gguf"
gguf=D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2_3B_Q8_3G7.gguf
tensors=628
rank0_scalars=0
embedded_sidecars=false
embedded_model_spec=false
```


## DOWNLOAD 

https://huggingface.co/audio-cpp/Yue2-3B-GGUF/tree/main


D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2

audiocpp_gguf.exe --inspect "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\yue2-3b-q8_0"


tree "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" /F
Folder PATH listing for volume Data
Volume serial number is 44A3-5B16
D:\LLM_MODELS\COMFYUI_MODELS\CHECKPOINTS\YUE2
│   yue2-3b-q8_0.gguf
│   yue2-vae-f32.gguf
│   Yue2_3B_Q8_3G7.gguf
│
└───sidecar
        yue2-generation-config.json
        yue2-model-config.json
        yue2-qwen.tiktoken
        yue2-vae-config.json


audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan

type "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars\yue2-generation-config.json"



D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>type "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars\yue2-generation-config.json"
{
  "abc": {
    "temperature": 0.7,
    "top_p": 0.9,
    "top_k": 30,
    "repetition_penalty": 1.005,
    "penalty_window": 100,
    "min_tokens": 32,
    "max_tokens": 4096
  },
  "semantic": {
    "temperature": 1.0,
    "top_p": 0.95,
    "top_k": 100,
    "repetition_penalty": 1.2,
    "penalty_window": 50,
    "min_tokens": 200,
    "max_tokens": 9000
  },
  "ode_steps": 32,
  "ode_method": "midpoint",
  "context": 24576,
  "version": "yue2-native-v1"
}

D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>type "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars\yue2-model-config.json"
{
  "return_dict": true,
  "output_hidden_states": false,
  "torchscript": false,
  "dtype": "bfloat16",
  "tie_word_embeddings": false,
  "is_encoder_decoder": false,
  "is_decoder": false,
  "add_cross_attention": false,
  "architectures": [
    "YuE2ForCausalLM"
  ],
  "bos_token_id": null,
  "pad_token_id": null,
  "eos_token_id": null,
  "decoder_start_token_id": null,
  "transformers_version": "4.57.6",
  "auto_map": {
    "AutoConfig": "modeling_yue2.YuE2Config",
    "AutoModelForCausalLM": "modeling_yue2.YuE2ForCausalLM"
  },
  "model_type": "yue2",
  "hidden_size": 2048,
  "num_hidden_layers": 28,
  "num_attention_heads": 16,
  "num_key_value_heads": 8,
  "head_dim": 128,
  "intermediate_size": 6144,
  "vocab_size": 184704,
  "rms_norm_eps": 1e-06,
  "rope_theta": 1000000,
  "max_position_embeddings": 24576,
  "latent_type": "vae",
  "latent_dim": 64,
  "max_latent_frames": 24576,
  "timestep_shift": 1.0,
  "outpu



D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>audiocpp_gguf.exe --inspect "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\yue2-vae-f32.gguf"
gguf=D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\yue2-vae-f32.gguf
tensors=435
rank0_scalars=0
embedded_sidecars=false
embedded_model_spec=false
namespace=vae_weights


D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars"
ggml_vulkan: Found 1 Vulkan devices:
ggml_vulkan: 0 = Intel(R) Arc(TM) B390 GPU (Intel Corporation) | uma: 1 | fp16: 1 | bf16: 0 | warp size: 32 | shared memory: 49152 | int dot: 1 | matrix cores: KHR_coopmat
audiocpp_cli failed: yue2.vae_gguf file does not exist: D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\yue2-vae-f16.gguf


yue2-user-override.json
{
  "family": "yue2",
  "vae_gguf": "yue2-vae-f32.gguf"
}

audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars\yue2-user-override.json"


D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>audiocpp_cli.exe --list-loaders --json
{"schema_version":1,"loaders":{"sanotts":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"outetts":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"builtin_audio_utils":{"tasks":{"s2s":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"ace_step":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"audio8_asr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"muscriptor":{"tasks":{"midi":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"audio8_tts":{"tasks":{"tts":["offline","streaming"],"clon":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"audiosr":{"tasks":{"s2s":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"breeze_tts":{"tasks":{"tts":["offline","streaming"],"clon":["offline","streaming"],"vdes":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"moss_tts_nano":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"cosyvoice3":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"bs_roformer":{"tasks":{"sep":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"chatterbox":{"tasks":{"clon":["offline"],"vc":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/tasks/run","/v1/audio/speech"]},"chatterbox_turbo":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"magpie_tts":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"citrinet_asr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"confucius4_tts":{"tasks":{"clon":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"controlfoley":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"pocket_tts":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"minimax_music3":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"dramabox":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"dots_tts":{"tasks":{"tts":["offline","streaming"],"clon":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"glm_tts":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"miocodec":{"tasks":{"vc":["offline"],"s2s":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"echo_tts":{"tasks":{"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"moonshine_asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"qwen3_asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"nemotron_asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"f5_tts":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"heartmula":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"kroko_asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"firered_audio":{"tasks":{"gen":["offline"],"asr":["offline"],"tts":["offline"],"clon":["offline"],"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/tasks/run","/v1/audio/speech"]},"rvc":{"tasks":{"vc":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"fun_asr_nano":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"fireredtts3":{"tasks":{"tts":["offline"],"clon":["offline"],"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"fish_audio":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"higgs_audio_tts":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"higgs_audio_stt":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"granite5asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"seed_vc":{"tasks":{"vc":["offline"],"svc":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"htdemucs":{"tasks":{"sep":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"hviske_asr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"index_tts2":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"mms_forced_aligner":{"tasks":{"align":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"inflect_v2":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"parakeet_tdt":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"irodori_tts":{"tasks":{"tts":["offline"],"clon":["offline"],"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"kokoro_tts":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"marblenet_vad":{"tasks":{"vad":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"meanvc2":{"tasks":{"vc":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"mel_band_roformer":{"tasks":{"sep":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"voxtral_realtime":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"midashenglm_gen":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"minimax_h3":{"tasks":{"tts":["offline"],"gen":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/tasks/run","/v1/audio/speech"]},"miotts":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"mira_tts":{"tasks":{"tts":["offline","streaming"],"clon":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"moss_tts_local":{"tasks":{"tts":["offline"],"clon":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"moss_voicegen":{"tasks":{"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"neutts":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"niagara_asr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"omnivoice":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"soft_tags","api_endpoints":["/v1/audio/speech"]},"personaplex":{"tasks":{"s2s":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"sense_asr":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"qwen3_forced_aligner":{"tasks":{"align":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"qwen3_tts":{"tasks":{"tts":["offline"],"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"sheetsage2":{"tasks":{"midi":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"silero_vad":{"tasks":{"vad":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"soprano_tts":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"sopro_tts":{"tasks":{"tts":["offline","streaming"],"clon":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"sortformer_diar":{"tasks":{"diar":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"sortformer_diar_v2":{"tasks":{"diar":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"stable_audio":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]},"supertonic":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"vevo2":{"tasks":{"tts":["offline"],"vc":["offline"],"s2s":["offline"],"svc":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/tasks/run","/v1/audio/speech"]},"vibeasr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"vibevoice":{"tasks":{"tts":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"vibevoice_asr":{"tasks":{"asr":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"vibevoice_asr_streaming":{"tasks":{"asr":["offline","streaming"]},"instructions_policy":"none","api_endpoints":["/v1/audio/transcriptions"]},"vietneu_tts":{"tasks":{"tts":["offline"],"vdes":["offline"]},"instructions_policy":"openai_instruct","api_endpoints":["/v1/audio/speech"]},"voxcpm1":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"text_prefix","api_endpoints":["/v1/audio/speech"]},"voxcpm2":{"tasks":{"tts":["offline","streaming"]},"instructions_policy":"text_prefix","api_endpoints":["/v1/audio/speech"]},"yue2":{"tasks":{"gen":["offline"]},"instructions_policy":"none","api_endpoints":["/v1/tasks/run"]}}}


download VAE FP16ù


audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars"


audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --text "Genre: Italian folk song. Vocals: a lone youthful female singer from Southern Italy, singing with a Sicilian Italian accent and shortened consonants. Language: Italian with Sicilian accent. Tempo: 120 BPM, happy and merry. Instruments: flute and harmonica, whimsical summery accompaniment, fast-paced mazurka-like rhythm. [Solo] Singer solo, harmonica accentuates the beats, flute melody evokes summer. [Chorus] School boys and girls accompany the solo singer." --lyrics "[Solo]
Sopra la panca la capra canta
Sotto la panca la capra crepa
[Chorus]
Il mietitore prende la capra e la mangia
Il creatore prende la capra e la rivive" --out "yue2-output.wav" --metrics

doesn't work

benchmark_input.json
{
  "style": "Genre: Italian folk song\nVocals: A lone Southern Italian youthful female singer, singing with a Sicilian Italian accent and shortened consonants.\nLanguage: Italian with Sicilian accent.\nTempo: 120 BPM, happy and merry.\nInstruments: Flutes and harmonica, whimsical summer happy tune accompanying the vocals, fast-paced and reminiscent of a mazurka.\n[Solo] Singer solo, harmonica accentuates the beats, flute melody evokes summer.\n[Chorus] School boys and girls accompany the solo singer.",
  "lyrics": "[Solo]\nSopra la panca la capra canta\nSotto la panca la capra crepa\n\n[Chorus]\nIl mietitore prende la capra e la mangia\nIl creatore prende la capra e la rivive"
}


audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-358h-b390-vulkan.wav"

# Attempt that runs

[
  {
    "id": "italian_folk_01",
    "options": {
      "style": "Italian folk song, Southern Italian female vocal, Sicilian accent, Italian language, happy, merry, 120 BPM, flute, harmonica, whimsical summer tune, fast-paced mazurka",
      "lyrics": "[Solo]\nSopra la panca la capra canta\nSotto la panca la capra crepa\n\n[Chorus]\nIl mietitore prende la capra e la mangia\nIl creatore prende la capra e la rivive"
    }
  }
]


audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-output.wav"

add feedback

audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-output.wav" --log --metrics

# Try CPU

audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend cpu --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-cpu-test.wav" --log --metrics

metrics[italian_folk_01].wall_ms=473642
metrics[italian_folk_01].audio_duration_ms=34958.7
metrics[italian_folk_01].rtf=13.5486
metrics[italian_folk_01].x_realtime=0.0738082
metrics[italian_folk_01].audio_duration_source=output
metrics[italian_folk_01].sample_rate=48000
metrics[italian_folk_01].channels=2

it worked, output is good

# Try Vulkan again

audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-358h-b390-vulkan.wav" --log --metrics

D:\Data\Project\Project-LLM\audio-v0.8.0-bin-windows-x64-vulkan>audiocpp_cli.exe --task gen --family yue2 --model "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2" --backend vulkan --model-spec-override "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\sidecars" --request-sequence "D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2\benchmark_input.json" --batch-merge-audio concat --out "yue2-358h-b390-vulkan.wav" --log --metrics
[TRACE ts=20260916-194007] runtime.model.family yue2
[TRACE ts=20260916-194007] runtime.model.variant Yue2
[TRACE ts=20260916-194007] runtime.model.root D:\LLM_Models\ComfyUI_Models\checkpoints\Yue2
[TRACE ts=20260916-194007] runtime.model.discovered_config_count 4
[TRACE ts=20260916-194007] runtime.model.discovered_weight_count 3
[TRACE ts=20260916-194007] runtime.model.task_count 1
[TRACE ts=20260916-194007] runtime.model.language_count 1
[TRACE ts=20260916-194007] runtime.model.supports_speaker_reference 0
[TRACE ts=20260916-194007] runtime.model.supports_style_condition 1
[TRACE ts=20260916-194007] runtime.model.supports_timestamps 0
ggml_vulkan: Found 1 Vulkan devices:
ggml_vulkan: 0 = Intel(R) Arc(TM) B390 GPU (Intel Corporation) | uma: 1 | fp16: 1 | bf16: 0 | warp size: 32 | shared memory: 49152 | int dot: 1 | matrix cores: KHR_coopmat
family=yue2
task=gen
mode=offline
[TRACE ts=20260916-194009] yue2.request seed=1234 cot=full guidance_scale=1 num_inference_steps=8 context=24576 abc=generated nar_noise=generated
[TRACE ts=20260916-194009] yue2.sampling.abc temperature=0.7 top_p=0.9 top_k=30 repetition_penalty=1.005 penalty_window=100 min_tokens=32 max_tokens=4096
[TRACE ts=20260916-194009] yue2.sampling.semantic temperature=1 top_p=0.95 top_k=100 repetition_penalty=1.2 penalty_window=50 min_tokens=200 max_tokens=9000
[TIMING ts=20260916-194009] yue2.plan_ms 6.1808
[TIMING ts=20260916-194015] yue2.ar.init_ms 5877.8752
[TIMING ts=20260916-194015] yue2.ar.ensure_generation_ms 823.0956
[TIMING ts=20260916-194015] yue2.ar.generate.prefix_tokens 199
[TIMING ts=20260916-194016] yue2.ar.decode.graph.build_ms 297.7641
[TRACE ts=20260916-194016] yue2.ar.decode.cache_steps 4295
[TIMING ts=20260916-194016] yue2.ar.prefill.graph.build_ms 249.5436
[TRACE ts=20260916-194016] yue2.ar.prefill.steps 199
[TIMING ts=20260916-194016] yue2.ar.generate.prefill_ms 693.1097
[TIMING ts=20260916-194148] yue2.ar.generate.sample_ms 2060.959600000003
[TIMING ts=20260916-194148] yue2.ar.generate.decode_ms 90382.95050000008
[TIMING ts=20260916-194148] yue2.ar.generate.refill_prefill_ms 0
[TIMING ts=20260916-194148] yue2.ar.generate.refill_count 0
[TIMING ts=20260916-194148] yue2.ar.generate.emitted_tokens 3097
[TIMING ts=20260916-194148] yue2.ar.generate.total_ms 93141.3707
[TIMING ts=20260916-194148] yue2.semantic.abc_generate_ms 93964.9513
[TIMING ts=20260916-194148] yue2.semantic.abc_generated_tokens 3097
[TIMING ts=20260916-194148] yue2.semantic.abc_truncated 0
[TIMING ts=20260916-194149] yue2.ar.ensure_generation_ms 0.0081
[TIMING ts=20260916-194149] yue2.ar.generate.prefix_tokens 3298
[TIMING ts=20260916-194149] yue2.ar.decode.graph.build_ms 396.3454
[TRACE ts=20260916-194149] yue2.ar.decode.cache_steps 8418
[TIMING ts=20260916-194150] yue2.ar.prefill.graph.build_ms 338.611
[TRACE ts=20260916-194150] yue2.ar.prefill.steps 3298
[TIMING ts=20260916-194153] yue2.ar.generate.prefill_ms 4647.2075
[TIMING ts=20260916-194403] yue2.ar.generate.sample_ms 1138.5032000000008
[TIMING ts=20260916-194403] yue2.ar.generate.decode_ms 128869.6804000002
[TIMING ts=20260916-194403] yue2.ar.generate.refill_prefill_ms 0
[TIMING ts=20260916-194403] yue2.ar.generate.refill_count 0
[TIMING ts=20260916-194403] yue2.ar.generate.emitted_tokens 4164
[TIMING ts=20260916-194403] yue2.ar.generate.total_ms 134660.4069
[TIMING ts=20260916-194403] yue2.semantic.tokens 4164
[TIMING ts=20260916-194403] yue2.semantic.truncated 0
[TIMING ts=20260916-194404] yue2.semantic_ms 235123.4822
[TIMING ts=20260916-194408] yue2.nar.init_ms 4439.6659
[TIMING ts=20260916-194408] yue2.nar.synthesize.codec_tokens 4164
[TIMING ts=20260916-194408] yue2.nar.synthesize.chunks 1
[TIMING ts=20260916-194408] yue2.nar.synthesize.context 24576
[TIMING ts=20260916-194409] yue2.ar.prefix_state.graph.build_ms 920.829
[TIMING ts=20260916-194426] yue2.nar.graph.build_ms 0.7751
ggml_vulkan: Device memory allocation of size 273031168 failed.
ggml_vulkan: vk::Device::allocateMemory: ErrorOutOfDeviceMemory
ggml_gallocr_reserve_n_impl: failed to allocate Vulkan0 buffer of size 273031168
audiocpp_cli failed: failed to allocate Yue2 NAR graph

# Try CPU again