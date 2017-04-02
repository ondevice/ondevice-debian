DIRS=$(subst /,,$(wildcard */))

all:
	echo "Error: use one of the build-* targets" >&2
	exit 1

build: build-amd64 build-i386 build-daemon

clean:
	rm -rf target/

# explicitly state the targets for autocomplete to work
build-amd64: _build-ondevice_amd64
build-armhf: _build-ondevice_armhf
build-i386: _build-ondevice_i386
build-daemon: _build-ondevice-daemon

_build-%:
	date > '$*/.nocache'
	cp -a _shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-deb:$*' .
	mkdir -p 'target/$*'

	$(eval TMPFILE := $(shell mktemp))
	id=$$(docker create 'ondevice/build-deb:$*' /bin/false); docker cp $$id:/tmp/build.tgz '$(TMPFILE)'; docker rm -v "$$id"
	cd 'target/$*'; tar xfz '$(TMPFILE)'
	rm '$(TMPFILE)' '$*/.nocache'
	rm -rf '$*/_sharedDebian/'

