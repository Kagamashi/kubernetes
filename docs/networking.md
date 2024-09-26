### NETWORKING

## Pod-to-Pod Communication
- Every Pod in Kubernetes cluster is assigned a unique IP address
- Pods can communicate with each other directly using these IP addresses even if they are running on different nodes (without NAT)
- Kubernetes assumes a flat network: all Pods can reach each other, and there are no IP address conflicts

## Pod-to-Service Communication
- Kubernetes provides Services to abstract and expose set of Pods
- Services act as a load balancer that routes traffic to healthy Pods
    ClusterIP: Default service type; exposes the Service on an internal IP, accessible only within the cluster.
    NodePort: Exposes the Service on a static port on each node.
    LoadBalancer: Integrates with cloud providers to expose the Service externally using a load balancer.

## Service Discovery
  - Kubenetes has built-in service discovery, allowing Pods to resolve DNS name of Service to its ClusterIP
  - DNS is primary method used for service discovery; Kubernetes runs a DNS reserver (usually CoreDNS) within the cluster

## Network Policies
  - NetworkPolicies control the flow of traffic between Pods. They define rules that determine which Pods can communicate with each other and with external resources.
  - By default, all Pods can communicate with each other. Applying a NetworkPolicy allows for restricting or controlling traffic.

---

## CNI (Container Network Interface) 
Kubernetes uses CNI plugins to provide networking to Pods. These plugins handle networking at node level, configuring network interfaces and IP addresses for containers.

CNI (Container Network Interface) is a specification and interface used by Kubernetes (and other container orchestrators) to configure the networking capabilities of containers. CNI plugins provide the actual network connectivity between containers in a Kubernetes cluster

Common CNI plugins:
# FLANNEL 
  - simple and lightweight CNI plugin provide basic overlay network between Kubernetes nodes
  - uses VXLAN or host-gw as networking backend 
  - Use: suitable for smaller clusters, it provides only basic L3 (IP) connectivity without advanced network policy features

# CALICO 
  - support BGP (Border Gateway Protocol) for routing traffic without the need for overlay network, reducing overhead
  - fully supports Kubernetes NetworkPolicies and offers its own advanced policy engine for more granular control
  - Use: ideal for large-scale clusters requiring fine-grained network security, scalability and performance

# WEAVE
  - provide overlay network with encryption, offering secure Pod-Pod communication
  - runs as DaemonSet on each node and uses a mesh network to route traffic between Pods
  - supports automatic IP address management and integrates well with Kubernetes NetworkPolicies
  - Use: scenarios where encryption between Pods is required without external security tools

# CILLIUM
  - advanced CNI plugin
  - leverages eBPF (extended Berkeley Packet Filter) for efficient packet processing and security
  - provides deep network visibility, performance monitoring and advanced features like L4 (Layer 7_) policies for fine-grained traffic control
  - Use: high-performance, security-focused environments requiring deep network observability and control

# How CNI Plugins Work:
  - CNI plugins configure networking for Pods by assigning IP addresses, setting up routes, and connecting the Pods to the cluster network.
  - When a Pod is created, the kubelet interacts with the CNI plugin to ensure the Pod is assigned an IP address and can communicate with other Pods.
  - The CNI plugin also ensures the network configuration is cleaned up when the Pod is deleted.

---

CoreDNS is DNS server that Kubernetes uses by default for service discovery within a cluster.
CoreDNS resolves Service and Pod names to their respective IP addresses, allowing Pods to communicate with Services or other Pods using DNS.

1. Service Discovery : my-service.my-namespace.svc.cluster.local
CoreDNS automatically updates DNS records when new Services are added/removed
2. Pod DNS: my-pod.my-namespace.svc.cluster.local

apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        errors
        health
        ready
        kubernetes cluster.local in-addr.arpa ip6.arpa {
          pods insecure
          fallthrough in-addr.arpa ip6.arpa
        }
        prometheus :9153
        forward . /etc/resolv.conf
        cache 30
        loop
        reload
        loadbalance
    }

- kubernetes: This block configures CoreDNS to serve DNS records for Services and Pods in the cluster. The domain cluster.local is the default cluster domain, and CoreDNS will resolve names like my-service.my-namespace.svc.cluster.local.
- forward: This section forwards DNS queries for external domains (e.g., google.com) to the DNS servers specified in /etc/resolv.conf.
- cache: Enables caching of DNS responses for 30 seconds to reduce the load on CoreDNS.
