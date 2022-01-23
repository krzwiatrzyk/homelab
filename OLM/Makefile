install-crd:
	kubectl apply -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.20.0/crds.yaml

uninstall-crd:
	kubectl delete -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.20.0/crds.yaml

install-olm:
	kubectl apply -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.20.0/olm.yaml
	kubectl rollout status -w deployment/olm-operator --namespace="olm"
	kubectl rollout status -w deployment/catalog-operator --namespace="olm"
	kubectl get -n olm csv
	kubectl get -n olm installplan
	kubectl get -n olm catalogsources
	kubectl get -n olm subscriptions
	kubectl get -n olm operatorgroups

uninstall-olm:
	kubectl delete -f https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.20.0/olm.yaml


run-console:
	./console.sh
