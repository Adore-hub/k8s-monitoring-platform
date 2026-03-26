# 部署指南

本文档将指导您如何在 Kubernetes 集群中部署 `k8s-monitoring-platform`。

## 1. 环境要求

- **Kubernetes**: v1.20+
- **Helm**: v3.0+
- **kubectl**: 已配置好集群访问权限

## 2. 安装步骤

我们提供了 Makefile 和 Shell 脚本两种方式，任选其一即可。

### 方式一：使用 Makefile (推荐)

```bash   ”“bash
# 执行安装
make install   使安装
