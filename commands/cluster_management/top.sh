# kubectl top
# Display resource (CPU and memory) usage for nodes or Pods in the cluster. It requires the Metrics Server to be installed.

# Usage:
kubectl top <resource-type> [resource-name]

# Example (view node resource usage):
kubectl top nodes

# Example (view Pod resource usage):
kubectl top pods --namespace=my-namespace

# Useful Flags:
# --containers: Show resource usage for containers within Pods.
kubectl top pods --containers

# Tips:
# - Use `kubectl top` to monitor resource consumption of nodes and Pods and identify bottlenecks.
# - Ensure that the Metrics Server is deployed in the cluster to use this command.
# - Combine with horizontal autoscaling to monitor resource utilization thresholds.
