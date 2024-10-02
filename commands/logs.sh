# kubectl cluster-info
# Display basic information about the Kubernetes cluster, including the API server address and core services.

# Usage:
kubectl cluster-info

# Example:
kubectl cluster-info

# Tips:
# - This command is helpful for quickly verifying that the Kubernetes cluster is up and running.
# - If you need the full API server URL, this command will provide it.
# kubectl logs
# Print the logs of a container in a Pod. Useful for troubleshooting or monitoring the output of your applications.

# Usage:
kubectl logs [pod-name] [-c [container-name]]

# Example (view logs of a Pod):
kubectl logs my-pod

# Example (view logs of a specific container in a Pod):
kubectl logs my-pod -c my-container

# Useful Flags:
# --tail: Show only the last N lines of logs.
# --follow/-f: Stream logs continuously as the container outputs them (like `tail -f`).
kubectl logs my-pod --follow

kubectl logs --since-time="timestamp" [name]


# Tips:
# - `kubectl logs` is one of the most useful commands for diagnosing issues with applications. Combine with `--follow` to stream logs for real-time monitoring.
# - For multi-container Pods, always specify the container name using `-c`.
