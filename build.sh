#!/bin/bash -xeu
unzip -f 4.7.zip
cp build_inner.sh chrony-4.7
docker run --rm -it -v $(pwd)/chrony-4.7:/src -u $(id -u):$(id -g) -w /src ghcr.io/octonezd/meego_docker:latest bash build_inner.sh
cp chrony-4.7/chronyd data/usr/bin/chronyd
patchelf --set-interpreter /lib/ld-linux.so.3 data/usr/bin/chronyd