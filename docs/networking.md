

## **Network Policies**

**NetworkPolicies** control traffic flow between Pods and external resources. They define rules to allow or deny traffic.

- **Default Behavior**: All Pods can communicate with each other.
- **With NetworkPolicies**: Traffic can be restricted based on specified rules.

**Key Features**:
- Control ingress (incoming) and egress (outgoing) traffic.
- Define rules using labels to match Pods.

**Example Use Cases**:
- Restrict access to specific Pods or namespaces.
- Limit egress traffic to external IPs.

---

---

## **CoreDNS: Kubernetes DNS Service**

**CoreDNS** is the default DNS server for Kubernetes clusters, providing service discovery for Pods and Services.

### Features:
1. **Service Discovery**:
   - Resolves Service names (e.g., `my-service.my-namespace.svc.cluster.local`) to their ClusterIP.

2. **Pod DNS**:
   - Resolves Pod names (e.g., `my-pod.my-namespace.svc.cluster.local`) to their IP addresses.

### Example CoreDNS ConfigMap:
```yaml
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
```

### Key Sections:
- **`kubernetes`**:
  - Configures CoreDNS to resolve Service and Pod names in the cluster.
  - `cluster.local` is the default cluster domain.
- **`forward`**:
  - Forwards DNS queries for external domains (e.g., `google.com`) to DNS servers in `/etc/resolv.conf`.
- **`cache`**:
  - Caches DNS responses for 30 seconds to reduce load.

