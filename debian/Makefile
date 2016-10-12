DIRS=$(subst /,,$(wildcard */))

all:


phony:
	@true

# explicitly state the targets for autocomplete to work
build-jessie-amd64: _build-jessie-amd64
build-jessie-i386: _build-jessie-i386
build-meta: _build-meta

_build-%:
	cp changelog '$*/debian/changelog'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'
	cd 'target/$*'; docker run --rm -ti 'ondevice/build-$*' base64 /tmp/build.tgz | base64 -D | tar x

.PHONY: phony
