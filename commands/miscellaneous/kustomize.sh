# kubectl kustomize
# Build and output a Kubernetes manifest from a Kustomize configuration directory. Kustomize is a tool for customizing Kubernetes resource configurations.

# Usage:
kubectl kustomize <directory>

# Example:
kubectl kustomize ./kustomization

# Tips:
# - Use `kubectl kustomize` to build a final manifest from your kustomization directory (typically containing `kustomization.yaml`). This is useful when deploying reusable, environment-specific configurations.
# - Combine with `kubectl apply -k <directory>` to apply the manifest directly from the kustomization.
