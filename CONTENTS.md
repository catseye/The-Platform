Contents of The Platform
========================

This document describes the software that makes up The Platform.
But before we get into that in detail, it's probably worth explaining _why_
these pieces of software were chosen.

Software Selection Criteria
---------------------------

The purpose of The Platform is to curate Cat's Eye Technologies' software
projects in an executable form.

For this we need some supporting software.  And for many of those cases,
we have choices for what software we could use.  And so we have to choose
that software somehow.

For inclusion in The Platform, we generally prefer software that:

*   builds under NetBSD (ideally, under any supported architecture)
*   has a reasonable build system
*   has few dependencies
*   is lightweight
*   has an unrestrictive license (public domain > BSD/MIT/ISC > LGPL > GPL)
*   is hosted somewhere in DVCS (Github, Bitbucket, etc.)

Also, there are limits to how much support can be provided.

Some of Cat's Eye Technologies' projects are not currently (and some
may not ever be) well-represented in The Platform.  These fall into
two broad categories: "Available on the Web" and "Of no great use to you".
These are described in more detail in their own sections below.
Note that source code of these projects is still included in The Platform.
It's just that you may not be able to build them, and you might not be
able to use them for any particular purpose, even if they do build.

Infrastructure Software
-----------------------

Now that we've covered the principles, we can get into the specifics.
We'll start with the infrastructure software.

Note that, in case this listing is out-of-date or inaccurate, one can examine
the `Funicularfile` in this directory and the various `*.catalog` files in the
`skel` directory to obtain more accurate, machine-readable version numbers.

