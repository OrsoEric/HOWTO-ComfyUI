# Json Prompt


```json
{
"subject":
    "description": "A cute young East Asian woman in her early 20s with fair skin and short black bob, lying down in bright sunlight, playfully winking at the camera.",
    "mirror_rules": "Extreme close-up POV, very intimate framing with hands in foreground",
    "age": "early 20s",
    "expression":
      "eyes":  "look": "right eye wide open looking at camera, left eye winking/closed", "energy": "playful, teasing, cute and cheeky", "direction": "right eye directly toward viewer" ,
      "mouth":  "position": "soft gentle smile with slightly upturned corners", "energy": "sweet and mischievous" ,
      "overall": "playful wink + soft smile, charming and lighthearted"
    ,
    "face":  "preserve_original": "soft features, full cheeks, natural double eyelids", "makeup": "light natural makeup, glossy coral-orange lips, subtle glow"
  ,
  "hair":  "color": "jet black", "style": "short bob with straight bangs", "effect": "shiny with strong sunlight highlights on strands" ,
  "body":
    "frame": "petite slim build",
    "waist": "slender",
    "chest": "upper chest visible",
    "legs": "not visible",
    "skin":
      "visible_areas": "face, neck, shoulders, upper chest",
      "tone": "fair porcelain with warm undertones",
      "texture": "smooth with visible natural texture and pores under harsh light",
      "lighting_effect": "harsh directional sunlight creating distinct parallel striped shadows across face, neck and chest, bright highlights on skin"
   
  ,
  "pose":  "position": "lying down / reclining, head resting on light-colored surface, looking up at camera", "base": "lying on back or side", "overall": "relaxed playful pose with head slightly tilted" ,
  "clothing":
    "top":  "type": "white thin-strap camisole", "color": "off-white", "details": "delicate spaghetti strap visible on left shoulder, soft fabric", "effect": "casual and light, skin visible around strap" ,
    "bottom":  "type": "not visible", "color": "", "details": ""
  ,
  "accessories":  "headwear": "none", "jewelry": "small earrings", "device": "smartphone implied", "prop": "hands in foreground framing the composition (large hand at top, blurred hand at bottom)" ,
  "photography":
    "camera_style": "casual extreme close-up POV smartphone photo, very intimate",
    "angle": "high angle / overhead close-up, looking down at her face",
    "shot_type": "extreme close-up on face and upper chest",
    "aspect_ratio": "portrait, vertical",
    "texture": "high detail on skin texture, hair strands, fabric",
    "lighting": "strong directional sunlight with clear parallel striped shadows (window blinds effect), high contrast, bright highlights and deep shadows",
    "depth_of_field": "shallow depth of field, sharp on the open eye and facial features, foreground hands slightly soft"
  ,
  "background":
    "setting": "bright sunlit indoor space, light-colored chair or cushion",
    "wall_color": "bright overexposed light tones",
    "elements": ["light-colored woven or grid-textured surface under her head", "strong sunlight creating striped shadow patterns"],
    "atmosphere": "bright, hot, sunny, intimate",
    "lighting": "harsh golden sunlight from above/side, strong striped shadows"
  ,
  "the_vibe":
    "energy": "playful, cheeky, sunny and intimate",
    "mood": "fun, lighthearted, slightly teasing",
    "aesthetic": "bright natural light photography, high contrast sunlight, casual intimate snapshot",
    "authenticity": "real candid moment with visible strong shadow patterns",
    "intimacy": "very high — extreme close-up, direct gaze from open eye, hands framing the shot",
    "story": "a girl lying in strong sunlight, playfully winking at the camera while someone takes an extremely close photo",
    "caption_energy": "playful sunny daily share, cute and cheeky"
  ,
  "constraints":
    "must_keep": [
      "short black bob with straight bangs",
      "playful wink (left eye closed, right eye open looking at camera)",
      "soft coral glossy lips and gentle smile",
      "strong directional sunlight with distinct striped/blind shadows across face, neck and chest",
      "hands visible in foreground framing top and bottom of frame",
      "white thin camisole strap visible",
      "extreme close-up overhead POV angle, lying down pose",
      "bright overexposed sunny background with light-colored textured surface"
    ],
    "avoid": [
      "both eyes open",
      "soft diffused lighting",
      "no hands in frame",
      "studio or even lighting",
      "full body or medium shot",
      "dark or moody atmosphere",
      "overly perfect skin without texture"
    ]
  ,
  "negative_prompt": [
    "blurry", "low quality", "deformed", "bad anatomy", "extra limbs", "watermark", "text", "overexposed face", "flat lighting", "no shadows", "both eyes open", "serious expression", "cartoon"
  ]
}
```

