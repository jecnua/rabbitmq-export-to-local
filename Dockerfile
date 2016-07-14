FROM golang:latest

MAINTAINER jecnua

VOLUME ["/data"]

RUN go get github.com/dubek/rabbitmq-dump-queue

ENTRYPOINT ["/bin/bash"]