For the meanings of the various card-suit symbols, see [Appendix A](#appendix-a).

The Platform can be thought of as being constructed in stages, with each
stage building upon the previous.  The first stage, "Base", consists of:

*   NetBSD 6.1.5 (minimal install + compiler tools) ♡ + ♢
*   Lua 5.1.4 (note that this is already a part of NetBSD 6.1.5) ♡
*   shelf 0.7 ♥

The second stage, "Infrastructure", consists of:

*   GNU Make 3.82 ♢
*   cPython 3.9.13 ♦¹
*   Perl 5.18.4 ♦²
*   Hugs98-plus Sep2006 ♡
*   Erlang/OTP R16B03-1 (stripped down, e.g. no megaco, etc.) ♦³
*   CHICKEN Scheme 4.13.0 ♡¹
*   yasm 1.3.0 ♡
*   Ophis 2.1-2019.0413 ♡
*   dcc6502 2.1-2018.0902 ♡

The two-and-a-half-th stage, "Cat's Eye Forks", consists of:

*   Mini-Scheme 0.85ce1 ♥
*   ee 1.5.2ce1 (solely for convenient text editing) ♡
*   OpenZz 1.0.4-4ce1              (for Zzrk) ♢¹

The third stage, "Cat's Eye Infrastructure", consists of:

*   catseye-realpath 1.0-2022.0908 (for Pixley and others) ♥
*   Falderal 0.14                  (for tests) ♡
*   yucca 1.2-2022.0909            (for building Dungeons of Ekileugor) ♡
*   hatoucan 0.2-2022.0908         (for tokenizing Commodore BASIC 2.0 sources) ♥

The fourth and "final" stage, the "Cat's Eye" stage, consists of the
remainder of almost all of Cat's Eye Technologies' software distributions.

Available on the Web
--------------------

A nominal goal is to have every Cat's Eye Technologies' project available
*either* in The Platform *or* as an online installation on the `catseye.tc`
web site.  Thus, if you can already experience it by pointing your web
browser at `catseye.tc`, we won't worry too much about it not being usable
in The Platform.

*   [Apple Befunge](https://archive.org/details/apple-befunge-1.1-2014.0819/).
    No Apple II emulator installed.
*   [Backtracking Wang Tiler](https://catseye.tc/installation/Backtracking_Wang_Tiler)
*   [BefOS](https://catseye.tc/installation/BefOS).  No PC emulator installed.
    **still buildable**
*   [Bubble Escape](https://catseye.tc/installation/Bubble_Escape).
    No Commodore 64 emulator installed.  **still buildable**
*   [Canvas Feedback](https://catseye.tc/installation/Canvas_Feedback)
*   [Chzrxl](https://catseye.tc/installation/Chzrxl)
*   [Cosmos Boulders](https://catseye.tc/installation/Cosmos_Boulders)
*   [Cyclobots](https://catseye.tc/installation/Cyclobots)
*   [Etcha](https://catseye.tc/installation/Etcha).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Gemooy](https://catseye.tc/installation/Gemooy).  Implemented only in
    Javascript, and no Javascript implementation is installed.
*   [HTML5-Gewgaws](https://catseye.tc/node/Gewgaw).
    Implemented only in Javascript, and no Javascript implementation is
    installed.  Plus, these gewgaws generally assume an HTML5 web browser.
*   [Kolakoski Kurve](https://catseye.tc/installation/Kolakoski_Kurve)
*   [Matchbox](https://catseye.tc/installation/Matchbox)
*   [Latcarf](https://catseye.tc/installation/Latcarf)
*   [Lexeduct](https://catseye.tc/installation/Lexeduct)
*   [Maze Clouds](https://catseye.tc/installation/Maze_Clouds)
*   [Shelta](https://catseye.tc/installation/Shelta).  No DOS emulator installed.
    **still buildable**
*   [The New Gamerly Realism](https://catseye.tc/installation/The_New_Gamerly_Realism)
*   [Wunnel](https://catseye.tc/installation/Wunnel).  Implemented only in Java
    and Javascript, and no implementations of either of these languages are
    installed.
*   [Whothm](https://catseye.tc/installation/Whothm).  Reference implementation
    is written in Java, and no Java implementation is installed.
*   [yoob](https://catseye.tc/installation/yoob).  Reference implementation
    is written in Java, and no Java implementation is installed.

Of no great use to you
----------------------

This is the list we want to minimize, either by allowing these to run in
The Platform somehow, or allowing them to run on the web, in an HTML5 browser,
somehow.  But for some of them, neither of those options make sense either.

*   DAM.  No Javascript implementation installed.  and it's a framework,
    really, with nothing of itself per se to run.
*   DiskSumo.  No Commodore 64 emulator installed.  Besides, no point.
*   ellsync.  It's a wrapper for `rsync`, which is not included.
*   The Dipple.  Contains Ruby, Javascript, Icon, etc., and no implementations
    of these languages are installed.  Otoh, I'm sure many of the contents that
    are written in C, Python, etc. will build and run, but there is no
    automation for this, and no tests.  Well, it's a junk-drawer anyway.
*   Dungeons of Ekileugor.  No VIC-20 emulator / BASIC interpreter installed.
    **still buildable**
*   Funicular.  No emulators installed.
*   NaNoGenLab.  Some programs may work, but many are written in Python 2.7
    and may have dependencies (like `py-editdist`) which are not installed.
*   ILLGOL.  No DOS emulator installed to run the executables produced by
    the compiler(s).  **still buildable and runnable**
*   kinoje.  PyYaml and Jinja2 are not installed.
*   SITU-SOL.  No Commodore 64 emulator installed.  **still buildable**
*   Tamsin.  Only Python 3.9 is included in The Platform, but Tamsin is written
    in Python 2.7 using techniques that are difficult to upgrade to 3.x.
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
*   yastasoti.  Python Requests library is not installed.  Besides, no point.

Also, many of the older NaNoGenMo entries are written in Python 2.7 and have
not been tested under Python 3.9 and will almost certainly not run.

Also also, some projects may be executable, but in a diminished form.  For
example, the Mono runtime is not included, so the compiler option of
PL-{GOTO}.NET is of little use.  The PL-{GOTO} interpreter is still usable
however.

Appendix A
----------

#### License Symbols

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
