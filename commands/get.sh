# kubectl get
# Retrieve and display one or more resources.

# Usage:
kubectl get <resource-type>

# Example:
kubectl get pods

# Useful Flags:
# -o wide: Displays more detailed information, like IPs and nodes.
# -o json | -o yaml: Output resource information in JSON or YAML format.
kubectl get pods -o wide

# Tips:
# - Use `kubectl get all` to see all resources in a namespace.
# - Combine with `kubectl describe` for detailed insights.
