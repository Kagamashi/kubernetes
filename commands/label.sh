# kubectl label
# Add or update labels on a resource. Labels are key-value pairs used for selecting and grouping resources.

# Usage:
kubectl label <resource-type> <resource-name> <label-key>=<value>

# Example:
kubectl label pod my-pod app=frontend

# Useful Flags:
# --overwrite: Allows updating an existing label.
kubectl label pod my-pod app=backend --overwrite

# Tips:
# - Labels are great for selecting subsets of resources (e.g., `kubectl get pods -l app=frontend`).
# - Combine with `kubectl get` or `kubectl delete` to select resources by labels.
