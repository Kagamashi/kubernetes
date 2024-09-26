# kubectl cordon
# Mark a node as unschedulable. This prevents new Pods from being scheduled on the node, but existing Pods will continue to run.

# Usage:
kubectl cordon <node-name>

# Example:
kubectl cordon node1

# Tips:
# - Use `kubectl cordon` to prepare a node for maintenance, ensuring that no new Pods will be scheduled on the node.
# - Combine with `kubectl drain` to safely evict existing Pods for maintenance.
