DIRS=$(subst /,,$(wildcard */))

all:


# explicitly state the targets for autocomplete to work
build-ondevice: _build-ondevice

_build-%:
	cp -a ../_shared/ '$*/_sharedDebian'
	cd '$*'; docker build -t 'ondevice/build-$*' .
	mkdir -p 'target/$*'
	cd 'target/$*'; docker run --rm -ti 'ondevice/build-$*' base64 /tmp/build.tgz | base64 -D | tar x
	rm -r '$*/_sharedDebian/'

