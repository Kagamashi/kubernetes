# kubectl cp
# Copy files and directories between a container in a Pod and your local filesystem.

# Usage:
kubectl cp <pod-name>:/path/to/source /local/path/to/destination
kubectl cp /local/path/to/source <pod-name>:/path/to/destination

# Example (copy file from Pod to local):
kubectl cp my-pod:/var/log/app.log /local/path/app.log

# Example (copy directory from local to Pod):
kubectl cp /local/path/dir my-pod:/container/path/dir

# Tips:
# - Useful for extracting logs, configurations, or debugging files from containers.
# - Ensure that the path is correct in the Pod (container) or on the local machine to avoid copy errors.
