

https://docs.comfy.org/tutorials/audio/minimax/minimax-music-3

# MODELS

https://huggingface.co/Comfy-Org/MiniMax-Music-3/tree/main


```cmd
[INFO] got prompt
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.float32
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load MiniMaxMusic3TEModel
[INFO] loaded completely; 22894.08 MB usable, 15921.75 MB loaded, full load: True
F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py:95: UserWarning: Using AOTriton backend for Efficient Attention forward... (Triggered internally at C:/b/pytorch/aten/src/ATen/native/transformers/hip/attention.hip:1452.)
  return torch.nn.functional.scaled_dot_product_attention(q, k, v, *args, **kwargs)
AR sampling: 100%|█████████████████████████████████████████████████████████████████| 1501/1501 [01:39<00:00, 15.11it/s]
[INFO] model weight dtype torch.float16, manual cast: None
[INFO] model_type FLOW
[INFO] Requested to load MiniMaxMusic3
[INFO] loaded completely; 22645.90 MB usable, 4686.50 MB loaded, full load: True
  0%|                                                                                           | 0/30 [00:00<?, ?it/s]MIOpen(HIP): Warning [IsEnoughWorkspace] [GetSolutionsFallback WTI] Solver <GemmFwdRest>, workspace required: 36864000, provided ptr: 0000000000000000 size: 0
100%|██████████████████████████████████████████████████████████████████████████████████| 30/30 [01:11<00:00,  2.40s/it]
[INFO] Requested to load MiniMaxMusic3DAV
[INFO] loaded completely;  206.60 MB loaded,
```


# AUDIO CLONING

I need the reference node with the video vae

https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/vae/minimax_h3_video_vae_fp16.safetensors

I should cut it to use only audio and audio vae



# PROMPT TO COMPOSE MUSIC

# BENCHMARK

Gregorian Chant & Liturgical Music

You are an expert musician. Your task is to analyze a one-paragraph description of a song and generate a comprehensive breakdown structured exactly as follows:

Global Metadata: Genre, BPM, Key, Scale, and Mood, natural language dscription of the mood
Vocal Details: natural language description of the singer(s) voices , gender, age, type, delivery, tick, vocalizations, timbre
Arrangement: Instrumentation, structure (Intro, Verse, Chorus, etc.), and production techniques. Natural language description of instruments and tempo and mood. Descrive the tags in square brackets. Tags are: [Intro], [Verse], [Chorus], [Bridge], [Instrumental], [Outro] that give the song structure.
Lyrics: ONLY the tags in square brackets to control the structure of the song, the exact lyrics to be spelled, round brackets for lyrics of secondary voices.

Ensure the output is technical, atmospheric, and creative, matching the style of the provided example.

Below an example of output

```txt
Global Metadata: Lo-fi hip-hop, chillhop. 78 BPM, D flat major, major scale with jazzy extensions. Laid-back and dreamy throughout, a gentle warm drift with a subtle late-night glow that deepens in the middle and dissolves softly at the end. Studying, raining-outside, headphones-on late-night listening. Bedroom production: muddy warm texture, heavy vinyl crackle, tape hiss and wow-flutter pitch wobble, low-passed dusty mix, soft-clipped drums, everything slightly detuned and cozy.

Vocal Details: Soft androgynous vocal, hushed half-sung half-spoken delivery, sitting low in the mix like another instrument, lazy behind-the-beat phrasing, gentle breathy timbre. Sparse murmured double-tracked harmonies, occasional wordless "mmm" and "ooh" hums drenched in tape delay and warm spring reverb. Long stretches with no vocals at all.

Arrangement: Dusty boom-bap drums with a soft thumping kick, cracked snare with lazy swing, brushed hi-hats, low round sub bass. Warm Rhodes piano chords with slow chorus wobble as the harmonic bed, mellow jazzy guitar licks answering the vocal lines, constant vinyl crackle as texture. Intro: rain and vinyl noise, solo Rhodes chords fading in, drums slipping in halfway. Verses: minimal — drums, bass, Rhodes, soft guitar fills between lines. Instrumental sections: guitar and Rhodes trade relaxed jazzy phrases over the beat, occasional muted trumpet ghost notes far in the background. Bridge: drums drop away to rain, crackle, and floating detuned Rhodes, then the beat eases back in. Outro: elements fade one by one until only vinyl crackle and a last unresolved Rhodes chord remain.

LYRICS:
[Intro]
Mmm...
Ooh...

[Verse]
Midnight and the canvas glows
Dragging little wires where the current flows
Type a quiet dream, let the sampler drift
Noise into a picture, like the fog just lifts
Twenty slow steps, I'm in no hurry now
Latents turning colors and I don't know how
Every render's like a polaroid I found
Soft focus memories, no sound

[Instrumental]

[Verse]
Queue another frame, let the motion breathe
Pictures start to move like the falling leaves
Video drifting by at twenty-four
Little animations on my bedroom floor
Seed after seed like the rain outside
Some of them are keepers, some I let slide
Save the ones that feel like a Sunday slow
Node to node to node... and off we go

[Chorus]
Mmm... let it render on
(take your time, take your time)
Ooh... by the morning it'll all be done
(one more queue, one more try)

[Instrumental]

[Bridge]
Rain keeps drawing pictures on the glass...
My machine keeps dreaming...
Neither of us fast...

[Chorus]
Mmm... let it render on
(take your time, take your time)
Ooh... by the morning it'll all be done
(one more queue, one more try)

[Instrumental]

[Outro]
Mmm...
(node to node)
Ooh... goodnight
```

# TEST

Global Metadata: Dark Liturgical Ambient, Ethereal Darkwave. 62 BPM, D minor, Dorian mode. A freezing, ancient melancholy, vast and silent, like standing on a frozen peak under a starless sky. The atmosphere is solemn and apocalyptic, yet strangely comforting in its coldness.

Vocal Details: Deep, resonant contralto, cold and distant. The voice is a low, vibrating register that sounds like it is echoing from a deep cavern or a distant tower. Delivery is half-spoken, ritualistic, and slow, with a detached, regal cadence. Timbre is hollow and cavernous, often sounding like a whisper amplified by vast reverb. Occasional guttural hums and wordless chants that mimic the sound of wind or distant chimes.

Arrangement: Massive, thunderous pipe organ chords that swell slowly, mournful dissonant violins that scrape and tremolo, cold, crystalline synth pads that mimic the texture of ice. Intro: Deep organ drone and low violin swells. Verses: Spoken-word lines over a backdrop of distant violin glissandos and soft organ pads. Chorus: High, ethereal organ swell and violin harmonics, creating a sense of vastness. Bridge: Dissonant violin tremolo and a breakdown of the organ into a single, haunting note. Outro: Elements fade into a cold, empty silence.

LYRICS:
[Intro]
The golden order turns to ash...
The stars are waking from their sleep...

[Verse]
The fire burns the old world down
We watch the golden order drown
In silence deep and cold and vast
The Age of Stars is coming fast

[Chorus]
The Moon is our only light
To guide us through the endless night
Save us from the burning sky
With cold and silver, endless eye

[Instrumental]

[Verse]
The Outer Gods sleep in dust
We leave the rot and rust
No more the Erdtree's heavy hand
We walk the path of star and sand

[Chorus]
The Moon is our only light
To guide us through the endless night
Save us from the burning sky
With cold and silver, endless eye

[Bridge]
The cold will not hurt us here
The silence is our only fear
No more the golden chains
The stars are all that remains

[Chorus]
The Moon is our only light
To guide us through the endless night
Save us from the burning sky
With cold and silver, endless eye

[Outro]
Sleep...
Under the Moon...