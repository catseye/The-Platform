About The Cat's Eye Technologies Platform
=========================================

The Cat's Eye Technologies Platform (version 0.5) is a bootable [NetBSD][]-based
disk image containing almost all of [Cat's Eye Technologies][]' software
distributions, pre-built and tested, along with the open-source infrastructure
needed to run them.

For more information, and more up-to-date information, on The Platform, see

*   [https://codeberg.org/catseye/The-Platform][]

Like virtually all software, The Cat's Eye Technologies Platform is provided
"AS IS" and without warranty of any kind, express or implied.  For more
information, see the section _License Information_ at the bottom of this
document.

Using The Platform
==================

The Platform is distributed as a disk image.  There are two general ways to use
this disk image: either

*   run a PC emulator such as QEMU and make it boot from this image
    (**recommended**); or
*   write it to a real disk drive (or USB stick) and boot from that device
    (**not** recommended, but possible).

It is not possible to burn this sort of disk image onto a CD-ROM or DVD-ROM.

When running, The Platform does *not* have access to your hard drive (outside
of its own disk image) and does *not* have access to your network.  This
is intentional; it means that you can muck around however you like inside The
Platform and it should not affect (or be affected by) anything outside it.

In other words, running The Platform under a PC emulator is at least as safe
as running anything else under that emulator.

Writing The Platform disk image to a USB stick is less safe, in a couple of
ways:

*   It's easier to make a mistake while writing the image, and accidentally
    overwrite something you care about (such as your computer's operating
    system.)
*   Once you've booted into The Plaform from this disk, it *does* have
    access to your whole computer.  It's not configured to *use* your disk
    and network, but it can be re-configured to do so with a little knowledge
    and not much effort, and it is possible to make very low-level and
    wide-reaching changes to your system this way.

Therefore, be careful!  Make backups.  Or use an old computer you don't care
much about.  Or use an emulator -- one with a good reputation, such as QEMU.

...on Windows
-------------

### How to extract the disk image ###

The disk image is compressed using 7-zip.  You can download 7-zip here:

*   [https://7-zip.org/][]

Note that while the compressed archive is "only" ~280 megabytes, the
uncompressed disk image is 3.6 **giga**bytes.  So, make sure you have
sufficient free disk space before extracting it.

### How to boot the image in the QEMU PC emulator ###

First, make sure the disk image of The Platform is on your desktop, and make
sure it is named `The-Cats-Eye-Technologies-Platform-0.5.img`.  (This is not a
strict requirement, but the instructions below assume that this is the case.)

**QEMU** is a versatile PC emulator, originally written by Fabrice Bellard,
and now maintained by a large number of developers.  It was originally written
for Unix-like operating systems, but it is possible to build it on Windows,
and several people have done so, so you have several options for which
distribution to use (as a web search for "qemu for windows" will reveal.)

The easiest to use that I've found, as of this writing, are the builds of
QEMU for Windows by Stefan Weil.  These are available from 
[https://qemu.weilnetz.de/][], and also from the QEMU Download page,
[https://www.qemu.org/download/][].  Note that there is a
disclaimer on that page that this is experimental software, and you use it
at your own risk.  However, I've found it to be reliable and, if there are
bugs in this version of QEMU, they're IMO far more likely to affect the
emulated system "inside" the emulator, rather than your Windows installation
"outside" the emulator.  (Still, always a good idea to keep backups, right?)

If you are running 64-bit Windows (and you probably are if your computer is
relatively modern), you can find the most recent QEMU for 64-bit Windows
installer in this folder -- it'll be the one that starts with `qemu-64-setup`
and ends in `.exe`:

*   [https://qemu.weilnetz.de/w64/][]

Download it and run it.  Say "OK" to what it wants you to install.

(If you don't have a 64-bit Windows, you'll need a 32-bit version, which
you can also find on that website.)

After it's installed, run a Command Prompt (you might need to hunt under
the Start Menu for this.)

In the Command Prompt, type

    "C:\Program Files\qemu\qemu-system-i386" Desktop\The-Cats-Eye-Technologies-Platform-0.5.img

...all on one line, and don't forget the double quotes.

You should see NetBSD boot up in the QEMU window.  Now see
_Logging in and using The Platform_, below.

### Using other PC emulators ###

You are of course free to try booting The Platform under a PC emulator that
isn't QEMU.  However, I haven't had a lot of luck with other emulators.
The last time I tried:

*   **Bochs**, it boots NetBSD just fine, but has major problems sending
    keystrokes to it; it sends far far far too many.  Making it unusable.
*   **VirtualBox**, it couldn't boot NetBSD.  (Apparently, "Of *course* it runs
    NetBSD" [does not apply to emulators](http://gnats.netbsd.org/44694).)

Granted, these attempts were a long time ago, and I haven't tried these
again since then.  And there are probably a number of other options now
as well.  Good luck and have fun.

### How to make a bootable USB stick of The Platform ###

First, get a USB stick that you don't need for anything else, that is at
least 4G in size.  (The written image will be only about 3.6G, so any drive
larger than 4G will just have wasted space on it.)

Download Win32 Disk Imager from here:

*   [https://sourceforge.net/projects/win32diskimager/][]

Run the installer.  Install it as usual and run it.

Click the folder icon and select `The-Cats-Eye-Technologies-Platform-0.5.img`
from your file system.

Select your USB stick's drive letter in the "Device" dropdown.  (If unsure,
start Windows Explorer and look at what "Devices and drives" says.  Generally
this will be maybe `[E:\]` or `[F:\]`; it will almost certainly **NOT** be
`[C:\]` or `[D:\]`!)

When you're sure you've got the drive letter right, click "Write".  And wait.

For using the USB stick after you've written it, see
_Booting from a created USB stick_ below.

...on Ubuntu
------------

These instructions should be fairly easy to adapt to other Linux distributions,
and even the *BSD operating systems; the main things that will differ will be
how to install the packages (and what their names are) and the names of device
nodes.

To extract the disk image, use `p7zip`:

    sudo apt-get install p7zip
    p7zip -d The-Cats-Eye-Technologies-Platform-0.5.img.7z

To boot the disk image under the QEMU emulator,

    sudo apt-get install qemu
    qemu-system-i386 The-Cats-Eye-Technologies-Platform-0.5.img

You should see NetBSD boot up in the QEMU window.  Now see
_Logging in and using The Platform_, below.

To write the disk image to a USB stick,

    dd if=The-Cats-Eye-Technologies-Platform-0.5.img of=/dev/sdX bs=1M

where `sdX` is the name of your (unmounted) USB device (could be `sdb` or
`sdc`; check `mount` while the device is still mounted.)

For using the USB stick after you've written it, see
_Booting from a created USB stick_ below.

Booting from a created USB stick
--------------------------------

Shut down your computer.  Plug the USB stick into a USB port.  Turn on your
computer.

If your computer displays `NetBSD/x86 BIOS Boot` and a numbered menu with
five items, congratulations, it booted into The Cat's Eye Technologies Platform.

If it didn't, restart your computer and go into its BIOS configuration
(how you do this differs from computer to computer, but it's usually a
matter of hitting a key -- maybe F1, maybe Escape, maybe something else --
right after it boots up.)

Here are some things to check:

*   Make sure the USB drive is listed in the boot devices, and make
    sure it's at the top of the list (i.e. that it boots before the
    hard drive.)
*   On systems with EFI, you might have to enable "Legacy Booting".
*   Similarly, you might have to disable "Secure Boot".

You might also have a key you can hold down during boot to get a "boot menu"
which lets you select the device to boot from (for me, it's F9.)

But systems vary so much at this level that I don't know how much more I can
say on the topic of coaxing your computer to boot from a USB stick.  Search
the web for more information, and especially for information specifically for
your model of computer.

...

When NetBSD does boot, for the first time, you'll get an error message like

    ERROR: ABORTING BOOT (sending SIGTERM to parent)!
    Enter pathname of shell or RETURN for /bin/sh:

At this point, just hit Enter.

Then type the following:

    mount /dev/sd0a /

(note that there is a space between the `a` and the last `/`.)  And then

    /home/user/.local/bin/ee /etc/fstab

(again, note there is a space between `ee` and the `/` following it.)

This will start a text editor, and let you edit the mount points of devices.
Now cursor down to the third line and change `wd0a` to `sd0a`.  (See footnote.)

Then cursor down to the last line (the `cd0a` one) and delete it (Ctrl+y).

Then Escape Enter Enter to save the file and leave the editor.

Then type

    reboot

and this time, when the system boots into NetBSD, it will not give you
this error and it will let you log into it normally.

Footnote: NetBSD reads this `fstab` file when it boots up to see what disks it
should try to mount.  The disk image is normally treated as a hard drive image,
so `fstab` contains a record telling it to try to mount the first hard disk
(`wd0a`.)  All we are doing here is telling it to try to mount the first USB
drive (`sd0a`) instead.

Logging in and using The Platform
---------------------------------

Once it has booted, log in as `user`.  There is no password.  You will get a
so-called "shell" prompt, which looks like `$`, at which you can type commands.

Note that any changes you make inside The Platform -- for example,
files you change, or new files you write -- will be saved to the disk image
file.  If you keep the `.7z` archive file you can always extract a fresh
copy of the disk image file from that, if you want to start over.

To shut down The Platform, type

    su

(and the prompt will change to a `#` to indicate that you now have awesome
Super User powers), then type

    shutdown -p now

You can also just close the emulator, or power off the computer, but these
actions risk corrupting the disk image.

While logged in, most of Cat's Eye Technologies' programming language
interpreters and compilers can be started just by typing their name
(in Unix-speak, these executables are on the search path.)  For example,

    bef ~/catseye/befunge-93/eg/robot.bf

(Type `n`, `s`, `e`, or `w` to walk around the maze.  Run into a wall
to end the game and return to the shell.)  Or, run

    maentw

to start the Maentwrog interpreter.  (Type `bye` to exit.)

You can also use `shelf` to navigate to the language project directories,
and run tests.  So, for example,

    shelf_cd befunge-93

There is also a `shelf` command to run all the tests for all the projects:

    shelf_test catseye/*

License Information
-------------------

The Cat's Eye Technologies Platform is based on NetBSD, and the NetBSD
licensing terms are essentially as follows -- although do note that this is an
approximation.  For more precise information, please see NetBSD's page on
[NetBSD Licensing and Redistribution][].

    Copyright (c) The NetBSD Foundation, Inc and contributors.
    All rights reserved.
        
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions
    are met:
    1. Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
    
    THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
    ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
    BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
    CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
    SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
    INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
    ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.

On top of NetBSD are various pieces of software with various licensing terms
(all of which allow for redistribution, but not necessarily commercial
redistribution.)  The source code, and the license documentation, for each of
these pieces of software is included in The Platform disk image.  For details,
please consult the documentation of the specific software package in question.

- - - -

[Cat's Eye Technologies]: https://catseye.tc/
[https://codeberg.org/catseye/The-Platform]: https://codeberg.org/catseye/The-Platform
[https://7-zip.org/]: https://7-zip.org/
[https://www.qemu.org/download/]: https://www.qemu.org/download/
[https://qemu.weilnetz.de/]: https://qemu.weilnetz.de/
[https://qemu.weilnetz.de/w64/]: https://qemu.weilnetz.de/w64/
[https://sourceforge.net/projects/win32diskimager/]: https://sourceforge.net/projects/win32diskimager/
[NetBSD]: https://netbsd.org/
[NetBSD Licensing and Redistribution]: https://www.netbsd.org/about/redistribution.html
