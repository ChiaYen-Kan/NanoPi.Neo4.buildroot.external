################################################################################
#
# idbloader
#
################################################################################
IDBLOADER_VERSION = 3a17e7c4fd924715712a59911429d37942e7a600
IDBLOADER_SOURCE = idbloader.img
IDBLOADER_SITE = https://github.com/friendlyarm/sd-fuse_rk3399/raw/$(IDBLOADER_VERSION)/prebuilt
IDBLOADER_INSTALL_IMAGES = YES

define IDBLOADER_EXTRACT_CMDS
endef

define IDBLOADER_INSTALL_IMAGES_CMDS	
	cp $(IDBLOADER_DL_DIR)/$(IDBLOADER_SOURCE) $(BINARIES_DIR)
endef

$(eval $(generic-package))