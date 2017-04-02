FROM vicamo/debian:jessie-i386

RUN apt-get update && apt-get -o Acquire::Retires=5 -y install devscripts git wget curl

RUN adduser --gecos builduser,,, --disabled-password user

# install go
WORKDIR /usr/local/
RUN wget https://storage.googleapis.com/golang/go1.7.5.linux-386.tar.gz
RUN tar xfz go1.7.5*.tar.gz
RUN ln -s /usr/local/go/bin/* /usr/local/bin/

ENV GOPATH=/go/
ENV PATH=/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p /go/bin /go/src

# install glide
RUN curl https://glide.sh/get | sh

# disable docker's build cache (Makefile will always update this file)
COPY .nocache /tmp/


# build and package ondevice (install to /usr/lib/ondevice/)
RUN git clone https://github.com/ondevice/ondevice.git /go/src/github.com/ondevice/ondevice/
WORKDIR /go/src/github.com/ondevice/ondevice/

RUN git checkout stable
COPY _sharedDebian/ /go/src/github.com/ondevice/ondevice/debian
#COPY debian /go/src/github.com/ondevice/ondevice/debian
RUN chown -R user:user /go/
USER user

RUN glide install


RUN dpkg-buildpackage -us -uc

RUN tar cfz /tmp/build.tgz ../ondevice_*.deb
