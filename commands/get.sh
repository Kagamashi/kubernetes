# kubectl get
# Retrieve and display one or more resources.

# Usage:
kubectl get [resource-type]

# Example:
kubectl get pods

# Useful Flags:
# -o wide: Displays more detailed information, like IPs and nodes.
# -o json | -o yaml: Output resource information in JSON or YAML format.
kubectl get pods -o wide

# Tips:
# - Use `kubectl get all` to see all resources in a namespace.
# - Use 'kubectl get [] -A' to get objects from ALL namespaces
# - Combine with `kubectl describe` for detailed insights.

# List pods without -controlplane in name
kubectl get pods -o json -A | jq -r '.items[] | select(.metadata.name | test("-controlplane") | not) | .metadata.name'

# List pods with specified selectors
kubectl get pods --selector app=App1, bu=finance

# Show tolerations on Pod
kubectl get pods [name] -o json | jq ".spec.tolerations"

# Show resource limits on Pod
kubectl get pod [name] -o=jsonpath='{.spec.containers[*].resources}'

# Check ENV on pod
kubectl get pod [name] -o json | jq ".spec.containers[].env[]"

# Get Taints on the Node
kubectl get nodes [name] -o json | jq ".spec.taints"
