#!/bin/bash
set -e -u -o pipefail
set -x

# Clean artifacts from previous builds.
find . -mindepth 1 -maxdepth 1 -name 'listusb*' -delete

# Build the debian package in a container.
docker build -t toradex-listusb-packager .

# Extract the new build artifacts from the container.
docker run --rm toradex-listusb-packager \
    bash -c "find \( -name 'listusb*20200530.*' -o -name 'listusb*20200530_*' \) -a ! -name 'listusb_20200530.tar.gz' | xargs tar -c --to-stdout" | \
tar -xvf -

