



### Launch without Manager

Remove API nodes, but disables the manager

Uses ROCm workaround that prevent driver crashes

```cmd
set COMFYUI_ENABLE_MIOPEN=1
set MIOPEN_FIND_MODE=2
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --disable-api-nodes
```

### Launch with Manager

The Manager needs the API to run

Uses ROCm workaround that prevent driver crashes

```cmd
set COMFYUI_ENABLE_MIOPEN=1
set MIOPEN_FIND_MODE=2
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --disable-smart-memory --enable-manager
```