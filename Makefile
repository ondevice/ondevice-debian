
all: clean build

build: build-deb build-linux build-macos


build-deb:
	make -C deb/ build
	mkdir -p target/deb/
	mv deb/target/*/*.deb target/deb/

build-linux:
	make -C linux build
	mkdir -p target/linux/
	mv linux/target/386 target/linux/i386
	mv linux/target/amd64 target/linux/

build-macos:
	# builds the raw binaries (i.e. everything but the distro-specific packages)
	make -C macos build
	mkdir -p target/linux/ target/macos/
	mv macos/target/386 target/macos/i386
	mv macos/target/amd64 target/macos/


clean:
	make -C deb/ clean
	make -C linux/ clean
	make -C macos/ clean
	rm -rf target/
