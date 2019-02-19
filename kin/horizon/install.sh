#!/bin/bash

apt-get update

apt-get install -y git curl mercurial

# install deps
RUN go get -u github.com/golang/dep/...

# deploy horizon binary
mkdir -p /go/src/github.com/kinecosystem/ \
  && git clone --depth 1 --branch ${HORIZON_TAG} https://github.com/kinecosystem/go.git /go/src/github.com/kinecosystem/go \
  && cd /go/src/github.com/kinecosystem/go \
  && dep ensure -v \
  && go install github.com/kinecosystem/go/services/horizon

mv /go/bin/horizon /usr/local/bin
