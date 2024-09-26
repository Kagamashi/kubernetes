# kubectl debug
# Create an ephemeral container or clone an existing Pod for debugging purposes. Useful for troubleshooting running Pods.

# Usage:
kubectl debug <pod-name> --image=<debug-image> --target=<container-name>

# Example (create an ephemeral container in the Pod):
kubectl debug my-pod --image=busybox --target=my-container

# Example (create a debug copy of the Pod):
kubectl debug my-pod --copy-to=my-pod-debug --image=busybox

# Useful Flags:
# --copy-to: Creates a new copy of the Pod for debugging.
# --image: Specifies the debug container image to use (e.g., busybox, alpine).
# --target: The target container in which to run the ephemeral container.

# Tips:
# - Use this command to debug a Pod by adding a temporary container with utilities like `curl`, `ping`, or `bash` that may not be available in the running container.
# - You can also create a copy of the Pod to test configurations or reproduce issues without affecting the original.
