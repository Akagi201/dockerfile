#!/bin/bash

# deploy stellar-core binary
git clone --depth 1 --branch ${STELLAR_CORE_TAG} https://github.com/akfork/stellar-core /stellar-core \
  && cd /stellar-core \
  && git submodule init \
  && git submodule update \
  && ./autogen.sh \
  && ./configure \
  && make -j2 \
  && make install
