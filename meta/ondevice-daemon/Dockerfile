FROM debian:jessie

WORKDIR /tmp/build/

RUN apt-get update && apt-get -y install devscripts python-virtualenv python3-virtualenv git equivs python3-dev

# build the ondevice meta package
WORKDIR /tmp/build/ondevice/
COPY _sharedDebian/ /tmp/build/ondevice/debian
COPY debian /tmp/build/ondevice/debian

RUN dpkg-buildpackage -us -uc

RUN tar cfz /tmp/build.tgz ../ondevice-daemon_*.deb
