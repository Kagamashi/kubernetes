# kubectl uncordon
# Mark a node as schedulable, allowing new Pods to be scheduled on it again.

# Usage:
kubectl uncordon <node-name>

# Example:
kubectl uncordon node1

# Tips:
# - Use `kubectl uncordon` after completing maintenance or upgrades on a node to allow it to receive new Pods again.
# - Combine with `kubectl cordon` to temporarily prevent scheduling during maintenance.
