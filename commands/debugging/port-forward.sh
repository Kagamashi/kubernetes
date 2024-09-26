# kubectl port-forward
# Forward one or more local ports to a Pod. Useful for accessing applications running in the cluster without exposing them through a Service.

# Usage:
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Example (forward port 8080 on local machine to port 80 in the Pod):
kubectl port-forward pod/my-pod 8080:80

# Example (forward port for a Service):
kubectl port-forward service/my-service 8080:80

# Tips:
# - `kubectl port-forward` is very useful for testing or debugging services that are not exposed externally (via NodePort or LoadBalancer). It allows you to access the service as if it were running on your local machine.
# - You can also use it with Services, which makes it easier to access applications behind Kubernetes services.
