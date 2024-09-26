# kubectl expose
# Expose a Kubernetes resource (like a Pod, Deployment, or Service) as a new Kubernetes Service (ClusterIP, NodePort, or LoadBalancer).

# Usage:
kubectl expose <resource-type>/<resource-name> --port=<service-port> --target-port=<container-port> --type=<service-type>

# Example (expose a deployment as a Service):
kubectl expose deployment/my-deployment --port=80 --target-port=8080 --type=NodePort

# Useful Flags:
# --port: The port that the service will expose to the outside world.
# --target-port: The port on the container that the traffic will be forwarded to.
# --type: Specify the type of Service (ClusterIP, NodePort, LoadBalancer).

# Tips:
# - Use `kubectl expose` to quickly expose your application to the outside world. It’s very useful in testing environments where you need fast access to services.
# - For external access, set the service `type` to `NodePort` or `LoadBalancer`. Use `ClusterIP` for internal services.
