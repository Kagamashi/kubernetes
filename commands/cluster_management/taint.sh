# kubectl taint
# Add, modify, or remove taints on nodes to control which Pods can be scheduled on them.

# Usage:
kubectl taint nodes <node-name> <key>=<value>:<effect>

# Example (add a NoSchedule taint):
kubectl taint nodes node1 key=value:NoSchedule

# Useful Flags:
# --overwrite: Overwrite the value of an existing taint.
kubectl taint nodes node1 key=value:NoSchedule --overwrite

# Tips:
# - Taints and tolerations are powerful tools to control Pod placement. Use them to reserve nodes for specific workloads or to prevent Pods from being scheduled on specific nodes.
# - The main effects are `NoSchedule`, `NoExecute`, and `PreferNoSchedule`, which determine how Pods are treated on tainted nodes.
