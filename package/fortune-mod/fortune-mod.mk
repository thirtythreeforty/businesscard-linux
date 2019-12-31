################################################################################
#
# fortune-mod
#
################################################################################

FORTUNE_MOD_VERSION = 2.10.0
FORTUNE_MOD_SITE = https://github.com/shlomif/fortune-mod/archive
FORTUNE_MOD_LICENSE = GPL-2.0
FORTUNE_MOD_LICENSE_FILES = COPYING
FORTUNE_MOD_DEPENDENCIES = host-fortune-mod librecode
HOST_FORTUNE_MOD_DEPENDENCIES = host-librecode
FORTUNE_MOD_SUBDIR = fortune-mod
FORTUNE_MOD_SUPPORTS_IN_SOURCE_BUILD = NO

# This is a hack... fortune's build is mostly sane, but unfortunately it builds
# a helper tool, strfile, during build.  CMake cannot cope with two toolchains.
# So, we build once for the host (it will install a bunch of fortunes into the
# host sysroot, but no matter).  Then, to build the target, we patch the CMake
# very slightly to allow us to specify STRFILE_PATH, and give it the strfile we
# built earlier.

FORTUNE_MOD_CONF_OPTS += \
	-DLOCALDIR=/usr/share/fortune/ \
	-DCOOKIEDIR=/usr/share/fortune/ \
	-DSTRFILE_PATH=$(HOST_DIR)/bin/strfile \

ifneq ($(BR2_PACKAGE_FORTUNE_MOD_COOKIES),)
	# Do not double quote; Kconfig does that for us
	FORTUNE_MOD_CONF_OPTS += -DCOOKIES=$(BR2_PACKAGE_FORTUNE_MOD_COOKIES)
endif

ifeq ($(BR2_PACKAGE_FORTUNE_MOD_OFFENSIVE),y)
	FORTUNE_MOD_CONF_OPTS += \
		-DLOCALODIR=/usr/share/fortune/off/ \
		-DOCOOKIEDIR=/usr/share/fortune/off/ \

ifneq ($(BR2_PACKAGE_FORTUNE_MOD_OCOOKIES),)
	# Do not double quote; Kconfig does that for us
	FORTUNE_MOD_CONF_OPTS += -DOFFENSIVE_COOKIES=$(BR2_PACKAGE_FORTUNE_MOD_OCOOKIES)
endif

else
	FORTUNE_MOD_CONF_OPTS += -DNO_OFFENSIVE=ON
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
