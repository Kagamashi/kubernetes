# kubectl scale
# Scale a Deployment, ReplicaSet, or StatefulSet by adjusting the number of replicas.

# Usage:
kubectl scale <resource-type>/<resource-name> --replicas=<number>

# Example:
kubectl scale deployment/my-deployment --replicas=5

# Useful Flags:
# --timeout: Set the maximum time to wait for the scaling action to finish.
kubectl scale deployment/my-deployment --replicas=10 --timeout=60s

# Tips:
# - Use `kubectl scale` to quickly adjust the number of running Pods for a service.
# - Combine with `kubectl get pods` to verify that the scaling has occurred as expected.
