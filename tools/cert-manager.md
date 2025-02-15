# Cert-Manager: Kubernetes TLS Certificate Automation

## **Overview**  
`cert-manager` is a powerful **Kubernetes-native certificate management tool** that automates the issuance, renewal, and management of TLS certificates. It integrates with multiple **certificate authorities (CAs)** such as **Let's Encrypt, HashiCorp Vault, and internal PKIs**, making it a key component for securing Kubernetes workloads.

---

## **Installation**  
`cert-manager` can be installed via Helm or Kubernetes manifests.

### **1. Install via Helm (Recommended)**  
```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --set installCRDs=true
```

### **2. Install via Kubernetes Manifests**  
```bash
kubectl apply -f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
```

### **3. Verify Installation**  
```bash
kubectl get pods -n cert-manager
```
Ensure that `cert-manager`, `cainjector`, and `webhook` pods are running.

---

## **Basic Usage**  

### **1. Create a ClusterIssuer (Let's Encrypt Example)**  
A `ClusterIssuer` defines how certificates are requested from a CA.

```yaml
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: admin@example.com
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx
```
Apply the manifest:
```bash
kubectl apply -f clusterissuer.yaml
```

### **2. Request a TLS Certificate**  
```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: my-tls-cert
  namespace: default
spec:
  secretName: my-tls-secret
  issuerRef:
    name: letsencrypt-prod
    kind: ClusterIssuer
  dnsNames:
  - my-app.example.com
```
Apply the manifest:
```bash
kubectl apply -f certificate.yaml
```

### **3. Checking Certificate Status**  
```bash
kubectl get certificate my-tls-cert -n default
```

---
