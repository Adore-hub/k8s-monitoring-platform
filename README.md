# k8s-monitoring-platform

![License   许可证](https://img.shields.io/badge/License-MIT-green)
![Kubernetes](https://img.shields.io/badge/Kubernetes-1.28%2B-blue)
![Prometheus](https://img.shields.io/badge/Prometheus-2.45%2B-orange)
![Grafana](https://img.shields.io/badge/Grafana-10.0%2B-orange)

> 基于 IaC 理念构建的企业级 Kubernetes 监控平台，支持 Prometheus + Grafana + Alertmanager + Exporters 的一体化部署，面向基础设施、集群组件与业务应用的端到端可观测性建设。

## 项目简介

`k8s-monitoring-platform` 是一个面向 Kubernetes 场景的开源监控平台方案，采用 Helm 与声明式配置实现监控体系的标准化、模块化和可复用。

本项目主要解决以下问题：

- 监控组件安装复杂、配置分散
- 告警规则难以统一管理
- Dashboard 缺乏版本化和可维护性
- 集群与业务指标割裂，无法形成完整可观测体系
- 故障定位依赖人工排查，响应效率低

通过本项目，可以实现：

- 一键部署监控平台
- 分层级告警治理（Node / Pod / Business）
- Grafana 可视化大屏展示
- Prometheus 指标采集与规则管理
- 面向企业级集群的可维护、可扩展监控实践

## 核心特性

- **IaC 化管理**：监控规则、Dashboard、Helm Values 解耦，纳入 Git 版本管理
- **自动化部署**：提供 `deploy.sh` 与 `Makefile`，支持一键部署
- **分级告警策略**：支持 P0 / P1 / P2 分级告警
- **多维度指标采集**：集成 Node Exporter、cAdvisor、kube-state-metrics
- **可视化大屏**：Grafana Dashboard 覆盖集群健康、资源水位、业务状态
- **预测性告警**：基于 `predict_linear` 等 PromQL 高级函数实现容量预测
- **高可用设计**：适配 3 节点高可用 Kubernetes 集群

## 技术栈

- Kubernetes
- Helm
- Prometheus
- Alertmanager
- Grafana
- node-exporter
- kube-state-metrics
- cAdvisor
- PromQL
- Bash / Makefile

## 项目结构

```bash
├── alerts                  # 告警规则配置
├── dashboards              # Dashboard 说明文档
├── docs                    # 架构、部署、告警、看板说明
├── examples                # 示例业务应用
├── grafana                 # Grafana Dashboard JSON
├── helm                    # Helm 部署配置
├── manifests               # 基础 Kubernetes 清单
├── prometheus              # Prometheus 相关配置
├── screenshots             # 项目截图
├── scripts                 # 自动化部署脚本
