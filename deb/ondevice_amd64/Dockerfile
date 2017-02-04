FROM debian:jessie

RUN apt-get update && apt-get -o Acquire::Retires=5 -y install devscripts git wget

RUN adduser --gecos builduser,,, --disabled-password user

# install go
WORKDIR /usr/local/
RUN wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
RUN tar xfz go1.7.5*.tar.gz
RUN ln -s /usr/local/go/bin/* /usr/local/bin/

# disable docker's build cache (Makefile will always update this file)
COPY .nocache /tmp/


# build and package ondevice (install to /usr/lib/ondevice/)
ENV GOPATH=/tmp/build/
RUN git clone https://github.com/ondevice/ondevice.git /tmp/build/src/github.com/ondevice/ondevice/
WORKDIR /tmp/build/src/github.com/ondevice/ondevice/

RUN git checkout stable
COPY _sharedDebian/ /tmp/build/src/github.com/ondevice/ondevice/debian
#COPY debian /tmp/build/src/github.com/ondevice/ondevice/debian
RUN chown -R user:user /tmp/build/
USER user


RUN dpkg-buildpackage -us -uc

RUN tar cfz /tmp/build.tgz ../ondevice_*.deb
