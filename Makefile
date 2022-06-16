
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

.PHONY: apply-minio
apply-minio:
	kustomize build ./minio | kubectl apply -f -

.PHONY: apply-trino
apply-trino:
	kustomize build ./trino | kubectl apply -f -

.PHONY: apply-mestastore
apply-mestastore:
	kustomize build ./hive-metastore | kubectl apply -f -