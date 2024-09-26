# kubectl config
# Manage kubeconfig files that define how to connect to clusters, users, and contexts.

# Usage:
kubectl config <subcommand>

# Example (set a context):
kubectl config use-context my-cluster

# Useful Subcommands:
# - `kubectl config get-contexts`: List available contexts in your kubeconfig.
# - `kubectl config use-context`: Switch between contexts.
# - `kubectl config view`: Show details of your kubeconfig file.

# Tips:
# - Use `kubectl config use-context` to easily switch between different clusters or environments.
# - `kubectl config set-context` allows you to modify or create new contexts in your kubeconfig file.