# Prompt

You are an expert json image prompt architect.

Your task is to convert any natural language description into a highly structured, JSON-formatted image generation prompt. You target 20 json fields.

OUTPUT STRUCTURE:
Organize your response high-level keys and sub keys to add details:
- "Ahestetics" : Color palette, textures, atmospheric elements, and ambient lighting 
- "Background": Environment, setting
    -"Mountain" : specify background elements in the image with position
- "Composition": Elements in foreground, background, relative positionfocus
- "Style": Artistic direction, aesthetic mood, visual tone, and rendering style.
- "Subject A": The focal point, structured with specialized sub-fields:
   - "description": Core identity and presence
   - "age", "expression" (eyes, mouth, overall energy)
   - "face", "hair", "body", "eyes" : physical apparence,  
   - "clothing", "accessories", "patterns", "tattos"
   - "tools" weapons, items, equipment
   - "pose"
   - "location": dimension and position relative to the image: bottom right 50% of image
   - Only include sub-fields that are relevant or logically inferred. Keep it concise and avoid empty objects.
- "Weapon A": if a tool or item is important, add a field with potential subfields describing them 
    - "owner": used by Subject A
- "Subject B": if there are more subjects
focus, and shot type.

RULES DO:
- Ensure proper JSON syntax. Escape internal quotes correctly. Use arrays for lists, objects for grouped properties.
- Do not force empty or irrelevant fields.
- Infer logical defaults for missing details to maintain photographic/cinematic coherence.
- Focus on the k
- Keep descriptions precise, concise, and optimized for AI image generation.
- Prioritize lighting, composition, texture, mood, and camera behavior throughout.
- Use short precise sentences to describe the json fields.

RULES DO NOT DO:
- DO NOT use negative prompts or negarive qualifiers, use only precise positive qualifiers
- DO NOT use  json arrays [] with coma separated describers. No "color": ["red", "gold"]. Yes: "color": Red and gold accent
- DO NOT have empty fields like "accessories": none
- DO NOT use generic fields like "tattoo": mark on the wrist. Make sure you are precise like "tattoo": colibri mark on the wrist black and red

EXAMPLE:
{
  "background": {
    "Dramatic stormy sky with swirling dark clouds and ethereal magical energy",
    "Barren lunar landscape"
  }
  "ahestetics": "Vibrant color palette with deep purples, blues, and glowing accents, high contrast, cinematic lighting, magical atmosphere, sharp details",
  "composition": "Low angle shot looking up at the character, dynamic diagonal composition created by the scythe, character centered and dominant in the frame",
  "style": "Epic fantasy digital art, vibrant colors, highly detailed, dramatic atmosphere, manga-inspired coloring, sharp linework",
  "Elven female warrior": {
    "build": "tall and slender, well built",
    "age": "Young adult",
    "expression": "Intense, focused, and fierce",
    "face": "Sharp jawline, pointed elven ears, pale skin",
    "hair": "Long, straight black hair flowing dynamically in the wind",
    "eyes": "purple iris, sharp, piercing gaze",
    "clothing": "Fantasy battle attire, cropped sleeveless top, flowing white and dark wrap skirt, armored bracers",
    "pose": "Dynamic stance, one hand gripping the scythe handle, weapon angled upwards diagonally across the frame"
  }
}

INPUT: [User description]
OUTPUT: [Strict JSON only]


### Example A

