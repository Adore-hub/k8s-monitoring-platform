# Deployment

## 前置条件
- Kubernetes 集群
- Helm 3
- kubectl

## 部署步骤

### 1. 创建命名空间
kubectl apply -f manifests/namespace.yaml

### 2. 部署监控平台
chmod +x scripts/deploy.sh
./scripts/deploy.sh

### 3. 验证部署
kubectl get pods -n monitoring
kubectl get svc -n monitoring

## 回滚
helm uninstall monitoring -n monitoring
kubectl delete namespace monitoring
