################################################################################
#
# libmali For Linux
#
################################################################################

LIBMALI_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
LIBMALI_SITE = $(call github,rockchip-linux,libmali,$(LIBMALI_VERSION))
LIBMALI_INSTALL_STAGING = YES
LIBMALI_PROVIDES = libegl libgles

LIBMALI_HEADER_STAGING_DIR=$(STAGING_DIR)/usr/include

define LIBMALI_RM_SO
	$(TARGET_DIR)/usr/lib/libmali* \
	$(TARGET_DIR)/usr/lib/libMali* \
	$(TARGET_DIR)/usr/lib/libEGL.so* \
	$(TARGET_DIR)/usr/lib/libgbm.so* \
	$(TARGET_DIR)/usr/lib/libGLESv1_CM.so* \
	$(TARGET_DIR)/usr/lib/libGLESv2.so* \
	$(TARGET_DIR)/usr/lib/libMaliOpenCL.so \
	$(TARGET_DIR)/usr/lib/libOpenCL.so \
	$(TARGET_DIR)/usr/lib/libfbdev-egl.so*
endef

define LIBMALI_LINK_SO
	ln -s libmali.so libMali.so && \
	ln -s libmali.so libEGL.so && \
	ln -s libmali.so libEGL.so.1 && \
	ln -s libmali.so libgbm.so && \
	ln -s libmali.so libgbm.so.1 && \
	ln -s libmali.so libGLESv1_CM.so && \
	ln -s libmali.so libGLESv1_CM.so.1 && \
	ln -s libmali.so libGLESv2.so && \
	ln -s libmali.so libGLESv2.so.2 && \
	ln -s libmali.so libfbdev-egl.so && \
	ln -s libmali.so libfbdev-egl.so.1
endef

define LIBMALI_LINK_OPENCL_SO
	ln -s libmali.so libMaliOpenCL.so && \
	ln -s libmali.so libOpenCL.so
endef

ifeq ($(BR2_PACKAGE_RK3308),y)
define LIBMALI_INSTALL_TARGET_CMDS
endef
endif

ifeq ($(BR2_aarch64),y)
ifeq ($(BR2_PACKAGE_RK3326),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-fbdev-gbm.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-bifrost-g31-rxp0-fbdev-gbm.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif
else
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-bifrost-g31-rxp0-fbdev-gbm.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-bifrost-g31-rxp0-fbdev-gbm.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif

ifeq ($(BR2_aarch64),y)
ifeq ($(BR2_PACKAGE_PX30),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
        $(INSTALL) -D -m 644 $(@D)/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-fbdev-gbm.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-bifrost-g31-rxp0-fbdev-gbm.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif
else
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-bifrost-g31-rxp0-fbdev-gbm.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-bifrost-g31-rxp0-fbdev-gbm.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif

ifeq ($(BR2_PACKAGE_PX3SE),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-utgard-400-r7p0-r3p0-fbdev.so $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 755 $(@D)/overlay/S10libmali_px3se $(TARGET_DIR)/etc/init.d/S10libmali
	$(INSTALL) -D -m 755 $(@D)/overlay/px3seBase $(TARGET_DIR)/usr/sbin/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-utgard-400-r7p0-r3p0-fbdev.so libmali.so && $(LIBMALI_LINK_SO) && cd -
endef
endif

ifeq ($(BR2_PACKAGE_RK3128),y)
define LIBMALI_INSTALL_TARGET_CMDS
        rm -f $(LIBMALI_RM_SO)
        $(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-utgard-400-r7p0-r1p1-fbdev.so $(TARGET_DIR)/usr/lib/
        cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-utgard-400-r7p0-r1p1-fbdev.so libmali.so && $(LIBMALI_LINK_SO) && cd -
endef
endif

ifeq ($(BR2_PACKAGE_RK3288),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-midgard-t76x-r14p0-r0p0-fbdev.so $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 644 $(@D)/lib/arm-linux-gnueabihf/libmali-midgard-t76x-r14p0-r1p0-fbdev.so $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 755 $(@D)/overlay/S10libmali_rk3288 $(TARGET_DIR)/etc/init.d/S10libmali
	cd $(TARGET_DIR)/usr/lib/ && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif

ifeq ($(BR2_PACKAGE_RK3399),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/aarch64-linux-gnu/libmali-midgard-t86x-r14p0-fbdev.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-midgard-t86x-r14p0-fbdev.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef

define LIBMALI_INSTALL_STAGING_CMDS
	rm -f $(LIBMALI_RM_SO)
	@cp -r $(@D)/include/* $(LIBMALI_HEADER_STAGING_DIR)

	$(INSTALL) -D -m 0644 $(@D)/pkgconfig/egl.pc.cmake \
		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc

	sed -i 's/@CMAKE_INSTALL_LIBDIR@/lib/g' $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
	sed -i 's/@CMAKE_INSTALL_INCLUDEDIR@/include/g' $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc

	$(INSTALL) -D -m 0644 $(@D)/pkgconfig/glesv2.pc.cmake \
		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc

	sed -i 's/@CMAKE_INSTALL_LIBDIR@/lib/g' $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
	sed -i 's/@CMAKE_INSTALL_INCLUDEDIR@/include/g' $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc

	$(INSTALL) -D -m 0644 $(@D)/pkgconfig/OpenCL.pc.cmake \
		$(STAGING_DIR)/usr/lib/pkgconfig/OpenCL.pc

	sed -i 's/@CMAKE_INSTALL_LIBDIR@/lib/g' $(STAGING_DIR)/usr/lib/pkgconfig/OpenCL.pc
	sed -i 's/@CMAKE_INSTALL_INCLUDEDIR@/include/g' $(STAGING_DIR)/usr/lib/pkgconfig/OpenCL.pc

	$(INSTALL) -D -m 0644 $(@D)/pkgconfig/mali.pc.cmake \
		$(STAGING_DIR)/usr/lib/pkgconfig/mali.pc

	sed -i 's/@CMAKE_INSTALL_LIBDIR@/lib/g' $(STAGING_DIR)/usr/lib/pkgconfig/mali.pc
	sed -i 's/@CMAKE_INSTALL_INCLUDEDIR@/include/g' $(STAGING_DIR)/usr/lib/pkgconfig/mali.pc

	$(INSTALL) -D -m 644 $(@D)/lib/aarch64-linux-gnu/libmali-midgard-t86x-r14p0-fbdev.so $(STAGING_DIR)/usr/lib/
	cd $(STAGING_DIR)/usr/lib/ && ln -s libmali-midgard-t86x-r14p0-fbdev.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif

ifeq ($(BR2_PACKAGE_RK3328),y)
define LIBMALI_INSTALL_TARGET_CMDS
	rm -f $(LIBMALI_RM_SO)
	$(INSTALL) -D -m 644 $(@D)/lib/aarch64-linux-gnu/libmali-utgard-450-r7p0-r0p0-fbdev.so $(TARGET_DIR)/usr/lib/
	cd $(TARGET_DIR)/usr/lib/ && ln -s libmali-utgard-450-r7p0-r0p0-fbdev.so libmali.so && $(LIBMALI_LINK_SO) && $(LIBMALI_LINK_OPENCL_SO) && cd -
endef
endif

$(eval $(generic-package))
