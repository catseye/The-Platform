How to Build The Platform
=========================

Building
--------

If you are on a Unix-like operating system, you can build your own disk
image with the following steps.  It is roughly 3.6G in size, so make sure
you have some free space.

*   Install [Funicular][] 0.5 (via [shelf][], we would suggest,
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

[shelf]: https://github.com/catseye/shelf/
[Funicular]: https://github.com/catseye/Funicular/
