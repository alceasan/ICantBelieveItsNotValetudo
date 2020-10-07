#!/bin/bash
set -ex

# NOTE: this url will change regularly because it's unstable
PACKAGE=http://ftp.debian.org/debian/pool/main/q/qemu/qemu-user-static_5.0-14~bpo10+1_amd64.deb

mkdir tmp/
cd tmp/

curl $PACKAGE -o $(basename ${PACKAGE})
dpkg-deb -X $(basename ${PACKAGE}) .
cp usr/bin/qemu-aarch64-static ..
cp usr/bin/qemu-arm-static ..
cd ..
rm -rf tmp
