################################################################################
#
# rockchip rkflashtool
#
################################################################################

ROCKCHIP_RKFLASHTOOL_VERSION = 8966c4e277de8148290554aaaa4146a3a84a3c53
ROCKCHIP_RKFLASHTOOL_SITE = $(call github,rockchip-linux,rkflashtool,$(ROCKCHIP_RKFLASHTOOL_VERSION))

define HOST_ROCKCHIP_RKFLASHTOOL_BUILD_CMDS
	$(HOST_MAKE_ENV) $(HOSTCC) $(@D)/rkcrc.c -o $(HOST_DIR)/bin/rkcrc
endef

define HOST_ROCKCHIP_RKFLASHTOOL_INSTALL_CMDS
endef

$(eval $(host-generic-package))
