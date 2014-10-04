The Cat's Eye Technologies Platform
===================================

Hey, if Haskell can have a Platform, why can't we?  It's only fair.

The Cat's Eye Technologies Platform is a [NetBSD][]-based,
[toolshelf][]-powered, [Funicular][]-built "distro" containing almost all of
[Cat's Eye Technologies][]' software distributions.

In fact, I could come up with a serious rationalization for this.  Picking
a fixed version of an operating system means that, once the versions of the
supporting software and the versions of our software have been picked, it
will all build and work consistently (and, we can only hope, correctly.)
Since it is not intended to be connected to a network, the need for upgrades
due to security, hardware support, and "new hawtness" is diminished.

Or: establishing a platform is to bitrot what canning food is to spoilage.

It also provides answers to the question "What is a minimal set of software
that'd be needed to run almost everything from Cat's Eye Technologies?"

As I said, I *could* come up with a serious rationalization for this.
But mainly, it's fun.  A certain awful flavour of fun, maybe, but still fun.

Version
-------

Each version of The Cat's Eye Technologies Platform can be thought of as a
"versionset" on a collection of software distributions, "frozen" at points
in their development where they are all mutually compatible.

The current released version of The Cat's Eye Technologies Platform is
version **0.1**.  It can be built with Funicular version 0.1 and employs
toolshelf version 0.1 revision 2014.0930 as its "packaging system".

All of the pieces of software that make up The Platform are interoperable;
that is, every piece builds successfully on NetBSD 6.1.4, and those with
test suites pass all of their relevant automated tests.  The pieces are
not, however, thoroughly tested manually.

Quick Start
-----------

Eventually, there will probably be a NetBSD disk image or ISO that you can
download with everything on it, but for now, if you want it, you'll have
to build it.  The disk image is roughly 3.6G in size, so make sure you have
some free space.

*   Install [Funicular][] 0.1 (via [toolshelf][], we would suggest, although
    this is not strictly necessary)
*   Put a copy of (or a symbolic link to) the
    [NetBSD 6.1.4](http://www.netbsd.org/releases/formal-6/NetBSD-6.1.4.html)
    install ISO for i386, called `NetBSD-6.1.4-i386.iso`, in this repo's
    root directory — since it is fairly large (314M) it is not automatically
    downloaded by Funicular, and you may wish to obtain it via a torrent or
    by some other method.
*   In this repo's directory, run
    
        funicular init 3600
        funicular install
        funicular setup
    
    and follow the instructions given to you at each step.

[NetBSD]: http://netbsd.org/
[toolshelf]: https://github.com/catseye/toolshelf/
[Funicular]: https://github.com/catseye/Funicular/
[Cat's Eye Technologies]: http://catseye.tc/

What's Included?
----------------

This section describes the software infrastructure that makes up The Platform.
As for _why_ these pieces of software were chosen, and for the meanings of the
various card suit symbols, see the "Software Selection Criteria" section below.

Note that, in case this listing is out-of-date or inaccurate, see the
`Funicularfile` in this directory and the various `*.catalog` files in the
`skel` directory for more accurate, machine-readable version numbers.

The Platform can be thought of as being constructed in stages, with each
stage building upon the previous.  The first stage (the "NetBSD Gondola" stage,
although this is something of a misnomer now) consists of:

*   NetBSD 6.1.4 (minimal install + compiler tools) ♡ + ♢
*   Lua 5.1.4 (note that this is already a part of NetBSD 6.1.4) ♡
*   cPython 2.7.6 ♦¹
*   toolshelf 0.1-2014.0924 ♡

The second stage, "Infrastructure", consists of:

*   GNU Make 3.81 ♢
*   GNU Nano 2.2.6 ♢
*   Mercurial 1.9.3 ♢
*   Perl 5.18.2 ♦²
*   Hugs98-plus Sep2006 ♡
*   Erlang/OTP R16B03-1 (stripped down, e.g. no megaco, etc.) ♦³
*   CHICKEN Scheme 4.8.0.5 ♡¹
*   yasm 1.2.0 ♡

(Nano is not strictly necessary, I just can't stand any of the text editors
that come with NetBSD.)

The third stage, "Cat's Eye Infrastructure", consists of:

*   catseye-realpath 1.0     (for Pixley and others) ♥
*   Falderal 0.9-2014.0525   (for tests) ♡
*   yucca 1.1                (for building Dungeons of Ekileugor) ♡
*   Mini-Scheme 0.85ce1      (our fork, for Pixley) ♥
*   OpenZz 1.0.4-4ce1        (our fork, for Zzrk) ♢¹
*   Ophis 2.1                (our Mercurial mirror, for building 6502 stuff) ♡

The fourth and "final" stage, the "Cat's Eye" stage, consists of the
remainder of almost all of Cat's Eye Technologies' software distributions.
See `skel/catseye.catalog` for a list of these and their version numbers.

What's Not Included?
--------------------

You may have noticed we keep saying "almost all"...

Some of Cat's Eye Technologies' projects are not currently (and some
may not ever be) well-represented in The Platform.  These fall into
two broad categories, detailed below.

Note that sources to these projects are still included as part of the
Cat's Eye Stage.  It's just that you may not be able to build them, and
you won't be able to use them even if they do build.

### Available on the Web ###

A nominal goal is to have every Cat's Eye Technologies' project available
*either* in The Platform *or* as an online installation on the `catseye.tc`
web site.  Thus, if you can already experience it by pointing your web
browser at `catseye.tc`, we won't worry too much about it not being usable
in The Platform.

*   [BefOS](http://catseye.tc/node/BefOS_(v86)).  No PC emulator installed.
    **still buildable**
*   [Bubble Escape](http://catseye.tc/node/Bubble_Escape_(JaC64)).
    No Commodore 64 emulator installed.  **still buildable**
*   [Etcha](http://catseye.tc/node/Etcha_(HTML5)).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Gemooy](http://catseye.tc/node/Gemooy_(HTML5)).  Implemented only in
    Javascript, and no Javascript implementation is installed.
*   [HTML5-Gewgaws](http://catseye.tc/node/Online_Installation#gewgaws_exhibit).
    Implemented only in Javascript, and no Javascript implementation is
    installed.  Plus, these gewgaws generally assume an HTML5 web browser.
*   [Shelta](http://catseye.tc/node/Shelta_(v86)).  No DOS emulator installed.
    **still buildable**
*   [Wunnel](http://catseye.tc/node/Wunnel_(HTML5)).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Whothm](http://catseye.tc/node/Whothm_(Applet)).  Reference implementation
    is written in Java, and no Java implementation is installed.
*   [yoob](http://catseye.tc/node/yoob_(Applet)).  Reference implementation
    is written in Java, and no Java implementation is installed.

### Of no great use to you ###

This is the list we want to minimize, either by allowing these to run in
The Platform somehow, or allowing them to run on the web, in an HTML5 browser,
somehow.  But for some of them, neither of those options make sense either.

*   Apple Befunge.  No Apple II emulator installed.
*   C64 Demo Depot.  No Commodore 64 emulator installed.  **still buildable**
*   DiskSumo.  No Commodore 64 emulator installed.  Besides, no point.
*   The Dipple.  Contains Ruby, Javascript, Icon, etc., and no implementations
    of these languages are installed.  Otoh, I'm sure many of the contents that
    are written in C, Python, etc. will build and run, but there is no
    automation for this, and no tests.  Well, it's a junk-drawer anyway.
*   Dungeons of Ekileugor.  No VIC-20 emulator / BASIC interpreter installed.
    **does not quite build, needs petcat**
*   ILLGOL.  No DOS emulator installed to run the executables produced by
    the compiler(s).  **still buildable and runnable**
*   Troupe.  Not implemented.  When it will be implemented, it will probably
    be implemented in Javascript first.
*   yoob.js.  no Javascript implementation installed.  and it's a framework,
    really, with nothing of itself per se to run.

Software Selection Criteria
---------------------------

For inclusion in The Platform, we generally prefer software that:

*   builds under NetBSD (ideally, under any supported architecture)
*   has a reasonable build system
*   has few dependencies
*   is lightweight
*   has an unrestrictive license (public domain > BSD/MIT/ISC > LGPL > GPL)
*   is hosted somewhere in DVCS (Github, Bitbucket, etc.)

The symbol following the name of the software indicates the license:

*   ♥ = Public domain
*   ♡ = BSD/MIT/ISC license
    *   ♡¹ = BSD license generally but note that some libs are non-BSD
*   ♢ = GPLv2 (nothing here is GPLv3)
    *   ♢¹ = note that the OpenZz libs are LGPL; only the driver is GPL
*   ♦ = more long-winded than BSD but not viral like GPL; specifically,
    *   ♦¹ = Python Software Foundation license
    *   ♦² = Artistic license
    *   ♦³ = Ericsson Public License (like Mozilla Public License except
        the jurisdiction is Sweden.)

Excepting NetBSD itself, all included software includes source code, from
which the executables for NetBSD are built.  I mean oh yes we could have
just plunked down some binary packages from `pkgsrc` but that'd be far too
easy, wouldn't it.  Or rather, inclusion of source and making sure you can
build from that source improves "hackability", that is, it lowers barriers
to customization to individual circumstance.  Yes.  I'm sure that's what we
were trying to say.

Some of Cat's Eye Technologies' projects were originally written in (or
otherwise depended on) some language (or other system or tool) which is not
included in The Platform.  In some of these cases, an additional implementation
in an included technology was added to the project.

*   **PL-{GOTO}.NET**.  The Mono runtime is not included — it can still
    interpret PL-{GOTO}, though, and passes the tests.
*   **Velo**.  No Ruby implementation is included.  An interpreter was
    implemented in Lua for inclusion in The Platform.

Appendix A.  How to make a bootable USB stick of The Platform
-------------------------------------------------------------

The instructions in this section have not been thoroughly tested.

First,

    funicular backup wd0-hdboot

Then

    funicular start

Then log in as root and edit `/etc/fstab`.  Change the line

    /dev/wd0a / ffs rw 1 1

to

    /dev/sd0a / ffs rw 1 1 

and run

    shutdown -p now

Then back on the host,

    dd if=wd0.img of=/dev/sdX bs=1M

where `sdX` is the name of your (unmounted) USB device (could be `sdb` or
`sdc`; check `mount` while the device is still mounted.)

Actually you can just `dd` the image you use in the emulator to the
USB drive device, but when NetBSD boots you'll have to run

    mount / /dev/sd0a

manually, which is annoying.

TODO
----

The information in this section is likely to be random and outdated.

*   If we have git repos, version git clones after docking them.  To do this
    we either need to mess with Dulwich (sigh) or build git on the guest.
    Somehow.  (also sigh.)
    
    *   Dulwich 0.9.5 ♢

*   Devtools stage.  Not docked anymore, but maybe bring it back:
    
    The second-and-a-half-th stage, "Devtools", consists of some projects
    which make using the system easier, but are not relied upon by any
    subsequent stage, and can, in fact, be docked right after the
    NetBSD Gondola stage.
    
    *   Links 2.8 ♢
    *   ymattw-cdiff 0.9.3 ♡
    *   cpressey-tree 1.0 ♥

*   Extended stages!  They may, one day, exist, but not yet.  Ideas:
    
    *   **Emulator Stage**, in which, if we can actually get it to build,
        we have QEMU, and in which The Platform gets recursive... it's
        turtles all the way down, or rather all the way up, or rather as
        far up as you can afford the disk space and electricity for...
    
    *   **Forks Stage**, in which we also dock forks of projects that
        Cat's Eye Technologies has on Github.

    *   **Stars Stage**, in which we also dock (feasible) projects from
        Github that Cat's Eye Technologies has starred.
    
    *   **Esoteric Files Archive Stage**, in which we also dock feasible
        stuff from the Esoteric Files Archive.
    
    *   and/or whatever else...
