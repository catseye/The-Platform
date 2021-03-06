The Cat's Eye Technologies Platform
===================================

Hey, if Haskell can have a Platform, why can't we?  It's only fair.

This is version 0.4 of _The Cat's Eye Technologies Platform_, a
[NetBSD][]-based, [shelf][]-powered, [Funicular][]-built "distro"
containing almost all of [Cat's Eye Technologies][]' software
distributions.  It is an "executable anthology" of our work in a
stand-alone format: a bootable disk image.

The current released version of The Cat's Eye Technologies Platform is
version **0.4**.  It can be built with Funicular version 0.4 and uses
shelf version 0.1 as its "packaging system". Its source can be found
at the tag `0.4` in the repository, for example
[on Github here](https://github.com/catseye/The-Platform/tree/0.4).

**If you want to download a pre-built disk image of The Platform**,
open this torrent in your torrent client:

*   [The-Cats-Eye-Technologies-Platform-0.4.torrent][]

**If there are no seeders and your torrent client has problems
downloading the webseed**, download it directly (and then seed!):

*   [The-Cats-Eye-Technologies-Platform-0.4.img.7z][]

**If you already have a copy of the pre-built disk image**,
and you want to know how to use it, see this document:

*   [USAGE.markdown](USAGE.markdown)

**If you wish to build a disk image of The Platform from source files**,
or if you simply want to know more about its internals, read on.

[The-Cats-Eye-Technologies-Platform-0.4.torrent]: https://raw.githubusercontent.com/catseye/The-Platform/master/torrent/The-Cats-Eye-Technologies-Platform-0.4.torrent
[The-Cats-Eye-Technologies-Platform-0.4.img.7z]: http://static.catseye.tc/webseeds/The-Cats-Eye-Technologies-Platform-0.4/The-Cats-Eye-Technologies-Platform-0.4.img.7z

[NetBSD]: http://netbsd.org/
[shelf]: https://github.com/catseye/shelf/
[Funicular]: https://github.com/catseye/Funicular/
[Cat's Eye Technologies]: http://catseye.tc/

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

Further Reading
---------------

*   [BUILDING](BUILDING.markdown) — how to build The Platform from parts
*   [USAGE](USAGE.markdown) — how to use a built copy of The Platform
*   [HISTORY](HISTORY.markdown) — log of major changes to The Platform over time
*   [TODO](TODO.markdown) — notes for further development

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
*   shelf 0.1 ♥

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
*   Falderal 0.11            (for tests) ♡
*   yucca 1.1                (for building Dungeons of Ekileugor) ♡
*   hatoucan 0.1             (for tokenizing Commodore BASIC 2.0 sources) ♥

The third-and-a-half-th stage, "Cat's Eye Forked Infrastructure", consists of
others' projects of which Cat's Eye Technologies maintains forks:

*   Mini-Scheme 0.85ce1      (for Pixley) ♥
*   OpenZz 1.0.4-4ce1        (for Zzrk) ♢¹
*   ee 1.5.2ce1              (for text editing) ♡

(ee is not strictly necessary, I just can't stand any of the text editors
that come with NetBSD.)

The fourth and "final" stage, the "Cat's Eye" stage, consists of the
remainder of almost all of Cat's Eye Technologies' software distributions.
See [`skel/catseye.catalog`](skel/catseye.catalog) for a list of these
distributions and the versions at which they are pinned.

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
*   [Bubble Escape](http://catseye.tc/installation/Bubble_Escape).
    No Commodore 64 emulator installed.  **still buildable**
*   [Canvas Feedback](http://catseye.tc/installation/Canvas_Feedback)
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
*   [The New Gamerly Realism](http://catseye.tc/installation/The_New_Gamerly_Realism)
*   [Wang Tilers](http://catseye.tc/installation/Wang_Tilers)
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
*   Funicular.  No emulators installed.
*   NaNoGenLab.  The pure Python (and Haskell) programs should work, but many
    of the experiments have dependencies (like `py-editdist`) which are not
    installed.
*   ILLGOL.  No DOS emulator installed to run the executables produced by
    the compiler(s).  **still buildable and runnable**
*   kinoje.  PyYaml and Jinja2 are not installed.
*   SITU-SOL.  No Commodore 64 emulator installed.  **still buildable**
*   The Platform.  While there is a version of The Platform (that is,
    the Funicularfile and scripts in this repository...) included *inside*
    The Platform, it lags behind the current version of The Platform by
    one revision (because doing otherwise would be quite tricky.)
*   toolshelf.  The Platform is based on shelf now, so toolshelf isn't
    activated.  While the scripts are there, it is not recommend you run them.
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
