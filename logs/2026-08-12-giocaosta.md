https://www.reddit.com/r/DungeonsAndDragons/comments/1vm9tfo/i_made_dd_npc_cards_comfyui/

 I made a ComfyUI workflows to make D&D NPC cards, printed, and they work really well, my players enjoyed the cards. I printed at high quality with protective film. It also allow to use markers and later wash them.

For size, I tried a few variation, and A5 works well since the images are pretty. I think A6 could work too.

I tried Magic Card size, but there is too much text to cram in there to make the card pleasing to read.

The layout isn't AI, it's fully deterministic, it took me a few weeks to make a pleasing composition.

For those cards, the text isn't AI either, I would have to work hard on system prompts and workflow to make good balance, AI generated stat blocks are nonsensical.

The layouts are AI generated just once and stored as images in the comfyui nodes, and deterministically composed using json.

The images are AI and they work great. For those I used Krea2 that makes a very pleasing semi realistic D&D look.

I do have some fixes to do, I think I can do better on the layout and font.

I am also planning an A4 layout for PC character sheet, it'll be lots of work to make it.

Repo of the ComfyUI workflow. You can drag drop the PNG into ComfyUI and use the manager to install the missing node, I released it for the node manager to see. 