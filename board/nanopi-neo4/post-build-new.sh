#!/bin/bash

BOARD_DIR="$(dirname $0)"

UBOOT_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'uboot-custom*'`
LINUX_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'linux-custom*'`
RKBIN_BUILD_DIR=`find ${BUILD_DIR} -type d -name 'rockchip-rkbin*'`

# copy extlinux
cp -rvf ${BOARD_DIR}/extlinux ${BINARIES_DIR}

# create idbloader.img
$UBOOT_BUILD_DIR/tools/mkimage -n rk3399 -T rksd -d $RKBIN_BUILD_DIR/bin/rk33/rk3399_ddr_933MHz_v1.19.bin ${BINARIES_DIR}/idbloader.img
cat $RKBIN_BUILD_DIR/bin/rk33/rk3399_miniloader_v1.19.bin >> ${BINARIES_DIR}/idbloader.img

# create uboot.img
UBOOT_LOAD_ADDR=`sed -n "/CONFIG_SYS_TEXT_BASE=/s/CONFIG_SYS_TEXT_BASE=//p" $UBOOT_BUILD_DIR/include/autoconf.mk|tr -d '\r'`
$UBOOT_BUILD_DIR/tools/loaderimage --pack --uboot $UBOOT_BUILD_DIR/u-boot.bin ${BINARIES_DIR}/uboot.img ${UBOOT_LOAD_ADDR} 

# create trust.img
pushd $RKBIN_BUILD_DIR
./tools/trust_merger --replace tools/rk_tools/ ./ $RKBIN_BUILD_DIR/RKTRUST/RK3399TRUST.ini
mv trust.img ${BINARIES_DIR}/
popd