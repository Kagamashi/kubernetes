# Kubernetes Debugging Tools and Best Practices

Kubernetes provides powerful tools and techniques for debugging Pods, Deployments, and other resources in your cluster. By combining CLI tools and visual interfaces, you can diagnose and resolve issues effectively.

---

## **CLI Tools for Debugging**

### **kubectl logs**
Retrieve logs from a container in a Pod.

```bash
kubectl logs <pod-name> [-c <container-name>] [-n <namespace>]
```

- **`-c <container-name>`**: Specify the container name if the Pod contains multiple containers.
- **`-n <namespace>`**: Specify the namespace of the Pod (if it’s not in the default namespace).

**Example**:
```bash
kubectl logs my-pod -c my-container -n my-namespace
```

Use logs to identify error messages or unexpected behavior in your application.

---

### **kubectl exec**
Execute commands inside a running container.

```bash
kubectl exec -it <pod-name> [-c <container-name>] -- <command>
```

- **`-it`**: Opens an interactive terminal session (useful for debugging).
- **`-- <command>`**: Specifies the command to run inside the container (e.g., `/bin/bash` or `/bin/sh`).

**Example**:
```bash
kubectl exec -it my-pod -- /bin/sh
```

Use this command to:
- Inspect the filesystem.
- Check environment variables.
- Test network connectivity (e.g., using `curl` or `ping`).

---

### **kubectl describe**
View detailed information about a Kubernetes resource, including events and conditions.

```bash
kubectl describe <resource-type> <resource-name> [-n <namespace>]
```

**Example**:
```bash
kubectl describe pod my-pod -n my-namespace
```

Use this command to inspect recent events (e.g., failed image pulls, resource issues, or permission errors).

---

### **kubectl get**
Retrieve basic information about Kubernetes resources.

```bash
kubectl get <resource-type> [-n <namespace>] [-o wide]
```

**Example**:
```bash
kubectl get pods -n my-namespace -o wide
```

Use this command to:
- Quickly check the status of resources.
- Identify the node hosting a specific Pod (using `-o wide`).

---

### **kubectl debug**
Add an ephemeral debugging container or create a copy of the Pod for troubleshooting.

```bash
kubectl debug <pod-name> -it --image=<debug-image> --target=<container-name>
```

- **`--image=<debug-image>`**: Specifies the image used for the debug container (e.g., `busybox` or `alpine`).
- **`--target=<container-name>`**: Specifies the container in the Pod where the debug container will be added.

**Example**:
```bash
kubectl debug my-pod -it --image=busybox --target=my-container
```

Use this to:
- Run troubleshooting tools like `curl`, `ping`, `top`, or `strace` inside a Pod that lacks these utilities.

---

### **kubectl port-forward**
Forward a local port to a Pod or Service for debugging.

```bash
kubectl port-forward <pod-name> <local-port>:<pod-port>
```

**Example**:
```bash
kubectl port-forward my-pod 8080:80
```

Use this to:
- Access internal services for debugging or testing.
- Interact with applications that are not exposed externally.

---

## **Visual Tools for Debugging**

### **Kubernetes Dashboard**
A web-based UI for monitoring and managing Kubernetes resources.

#### **Setup**:
1. Deploy the Dashboard:
   ```bash
   kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
   ```
2. Start the Proxy:
   ```bash
   kubectl proxy
   ```
3. Access the Dashboard:
   Open the following URL in your browser:
   ```
   http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
   ```

#### Features:
- View the status of resources like Pods, Deployments, and Services.
- Inspect logs directly in the UI.
- Scale Deployments interactively.

---

### **Lens Kubernetes IDE**
A powerful GUI tool for managing and debugging Kubernetes clusters.

#### Features:
- Real-time insights into cluster health, node metrics, and application status.
- Direct access to Pod shells for debugging.
- User-friendly interface for viewing logs and managing resources.
- Multi-cluster management from a single interface.

#### Installation:
Download Lens from [Lens Official Website](https://k8slens.dev/).

---

## **Best Practices for Debugging in Kubernetes**

1. **Start with the Basics**:
   - Use `kubectl get pods` to check the status of Pods.
   - Use `kubectl logs` to inspect error messages from containers.

2. **Inspect Events**:
   - Use `kubectl describe pod <pod-name>` to review recent events like failed image pulls, resource allocation issues, or permission errors.

3. **Access the Container**:
   - Use `kubectl exec` to open a shell and inspect the container's filesystem, environment variables, or network connectivity.

4. **Utilize Debug Containers**:
   - Use `kubectl debug` to add an ephemeral container with diagnostic tools to troubleshoot.

5. **Port Forwarding for Access**:
   - Use `kubectl port-forward` to debug internal services locally without exposing them externally.

6. **Use Visual Tools**:
   - Leverage tools like Kubernetes Dashboard, Lens, or Octant to gain real-time insights into cluster health, resource usage, and Pod status.

---

By combining these powerful CLI tools and visual debugging solutions, you can effectively troubleshoot and resolve issues in your Kubernetes environments.

