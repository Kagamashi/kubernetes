# kubectl api-resources
# List all available resource types (both standard and custom resources) that the Kubernetes API server supports.

# Usage:
kubectl api-resources

# Example (list all resources):
kubectl api-resources

# Useful Flags:
# --namespaced: Only show namespaced resources (e.g., Pods, Deployments).
# --verbs: Filter resources that support specific actions (e.g., get, list, create).
kubectl api-resources --namespaced=true
kubectl api-resources --verbs=create,list

# Tips:
# - Use this command when you're unsure of the exact name or spelling of a Kubernetes resource or to check available custom resources.
# - Useful for scripting or debugging when working with less common resource types.
