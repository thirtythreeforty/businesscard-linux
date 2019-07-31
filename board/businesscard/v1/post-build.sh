#!/bin/sh
grep -q "GADGET_SERIAL" "${TARGET_DIR}/etc/inittab" \
	|| echo '/dev/ttyGS0::respawn:/sbin/getty -L  /dev/ttyGS0 0 vt100 # GADGET_SERIAL' >> "${TARGET_DIR}/etc/inittab"