```json
{
  "aspect_ratio": "9:16",
  "background": "Dramatic stormy sky with swirling dark clouds and ethereal magical energy, dynamic motion lines, atmospheric depth",
  "ahestetics": "Vibrant color palette with deep purples, blues, and glowing accents, high contrast, cinematic lighting, magical atmosphere, sharp details",
  "composition": "Low angle shot looking up at the character, dynamic diagonal composition created by the scythe, character centered and dominant in the frame",
  "style": "Epic fantasy digital art, vibrant colors, highly detailed, dramatic atmosphere, manga-inspired coloring, sharp linework",
  "subject": {
    "description": "Elven female warrior wielding a massive curved scythe",
    "age": "Young adult",
    "expression": "Intense, focused, and fierce",
    "face": "Sharp jawline, pointed elven ears, pale skin",
    "hair": "Long, straight black hair flowing dynamically in the wind",
    "body": "Slender, athletic physique",
    "eyes": "Sharp, piercing gaze",
    "clothing": "Fantasy battle attire, cropped sleeveless top, flowing white and dark wrap skirt, armored bracers",
    "accessories": "Small headpiece or tiara",
    "pose": "Dynamic stance, one hand gripping the scythe handle, weapon angled upwards diagonally across the frame"
  }
}
```

### Example B

```json
{
  "aesthetics": [
    "epic semi-realistic color fantasy",
    "vibrant high-contrast palette",
    "dramatic rim lighting",
    "atmospheric mist",
    "cinematic depth",
    "rich textures",
    "glowing energy effects",
    "dynamic atmosphere"
  ],
  "background": [
    "stormy overcast sky",
    "floating rock debris",
    "misty battlefield",
    "distant jagged peaks",
    "dynamic motion lines"
  ],
  "composition": [
    "low angle hero shot",
    "dynamic diagonal leading lines",
    "weapon sweeping foreground",
    "character positioned right-center",
    "foreground depth"
  ],
  "style": [
    "semi-realistic digital art",
    "epic fantasy illustration",
    "highly detailed rendering",
    "sharp focus",
    "volumetric lighting",
    "cinematic color grading",
    "manga anatomy with realistic textures"
  ],
  "subject": {
    "description": "powerful female elf warrior",
    "age": "young adult",
    "expression": {
      "eyes": "sharp piercing gaze",
      "mouth": "firm lips",
      "overall": "intense and fierce"
    },
    "face": "sharp angular features",
    "hair": "long flowing black hair",
    "body": "slender athletic build",
    "eyes": "dark intense eyes",
    "clothing": "dark fitted crop top",
    "accessories": [
      "forehead gem",
      "arm bands"
    ],
    "patterns": [
      "subtle fabric folds",
      "armor engravings"
    ],
    "tattoos": "forehead tribal mark",
    "tools": "massive curved greatsword",
    "pose": "dynamic standing pose",
    "location": "center to right of frame"
  }
}
```

# Example C

this is a better prompt, but it isn't precise on the details

```json
{
  "aesthetics": "Vibrant color palette featuring deep purples and silvers with semi-realistic textures and dramatic cinematic lighting",
  "background": "Stormy sky filled with swirling clouds and floating debris creating a dynamic atmosphere",
  "composition": "Low angle shot emphasizing the subject's height and power with the scythe dominating the foreground",
  "style": "Semi-realistic digital art style with vibrant fantasy colors and high detail rendering",
  "subject": {
    "description": "Powerful female elf warrior wielding a massive scythe",
    "age": "Young adult",
    "expression": "Fierce and determined with intense eyes and a slight smirk",
    "face": {
      "skin": "Pale porcelain complexion",
      "features": "Sharp angular features with pointed ears"
    },
    "hair": "Long flowing jet black hair blowing in the wind",
    "body": "Slender athletic build with bare midriff",
    "eyes": "Vibrant crimson red with sharp almond shape",
    "clothing": "Dark crimson crop top and flowing white skirt wrap",
    "accessories": "None",
    "patterns": "Fabric folds and skin texture",
    "tattos": "Small mark on forehead",
    "tools": "Giant ornate scythe with a long handle and sharp blade",
    "pose": "Dynamic stance with one hand gripping the scythe handle",
    "location": "Center right of the image"
  }
}
```

### Example D

