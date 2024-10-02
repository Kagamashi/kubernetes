# kubectl apply
# Apply a configuration to a resource by filename or stdin. This is often used to create or update resources declaratively.

# Usage:
kubectl apply -f [file]

# Example:
kubectl apply -f deployment.yaml

# Useful Flags:
# --dry-run=client: See the output of the command without making any changes.
# --force: Forcefully apply changes even if conflicts occur.
kubectl apply -f deployment.yaml --dry-run=client

# Tips:
# - Combine with `kubectl diff` to preview the changes.
# - Use `kubectl apply --server-side` to allow server-side apply for multiple authors.
