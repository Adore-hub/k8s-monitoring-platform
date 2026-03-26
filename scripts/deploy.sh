#!/bin/bash   #！/bin/bash

# ==========================================
# K8s Monitoring Platform 一键部署脚本
# Author: Wang Yuchen
# Description: 自动化部署 Prometheus/Grafana/AlertManager 监控栈
# ==========================================

set -e

# 变量定义
NAMESPACE="monitoring"
RELEASE_NAME="kube-prometheus-stack"
CHART_REPO="prometheus-community"
CHART_NAME="kube-prometheus-stack"
VALUES_FILE="./helm/kube-prometheus-stack/custom-values.yaml"

echo "=========================================="echo "=========================================="
echo "🚀 K8s Monitoring Platform Deployer"
echo "=========================================="echo "=========================================="

# 1. 检查 Helm 是否安装
if ! command -v helm &> /dev/null; then
    echo "❌ 错误: 未检测到 Helm，请先安装 Helm 3.0+"
    exit 1
fi

# 2. 创建命名空间
echo "📦 Step 1: 创建命名空间
kubectl create namespace $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

# 3. 添加 Helm 仓库
echo "📥 Step 2: 添加 Prometheus 社区 Helm 仓库"
helm repo add $CHART_REPO https://prometheus-community.github.io/helm-charts 2>/dev/null || true
helm repo update   Helm回购更新

# 4. 部署监控栈
echo "🛠️ Step 3: 部署 kube-prometheus-stack..."
if [ -f "$VALUES_FILE" ]; then
    helm upgrade --install $RELEASE_NAME $CHART_REPO/$CHART_NAME \
      --namespace $NAMESPACE \
      --values $VALUES_FILE \
      --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
      --set prometheus.prometheusSpec.podMonitorSelectorNilUsesHelmValues=false
else
    echo "⚠️ 未找到自定义 values 文件，使用默认配置..."
    helm upgrade --install $RELEASE_NAME $CHART_REPO/$CHART_NAME \
      --namespace $NAMESPACE
fi

# 5. 等待 Pod 就绪
echo "⏳ Step 4: 等待核心组件启动..."
kubectl rollout status deployment/kube-prometheus-stack-operator -n $NAMESPACE --timeout=300s
kubectl rollout status statefulset/prometheus-kube-prometheus-stack-prometheus -n $NAMESPACE --timeout=300s

echo "=========================================="
echo "✅ 部署完成！"
echo ""
echo "💡 访问提示:"
echo "Grafana 端口转发: kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n $NAMESPACE"
echo "默认用户: admin / prom-operator"
echo "=========================================="