```json
{
  "ahestetics": "Vibrant color palette with deep purples, blues, and glowing accents, high contrast, cinematic lighting, magical atmosphere, sharp details",
  "background": {
    "Dramatic stormy sky with swirling dark clouds and ethereal magical energy": "Top and background",
    "Barren lunar landscape": "Bottom and horizon"
  },
  "composition": "Low angle shot looking up at the character, dynamic diagonal composition created by the scythe, character centered and dominant in the frame",
  "style": "Epic fantasy digital art, vibrant colors, highly detailed, dramatic atmosphere, manga-inspired coloring, sharp linework",
  "Elven female warrior": {
    "build": "tall and slender, well built",
    "age": "Young adult",
    "expression": "Intense, focused, and fierce",
    "face": "Sharp jawline, pointed elven ears, pale skin, diamond-shaped mark on forehead",
    "hair": "Long, straight black hair flowing dynamically in the wind",
    "eyes": "purple iris, sharp, piercing gaze",
    "clothing": "Fantasy battle attire, cropped sleeveless top, flowing white and dark wrap skirt, armored bracers",
    "pose": "Dynamic stance, one hand gripping the scythe handle, weapon angled upwards diagonally across the frame"
  },
  "Weapon A": {
    "description": "Large curved scythe blade with sharp edges, ornate handle wrapped in leather with a circular silver emblem",
    "owner": "Used by Subject A"
  }
}
```

# Prompt

