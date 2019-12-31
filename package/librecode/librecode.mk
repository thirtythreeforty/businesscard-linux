################################################################################
#
# librecode
#
################################################################################

LIBRECODE_VERSION = 3.7.1
LIBRECODE_SITE = https://github.com/rrthomas/recode/releases/download/v$(LIBRECODE_VERSION)
LIBRECODE_SOURCE = recode-$(LIBRECODE_VERSION).tar.gz
LIBRECODE_LICENSE = LGPL-3.0
LIBRECODE_LICENSE_FILES = COPYING
LIBRECODE_INSTALL_STAGING = YES
LIBRECODE_DEPENDENCIES = libiconv

$(eval $(autotools-package))
$(eval $(host-autotools-package))
