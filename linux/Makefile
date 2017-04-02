THISDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: build

build: build-amd64 build-i386

build-amd64: _build-amd64
build-armhf: _build-arm
build-i386: _build-i386

_build-%: _docker-build-%
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-linux:$*'); docker start --attach "$$id" && docker cp "$$id:/tmp/build.tgz" '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfvz '$(TMPFILE)'
	rm '$(TMPFILE)'

_docker-build-%:
	@if [ 0 -eq "$$(docker images -q 'ondevice/build-linux:$*' | wc -l)" ]; then $(MAKE) 'docker-build-$*'; fi

docker-build-%:
	@echo "-- preparing build-image: --"
	docker build -t 'ondevice/build-linux:$*' '$*/'

clean:
	rm -rf target/
