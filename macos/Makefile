THISDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: build

build: build-amd64

build-amd64: _build-amd64
build-i386: _build-386


_build-%:
	[ -d src/github.com/ondevice/ondevice/ ] || git clone https://github.com/ondevice/ondevice/ src/github.com/ondevice/ondevice/
	cd src/github.com/ondevice/ondevice/ && git pull && git checkout stable
	GOPATH=$(THISDIR) make -C src/github.com/ondevice/ondevice deps
	mkdir -p target/
	cd src/github.com/ondevice/ondevice/; env GOOS=darwin GOARCH=$* GOPATH=$(THISDIR) go build -o ../../../../target/$*/ondevice

clean:
	rm -rf src/ pkg/ target/
