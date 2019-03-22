#!/bin/sh

BOARD_DIR="$(dirname $0)"

UBOOT_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'uboot-custom*'`
LINUX_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'linux-custom*'`
RKBIN_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'rockchip-rkbin*'`

# create parameter.img
$HOST_DIR/bin/rkcrc -p $BOARD_DIR/parameter.txt $BINARIES_DIR/parameter.img

# copy over uboot files
cp $UBOOT_BUILD_DIR/uboot.img ${BINARIES_DIR}/
cp $UBOOT_BUILD_DIR/trust.img ${BINARIES_DIR}/

# copy over the kernel images
LINUX_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'linux-custom*'`
cp $LINUX_BUILD_DIR/resource.img ${BINARIES_DIR}/

