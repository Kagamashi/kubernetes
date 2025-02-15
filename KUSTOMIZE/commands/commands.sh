#!/bin/bash

# This command builds the configuration from the specified directory
# which contains the kustomization.yaml file.
kustomize build ./overlays/dev

# You can pipe the output to kubectl to apply it to the cluster.
kustomize build ./overlays/dev | kubectl apply -f -

# Check the version of kustomize
kustomize version --short


# List the resources and their status in the directory containing kustomization.yaml.
kustomize cfg list ./overlays/dev

# Format all Kubernetes manifests in the directory.
kustomize cfg fmt ./overlays/dev
