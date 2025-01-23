# List all available resource types (both standard and custom resources) that the Kubernetes API server supports.
kubectl api-resources

# --namespaced:   Only show namespaced resources (e.g., Pods, Deployments).
# --verbs:        Filter resources that support specific actions (e.g., get, list, create).
kubectl api-resources --namespaced=true
kubectl api-resources --verbs=create,list
