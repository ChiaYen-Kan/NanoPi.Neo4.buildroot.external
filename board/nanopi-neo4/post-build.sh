#!/bin/sh

BOARD_DIR="$(dirname $0)"

# copy over uboot files
UBOOT_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'uboot-custom*'`
cp $UBOOT_BUILD_DIR/uboot.img ${BINARIES_DIR}/
cp $UBOOT_BUILD_DIR/trust.img ${BINARIES_DIR}/
cp $UBOOT_BUILD_DIR/rk3399_loader_v1.12.109.bin ${BINARIES_DIR}/sd-fuse-rk3399/buildroot/MiniLoaderAll.bin

# copy over the kernel images
LINUX_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'linux-custom*'`
cp $LINUX_BUILD_DIR/resource.img ${BINARIES_DIR}/

# setup the image creation software
cp ${BOARD_DIR}/parameter.txt ${BINARIES_DIR}/sd-fuse-rk3399/buildroot
ln -sf ${BINARIES_DIR}/kernel.img ${BINARIES_DIR}/sd-fuse-rk3399/buildroot
ln -sf ${BINARIES_DIR}/resource.img ${BINARIES_DIR}/sd-fuse-rk3399/buildroot
ln -sf ${BINARIES_DIR}/uboot.img ${BINARIES_DIR}/sd-fuse-rk3399/buildroot
ln -sf ${BINARIES_DIR}/trust.img ${BINARIES_DIR}/sd-fuse-rk3399/buildroot
ln -sf ${BINARIES_DIR}/rootfs.ext2 ${BINARIES_DIR}/sd-fuse-rk3399/buildroot/rootfs.img

# create the sdcard image
${BINARIES_DIR}/sd-fuse-rk3399/mkimage.sh
