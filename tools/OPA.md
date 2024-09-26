- Open Policy Agent (OPA) provides a flexible policy engine for enforcing rules across Kubernetes (and other systems). Policies are written in Rego, a powerful declarative language.
- Gatekeeper is a Kubernetes-native integration of OPA that allows you to enforce OPA policies at admission time using Kubernetes CRDs (ConstraintTemplate and Constraint).
- Use Cases for OPA and Gatekeeper include enforcing security rules, limiting resource usage, managing compliance requirements, and more.
- Auditing with Gatekeeper allows you to identify policy violations in existing resources, helping you maintain compliance without enforcing strict admission controls immediately.
- Following best practices like starting with audits, managing policies as code, and testing in non-production environments ensures smooth adoption of OPA and Gatekeeper for policy enforcement.

# OpenPolicyAgent (OPA) is a general-purpose policy engine that allows to enfore fine-grained policies

- Policies are defined in language called Rego
- Policies are evaluated to allow/deny requests based on the desired logic


# Gatekeeper
Kubernetes-native extension for OPA that integrates OPA policy engine with Kubernetes admission control via Admission Controllers.
Gatekeeper allows policies to be enforced dynamically as resources are created or modified in the cluster.

Gatekeeper Components:
**ConstraintTemplate**: defines a reusable policy with logic written in Rego. This template allows to create specific constraints.

apiVersion: templates.gatekeeper.sh/v1beta1
kind: ConstraintTemplate
metadata:
  name: k8sallowedrepos
spec:
  crd:
    spec:
      names:
        kind: K8sAllowedRepos
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package k8sallowedrepos

        violation[{"msg": msg}] {
          input.review.object.spec.containers[_].image
          not startswith(input.review.object.spec.containers[_].image, "my-approved-registry.com/")
          msg := sprintf("Container image %s is not from an approved registry", [input.review.object.spec.containers[_].image])
        }


**Constraint**: instance of ConstraintTemplate, applies policy to specific resources or namespaces in the cluster
apiVersion: constraints.gatekeeper.sh/v1beta1
kind: K8sAllowedRepos
metadata:
  name: allowed-repos
spec:
  match:
    kinds:
      - apiGroups: [""]
        kinds: ["Pod"]
  parameters:
    repos:
      - "my-approved-registry.com"
