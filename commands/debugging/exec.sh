# kubectl exec
# Execute a command inside a running container. This is commonly used for troubleshooting or inspecting running applications.

# Usage:
kubectl exec <pod-name> [-c <container-name>] -- <command>

# Example (execute a command inside a Pod):
kubectl exec my-pod -- ls /app

# Example (run an interactive shell inside a Pod):
kubectl exec -it my-pod -- /bin/sh

# Useful Flags:
# -it: Opens an interactive terminal session (useful for running a shell).
kubectl exec -it my-pod -- /bin/bash

# Tips:
# - `kubectl exec` is ideal for troubleshooting by running commands directly inside a container. Common uses include checking logs, configurations, or testing network connectivity.
# - Always use `-it` for interactive commands like shells (`bash`, `sh`), which require user input.
