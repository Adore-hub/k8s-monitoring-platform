#!/usr/bin/env bash
set -euo pipefail

NAMESPACE=monitoring

echo "==> Creating namespace..."
kubectl apply -f manifests/namespace.yaml

echo "==> Adding Helm repo..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "==> Installing kube-prometheus-stack..."
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack \
  -n ${NAMESPACE} \
  -f helm/kube-prometheus-stack/custom-values.yaml

echo "==> Applying custom Prometheus rules..."
kubectl apply -f alerts/

echo "==> Applying Grafana dashboard config..."
kubectl apply -f grafana/dashboard.json || true

echo "==> Deployment completed."
kubectl get pods -n ${NAMESPACE}
