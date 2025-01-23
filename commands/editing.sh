# Edit a resource on the server directly, opens the resource in your default text editor.
kubectl edit [resource-type] [resource-name]


# --record: Record the command in the resource's annotations (good for auditing).
kubectl edit deployment my-deployment --record

# Tips:
# - Be cautious when editing live resources. Always verify the changes before saving.
# - If you need to adjust multiple resources simultaneously, use `kubectl patch` or `kubectl apply` with YAML files instead.

kubectl edit svc/docker-registry                      # Edit the service named docker-registry
KUBE_EDITOR="nano" kubectl edit svc/docker-registry   # Use an alternative editor