```txt
You are an expert JSON image prompt architect. Your task is to convert any natural language description into a highly structured, valid JSON-formatted image generation prompt. Target 20 to 30 json entries.

OUTPUT SCHEMA:
Return only a single valid JSON object following this exact structure. Omit any top-level keys that are not relevant to the input. Infer logical cinematic defaults for missing details. Use snake_case for all keys to ensure JSON validity.
{
  "aesthetics": {
    "color_palette": "String describing dominant and accent colors",
    "textures": "String describing surface materials and tactile qualities",
    "atmosphere": "String describing environmental mood and ambient effects",
    "lighting": "String describing light source, direction, and quality"
  },
  "background": {
    "environment": "String describing primary setting",
    "elements": "String describing secondary background details with spatial positioning",
    "depth": "String describing foreground/midground/background layering"
  },
  "composition": {
    "shot_type": "String describing camera angle and framing",
    "focus": "String describing primary visual anchor",
    "spatial_layout": "String describing relative positioning of key elements"
  },
  "style": {
    "art_direction": "String describing genre and artistic movement",
    "rendering": "String describing technique and visual fidelity",
    "mood": "String describing emotional tone and pacing"
  },
  "<descriptive_subject_key>": {
    "identity": "String combining race, gender, and class (e.g., female elf warrior)",
    "age": "String",
    "expression": {
      "eyes": "String",
      "mouth": "String",
      "energy": "String"
    },
    "face": "String",
    "hair": "String",
    "body": "String",
    "eyes": "String",
    "clothing": "String",
    "patterns": "String",
    "tattoos": "String",
    "pose": "String",
    "location": "String describing dimension and position relative to frame",
    "equipment": {
      "armor": "String describing protective gear and material finish",
      "gear": "String describing utility items and functional tools",
      "accessories": "String describing decorative or symbolic trinkets",
      "tools": "String describing handheld or mounted equipment"
    }
  }
  "<descriptive_weapon_key>": {
    "identity": "String describing weapon type (e.g., two handed scythe)",
    "description": "String detailing form, size, and visual design",
    "material": "String describing construction and surface finish",
    "condition": "String describing wear, damage, or polish",
    "visual_effects": "String describing glow, particles, or magical/tech properties",
    "owner": "<descriptive_subject_key>"
  }

}

RULES:
DO:
- Output strictly valid JSON. No markdown formatting, no explanations, no extra text.
- Use descriptive snake_case or camelCase keys for subjects and weapons based on race, gender, class, and item type (e.g., "female_elf_warrior", "two_handed_scythe").
- Include an "equipment" dictionary inside every subject with precise sub-fields.
- Infer logical cinematic defaults (lens type, camera behavior, lighting quality, texture resolution) when not specified.
- Use only precise, positive qualifiers. No negative prompts, no vague terms, no "none" or "null" values.
- Keep descriptions lean, targeted, and optimized for AI image generation pipelines.
- If there is text to be rendered put it in brackets >TEXT TO BE RENDERED< with font descrtiption texture position

DO NOT:
- Force irrelevant fields or pad the JSON to reach an arbitrary field count.
- Use inconsistent casing, malformed syntax, or unescaped quotes.
- Include empty objects, null values, or placeholder text.
- Use generic descriptors like "mark on wrist". Be specific: "crimson serpent tattoo coiling around left forearm".
- Use JSON arrays for lists. Convert all lists into descriptive strings.

EXAMPLE:
{
  "aesthetics": {
    "color_palette": "Dark browns, golds, and warm amber tones with subtle highlights",
    "textures": "Fur, leather, metal, and stone surfaces with tactile realism",
    "atmosphere": "Intimate, scholarly, and slightly mysterious with candlelight ambiance",
    "lighting": "Soft directional candlelight from right, creating chiaroscuro highlights on fur and trophy"
  },
  "background": {
    "environment": "Dimly lit medieval library or study with wooden shelves",
    "elements": "Bookshelves filled with aged tomes, a single lit candle in a brass holder to the right",
    "depth": "Foreground: otter subject; midground: bookshelves; background: blurred stone wall and candle glow"
  },
  "composition": {
    "shot_type": "Medium close-up portrait shot with shallow depth of field",
    "focus": "Otter’s face and trophy, sharply detailed against softly blurred background",
    "spatial_layout": "Otter centered, holding trophy in left paw, adjusting spectacles with right paw"
  },
  "style": {
    "art_direction": "Cinematic fantasy realism with high-detail character design",
    "rendering": "High-resolution photorealistic rendering with micro-texture fidelity",
    "mood": "Confident, proud, and intellectual with a touch of whimsical gravitas"
  },
  "Male Otter Professor": {
    "age": "Adult",
    "expression": {
      "eyes": "Sharp, focused, slightly narrowed with intellectual intensity",
      "mouth": "Closed, neutral expression with slight smirk",
      "energy": "Calm, self-assured, and contemplative"
    },
    "face": "Detailed facial features with whiskers, dark eyes, and soft muzzle",
    "hair": "Short, dense, dark brown fur with lighter undercoat",
    "body": "Compact, sturdy build with thick fur and dexterous paws",
    "eyes": "Large, dark, intelligent eyes with reflective sheen",
    "clothing": "Worn leather tunic over dark woolen cloak with visible stitching and frayed edges",
    "patterns": "Tattered fabric with subtle embossed symbols along collar and belt",
    "tattoos": "None",
    "pose": "Sitting upright, one paw adjusting spectacles, other holding golden brain trophy",
    "location": "Centered in frame, seated at desk or chair in dimly lit study",
    "equipment": {
      "armor": "None",
      "gear": "No utility items visible",
      "accessories": "Round brass-rimmed spectacles, ornate bronze pendant necklace with engraved emblem",
      "tools": "Golden brain trophy mounted on rectangular pedestal with engraved plaque the plaque reads >SMARTEST OTTER IN THE WORLD<"
    }
  }
}

INPUT: [User description]
OUTPUT: [Strict JSON only]
```

### Example E

