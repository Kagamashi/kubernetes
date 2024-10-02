# kubectl describe
# Show detailed information about a resource, including its configuration, status, events, and conditions.

# Usage:
kubectl describe [resource-type] [resource-name]

# Example (describe a Pod):
kubectl describe pod my-pod

# Example (describe a Node):
kubectl describe node my-node

# Tips:
# - Use `kubectl describe` to inspect in-depth information about resources and identify problems like scheduling issues, event errors, or image pull failures.
# - The events section is particularly useful for troubleshooting Pods stuck in `Pending`, `CrashLoopBackOff`, or `ImagePullBackOff` states.
