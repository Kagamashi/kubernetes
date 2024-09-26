Kubernetes Operators extend the functionality of Kubernetes API to manage lifecycle of complex applications.
Operators are custom controllers that automate the deployment, management, scaling, and recovery of stateful or complicated applications.

- Operators are built using Kubernetes Controller Pattern
- Operators use Custom Resource Definitions (CRDs) to define custom Kubernetes objects representing the application state

Components:
- Custom Resource (CR) defines the desired state of the application (e.g. how many replicas, configuration settings)
- CRDs extends Kubernetes API to introduce new resource types that represent the application components (e.g. MySQLCluster, KafkaBroker)
- Controller: component responsible for managing the application by ensuring the current state matches the desired state

# CRD
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: mysqlclusters.mysql.example.com
spec:
  group: mysql.example.com                # API group for the custom resource
  versions:
    - name: v1
      served: true
      storage: true
  scope: Namespaced                       # Resource is namespaced
  names:
    plural: mysqlclusters                 # Plural name for the resource
    singular: mysqlcluster                # Singular name for the resource
    kind: MySQLCluster                    # Custom resource kind
    shortNames:
    - mysql

# CR
apiVersion: mysql.example.com/v1
kind: MySQLCluster
metadata:
  name: my-cluster
spec:
  replicas: 3                  # Desired number of replicas for the MySQL cluster
  version: 8.0.21              # MySQL version


Steps to build an Operator:
- Define the Custom Resource (CR): Identify the application you want to manage and define its key attributes.
- Create a Custom Resource Definition (CRD): Extend the Kubernetes API by creating a CRD that represents the desired state of the application.
- Develop the Controller: Write a custom controller to watch the CRD and reconcile the desired state with the actual state.
- Package the Operator: Package the Operator for distribution using the Operator SDK or another tool.
- Deploy the Operator: Deploy the Operator to the Kubernetes cluster, where it can manage the application's lifecycle.


Reconciliation logic handles lifecycle of the application
func (r *MySQLClusterReconciler) Reconcile(req ctrl.Request) (ctrl.Result, error) {
    // Fetch the MySQLCluster instance
    var cluster mysqlv1.MySQLCluster
    if err := r.Get(ctx, req.NamespacedName, &cluster); err != nil {
        return ctrl.Result{}, client.IgnoreNotFound(err)
    }

    // Define the desired state (e.g., create or update StatefulSet)
    // Compare it with the current state and reconcile
}
