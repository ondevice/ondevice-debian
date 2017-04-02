#!/bin/bash
# build and package ondevice (install to /usr/lib/ondevice/)

set -ex

git clone https://github.com/ondevice/ondevice.git /go/src/github.com/ondevice/ondevice/
cd /go/src/github.com/ondevice/ondevice/

git checkout stable
chown -R user:user /go/

sudo -EH -u user /go/bin/glide install
sudo -EH -u user go build

sudo -u user tar cfz /tmp/build.tgz ondevice
