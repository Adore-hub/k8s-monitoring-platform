# 🚀 部署指南 (Deployment Guide)
本文档将指导您如何在 Kubernetes 集群中快速部署 k8s-monitoring-platform 监控平台。
## 1. 环境要求 (Prerequisites)
在开始部署之前，请确保您的环境满足以下要求：
| 组件 | 版本要求 | 说明 |
| :--- | :--- | :--- |
| Kubernetes | `v1.20+` | 需具备集群管理员权限 |
| Helm | `v3.0+` | 用于管理 Charts 包 |
| kubectl | `v1.20+` | 已配置好集群访问权限 (`~/.kube/config`) |
| Make | `latest` | (可选) 用于执行简化命令 |

## 2. 安装步骤 (Installation)
### 我们提供了 Makefile 和 Shell 脚本 两种部署方式，任选其一即可。
#### 方式一：使用 Makefile (推荐)
##### # 需要先安装make工具
git clone https://github.com/Adore-hub/k8s-monitoring-platform.git

cd k8s-monitoring-platform

##### # 执行一键安装
make install
#### 方式二：使用原生 Shell 脚本
##### # 赋予脚本执行权限
chmod +x scripts/deploy.sh

##### # 执行部署
./scripts/deploy.sh

💡 提示: 脚本会自动添加 Helm 源、创建命名空间、安装 kube-prometheus-stack 并应用自定义告警规则。
## 3. 验证安装 (Verification)
### 3.1 检查 Pod 状态
kubectl get pods -n monitoring

#### # 预期输出核心组件（prometheus, grafana, alertmanager, node-exporter 等）的状态应为 Running。
NAME                                               READY   STATUS    RESTARTS   AGE

alertmanager-kube-prometheus-alertmanager-0        2/2     Running   0          2m

grafana-6f5b8c9d7-x2v4p                            2/2     Running   0          2m

prometheus-kube-prometheus-prometheus-0            2/2     Running   0          2m

prometheus-node-exporter-abcde                     1/1     Running   0          2m

...

### 3.2 访问 Grafana 界面
#### 方法一：使用 Makefile (推荐)
make port-forward
#### 方法二：手动端口转发
kubectl port-forward svc/kube-prometheus-grafana 3000:80 -n monitoring

启动后，打开浏览器访问：http://localhost:3000

##### # 默认用户名: admin

##### # 默认密码: prom-operator
## 4. 卸载平台 (Uninstall)
#### 方法一：使用 Makefile
make clean
#### 方法二：使用 Helm 手动卸载
helm uninstall prometheus -n monitoring

kubectl delete namespace monitoring
