DOCS = "https://access.redhat.com/documentation/en-us/red_hat_codeready_containers/1.38/html/getting_started_guide/index"
OCPREL = "https://console.redhat.com/openshift/releases"

install:
	wget -nc https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz
	tar xvf crc-linux-amd64.tar.xz
	sudo ln -s $$(pwd)/crc-linux-1.38.0-amd64/crc /usr/local/bin/crc

setup:
	crc setup

start:
	crc start

eval:
	eval $$(crc oc env)

login:
	oc login -u developer -p developer

console:
	crc console --credentials

docs:
	nohup firefox ${DOCS} &

releases:
	nohup firefix ${OCPREL} &