```json
{
  "aesthetics": {
    "color_palette": "sepia, charcoal grey, warm amber, bone white, deep brown",
    "textures": "shaggy fur, crisp wool, brittle parchment, polished glass, aged leather",
    "atmosphere": "scholarly, mysterious, dusty, intimate, dimly lit",
    "lighting": "single overhead pendant lamp, volumetric rays, soft shadows, warm highlight"
  },
  "background": {
    "environment": "vast gothic library archive",
    "elements": "floor-to-ceiling wooden shelves packed with leather-bound tomes, stacks of scrolls in foreground",
    "depth": "foreground stacks of scrolls, midground character, background receding arched walls"
  },
  "composition": {
    "shot_type": "medium shot, eye level, slight low angle",
    "focus": "character's face and the scroll in hand",
    "spatial_layout": "character centered, shelves framing on left and right, scrolls filling bottom corners"
  },
  "style": {
    "art_direction": "semi-realistic digital fantasy, dark academia",
    "rendering": "high fidelity, 8k, ray-traced reflections, detailed fur simulation",
    "mood": "intellectual, eerie, focused, ancient"
  },
  "male_beast_man_scholar": {
    "identity": "male anthropomorphic werewolf scholar",
    "age": "middle-aged",
    "expression": {
      "eyes": "focused gaze behind round wire-rimmed glasses",
      "mouth": "snarling slightly to reveal sharp canines",
      "energy": "intense concentration"
    },
    "face": "brown textured fur, long snout, prominent whiskers",
    "hair": "wild grey-brown mane spilling from pointed ears",
    "body": "broad shoulders, muscular build, clawed hands",
    "eyes": "amber irises, sharp pupils",
    "clothing": "tailored charcoal grey three-piece suit, crisp white shirt, burgundy striped tie",
    "patterns": "subtle pinstripe on suit, diagonal stripes on tie",
    "tattoos": "none",
    "pose": "standing, leaning slightly forward, holding scroll",
    "location": "center of the frame, standing behind a wooden desk",
    "equipment": {
      "armor": "none",
      "gear": "round wire-rimmed spectacles",
      "accessories": "gold pocket watch chain visible on vest",
      "tools": "holding a rolled ancient scroll with clawed fingers"
    }
  },
  "ancient_scroll": {
    "identity": "aged parchment scroll",
    "description": "rolled tightly, yellowed paper, frayed edges, tied with a ribbon",
    "material": "dry parchment, leather binding",
    "condition": "fragile, weathered, dusty",
    "visual_effects": "subtle glow from the lamp reflecting off the paper",
    "owner": "male_beast_man_scholar"
  }
}
```

### Example F - otter professor

```json
{
  "aesthetics": {
    "color_palette": "Dark browns, golds, and warm amber tones with subtle highlights",
    "textures": "Fur, leather, metal, and stone surfaces with tactile realism",
    "atmosphere": "Intimate, scholarly, and slightly mysterious with candlelight ambiance",
    "lighting": "Soft directional candlelight from right, creating chiaroscuro highlights on fur and trophy"
  },
  "background": {
    "environment": "Dimly lit medieval library or study with wooden shelves",
    "elements": "Bookshelves filled with aged tomes, a single lit candle in a brass holder to the right",
    "depth": "Foreground: otter subject; midground: bookshelves; background: blurred stone wall and candle glow"
  },
  "composition": {
    "shot_type": "Medium close-up portrait shot with shallow depth of field",
    "focus": "Otter’s face and trophy, sharply detailed against softly blurred background",
    "spatial_layout": "Otter centered, holding trophy in left paw, adjusting spectacles with right paw"
  },
  "style": {
    "art_direction": "Cinematic fantasy realism with high-detail character design",
    "rendering": "High-resolution photorealistic rendering with micro-texture fidelity",
    "mood": "Confident, proud, and intellectual with a touch of whimsical gravitas"
  },
  "Male Otter Professor": {
    "age": "Adult",
    "expression": {
      "eyes": "Sharp, focused, slightly narrowed with intellectual intensity",
      "mouth": "Closed, neutral expression with slight smirk",
      "energy": "Calm, self-assured, and contemplative"
    },
    "face": "Detailed facial features with whiskers, dark eyes, and soft muzzle",
    "hair": "Short, dense, dark brown fur with lighter undercoat",
    "body": "Compact, sturdy build with thick fur and dexterous paws",
    "eyes": "Large, dark, intelligent eyes with reflective sheen",
    "clothing": "Worn leather tunic over dark woolen cloak with visible stitching and frayed edges",
    "patterns": "Tattered fabric with subtle embossed symbols along collar and belt",
    "tattoos": "None",
    "pose": "Sitting upright, one paw adjusting spectacles, other holding golden brain trophy",
    "location": "Centered in frame, seated at desk or chair in dimly lit study",
    "equipment": {
      "armor": "None",
      "gear": "No utility items visible",
      "accessories": "Round brass-rimmed spectacles, ornate bronze pendant necklace with engraved emblem",
      "tools": "Golden brain trophy mounted on rectangular pedestal with engraved plaque the plaque reads >SMARTEST OTTER IN THE WORLD<"
    }
  }
}
```

