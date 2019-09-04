################################################################################
#
# businesscard-flashdrive
#
################################################################################

BUSINESSCARD_FLASHDRIVE_SITE = $(BUSINESSCARD_FLASHDRIVE_PKGDIR)files
BUSINESSCARD_FLASHDRIVE_SITE_METHOD = local
BUSINESSCARD_FLASHDRIVE_LICENSE = Proprietary
BUSINESSCARD_FLASHDRIVE_DEPENDENCIES = host-genimage host-dosfstools host-mtools
BUSINESSCARD_INSTALL_IMAGES = YES
BUSINESSCARD_INSTALL_TARGET = NO

define BUSINESSCARD_FLASHDRIVE_BUILD_CMDS
	rm -rf "$(@D)/tmp"
	mkdir -p $(@D)/dummyroot
	$(HOST_DIR)/bin/genimage \
		--config $(@D)/genimage.cfg \
		--inputpath $(@D) \
		--outputpath $(@D) \
		--tmppath $(@D)/tmp \
		--rootpath $(@D)/dummyroot \
		--mcopy $(HOST_DIR)/bin/mcopy \
		--mkdosfs $(HOST_DIR)/sbin/mkdosfs

endef

define BUSINESSCARD_FLASHDRIVE_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)
	cp $(@D)/flashdrive.img $(BINARIES_DIR)/flashdrive.img
endef

$(eval $(generic-package))
