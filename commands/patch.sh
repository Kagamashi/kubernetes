# Remove NodeAffinity from a pod
kubectl patch pod [name] -p '{"spec":{"affinity":{"nodeAffinity":null}}}'
