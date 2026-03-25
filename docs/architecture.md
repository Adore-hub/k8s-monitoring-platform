# 架构说明

## 监控流程

1. Node Exporter 收集主机指标
2. kube-state-metrics 提供K8s资源状态
3. Prometheus 拉取数据
4. Grafana 展示数据
5. Alertmanager 发送告警

## 架构优势

- 高可扩展性
- 支持多维度监控
- 云原生兼容
