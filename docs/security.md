## Pod Security Admission (PSA)
PSA is the recommended mechanism for enforcing Pod security standards.
It provides security profiles that can be applied at namespace level ensuring that Pods in this namespace meet certain security requirements.

Key features:
1. PROFILES
    - Privileges: Allow all capabilities and provides minimal restrictions.
      Suitable for trusted workloads that require high privileges.
        > :>
    - Baseline: Provides moderate restrictions, suitable for general-purpose workloads. 
        > restricts use of HostNetwork and HostPID (prevents Pods from accessing underlying host's network or process namespaces)
        > restricts access to host paths, limiting the ability to mount host directories into containers
    - Restricted: Enforces most stringent security controls, ideal for highly sensitive workloads. 
        > enforces use of non-root containers by default
        > restricts use of HostNetwork and HostPID (prevents Pods from accessing underlying host's network or process namespaces)
        > restricts access to host paths, limiting the ability to mount host directories into containers
2. NAMESPACE-LEVEL ENFORCEMENT
    - Profiles are applied at namespace level
    - All pods in the namespace must conform to the selected profile
3. VALIDATION ENFORCE MODES
    - Audit: Logs violations but does not block the Pod
    - Warn: Provides warning but allows Pod to run
    - Enforce: Blocks the creation of Pods that violate the policy

PSA Profiles can be enforced on namespace by applying labels
pod-security.kubernetes.io/[ENFORCE_MODE]=[PROFILE]

# Apply the restricted security profile to a namespace
kubectl label namespace my-namespace pod-security.kubernetes.io/enforce=restricted

# Enable warnings for baseline profile violations
kubectl label namespace my-namespace pod-security.kubernetes.io/warn=baseline

# Enable auditing for privileged profile violations
kubectl label namespace my-namespace pod-security.kubernetes.io/audit=privileged

---