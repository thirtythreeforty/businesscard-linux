################################################################################
#
# rogue
#
################################################################################

ROGUE_VERSION = 5.4.4
ROGUE_SITE = https://github.com/phs/rogue/archive
ROGUE_SOURCE = v$(ROGUE_VERSION).tar.gz
ROGUE_LICENSE = Custom
ROGUE_LICENSE_FILES = LICENSE.TXT
ROGUE_DEPENDENCIES = ncurses

ROGUE_CONF_OPTS = \
	--enable-scorefile=/root/.rogue.scr \
	--enable-lockfile=/tmp/rogue.lck \

$(eval $(autotools-package))
