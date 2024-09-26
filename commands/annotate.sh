# kubectl annotate
# Adds or updates the annotations on a resource.

# Usage:
kubectl annotate <resource-type> <resource-name> <annotation-key>=<value>

# Example:
kubectl annotate pod my-pod description="This is my pod"

# Useful Flags:
# --overwrite: Allows overwriting an existing annotation.
kubectl annotate pod my-pod description="Updated pod" --overwrite

# Tips:
# - Use annotations to store metadata that can be used by tools or automation systems.
