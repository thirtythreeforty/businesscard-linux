################################################################################
#
# 2048
#
################################################################################

2048_VERSION = 72725bab07d7686e5e5b3f68e398f43ffb6f49ce
2048_SITE = $(call github,mevdschee,2048.c,$(2048_VERSION))
2048_LICENSE = MIT
2048_LICENSE_FILES = LICENSE
2048_DEPENDENCIES = ncurses

define 2048_BUILD_CMDS
	$(TARGET_CC) -o $(@D)/2048 $(@D)/2048.c
endef

define 2048_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/2048 $(TARGET_DIR)/usr/bin/2048
endef

$(eval $(generic-package))
