#!/bi/bash

set -ex

# Create Custom Resource Definitions

kubectl create -f prometheus-operator-crd

# Create Kubernetes Namespaces
