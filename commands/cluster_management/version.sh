# kubectl version
# Show the version of both the client and server (if connected to a Kubernetes cluster).

# Usage:
kubectl version

# Example:
kubectl version

# Useful Flags:
# --short: Output concise version information.
# --client: Show only the kubectl client version.
kubectl version --short

# Tips:
# - Always verify the version compatibility between the `kubectl` client and the Kubernetes server. Mismatched versions can lead to unexpected issues.
# - Use `--client` to quickly check the `kubectl` version without querying the server.
