Scaling is a feature that allows Kubernetes to adjust number of Pods or worker nodes in a cluster to match the demand for our applications.

## Horizontal Pod Autoscaling (HPA)
Automatically scales number of Pods in a deployment, replicaSet or statefulSet based on observed CPU utilization, memory usage or custom metrics.
Goal of HPA is to ensure that number of Pods scales horizontally (increase or decreases) according to application load.
- HPA allows for settings minimum and maximum number of Pods

HPA Metrics:
1. Resource Metrics:
    - CPU
    - Memory
2. Custom Metrics:
    - Based on custom metrics such as number of HTTP requests, queue length, or other application-specific metrics using Prometheus or custom metric APis

Use cases:
- applications with fluctuating traffic (web servers, APIs)
- batch processing jobs that scale based on the size of the workload
- microservices that need to scale out to handle bursts of traffic


## Vertical Pod Autoscaling (VPA)
Adjust resource requests and limits (CPU and memory) of individual Pods based on their usage patterns.
VPA optimizes resource allocation for each Pod, ensuring that each Pod has the correct CPU and memory resources for its workload.
- VPA can operate in recommendation mode where it suggests resource limit but does not automatically apply them.
- In full auto mode VPA may evict Pods that require more resources than initially requested; may cause service disruption


Use cases:
- applications with dynamic resource needs, such as databases or AI/ML workloads
- long-running processes where resource consumption changes over time
- applications where resource requests are difficult to predict at deployment time


## Cluster Autoscaler : Scaling Worker Nodes
Cluster Autoscaler automatically adjust size of Kubernetes cluster by adding or removing worker nodes based on scheduling requirements of the Pods.
- Scales number of worker nodes in the cluster to meet demand for Pods
- Attempts to scale down underutilizied nodes, removing nodes that have no scheduled Pods or only low-priority workloads
- Works in tandem with HPA/VPA

# AWS Autoscaling Group example
apiVersion: v1
kind: ConfigMap
metadata:
  name: cluster-autoscaler-config
  namespace: kube-system
data:
  cluster-autoscaler-config: |
    scale-down-enabled: true              # Enable scale-down of underutilized nodes
    scale-down-delay-after-add: 10m       # Delay before scaling down after a node is added
    scale-down-unneeded-time: 10m         # Time before an underutilized node is considered for removal
    scale-down-utilization-threshold: 0.5 # Threshold of node utilization before considering scaling down

Use cases:
- Dynamic environments where workloads fluctuate, such as multi-tenant environments.
- Cost optimization in cloud environments, ensuring only the necessary worker nodes are running.
- Applications with unpredictable traffic patterns, ensuring there are always enough nodes to run new Pods.