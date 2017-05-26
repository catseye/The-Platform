How to Build The Platform
=========================

Building
--------

If you are on a Unix-like operating system, you can build your own disk
image with the following steps.  It is roughly 3.6G in size, so make sure
you have some free space.

*   Install [Funicular][] 0.4 (via [shelf][], we would suggest,
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

Notes for making the Torrent
----------------------------

*   Build the image per the instructions in the Funicularfile.
*   Run `script`.
*   Run `/cdrom/test-shelf.sh`.
*   `exit` and review the `typescript` for errors.
*   If no errors, delete the `typescript` and exit the emulator.
*   Create a directory on a FAT32 or NTFS partition called
    `The-Cats-Eye-Technologies-Platform-0.x`.  We'll call this the
    torrent directory.
*   Copy the `wd0.img` to `The-Cats-Eye-Technologies-Platform-0.x.img`
    in the torrent directory.
*   Run `pandoc --from=markdown --to=html5 <USAGE.md >USAGE.html`.
*   Copy `USAGE.html` to the torrent directory too.
*   Reboot into Windows.
*   Use **7-Zip** to compress the image to
    `The-Cats-Eye-Technologies-Platform-0.x.img.7z` at the highest
    level of compression.
*   Copy the torrent directory into the `webseeds` directory of the
    static website data.
*   rsync the static website data to the live website.
*   Run **μTorrent**.  Select "Create new torrent".
*   Select "Add directory" and select the torrent directory.
*   In the "Webseeds" text box, enter `http://static.catseye.tc/webseeds/`
    (note: there have been issues with webseeds not being 100%
    downloaded; I'm not sure if the cause is the torrent software,
    or the web server configuration, or something else.)
*   In the "Related website" text box, enter `http://catseye.tc/`
*   Click "Create torrent".
