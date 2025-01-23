# Automatically scale the number of Pods in a Deployment, ReplicaSet, or StatefulSet based on observed resource usage (CPU/memory).
# It creates a Horizontal Pod Autoscaler (HPA).
kubectl autoscale [resource-type]/[resource-name] --min=[min-replicas] --max=[max-replicas] --cpu-percent=[target-percentage]

# Example (scale a deployment based on CPU usage):
kubectl autoscale deployment/my-deployment --min=2 --max=10 --cpu-percent=80

# Useful Flags:
# --min: Set the minimum number of replicas.
# --max: Set the maximum number of replicas.
# --cpu-percent: Target average CPU utilization across the Pods (as a percentage).

# Tips:
# - `kubectl autoscale` is useful for applications that experience variable load. Kubernetes will automatically adjust the number of Pods between the specified min and max limits based on resource usage.
# - You can monitor the status of autoscaling using `kubectl get hpa`.
