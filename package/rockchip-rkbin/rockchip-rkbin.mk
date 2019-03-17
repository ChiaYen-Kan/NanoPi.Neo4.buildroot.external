################################################################################
#
# rockchip_rkbin
#
################################################################################

ROCKCHIP_RKBIN_VERSION = 9fc33aee92908b538ca6687550be437415efae8e
ROCKCHIP_RKBIN_SITE = $(call github,rockchip-linux,rkbin,$(ROCKCHIP_RKBIN_VERSION))
ROCKCHIP_RKBIN_INSTALL_TARGET = YES

define ROCKCHIP_RKBIN_BUILD_CMDS
endef

define ROCKCHIP_RKBIN_INSTALL_TARGET_CMDS
endef

$(eval $(generic-package))
