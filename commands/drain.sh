# kubectl drain
# Evict all Pods from a node and mark it as unschedulable, preparing the node for maintenance.

# Usage:
kubectl drain [node-name] --ignore-daemonsets --delete-emptydir-data

# Example:
kubectl drain node1 --ignore-daemonsets --delete-emptydir-data

# Useful Flags:
# --ignore-daemonsets: Ignore DaemonSet-managed Pods during draining.
# --delete-emptydir-data: Allow deletion of Pods with emptyDir volumes.
# --force: Force deletion of Pods that are not gracefully evicted.

# Tips:
# - `kubectl drain` is useful for safely removing all Pods before performing maintenance or upgrades on the node.
# - Always use `--ignore-daemonsets`, as DaemonSet Pods are managed independently and should not be drained.
# - Combine with `kubectl cordon` to ensure the node remains unschedulable after draining.
