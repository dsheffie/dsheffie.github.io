#!/bin/bash
pushd ~/initramfs/root; find . | cpio -o -H newc > ../initramfs.cpio; popd
make ARCH=riscv CROSS_COMPILE=/home/dsheffie/buildroot-2024.02/output/host/bin/riscv64-buildroot-linux-gnu- -j4

~/bin/interp_rv64 -f bbl.bin -r 1 --dump 0 --ram_size $((2*1024*1024*1024)) #--fdt_uart 1
scp bbl.bin0.rv64.chpt  root@ultra96v2-2020-1.local:

