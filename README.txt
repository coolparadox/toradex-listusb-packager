This project packages the listusb tool from Sergio Prado
<https://github.com/sergioprado/listusb> for Debian Linux.

In any Linux OS for the amd64 architecture with Docker and bash, the build_deb.sh script generates the deb
package (and other packaging artifacts) for installing listusb in Debian Buster.

Major produced artifacts:

- listusb_20200530_amd64.deb: Debian Buster (amd64 architecture) package containing the listusb executable (stripped).
- listusb-dbgsym_20200530_amd64.deb: debug symbols for the listusb executable.
- listusb_20200530.tar.xz: Debian source tarball for listusb.
- listusb_20200530.orig.tar.gz: original source tarball for listusb.
- listusb_20200530_amd64.changes: Package information and checksums.
- listusb_20200530_amd64.buildinfo: Build information for the amd64 architecture.

Rafael Lorandi
coolparadox@gmail.com
