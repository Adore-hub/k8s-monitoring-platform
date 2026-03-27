```md
# Dashboards

## Dashboard 目标

通过 Grafana Dashboard 实现：

- 集群健康可视化
- 节点资源趋势分析
- Pod 生命周期异常检测
- 业务接口错误率和延迟观测

## 推荐面板

- CPU/Memory 使用率
- Node Ready 状态
- Pod Restarts
- HTTP 5xx 错误率
- p95 延迟
- 磁盘剩余容量预测

## 导入方式

1. 打开 Grafana
2. 导入 `grafana/dashboard.json`
3. 绑定 Prometheus 数据源
