ABOUT ME

I am an embedded systems engineer.  My specialty is designing software and
hardware for small microcontrollers and especially small Linux devices like this
business card.  I do this both professionally and as a hobby.  I am also fluent
in several computer languages, and comfortable working on any level of the
stack, from low-level drivers to cleanly-designed backend servers to smooth,
fluid Android apps.

I'm also a decent amateur photographer, vehicle mechanic, and cook.

If you'd like to work with me on business or a cool project, please don't
hesitate to reach out.  (You have my card!)

ABOUT THIS CARD

This is a small Linux computer running a custom-built Linux distribution.  It
has a $1.40 system-on-a-chip with 32MB RAM and 8MB storage; everything runs in
this very constrained environment.  It is configured to appear as a "USB
gadget" -- a complete Linux device playing the role of a peripheral.

In this case, the card emulates a very small flash drive.  This readme is on
the flash drive alongside my resume and some of my photography (unfortunately
not many photos will fit in the remaining space, but it is enough for a sample).

The card also emulates a serial port.  You can use this to log into the card's
Linux shell and run programs -- it is a complete computer.  On Windows, you can
use PuTTY or similar to connect to the COM port (you may need to open Device
Manager to discover which COM port number it has been assigned).  On Linux, you
can use screen.  Try this example command:

    sudo screen /dev/ttyUSB0

You should get a "Welcome" message and a login prompt once you connect (if not,
press Enter a few times).  The username is "root" and there is no password.

The card's functionality is limited by the "business card" form factor, so I
have mainly provided some amusements, as follows.  Type any of the commands to
start them:

    micropython  - a complete implementation of Python 3.4
    rogue        - the original dungeon-crawling game (type Ctrl-C to quit)
    fortune      - random, hopefully interesting, quips from a bunch of sources
    2048         - the simple puzzle game

The usual POSIX utilities such as vi and grep are present too.  And finally,
there is a very small writable partition that will allow you to save your
progress in rogue, or write small Python programs.

This operating system is based on the Buildroot distribution, which I ported to
the hardware which I designed.  All the parts for the card cost me about $3.
You can get the source code at github.com/thirtythreeforty/businesscard-linux.

Enjoy!
-- George Hilliard
