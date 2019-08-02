################################################################################
#
# robotfindskitten
#
################################################################################

ROBOTFINDSKITTEN_VERSION = 2.7182818.701
ROBOTFINDSKITTEN_SITE = http://robotfindskitten.org/download/POSIX
ROBOTFINDSKITTEN_LICENSE = GPL-2.0
ROBOTFINDSKITTEN_LICENSE_FILES = COPYING
ROBOTFINDSKITTEN_DEPENDENCIES = ncurses

define ROBOTFINDSKITTEN_INSTALL_NKI
	$(INSTALL) -Dm644 "$(@D)/nki/vanilla.nki" "$(TARGET_DIR)/usr/share/games/robotfindskitten/vanilla.nki"
endef
ROBOTFINDSKITTEN_POST_INSTALL_TARGET_HOOKS += ROBOTFINDSKITTEN_INSTALL_NKI

$(eval $(autotools-package))
