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

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-$*' /bin/false); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)'

