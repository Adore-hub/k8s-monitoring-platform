.PHONY: deploy clean lint help

NAMESPACE=monitoring

help:
	@echo "Available targets:"
	@echo "  make deploy   - Deploy monitoring platform"
	@echo "  make clean    - Remove monitoring namespace"
	@echo "  make lint     - Validate YAML files"

deploy:
	@chmod +x scripts/deploy.sh
	@./scripts/deploy.sh

clean:
	kubectl delete namespace $(NAMESPACE) --ignore-not-found=true

lint:
	@echo "Validating YAML files..."
	@find . -name "*.yaml" -o -name "*.yml" | xargs -I {} sh -c 'echo "Checking {}"; kubectl apply --dry-run=client -f {} >/dev/null'
	@echo "YAML validation completed."
