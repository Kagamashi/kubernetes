- The EFK stack (Elasticsearch, Fluentd, Kibana) is used for centralized logging, making it easy to collect, store, and     visualize logs.
- Prometheus and Grafana provide powerful monitoring and visualization for Kubernetes metrics, allowing for detailed insights and alerting.
- The Metrics Server collects real-time resource metrics for use in autoscaling and resource monitoring.
- Liveness and Readiness Probes are critical for ensuring the health and availability of containers, preventing downtime and ensuring proper traffic routing.

---

## EFK stack (Elasticsearch, Fluentd, Kibana)
Solution for centralized logging 

- Fluentd - log aggregator and forwarder
- Elasticsearch - log storage and indexing
- Kibana - visualization and dashboards


## Prometheus and Grafana
- Prometheus - metrics collection and monitoring
- Grafana - visualization and dashboards

---

## Liveness Probes 
Determine if a container is still running.
If container is not responding due to a deadlock or other failure Kubernetes can restart it to recover.
LivenessProbe can be based on HTTP requests, TCP connections or execution of a command inside the container.

apiVersion: v1
kind: Pod
metadata:
  name: liveness-example
spec:
  containers:
  - name: my-container
    image: nginx
    livenessProbe:
      httpGet:
        path: /healthz          # Path to check for health status
        port: 8080              # Port to use for the health check
      initialDelaySeconds: 3    # Wait before starting liveness checks
      periodSeconds: 10         # Frequency of checks


## Readiness Probes
Determine if a container is ready to start receiving traffic
Container may be running but not ready (e.g. waiting for database connections to initialize)
ReadinessProbe can be based on HTTP requests, TCP connections or execution of a command inside the container.

apiVersion: v1
kind: Pod
metadata:
  name: readiness-example
spec:
  containers:
  - name: my-container
    image: nginx
    readinessProbe:
      httpGet:
        path: /readyz           # Path to check readiness status
        port: 8080
      initialDelaySeconds: 5    # Wait before starting readiness checks
      periodSeconds: 10         # Frequency of checks
