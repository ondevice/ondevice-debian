THISDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: build

build: build-amd64 build-i386

build-amd64: _build-amd64
build-armhf: _build-arm
build-i386: _build-i386

_build-%:
	date > '$*/.nocache'
	cd '$*'; docker build -t 'ondevice/build-linux-$*' .
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-linux-$*' /bin/false); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)' '$*/.nocache'

clean:
	rm -rf target/
