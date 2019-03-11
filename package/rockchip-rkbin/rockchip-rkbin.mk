################################################################################
#
# rockchip_rkbin
#
################################################################################

ROCKCHIP_RKBIN_VERSION = 6d64f556f2578a29dc0974e82d6f6cc3b98d3f2d
ROCKCHIP_RKBIN_SITE = $(call github,rockchip-linux,rkbin,$(ROCKCHIP_RKBIN_VERSION))
ROCKCHIP_RKBIN_INSTALL_TARGET = YES

define ROCKCHIP_RKBIN_BUILD_CMDS
endef

define ROCKCHIP_RKBIN_INSTALL_TARGET_CMDS
	echo $(BINARIES_DIR)
endef

$(eval $(generic-package))
