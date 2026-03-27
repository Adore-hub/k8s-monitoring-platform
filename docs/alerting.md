```md
# Alerting

## 告警分级

### P0
核心业务不可用、节点宕机、关键组件故障。

### P1
Pod 异常、资源使用过高、服务延迟升高。

### P2
容量趋势预警、潜在风险项、低优先级异常。

## 告警策略

- Node 层：节点宕机、CPU、内存、磁盘
- Pod 层：重启异常、NotReady、资源超限
- Business 层：错误率、延迟、吞吐量

## 高级 PromQL 示例

```promql
predict_linear(node_filesystem_free_bytes[6h], 4 * 3600) < 0
