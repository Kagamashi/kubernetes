# kubectl restart
# Restart Pods associated with a Deployment, StatefulSet, or DaemonSet. It triggers a rolling restart of the resources.

# Usage:
kubectl rollout restart [resource-type]/[resource-name]

# Example (restart a deployment):
kubectl rollout restart deployment/my-deployment

# Tips:
# - `kubectl restart` is useful when you need to apply changes such as configuration updates, environment variable changes, or to resolve stuck Pods.
# - The restart doesn't change the Pod template spec, but it triggers a rolling update, cycling through each Pod in the resource.
# - Works well with Deployments and StatefulSets but is not supported for individual Pods.

# kubectl rollout
# Manage the rollout of a resource (like Deployment, StatefulSet). You can check rollout status, pause, resume, or undo it.

# Usage:
kubectl rollout [subcommand] [resource-type]/[resource-name]

# Example (check rollout status):
kubectl rollout status deployment/my-deployment

# Example (pause a rollout):
kubectl rollout pause deployment/my-deployment

# Example (resume a paused rollout):
kubectl rollout resume deployment/my-deployment

# Example (undo the last rollout):
kubectl rollout undo deployment/my-deployment

# Useful Subcommands:
# - `status`: Show the status of the rollout (e.g., "in progress", "completed").
# - `pause`: Temporarily pause a rollout.
# - `resume`: Resume a paused rollout.
# - `undo`: Roll back to the previous revision.

# Tips:
# - Use `kubectl rollout status` to monitor progress during a deployment update. It is particularly useful for long-running rollouts.
# - `kubectl rollout undo` allows you to quickly revert to a previous version if something goes wrong with the deployment.
# - Pausing a rollout is helpful when you need time to analyze the status before continuing the update.
