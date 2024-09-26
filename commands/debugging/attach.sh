# kubectl attach
# Attach to a running container in a Pod to view its output or interact with it. This can be useful for applications running in the foreground.

# Usage:
kubectl attach <pod-name> [-c <container-name>]

# Example (attach to a Pod):
kubectl attach my-pod

# Example (attach to a specific container in a multi-container Pod):
kubectl attach my-pod -c my-container

# Useful Flags:
# --stdin/-i: Pass stdin to the container, allowing interactive commands.
kubectl attach my-pod -c my-container -i

# Tips:
# - Use `kubectl attach` when you want to connect to an already running container and observe output or provide input.
# - For interactive use, combine with `--stdin` to send input to the container.
