#!/bin/bash
set -e -u -o pipefail
set -x

# Build deb package
docker build -t toradex-listusb-packager .

# Extract result from container
docker create -ti --name container toradex-listusb-packager bash
for F in \
        listusb-dbgsym_20200530_amd64.deb \
        listusb_20200530.orig.tar.gz \
        listusb_20200530_amd64.changes \
        listusb_20200530.dsc \
        listusb_20200530_amd64.buildinfo \
        listusb_20200530_amd64.deb ; do
    docker cp container:/root/$F .
done
docker rm -f container 1>/dev/null

