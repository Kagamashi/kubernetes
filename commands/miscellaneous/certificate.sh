# kubectl certificate
# Manage certificates within Kubernetes (e.g., approve or deny CertificateSigningRequests).

# Usage:
kubectl certificate <subcommand>

# Example (approve a CSR):
kubectl certificate approve <csr-name>

# Example (deny a CSR):
kubectl certificate deny <csr-name>

# Tips:
# - `kubectl certificate` is primarily used for managing TLS certificates in Kubernetes, especially CertificateSigningRequests (CSR). It's commonly used when working with custom certificate authorities.
# - Combine with `kubectl get csr` to view pending certificate requests before approving or denying them.
