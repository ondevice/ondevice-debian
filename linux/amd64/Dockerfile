FROM debian:jessie

RUN apt-get update && apt-get -o Acquire::Retires=5 -y install devscripts git wget curl sudo

RUN adduser --gecos builduser,,, --disabled-password user

# install go
WORKDIR /usr/local/
RUN wget https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
RUN tar xfz go1.7.5*.tar.gz
RUN ln -s /usr/local/go/bin/* /usr/local/bin/

ENV GOPATH=/go/
ENV PATH=/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN mkdir -p /go/bin /go/src

# install glide
RUN curl https://glide.sh/get | sh

COPY run.sh /

CMD /run.sh
