How to Build The Platform
=========================

Building
--------

If you are on a Unix-like operating system, you can build your own disk
image with the following steps.  It is roughly 3.6G in size, so make sure
you have some free space.

*   Install [Funicular][] 0.6 (via [shelf][], we would suggest,
    although this is not strictly necessary)
*   Put a copy of (or a symbolic link to) the
    [NetBSD 6.1.5](http://www.netbsd.org/releases/formal-6/NetBSD-6.1.5.html)
    install ISO for i386, called `NetBSD-6.1.5-i386.iso`, in this repo's
    root directory.  Since it is fairly large (~314M) it is not automatically
    downloaded by Funicular, and you may wish to obtain it via a torrent or
    by some other method.
*   In this repo's directory, run
    
        IMAGE_SIZE=3600 funicular init system
        funicular install
        funicular init setup
        funicular setup
    
    and follow the instructions given to you at each step.

### Handy tips

`funicular setup` will run QEMU, in particular the `qemu-system-i386`
executable.  To pass additional flags to this executable, put them in
the `QEMU_SYSTEM_I386_FLAGS` env var.  For instance, to have QEMU
display NetBSD console in your host system's terminal, you can

    export QEMU_SYSTEM_I386_FLAGS="-display curses"

[shelf]: https://codeberg.org/catseye/shelf/
[Funicular]: https://codeberg.org/catseye/Funicular/

Notes for making the distribution
---------------------------------

*   Build the image per the instructions in the Funicularfile.
*   Create a directory on a FAT32 or NTFS partition called
    `The-Cats-Eye-Technologies-Platform-0.x`.  We'll call this the
    distribution directory.
*   Copy the `wd0.img` to `The-Cats-Eye-Technologies-Platform-0.x.img`
    in the distribution directory.
*   Run `pandoc --from=markdown --to=html5 <USAGE.md >USAGE.html`.
*   Copy `USAGE.html` to the distribution directory too.
*   Use **7-Zip** to compress the image to
    `The-Cats-Eye-Technologies-Platform-0.x.img.7z` at the highest
    level of compression.
*   Upload both files as per need.
