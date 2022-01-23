.ONESHEL:

install-dapr-cli:
	wget -nc -q https://github.com/dapr/cli/releases/download/v1.5.1/dapr_linux_amd64.tar.gz
	mkdir -p dapr
	tar zxvf dapr_linux_amd64.tar.gz --directory dapr
	chmod +x dapr/dapr
	sudo mv dapr/dapr /usr/local/bin/dapr
	rmdir dapr
	rm dapr_linux_amd64.tar.gz

dapr-init:
	dapr init

dapr-dashboard:
	dapr dashboard
