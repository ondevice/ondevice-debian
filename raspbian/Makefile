DIRS=$(subst /,,$(wildcard */))

all:


# explicitly state the targets for autocomplete to work
build-jessie-armhf: _build-jessie-armhf


_build-%:
	cp -a ../_shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-$*' /bin/false); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)'
	rm -rf '$*/_sharedDebian/'

