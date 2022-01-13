k3d-create-cluster:
	# k3d cluster create demo --agents 2
	k3d cluster create homelab \
	--servers 1 \
	-p "80:80@loadbalancer" \
	-p "443:443@loadbalancer" \
	--volume /k3s:/k3s@all

k3d-list-clusters:
	k3d cluster list

k3d-delete-cluster:
	k3d cluster delete homelab

k3d-import-image:
	k3d image import -c demo elo:1.0.0

build: 
	docker build samples/image -t elo:1.0.0

k3d-add-node:
	k3d node create new-agent --cluster demo --role agent --replicas 1

k3d-list-nodes:
	k3d node list

k3d-create-live-demo-cluster:
	k3d cluster create demo \
	--api-port 6550 \
	--servers 1 \
	--agents 2 \
	--port 8082:80@loadbalancer \
	--volume $$(pwd)/samples/image:/src@all --wait

k3d-install-elo-chart:
	helm upgrade --install elo samples/chart 

k3s-install:
	wget https://github.com/k3s-io/k3s/releases/download/v1.22.3%2Bk3s1/k3s
	chmod +x k3s
	sudo mv k3s /usr/bin/k3s

k3s-create-single-node-cluster:
	sudo k3s server --https-listen-port 6444 &

k3s-check-config:
	k3s check-config 

k3d-expose-port:
	k3d node edit k3d-homelab-serverlb --port-add 80:80
