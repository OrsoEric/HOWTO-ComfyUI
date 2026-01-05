import torch

def check_torch():
    print("--- Torch Import ---")
    try:
        import torch
        print("Success: torch imported successfully.")
    except ImportError:
        print("Failure: torch import failed.")
        return

    print("\n--- CUDA Availability ---")
    try:
        print(f"CUDA available: {torch.cuda.is_available()}")
    except Exception as e:
        print(f"Failure: CUDA check failed. Error: {e}")

    print("\n--- Device Name ---")
    try:
        if torch.cuda.is_available():
            print(f"Device name [0]: {torch.cuda.get_device_name(0)}")
        else:
            print("No CUDA device found.")
    except Exception as e:
        print(f"Failure: Device name check failed. Error: {e}")

    print("\n--- Environment Info ---")
    try:
        # Collect environment information
        env_info = env_info = torch.utils.collect_env.get_pretty_env_info()

        # Print the environment information
        print(env_info)
        
    except Exception as e:
        print(f"Failure: Environment info collection failed. Error: {e}")

if __name__ == "__main__":
    check_torch()