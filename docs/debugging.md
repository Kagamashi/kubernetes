- Kubernetes provides powerful tools for debugging Pods and deployments: kubectl logs, kubectl exec, kubectl describe, and kubectl debug.
- Visual tools like the Kubernetes Dashboard, Lens, and Octant offer a user-friendly way to monitor and troubleshoot your cluster.
- Using a combination of CLI tools and dashboards ensures a comprehensive approach to diagnosing and resolving issues in Kubernetes environments.

---

Best practices for Debugging:
1. **Start with the Basics:**
Always start by checking the Pod’s status with kubectl get pods. Then use kubectl logs to see if there’s an error output from the container.
2. **Inspect Events:**
Use kubectl describe pod <pod-name> to inspect recent events (e.g., failed image pulls, resource issues, or permission errors).
3. **Access the Container:**
If logs don’t provide enough information, use kubectl exec to open a shell in the container to inspect configuration files, environment variables, or test connectivity.
4. **Utilize Debug Containers:**
Use kubectl debug to add an ephemeral debugging container to troubleshoot Pods that lack utilities like curl or ping.
5. **Port Forwarding for Access:**
Use kubectl port-forward to access internal services for local debugging when services aren’t exposed externally.
6. **Use Visual Tools:**
Leverage visual tools like Kubernetes Dashboard, Lens, or Octant to gain real-time insights into cluster health, resource usage, and Pod status.

---

**kubectl logs**
kubectl logs <pod-name> [-c <container-name>] [-n <namespace>]
 -c <container-name>: Specify the container name if the Pod contains multiple containers.
 -n <namespace>: Specify the namespace of the Pod (if it's not in the default namespace)
kubectl logs my-pod -c my-container -n my-namespace


**kubectl exec**
kubectl exec -it <pod-name> [-c <container-name>] -- <command>
 -it: Opens an interactive terminal session (useful for debugging).
 -- <command>: Specifies the command you want to run inside the container (e.g., /bin/bash or /bin/sh).
kubectl exec -it my-pod -- /bin/sh

Use kubectl exec to check the state of the filesystem, environment variables, network connectivity, or to manually test applications inside a container.


**kubectl describe**
kubectl describe <resource-type> <resource-name> [-n <namespace>]
kubectl describe pod my-pod -n my-namespace


**kubectl get**
kubectl get <resource-type> [-n <namespace>] [-o wide]
kubectl get pods -n my-namespace


**kubectl debug**
kubectl debug <pod-name> -it --image=<debug-image> --target=<container-name>
 --image=<debug-image>: Specifies the image used to run the debugging container (e.g., busybox or alpine).
 --target=<container-name>: Specifies the container inside the Pod where the debug container will be added.
kubectl debug my-pod -it --image=busybox --target=my-container

Use kubectl debug to run network or performance troubleshooting tools (e.g., curl, ping, top, strace) inside a Pod that lacks these utilities.


**kubectl port-forward**
kubectl port-forward <pod-name> <local-port>:<pod-port>
kubectl port-forward my-pod 8080:80

Use kubectl port-forward to debug or interact with internal services that aren’t exposed via a public IP.


---

1. Kubernetes Dashboard
web-based UI that provides an overview of our cluster resources.
It allows visual inspection of resource status, logs, and even interactive scaling of Deployments

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
kubectl proxy
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/


2. Lens Kubernetes IDE
Offers real-time insights into cluster health, node and Pod metrics, and application status.
- Direct access to Pod shell for debugging
- User-friendly interface for viewing container logs
- Manage multiple Kubernetes clusters from single interface
