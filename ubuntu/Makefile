DIRS=$(subst /,,$(wildcard */))

all:

# convenience targets (for bash completion purposes)
build-xenial-i386: _build-xenial-i386

_build-%:
	cp -a _shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'
	cd 'target/$*'; docker run --rm -ti 'ondevice/build-$*' base64 /tmp/build.tgz | base64 -D | tar x
	rm -r '$*/_sharedDebian/'

