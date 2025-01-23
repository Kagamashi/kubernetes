# Adds or updates the annotations on a resource.
kubectl annotate [resource-type] [resource-name] [annotation-key]=[value]


# --overwrite:  Allows overwriting an existing annotation.
kubectl annotate pod my-pod description="Updated pod" --overwrite

# Tips:
# - Use annotations to store metadata that can be used by tools or automation systems.
