DIRS=$(subst /,,$(wildcard */))

all:
	echo "Error: use one of the build-* targets" >&2
	exit 1

clean:
	rm -rf target/

# explicitly state the targets for autocomplete to work
build-amd64: _build-amd64
build-i386: _build-i386

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

