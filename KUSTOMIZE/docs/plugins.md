# Kustomize Plugins

Kustomize supports custom extensions through plugins to address specific needs that go beyond its built-in features.

---

## Types of Plugins

- **Generators**: Used to dynamically create resources like ConfigMaps, Secrets, or any other Kubernetes resources.
- **Transformers**: Used to modify existing resources by adding, removing, or altering fields, labels, and more.

---

## Enabling Plugins

1. Set the `KUSTOMIZE_PLUGIN_HOME` environment variable to define the plugins path directory. The directory structure is organized by API group, version, and plugin name.
2. Use the `--enable-alpha-plugins` flag when running Kustomize to enable plugins.

### Example:
```bash
kustomize build --enable-alpha-plugins ./overlays/dev
```

---

## Custom Generator

### Directory Structure
```plaintext
$KUSTOMIZE_PLUGIN_HOME
└── mycompany.example.com
    └── v1
        └── customconfiggenerator
            └── CustomConfigGenerator.yaml
```

### CustomConfigGenerator.yaml
```yaml
apiVersion: mycompany.example.com/v1
kind: CustomConfigGenerator
metadata:
  name: custom-config
spec:
  key: custom-value
  filePath: /path/to/config.properties
```

### Script: example-script.sh
```bash
#!/bin/bash
echo "apiVersion: v1
kind: ConfigMap
metadata:
  name: custom-config
data:
  custom-key: custom-value" > $1
```

### kustomization.yaml
```yaml
generators:
  - mycompany.example.com/v1/customconfiggenerator/CustomConfigGenerator.yaml
```

---

## Custom Transformers

### Directory Structure
```plaintext
$KUSTOMIZE_PLUGIN_HOME
└── mycompany.example.com
    └── v1
        └── customlabeltransformer
            └── CustomLabelTransformer.yaml
```

### CustomLabelTransformer.yaml
```yaml
apiVersion: mycompany.example.com/v1
kind: CustomLabelTransformer
metadata:
  name: add-label
labels:
  team: ops
  environment: production
```

### Script: example-go.go
```go
package main

import (
  "sigs.k8s.io/kustomize/kyaml/yaml"
  "sigs.k8s.io/kustomize/kyaml/kio"
)

func main() {
  r := &kio.LocalPackageReader{PackagePath: "./"}
  resources, err := r.Read()
  if err != nil {
    panic(err)
  }

  for _, resource := range resources {
    resource.SetLabel("team", "ops")
    resource.SetLabel("environment", "production")
  }

  w := &kio.LocalPackageWriter{PackagePath: "./"}
  err = w.Write(resources)
  if err != nil {
    panic(err)
  }
}
```

### kustomization.yaml
```yaml
transformers:
  - mycompany.example.com/v1/customlabeltransformer/CustomLabelTransformer.yaml
```
