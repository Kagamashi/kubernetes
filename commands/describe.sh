# kubectl describe
# Display detailed information about a resource or group of resources, including events, labels, and conditions.

# Usage:
kubectl describe <resource-type> <resource-name>

# Example:
kubectl describe pod my-pod

# Tips:
# - Very useful for debugging, especially when looking for events or conditions like `ImagePullBackOff` or `CrashLoopBackOff`.
# - Combine with `kubectl get events` to get more context for issues.
