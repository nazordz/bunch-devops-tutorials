#!/bin/bash

set -ex

# Create Custom Resource Definitions

kubectl create -f prometheus-operator-crd
kubectl create -f linkerd/linerd-crds.yaml

# Create Kubernetes Namespaces

kubectl apply -f namespaces

# Deploy Monitoring Components

kubectl apply -R -f monitoring

# Install Service Meash (Linkerd)

kubectl apply -f linkerd/linkerd-core.yaml
kubectl apply -f linkerd/dashboard.yaml

# Deploy Applications

kubectl apply -f java-app/deploy
kubectl apply -f go-app/deploy
