# kubectl get events
# List cluster events. Events can help in identifying issues such as failures in Pod scheduling, image pulling, and more.

# Usage:
kubectl get events

# Example:
kubectl get events --sort-by='.metadata.creationTimestamp'

# Useful Flags:
# --sort-by: Sort the events based on a specific field.
kubectl get events --sort-by='.lastTimestamp'

# Tips:
# - Use `kubectl get events` to see important information on why Pods might be stuck in Pending or CrashLoopBackOff states.
# - Sorting by `creationTimestamp` or `lastTimestamp` helps in seeing the most recent events, which are often the most relevant for debugging.
