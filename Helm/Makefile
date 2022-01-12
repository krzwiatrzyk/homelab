install-kubernetes-dashboard:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

uninstall-kubernetes-dashboard:
	kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

install-skooner-dashboard:
	kubectl apply -f https://raw.githubusercontent.com/skooner-k8s/skooner/master/kubernetes-skooner.yaml

uninstall-skooner-dashboard:
	kubectl delete -f https://raw.githubusercontent.com/skooner-k8s/skooner/master/kubernetes-skooner.yaml

install-cert-manager-kubectl-extension:
	curl -L -o kubectl-cert-manager.tar.gz https://github.com/jetstack/cert-manager/releases/latest/download/kubectl-cert_manager-linux-amd64.tar.gz
	tar xzf kubectl-cert-manager.tar.gz
	sudo mv kubectl-cert_manager /usr/local/bin
	kubectl cert-manager