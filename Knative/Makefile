start-k3s:
	k3d cluster create knative \
	--servers 1 \
	-p "80:80@loadbalancer" \
	-p "443:443@loadbalancer" \
	--k3s-arg --disable=traefik@server:0 \
	--k3s-arg --disable=local-storage@server:0

stop-k3s:
	k3d cluster stop knative
	k3d cluster delete knative

install-broker:
#	kubectl apply -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.1.3/eventing-kafka-controller.yaml
#	kubectl apply -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.1.3/eventing-kafka-broker.yaml
	kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.1.1/mt-channel-broker.yaml


install-channel:
	kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.1.0/in-memory-channel.yaml

install-sugar:
	kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.1.0/eventing-sugar-controller.yaml

uninstall-broker:
#	kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.1.3/eventing-kafka-controller.yaml
# 	kubectl delete -f https://github.com/knative-sandbox/eventing-kafka-broker/releases/download/knative-v1.1.3/eventing-kafka-broker.yaml
	kubectl delete -f https://github.com/knative/eventing/releases/download/knative-v1.1.0/mt-channel-broker.yaml


install-serving:
	kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-crds.yaml
	kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-core.yaml

uninstall-serving:
	kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-crds.yaml
	kubectl delete -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-core.yaml

install-eventing:
	kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.1.0/eventing-crds.yaml
	kubectl apply -f https://github.com/knative/eventing/releases/download/knative-v1.1.0/eventing-core.yaml

install-kn-cli:
	wget https://github.com/knative/client/releases/download/knative-v1.1.0/kn-linux-amd64
	chmod +x kn-linux-amd64
	sudo mv kn-linux-amd64 /usr/local/bin/kn

create-hello-service:
	kn service create hello \
	--image gcr.io/knative-samples/helloworld-go \
	--port 8080 \
	--env TARGET=World \
	--revision-name=world

install-istio-for-knative:
	kubectl apply -l knative.dev/crd-install=true -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/istio.yaml
	kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/istio.yaml
	sleep 3s
	kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/net-istio.yaml

uninstall-istio-for-knative:
	kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/net-istio.yaml
	kubectl delete -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/istio.yaml
	kubectl delete -l knative.dev/crd-install=true -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/istio.yaml

install-courier:
	kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.1.0/kourier.yaml
	sleep 3s
	kubectl patch configmap/config-network \
	  --namespace knative-serving \
	  --type merge \
	  --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

create-core-dns:
	docker run -p 127.0.0.1:53:53/udp -d \
	--name coredns \
	--volume $$(pwd)/coredns/:/root/ \
	coredns/coredns:1.8.7 -p 53 -conf /root/Corefile

delete-core-dns:
	docker rm -f coredns

install-prometheus:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 30.1.0 --values=prometheus/values.yaml

