#!/bin/bash -e

cd /
wget --no-check-certificate https://netfilter.org/projects/libmnl/files/libmnl-1.0.4.tar.bz2
tar xf libmnl-1.0.4.tar.bz2
cd libmnl-1.0.4
./configure
make install

cd /
wget --no-check-certificate https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190227.tar.xz
tar xf WireGuard-0.0.20190227.tar.xz
cd WireGuard-0.0.20190227/src
sed "s#KERNELDIR ?= .*#KERNELDIR ?= /usr/local/x86_64-pc-linux-gnu/x86_64-pc-linux-gnu/sys-root/usr/lib/modules/DSM-6.2/build#" -i Makefile
make

