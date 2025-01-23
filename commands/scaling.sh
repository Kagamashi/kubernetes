# Scale a Deployment, ReplicaSet, or StatefulSet by adjusting the number of replicas.
kubectl scale [resource-type]/[resource-name] --replicas=[number]


# --timeout: Set the maximum time to wait for the scaling action to finish.
kubectl scale deployment/my-deployment --replicas=10 --timeout=60s

# Tips:
# - Use `kubectl scale` to quickly adjust the number of running Pods for a service.
# - Combine with `kubectl get pods` to verify that the scaling has occurred as expected.

kubectl scale --replicas=3 rs/foo                                 # Scale a replicaset named 'foo' to 3
kubectl scale --replicas=3 -f foo.yaml                            # Scale a resource specified in "foo.yaml" to 3
kubectl scale --current-replicas=2 --replicas=3 deployment/mysql  # If the deployment named mysql's current size is 2, scale mysql to 3
kubectl scale --replicas=5 rc/foo rc/bar rc/baz                   # Scale multiple replication controllers
