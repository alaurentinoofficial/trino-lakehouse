
order:
	helm repo add trino https://trinodb.github.io/charts/
	docker build ./hive-metastore -t hive-metastore

.PHONY: create-secrets
create-secrets:
	kubectl create secret generic metadata-db --from-literal=password=blablabla

.PHONY: install-helm-charts
install-helm-charts:
	helm repo add trino https://trinodb.github.io/charts/

.PHONY: build-hive-metastore
build-hive-metastore:
	docker build ./hive-metastore -t hive-metastore

.PHONY: up-minio
apply-minio:
	kubectl apply -f minio/minio-pvc.yaml
	kubectl apply -f minio/minio-deployment.yaml
	kubectl apply -f minio/minio-service.yaml