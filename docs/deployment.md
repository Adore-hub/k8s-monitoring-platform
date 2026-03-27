# Deployment

## 前置条件

- Kubernetes 集群
- Helm 3
- kubectl

## 部署步骤

### 1. 创建命名空间

```bash
kubectl apply -f manifests/namespace.yaml
