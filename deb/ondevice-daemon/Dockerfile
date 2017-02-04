FROM debian:jessie

WORKDIR /tmp/build/

RUN apt-get update && apt-get -y install devscripts git

# build the ondevice-daemon meta package
WORKDIR /tmp/build/ondevice-daemon/
COPY Makefile /tmp/build/ondevice-daemon/
COPY _sharedDebian/ /tmp/build/ondevice-daemon/debian
COPY * /tmp/build/ondevice-daemon/
COPY debian /tmp/build/ondevice-daemon/debian

RUN dpkg-buildpackage -us -uc

RUN tar cfz /tmp/build.tgz ../ondevice-daemon_*.deb
