# 🚀 Kubernetes Monitoring Platform

## 📌 项目简介
基于 Kubernetes 构建的云原生监控告警平台，实现对集群、容器及业务的全链路监控与告警。

👉 项目亮点：
- 从0到1搭建监控体系
- 支持多维度指标采集（Node / Pod / Container）
- 实现自动化部署（Helm）
- 告警分级与路由策略

---

## 🧪 实验环境

- Kubernetes: v1.28
- 节点规模: 3节点（1 Master + 2 Worker）
- 部署方式: 本地虚拟机（CentOS 7）
- Helm: v3.x

---

## 🏗️ 技术栈

- Kubernetes
- Prometheus
- Grafana
- Alertmanager
- Helm

---

## 📂 项目结构
.
├── prometheus/
├── grafana/
├── screenshots/
├── deploy.sh
└── README.md
---

## 🚀 快速部署

```bash
chmod +x deploy.sh
./deploy.sh
📊 核心功能
集群监控（Node / Pod / Deployment）
容器资源监控（CPU / 内存）
Grafana可视化
告警分级（P0/P1/P2）
PromQL自定义规则
🔔 告警示例

详见：prometheus/alert-rules.yaml

📸 效果展示

（这里放截图）

🧠 项目总结

该项目完整实现了 Kubernetes 监控体系搭建，具备实际生产环境演进能力。

👨‍💻 作者

王雨辰

