SHELL = /bin/bash
VERSION = v4.0.2
KAM_VERSION = 5.5.4
UAS_VERSION = v1.1.66
CMAN_VERSION = latest

test:
	ansible-playbook -i hosts test.yml

add-key:
	ansible-playbook -i hosts add-key.yml

apt:
	ansible-playbook -i hosts apt.yml

docker-install:
	ansible-playbook -i hosts docker-install.yml

install: pull-all save-all
	ansible-playbook -i hosts install.yml


agent-install: pull-monitor-agent save-monitor-agent
	ansible-playbook -i hosts agent-install.yml

up:
	ansible-playbook -i hosts up.yml

down:
	ansible-playbook -i hosts down.yml

clean:
	rm -rf lua.tar.gz xui.tar.gz pg.tar.gz kamailio.tar.gz cman.tar.gz uas.tar.gz nats.tar.gz cadvisor.tar.gz node.tar.gz

login:
	docker login --username=100007721501 ccr.ccs.tencentyun.com

deploy: deploy-xswitch deploy-cman deploy-uas

deploy-xswitch: pull-xswitch save-xswitch
	ansible-playbook -i hosts --extra-vars "v=${VERSION}" deploy-xswitch.yml

deploy-cman: pull-cman save-cman
	ansible-playbook -i hosts --extra-vars "v=${VERSION}" deploy-cman.yml

deploy-uas: pull-uas save-uas
	ansible-playbook -i hosts --extra-vars "v=${VERSION}" deploy-uas.yml

deploy-test:
	ansible-playbook -i hosts deploy-test.yml

docker-status:
	ansible-playbook -i hosts status.yml



########################################################################

#					PULL IMAGES

########################################################################


pull-all: pull-xswitch pull-pg pull-kamailio pull-uas pull-cman

save-all: save-xswitch save-pg save-kamailio save-uas save-cman

pull-xswitch:
	docker pull ccr.ccs.tencentyun.com/xswitch-cloud/xswitch:${VERSION}-cloud-lua
	docker pull ccr.ccs.tencentyun.com/xswitch-cloud/xswitch:${VERSION}-cloud-nginx-xui

pull-pg:
	docker pull ccr.ccs.tencentyun.com/customers/xswitch-pg:latest

pull-kamailio:
	docker pull ccr.ccs.tencentyun.com/olcc/kamailio-ci:${KAM_VERSION}

pull-uas:
	docker pull ccr.ccs.tencentyun.com/xswitch-cluster/uas:${UAS_VERSION}

pull-cman:
	docker pull ccr.ccs.tencentyun.com/xswitch-cluster/cman:${CMAN_VERSION}

pull-monitor-agent:
	docker pull ccr.ccs.tencentyun.com/free/cadvisor:latest
	docker pull ccr.ccs.tencentyun.com/free/node-exporter:latest

save-xswitch:
	docker save -o lua.tar.gz ccr.ccs.tencentyun.com/xswitch-cloud/xswitch:${VERSION}-cloud-lua
	docker save -o xui.tar.gz ccr.ccs.tencentyun.com/xswitch-cloud/xswitch:${VERSION}-cloud-nginx-xui

save-kamailio:
	docker save -o kamailio.tar.gz ccr.ccs.tencentyun.com/olcc/kamailio-ci:${KAM_VERSION}

save-uas:
	docker save -o uas.tar.gz ccr.ccs.tencentyun.com/xswitch-cluster/uas:${UAS_VERSION}

save-cman:
	docker save -o cman.tar.gz ccr.ccs.tencentyun.com/xswitch-cluster/cman:${CMAN_VERSION}

save-pg:
	docker save -o pg.tar.gz ccr.ccs.tencentyun.com/customers/xswitch-pg:latest

save-monitor-agent:
	docker save -o cadvisor.tar.gz ccr.ccs.tencentyun.com/free/cadvisor:latest
	docker save -o node.tar.gz ccr.ccs.tencentyun.com/free/node-exporter:latest