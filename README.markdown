The Cat's Eye Technologies Platform
===================================

Hey, if Haskell can have a Platform, why can't we?  It's only fair.

This is version 0.4 of _The Cat's Eye Technologies Platform_, a
[NetBSD][]-based, [shelf][]-powered, [Funicular][]-built "distro"
containing almost all of [Cat's Eye Technologies][]' software
distributions.  It is an anthology of our work in a "stand-alone"
format, a bootable disk image.

Version 0.4 is currently under development; no binary distribution
is available yet.

The current released version of The Cat's Eye Technologies Platform is
version **0.3**.  It can be built with Funicular version 0.3 and
employs toolshelf version 0.1-2016.0315 as its "packaging system".
Its source code can be found at the tag `0.3` in the repository, for
example [on Github here](https://github.com/catseye/The-Platform/tree/0.3).

Background
----------

Each version of The Cat's Eye Technologies Platform can be thought of as a
"versionset" on a collection of software distributions, "frozen" at points
in their development where they are all mutually compatible.

Picking a fixed version of an operating system means that, once the
versions of the supporting software and the versions of our software
have been picked, it will all build and work consistently (and, we
can only hope, correctly.)

Since it is not intended to be connected to a network, the need for upgrades
due to security, hardware support, and "new hawtness" is diminished.
Establishing a platform in this way is to bitrot what canning food is to
spoilage.  It also answers the question "What is a minimal set of software
that'd be needed to run almost everything from Cat's Eye Technologies?"

All of the pieces of software that make up The Platform are interoperable;
that is, every piece builds successfully on NetBSD 6.1.5, and those with
test suites pass all of their relevant automated tests.  The pieces are
not, however, thoroughly tested manually.

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

[NetBSD]: http://netbsd.org/
[shelf]: https://github.com/catseye/shelf/
[Funicular]: https://github.com/catseye/Funicular/
[Cat's Eye Technologies]: http://catseye.tc/

*things below this line need review*

What's Included?
----------------

This section describes the software infrastructure that makes up The Platform.
As for _why_ these pieces of software were chosen, and for the meanings of the
various card suit symbols, see the "Software Selection Criteria" section below.

Note that, in case this listing is out-of-date or inaccurate, see the
`Funicularfile` in this directory and the various `*.catalog` files in the
`skel` directory for more accurate, machine-readable version numbers.

The Platform can be thought of as being constructed in stages, with each
stage building upon the previous.  The first stage consists of:

*   NetBSD 6.1.5 (minimal install + compiler tools) ♡ + ♢
*   Lua 5.1.4 (note that this is already a part of NetBSD 6.1.5) ♡
*   toolshelf 0.1-2016.0315 ♡

The second stage, "Infrastructure", consists of:

*   GNU Make 3.82 ♢
*   cPython 2.7.8 ♦¹
*   Perl 5.20.1 ♦²
*   Hugs98-plus Sep2006 ♡
*   Erlang/OTP R16B03-1 (stripped down, e.g. no megaco, etc.) ♦³
*   CHICKEN Scheme 4.9.0.1 ♡¹
*   yasm 1.3.0 ♡
*   Ophis 2.1 ♡

The third stage, "Cat's Eye Infrastructure", consists of:

*   catseye-realpath 1.0     (for Pixley and others) ♥
*   Falderal 0.10            (for tests) ♡
*   yucca 1.1                (for building Dungeons of Ekileugor) ♡
*   hatoucan 0.1             (for tokenizing Commodore BASIC 2.0 sources) ♥

The third-and-a-half-th stage, "Cat's Eye Forked Infrastructure", consists of
others' projects of which Cat's Eye Technologies maintains forks (or just
mirrors in Mercurial to make things easier.)

*   Mini-Scheme 0.85ce1      (for Pixley) ♥
*   OpenZz 1.0.4-4ce1        (for Zzrk) ♢¹
*   ee 1.5.2ce1              (for text editing) ♡

(ee is not strictly necessary, I just can't stand any of the text editors
that come with NetBSD.)

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

*   [BefOS](http://catseye.tc/installation/BefOS).  No PC emulator installed.
    **still buildable**
*   [Bubble Escape](http://catseye.tc/installation/Bubble Escape).
    No Commodore 64 emulator installed.  **still buildable**
*   [Canvas Feedback](http://catseye.tc/installation/Canvas Feedback)
*   [Etcha](http://catseye.tc/installation/Etcha).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Gemooy](http://catseye.tc/installation/Gemooy).  Implemented only in
    Javascript, and no Javascript implementation is installed.
*   [HTML5-Gewgaws](http://catseye.tc/node/Gewgaw).
    Implemented only in Javascript, and no Javascript implementation is
    installed.  Plus, these gewgaws generally assume an HTML5 web browser.
*   [Matchbox](http://catseye.tc/installation/Matchbox)
*   [Lexeduct](http://catseye.tc/installation/Lexeduct)
*   [Shelta](http://catseye.tc/installation/Shelta).  No DOS emulator installed.
    **still buildable**
*   [The New Gamerly Realism](http://catseye.tc/installation/The New Gamerly Realism)
*   [Wang Tilers](http://catseye.tc/installation/Wang Tilers)
*   [Wunnel](http://catseye.tc/installation/Wunnel).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Whothm](http://catseye.tc/installation/Whothm).  Reference implementation
    is written in Java, and no Java implementation is installed.
*   [yoob](http://catseye.tc/installation/yoob).  Reference implementation
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
    **still buildable**
*   NaNoGenLab.  The pure Python (and Haskell) programs should work, but many
    of the experiments have dependencies (like `py-editdist`) which are not
    installed.
*   ILLGOL.  No DOS emulator installed to run the executables produced by
    the compiler(s).  **still buildable and runnable**
*   SITU-SOL.  No Commodore 64 emulator installed.  **still buildable**
*   The Platform.  While there is a version of The Platform (that is,
    the Funicularfile and scripts in this repository...) included *inside*
    The Platform, it lags behind the current version of The Platform by
    one revision (because doing otherwise would be quite tricky.)
*   Troupe.  Not implemented.  When it will be implemented, it will probably
    be implemented in Javascript first.
*   yoob.js.  No Javascript implementation installed.  and it's a framework,
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
to customization for individual circumstances.  Yes.  I'm sure that's what
we were trying to say.

Some of Cat's Eye Technologies' projects were originally written in (or
otherwise depended on) some language (or other system or tool) which is not
included in The Platform.  In some of these cases, an additional implementation
in an included technology was added to the project.

*   **PL-{GOTO}.NET**.  The Mono runtime is not included — it can still
    interpret PL-{GOTO}, though, and passes the tests.
*   **Velo**.  No implementation of Ruby is included.  An interpreter was
    implemented in Lua for inclusion in The Platform.

History
-------

This section highlights major changes from release to release.

*   **0.4** (in progress)
    
    *   Now based on shelf instead of toolshelf.  shelf is written in
        pure Bourne shell, so Python no longer needs to be built before
        sources can be docked.
    *   Now built with version 0.4 of Funicular, which is also written
        in Bourne shell now, instead of Lua.
    *   Updated versions of Falderal and Quylthulg.
    *   Several new distributions, including Samovar, etc.

*   **0.3**
    
    *   Updated versions of many Cat's Eye Technologies' distributions,
        and added several new distributions, including hatoucan, MARYSUE,
        Schroedinger's Game of Life, etc.
    *   hatoucan is now used to build (tokenize) the `.bas` files for
        Bubble Escape and Dungeons of Ekileugor. 
    *   Kosheri actually had failing tests in version 0.2, but they
        were not propagating the exit code and were mistaken as passing.
        These cases have been fixed.

*   **0.2**
    
    *   Based on a newer, more modular version of toolshelf, with new features
        which do away with the need of keeping a local cookies file just
        for The Platform.
    *   Updated versions of NetBSD, Python, Perl, Chicken, and YASM.
    *   Includes `ee` (BSD licensed) instead of `nano` (GPL) as the text
        editor.
    *   Many projects updated to use the syntax and conventions of
        Falderal version 0.10.
    *   ALPACA and Velo actually had failing tests in version 0.1, but they
        were not propagating the exit code and were mistaken as passing.
        These cases have been fixed.
    *   Several more of the Haskell projects (Quylthulg, etc) create a
        wrapper script which is placed on the executable search path, with
        which the implementation may be run from the command line.
    *   Added the NaNoGenLab.
    *   Created a torrent by which a pre-built disk image (and instructions
        for using it) are distributed.

*   **0.1**
    
    *   Initial release.

Notes for making the Torrent
----------------------------

*   Build the image per the instructions in the Funicularfile.
*   Run `script`.
*   Run `toolshelf.py test --verbose catseye/all`.
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

TODO
----

The information in this section is likely to be random and outdated.

*   py-editdist, perhaps?  For NaNoGenLab.

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

TODO: for 0.4
-----------------------------

*   lexeduct has failing test
*   better shelf_test, don't abort on a single failed test

### Things that have been released

*   Falderal 0.11
*   Quylthulg rel_1_0_2016_0504
*   yoob.js 0.12

### Things that will need to be released

#### Have actual due releases

*   SITU-SOL -- blogs are part of it now.  probably 0.1-2017.05xx
*   Maxixe - needs initial tag 0.1 - and add to catalog
*   kinoje - needs initial tag 0.1 - and add to catalog - and what will we do about yaml and jinja?

*   Funicular - 0.4
*   shelf - needs initial tag 0.1

#### Not known yet

    https://github.com/catseye/toolshelf
    https://github.com/catseye/Chrysoberyl
    https://github.com/catseye/The-Dossier
    https://github.com/catseye/The-Platform

#### Things we can punt on

*   Dipple -- probably 0.2 -- not that you lose much if it's 0.1
*   Canvas Feedback -- supports querystring args now, poorly -- should release 1.1 I guess, not that we lose much here
*   Castile -- 0_3_2017_05xx -- it's a generated Ruby thing, inconsequential for here
*   Maentwrog -- just changes for building on AmigaDOS 1.3
*   Befunge-93 - same
*   Braktif -- updates to yoob.js 0.7
*   Tamsin -- next version will be 0.6, but included version will be 0.5
*   SixtyPical -- next version will be 0.6, but included version will be 0.5
