DIRS=$(subst /,,$(wildcard */))

all:

# convenience targets (for bash completion purposes)
build-xenial-i386: _build-xenial-i386
build-xenial-amd64: _build-xenial-amd64
build-trusty-i386: _build-trusty-i386
build-trusty-amd64: _build-trusty-amd64
build-precise-i386: _build-precise-i386
build-precise-amd64: _build-precise-amd64

_build-%:
	cp -a ../_shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'
	cd 'target/$*'; docker run --rm -ti 'ondevice/build-$*' base64 /tmp/build.tgz | base64 -D | tar x
	rm -r '$*/_sharedDebian/'

