

build: build-amd64 build-i386

build-amd64: _build-amd64
build-i386: _build-386


_build-%:
	[ -d src/ ] || git clone https://github.com/ondevice/ondevice/ src/
	cd src/ && git pull && git checkout stable
	cd src/; env GOOS=linux GOARCH=$* go build -o ../target/$*/ondevice

clean:
	rm -rf src/ target/
