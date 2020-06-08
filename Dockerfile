FROM debian:buster
RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get -y install dh-make
RUN apt-get -y install git
RUN apt-get -y install libusb-1.0-0-dev
RUN apt-get -y install pkg-config

ENV DEBEMAIL "coolparadox@gmail.com"
ENV DEBFULLNAME "Rafael Lorandi"

# Prepare original source tarball.
# As the author has not released any version, choose the most recent commit at the moment of this writing.
WORKDIR /root
RUN git clone https://github.com/sergioprado/listusb.git listusb
WORKDIR listusb
RUN git archive --format=tar.gz --prefix=listusb-20200530/ d1112976 >../listusb_20200530.orig.tar.gz

# Build debian package artifacts.
WORKDIR /root
RUN tar -xzf listusb_20200530.orig.tar.gz
WORKDIR listusb-20200530
COPY debian debian
RUN dpkg-buildpackage -us -uc

# List package contents for verification.
WORKDIR /root
RUN dpkg-deb -c listusb_20200530_amd64.deb
