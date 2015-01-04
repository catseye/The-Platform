Using The Cat's Eye Technologies Platform
=========================================

The Cat's Eye Technologies Platform (version 0.2) is a bootable NetBSD-based
disk image containing almost all of [Cat's Eye Technologies](http://catseye.tc/)'
software distributions, pre-built and tested, and the infrastructure needed to
run them.

For more information, and more up-to-date information, on The Platform, see

*   [https://github.com/catseye/The-Platform](https://github.com/catseye/The-Platform)

...on Windows
-------------

### How to boot the image in the QEMU PC emulator ###

Make sure the disk image of The Platform is on your desktop, and make sure
it is named `The-Cats-Eye-Technologies-Platform-0.2.img`.  (This is not a
strict requirement, but the instructions below assume that this is the case.)

Download the QEMU for 64-bit Windows installer here (~20M):

    http://qemu.weilnetz.de/w64/qemu-w64-setup-20141210.exe

And run it.  Say "OK" to what it wants you to install.

(If you don't have a 64-bit Windows, you'll need a 32-bit version, which
you can also find on that website.)

After it's installed, run a Command Prompt (you might need to hunt under
the Start Menu for this.)

In the Command Prompt, type

    "C:\Program Files\qemu\qemu-system-i386" Desktop\The-Cats-Eye-Technologies-Platform-0.2.img

...all on one line, and don't forget the double quotes.

### How to boot the image in the Bochs PC emulator ###

**Note**: Bochs has problems sending keystrokes to NetBSD, so using it
isn't really recommended.  But if you really want to try, here's what to do.

Start Bochs.  Select "Disk & Boot" in the list.  Click "Edit".
Click the "ATA channel 0" tab.  Then click the "First HD/CD on channel 0"
tab underneath it.

For "Type of ATA device", select "disk".  Click "Browse..." beside the
"Path or physical device name" field.  Select the `.img` file.

Assuming the disk image was created with `funicular init 3600` (if you don't
know, you can assume that it was), fill out the fields below as follows:

*   Cylinders: 7314
*   Heads: 16
*   Sectors per track: 63

Then click the "Boot Options" tab on the far upper right.
For "Boot drive #1", select "disk".

Click "OK".  Click "Save" and save this somewhere so you can just
load it again.

Then click "Start".

### How to make a bootable USB stick of The Platform ###

First, get a USB stick that you don't need for anything else, that is at
least 4G in size.  (The written image will be only about 3.6G, so any drive
larger than 4G will just have wasted space on it.)

Download Win32 Disk Imager from here:

    http://sourceforge.net/projects/win32diskimager/

Run the installer.  Install it as usual and run it.

Click the folder icon and select `The-Cats-Eye-Technologies-Platform-0.2.img`
from your file system.

Select your USB stick's drive letter in the "Device" dropdown.  (If unsure,
start a file explorer and look at what "Devices and drives" says.  Generally
this will be maybe `[E:\]` or `[F:\]`; it will almost certainly **NOT** be
`[C:\]` or `[D:\]`!)

When you're sure you've got the drive letter right, click "Write".  And wait.

For using the USB stick after you've written it, see below.

...on Ubuntu (Linux)
--------------------

To boot the disk image under the QEMU emulator,

    sudo apt-get install qemu
    qemu-system-i386 The-Cats-Eye-Technologies-Platform-0.2.img

To write the disk image to a USB stick,

    dd if=The-Cats-Eye-Technologies-Platform-0.2.img of=/dev/sdX bs=1M

where `sdX` is the name of your (unmounted) USB device (could be `sdb` or
`sdc`; check `mount` while the device is still mounted.)

Using the USB stick after you've written it
-------------------------------------------

**Note**: The instructions in this section have not been thoroughly tested.

Turn off your computer.  Plug the USB stick into a USB port.  Turn on your
computer.

If your computer displays `NetBSD/x86 BIOS Boot` and a numbered menu with
five items, congratulations, it booted into The Cat's Eye Technologies Platform.

If it didn't, restart your computer and go into its BIOS configuration
(how you do this differs from computer to computer, but it's usually a
matter of hitting a key (maybe F1, maybe Escape, maybe something else)
right after it boots up.

Here are some things to check:

*   Make sure the USB drive is listed in the boot devices, and make
    sure it's at the top of the list (i.e. that it boots before the
    hard drive.)
*   On systems with EFI, you might have to enable "Legacy Booting".
*   Similarly, you might have to disable "Secure Boot".

...

When NetBSD does boot, for the first time, you'll get an error message like

    ERROR: ABORTING BOOT (sending SIGTERM to parent)!
    Enter pathname of shell or RETURN for /bin/sh:

At this point, just hit Enter.

Then type the following:

    mount /dev/sd0a /

And then

    /home/user/toolshelf/bitbucket.org/catseye/ee/ee /etc/fstab

Now cursor down to the third line and change `wd0a` to `sd0a`.

Then cursor down to the last line (the `cd0a` one) and delete it (Ctrl+y).

Then Escape Enter Enter to save the file and leave the editor.

Then type

    reboot

and this time, when the system boots into NetBSD, it will not give you
this error and it will let you log into it normally, as `user`.
