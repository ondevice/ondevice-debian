DIRS=$(subst /,,$(wildcard */))

all:


# explicitly state the targets for autocomplete to work
build-ondevice: _build-ondevice
build-ondevice-daemon: _build-ondevice-daemon

_build-%:
	date > '$*/.nocache'
	cp -a ../_shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-$*' /bin/false); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)' '$*/.nocache'
	rm -rf '$*/_sharedDebian/'

