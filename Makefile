.PHONY: install clean port-forward

install:
	@echo "🚀 开始部署监控平台..."
	@chmod +x scripts/deploy.sh
	@./scripts/deploy.sh

clean:
	@echo "🧹 清理监控平台..."
	helm uninstall kube-prometheus-stack -n monitoring || true
	kubectl delete namespace monitoring || true

port-forward:
	@echo "📊 开启 Grafana 端口转发 (http://localhost:3000)..."
	kubectl port-forward svc/kube-prometheus-stack-grafana 3000:80 -n monitoring
