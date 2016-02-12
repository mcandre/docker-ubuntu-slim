IMAGE=mcandre/docker-ubuntu-slim:latest
ROOTFS=rootfs.tar.gz
define GENERATE
apt-get update && \
apt-get install -y debootstrap && \
mkdir /chroot && \
debootstrap --variant=minbase vivid /chroot && \
chroot /chroot apt-get clean && \
find /chroot/var/log -type f -delete && \
cd /chroot && \
tar czvf /mnt/rootfs.tar.gz .
endef

all: run

$(ROOTFS):
	docker run --rm --privileged -v $$(pwd):/mnt -t ubuntu:15.04 sh -c '$(GENERATE)'

build: Dockerfile $(ROOTFS)
	docker build -t $(IMAGE) .

run: clean-containers build
	docker run --rm $(IMAGE) sh -c 'apt-get update && apt-get -y install ruby && ruby -v'
	docker images | grep 'docker-ubuntu-slim.*latest' | awk '{ print $$(NF-1), $$NF }'

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean-rootfs:
	-rm $(ROOTFS)

clean: clean-containers clean-images clean-layers clean-rootfs

dockerlint:
	$(shell npm bin)/dockerlint

lint: dockerlint

publish:
	docker push $(IMAGE)
