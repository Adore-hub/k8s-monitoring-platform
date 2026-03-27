# Dashboards

本目录用于存放 Grafana Dashboard 相关说明。

## 说明

- `grafana/dashboard.json`：Grafana 仪表盘配置文件
- Dashboard 主要覆盖：
  - 集群概览
  - 节点资源监控
  - Pod 生命周期监控
  - 业务接口可用性
  - 告警统计分析

## 使用方式

可以通过 Grafana UI 导入 JSON 文件，或者通过 provisioning 机制进行自动加载。
