DIRS=$(subst /,,$(wildcard */))

all:


# explicitly state the targets for autocomplete to work
build-jessie-amd64: _build-jessie-amd64
build-jessie-i386: _build-jessie-i386

build-wheezy-amd64: _build-wheezy-amd64
build-wheezy-i386: _build-wheezy-i386

build-squeeze-amd64: _build-squeeze-amd64
build-squeeze-i386: _build-squeeze-i386

_build-%:
	cp -a ../_shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-$*'); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)'

