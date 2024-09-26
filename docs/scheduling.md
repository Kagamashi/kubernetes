# Taints and Tolerations
- **Taints** are applied to nodes and prevent Pods from being scheduled on the node unless the Pod has a matching toleration
- **Tolerations** are applied to Pods and allow them to be scheduled on nodes with matching taints

Tainting a Node (via kubectl command):
> kubectl taint nodes node1 key=value:NoSchedule
This taints the node node1 with key=value:NoSchedule

apiVersion: v1
kind: Pod
metadata:
  name: my-app
spec:
  tolerations:
  - key: "key"
    operator: "Equal"
    value: "value"
    effect: "NoSchedule"
  containers:
  - name: my-container
    image: nginx


# AFFINITY
Affinity and Anti-Affinity rules control how Pods are placed relative to other Pods.
Either encouraging them to be co-located on the same node (affinity) or ensuring they are placed on different nodes (anti-affinity)

1. **Node Affinity**: allows to specify that Pod should run on nodes with certain labels (e.g. specific types of hardware)
2. **Pod Affinity**: ensures that Pods are co-located on the same node
3. **Pod Anti-Affinity**: ensures Pods are placed on different nodes, ensuring **high availability** by distributing workloads across nodes

Pod affinity ensures that Pods with label app=my-app are scheduled on different nodes
topologyKey: kubernetes.io/hostname ensures they are spread across different nodes

apiVersion: v1
kind: Pod
metadata:
  name: my-app
spec:
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchLabels:
            app: my-app
        topologyKey: "kubernetes.io/hostname"
  containers:
  - name: my-container
    image: nginx
