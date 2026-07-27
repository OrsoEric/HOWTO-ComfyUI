
```cmd
[INFO] got prompt
[INFO] Using split attention in VAE
[INFO] Using split attention in VAE
[INFO] VAE load device: cuda:0, offload device: cpu, dtype: torch.bfloat16
[INFO] Found quantization metadata version 1
[INFO] Using MixedPrecisionOps for text encoder
[INFO] CLIP/text encoder model load device: cuda:0, offload device: cpu, current: cpu, dtype: torch.float16
[INFO] Requested to load ZImageTEModel_
[INFO] loaded completely; 22892.08 MB usable, 4303.51 MB loaded, full load: True
[INFO] Found quantization metadata version 1
[INFO] Detected mixed precision quantization
[INFO] Using mixed precision operations
[INFO] Native ops: convrot_w4a4, int8_tensorwise , emulated ops: float8_e5m2, mxfp8, float8_e4m3fn, nvfp4
[INFO] model weight dtype torch.bfloat16, manual cast: torch.bfloat16
[INFO] model_type FLOW
[INFO] Requested to load Lumina2
[INFO] loaded completely; 22654.43 MB usable, 6007.20 MB loaded, full load: True
  0%|                                                                                            | 0/9 [00:00<?, ?it/s]Windows fatal exception: access violation

Stack (most recent call first):
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\backends\eager\quantization.py", line 753 in fast_int8_mm
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\backends\eager\quantization.py", line 778 in _int8_matmul_accumulate
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\backends\eager\quantization.py", line 994 in int8_linear
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\backends\eager\quantization.py", line 1164 in _op_int8_linear
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\_library\custom_ops.py", line 376 in wrapped_fn
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\_dynamo\eval_frame.py", line 1044 in _fn
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\_compile.py", line 53 in inner
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\_library\custom_ops.py", line 343 in backend_impl
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\_ops.py", line 1255 in __call__
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\tensor\int8.py", line 273 in _handle_int8_linear_tensorwise
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\comfy_kitchen\tensor\base.py", line 362 in __torch_dispatch__
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py", line 1223 in _forward
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py", line 1252 in forward_comfy_cast_weights
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ops.py", line 1310 in forward
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1786 in _call_impl
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1775 in _wrapped_call_impl
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ldm\lumina\model.py", line 142 in forward
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1786 in _call_impl
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1775 in _wrapped_call_impl
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ldm\lumina\model.py", line 339 in forward
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1786 in _call_impl
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1775 in _wrapped_call_impl
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ldm\lumina\model.py", line 760 in patchify_and_embed
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ldm\lumina\model.py", line 840 in _forward
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\ldm\lumina\model.py", line 803 in forward
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1786 in _call_impl
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\nn\modules\module.py", line 1775 in _wrapped_call_impl
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\model_base.py", line 236 in _apply_model
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\model_base.py", line 192 in apply_model
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 334 in _calc_cond_batch
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 218 in _calc_cond_batch_outer
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 210 in calc_cond_batch
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 619 in sampling_function
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1212 in predict_noise
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1209 in outer_predict_noise
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1202 in __call__
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 639 in __call__
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\k_diffusion\sampling.py", line 1418 in res_multistep
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\utils\_contextlib.py", line 120 in decorate_context
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\k_diffusion\sampling.py", line 1460 in sample_res_multistep
  File "F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\utils\_contextlib.py", line 120 in decorate_context
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 999 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1229 in inner_sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1254 in outer_sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\patcher_extension.py", line 113 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1316 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1334 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\samplers.py", line 1444 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\comfy\sample.py", line 74 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\nodes.py", line 1571 in common_ksampler
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\nodes.py", line 1607 in sample
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 304 in process_inputs
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 316 in _async_map_node_over_list
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 342 in get_output_data
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 543 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 785 in execute_async
  File "asyncio\events.py", line 88 in _run
  File "asyncio\base_events.py", line 1999 in _run_once
  File "asyncio\base_events.py", line 645 in run_forever
  File "asyncio\windows_events.py", line 322 in run_forever
  File "asyncio\base_events.py", line 678 in run_until_complete
  File "asyncio\runners.py", line 118 in run
  File "asyncio\runners.py", line 195 in run
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\execution.py", line 725 in execute
  File "F:\ComfyUI_windows_portable_amd\ComfyUI\main.py", line 359 in prompt_worker
  File "threading.py", line 1012 in run
  File "threading.py", line 1075 in _bootstrap_inner
  File "threading.py", line 1032 in _bootstrap
Exception Code: 0xC0000005
  #0 0x00007ffe4de90000 (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_hip.dll+0x0)
  #1 0x00007ffe5056c36d at::cuda::_int_mm(class at::Tensor const &, class at::Tensor const &) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_hip.dll+0x26dc36d)
  #2 0x00007ffe506ed4f5 at::cuda::_fused_adagrad_(class c10::ArrayRef<class at::Tensor>, class c10::ArrayRef<class at::Tensor>, class c10::ArrayRef<class at::Tensor>, class c10::ArrayRef<class at::Tensor>, class at::Tensor const &, double, double, double, bool, class std::optional<class at::Tensor> const &, class std::optional<class at::Tensor> const &) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_hip.dll+0x285d4f5)
  #3 0x00007ffe5b44fb8f at::_ops::_int_mm::call(class at::Tensor const &, class at::Tensor const &) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x12cfb8f)
  #4 0x00007ffe4c95318b THPPointer<struct _frame>::release(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x29318b)
  #5 0x00007ffeabc379e4 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x379e4)
  #6 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
  #7 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
  #8 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
  #9 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #10 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
 #11 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #12 0x00007ffe4cf25f6a c10::ivalue::ConcretePyObjectHolder::getPyObject(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x865f6a)
 #13 0x00007ffe4d2b7a82 torch::PythonArgParser::print_error(struct _object *, struct _object *, struct _object *, struct _object **const) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0xbf7a82)
 #14 0x00007ffe5a1e5ce2 c10::Dispatcher::callBoxed(class c10::OperatorHandle const &, class std::vector<struct c10::IValue, class std::allocator<struct c10::IValue>> *) const (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x65ce2)
 #15 0x00007ffe4cfd29fb torch::jit::invokeOperatorFromPython(class std::vector<class std::shared_ptr<struct torch::jit::Operator>, class std::allocator<class std::shared_ptr<struct torch::jit::Operator>>> const &, class pybind11::args const &, class pybind11::kwargs const &, class std::optional<enum c10::DispatchKey>) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x9129fb)
 #16 0x00007ffe4cfd3b76 torch::jit::_get_operation_for_overload_or_packet(class std::vector<class std::shared_ptr<struct torch::jit::Operator>, class std::allocator<class std::shared_ptr<struct torch::jit::Operator>>> const &, struct c10::Symbol, class pybind11::args const &, class pybind11::kwargs const &, bool, class std::optional<enum c10::DispatchKey>) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x913b76)
 #17 0x00007ffe4cfd3882 torch::jit::_get_operation_for_overload_or_packet(class std::vector<class std::shared_ptr<struct torch::jit::Operator>, class std::allocator<class std::shared_ptr<struct torch::jit::Operator>>> const &, struct c10::Symbol, class pybind11::args const &, class pybind11::kwargs const &, bool, class std::optional<enum c10::DispatchKey>) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x913882)
 #18 0x00007ffe4cf0e40b c10::ivalue::ConcretePyObjectHolder::getPyObject(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x84e40b)
 #19 0x00007ffe4c6dbd4c THPPointer<struct THPStorage>::~THPPointer<struct THPStorage>(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x1bd4c)
 #20 0x00007ffeabc379e4 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x379e4)
 #21 0x00007ffeabcb27a6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb27a6)
 #22 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #23 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #24 0x00007ffeabcb3e8b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3e8b)
 #25 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
 #26 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
 #27 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
 #28 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
 #29 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
 #30 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #31 0x00007ffeabc7bd8e (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7bd8e)
 #32 0x00007ffeabc81a5f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x81a5f)
 #33 0x00007ffeabc07e26 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7e26)
 #34 0x00007ffeabc07cd2 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7cd2)
 #35 0x00007ffe4d2889ca torch::handle_torch_function_no_python_arg_parser(class c10::ArrayRef<struct _object *>, struct _object *, struct _object *, char const *, struct _object *, char const *, enum torch::TorchFunctionName) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0xbc89ca)
 #36 0x00007ffe4cc166c2 getPyInterpreter(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x5566c2)
 #37 0x00007ffe5a56d567 at::impl::MaybeSetTLSOnEntryGuard::~MaybeSetTLSOnEntryGuard(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x3ed567)
 #38 0x00007ffe5a56dc1b at::impl::MaybeSetTLSOnEntryGuard::~MaybeSetTLSOnEntryGuard(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x3edc1b)
 #39 0x00007ffe5b20a3cd at::_ops::linear::call(class at::Tensor const &, class at::Tensor const &, class std::optional<class at::Tensor> const &) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x108a3cd)
 #40 0x00007ffe5b20992c at::_ops::linear::call(class at::Tensor const &, class at::Tensor const &, class std::optional<class at::Tensor> const &) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_cpu.dll+0x108992c)
 #41 0x00007ffe4cab8f66 THPPointer<struct _frame>::release(void) (F:\ComfyUI_windows_portable_amd\python_embeded\Lib\site-packages\torch\lib\torch_python.dll+0x3f8f66)
 #42 0x00007ffeabc379e4 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x379e4)
 #43 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
 #44 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
 #45 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
 #46 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #47 0x00007ffeabc7bd8e (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7bd8e)
 #48 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
 #49 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #50 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #51 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #52 0x00007ffeabc7bd8e (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7bd8e)
 #53 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
 #54 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #55 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #56 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #57 0x00007ffeabcb3e8b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3e8b)
 #58 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
 #59 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
 #60 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
 #61 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
 #62 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
 #63 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #64 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
 #65 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
 #66 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #67 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #68 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #69 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
 #70 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
 #71 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #72 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #73 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #74 0x00007ffeabcb3f03 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3f03)
 #75 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
 #76 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
 #77 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
 #78 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
 #79 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
 #80 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #81 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
 #82 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
 #83 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #84 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #85 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #86 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
 #87 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
 #88 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
 #89 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
 #90 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #91 0x00007ffeabcb3f03 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3f03)
 #92 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
 #93 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
 #94 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
 #95 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
 #96 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
 #97 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
 #98 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
 #99 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#100 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#101 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#102 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#103 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#104 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#105 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#106 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#107 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#108 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#109 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#110 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#111 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#112 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#113 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#114 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#115 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#116 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#117 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#118 0x00007ffeabcb3f03 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3f03)
#119 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
#120 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
#121 0x00007ffeabcb27a6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb27a6)
#122 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#123 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#124 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#125 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#126 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#127 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#128 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#129 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#130 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#131 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#132 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#133 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#134 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#135 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#136 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#137 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#138 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#139 0x00007ffeabc7bd8e (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7bd8e)
#140 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
#141 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#142 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#143 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#144 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#145 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#146 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#147 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#148 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#149 0x00007ffeabcb3f03 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3f03)
#150 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
#151 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
#152 0x00007ffeabc82018 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82018)
#153 0x00007ffeabc819c5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x819c5)
#154 0x00007ffeabc82ea5 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x82ea5)
#155 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#156 0x00007ffeabcb3f03 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb3f03)
#157 0x00007ffeabd5319b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x15319b)
#158 0x00007ffeabd530c6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x1530c6)
#159 0x00007ffeabcb27a6 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb27a6)
#160 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#161 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#162 0x00007ffeabc7bd8e (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7bd8e)
#163 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
#164 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#165 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#166 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#167 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#168 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#169 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#170 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#171 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#172 0x00007ffeabc7be18 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be18)
#173 0x00007ffeabcb286b (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb286b)
#174 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#175 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#176 0x00007ffeabc4b201 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x4b201)
#177 0x00007ffeabe44f58 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x244f58)
#178 0x00007ffeabe3b57d (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x23b57d)
#179 0x00007ffefa0b7334 (F:\ComfyUI_windows_portable_amd\python_embeded\_asyncio.pyd+0x7334)
#180 0x00007ffefa0b6c7e (F:\ComfyUI_windows_portable_amd\python_embeded\_asyncio.pyd+0x6c7e)
#181 0x00007ffefa0b7574 (F:\ComfyUI_windows_portable_amd\python_embeded\_asyncio.pyd+0x7574)
#182 0x00007ffeabc7cc79 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7cc79)
#183 0x00007ffeabe696b1 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x2696b1)
#184 0x00007ffeabe699c0 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x2699c0)
#185 0x00007ffeabc68376 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x68376)
#186 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
#187 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#188 0x00007ffeabc866ee (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x866ee)
#189 0x00007ffeabc8103c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x8103c)
#190 0x00007ffeabc7be6c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x7be6c)
#191 0x00007ffeabcb2815 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb2815)
#192 0x00007ffeabcb275f (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0xb275f)
#193 0x00007ffeabc2304c (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x2304c)
#194 0x00007ffeabc22ff2 (F:\ComfyUI_windows_portable_amd\python_embeded\python312.dll+0x22ff2)
#195 0x00007fff14259333 (C:\Windows\System32\ucrtbase.dll+0x29333)
#196 0x00007fff14c5259d (C:\Windows\System32\KERNEL32.DLL+0x1259d)
#197 0x00007fff1674af38 (C:\Windows\SYSTEM32\ntdll.dll+0x5af38)
```