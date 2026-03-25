```bash
#!/bin/bash

echo "🚀 Start Deploy Monitoring Stack..."

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitor prometheus-community/kube-prometheus-stack \
  -f prometheus/values.yaml

echo "✅ Deploy Success!"
