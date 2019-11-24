# Business Card Linux

This is the Linux distribution small enough to run from the 8MB of storage on my Linux-powered business card.
It is powered by the Allwinner F1C100s, a $1.40 Linux-capable ARM system-on-chip.
This repository is the source code for its firmware image, based on Buildroot 2019.05.
This directory is a "Buildroot external," providing a few patches, additional packages, and board support files on top of mainline Buildroot.

For a complete write-up, see my [blog post][blog-post] about the project.

![business card top](doc/images/businesscard-top.jpg)

## Patched Linux and U-Boot

I lightly patched the Linux kernel and U-Boot to get all the hardware peripherals working.
You can find my forks here:

- [Linux][linux-f1c100s] v5.0.2 (patched to enable USB gadget mode)
- [U-Boot][uboot-f1c100s] (patched to support the F1C100s)

## Build

Make sure submodules are initialized:

	git submodule update --init

Change to the top-level Buildroot directory:

	cd buildroot

Initialize the configuration, including the defconfig and this external directory:

	make BR2_EXTERNAL=$PWD/../ thirtythreeforty_businesscard_defconfig

And compile:

	make

This may take a couple hours to do from scratch, depending on the speed of your machine.

## Installation

If you have a [Lichee Pi Nano][lichee-nano] with a flash chip, or one of my blank business cards, you can flash it with the following command.
Make sure the board is in FEL mode using `dmesg` or similar.

	output/host/bin/sunxi-fel -p spiflash-write 0 output/images/flash.bin

You can erase the card after it boots by simply logging in (as `root`) and erasing the flash manually:

	dd if=/dev/zero of=/dev/mtd0

Don't erase it unless you're prepared to burn a new image!

[blog-post]: https://www.thirtythreeforty.net/posts/2019/12/my-business-card-runs-linux/
[linux-f1c100s]: https://github.com/thirtythreeforty/linux.git
[uboot-f1c100s]: https://github.com/thirtythreeforty/u-boot.git
[lichee-nano]: https://www.seeedstudio.com/Sipeed-Lichee-Nano-Linux-Development-Board-16M-Flash-WiFi-Version-p-2893.html
