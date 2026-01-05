import os
import importlib.util

print("Aule Flash Attention location:", os.path.dirname(importlib.util.find_spec("aule").origin))

from aule import flash_attention

print("PyTorch location:", os.path.dirname(importlib.util.find_spec("torch").origin))

from aule import get_available_backends, print_backend_info

# List available backends
backends = get_available_backends()
print(f"Available backends: {backends}")

# Display detailed backend information
print_backend_info()

import torch

# Create input tensors [batch, heads, seq_len, head_dim]
q = torch.randn(1, 8, 512, 64, device='cuda')
k = torch.randn(1, 8, 512, 64, device='cuda')
v = torch.randn(1, 8, 512, 64, device='cuda')

# Compute attention with causal masking
output = flash_attention(q, k, v, causal=True)