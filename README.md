The Cat's Eye Technologies Platform
===================================

Hey, if Haskell can have a Platform, why can't we?  It's only fair.

This is version 0.5 of _The Cat's Eye Technologies Platform_, a
[NetBSD][]-based, [shelf][]-powered, [Funicular][]-built "distro"
containing almost all of [Cat's Eye Technologies][]' software
distributions.  It is an "executable anthology" of our work in a
stand-alone format: a bootable disk image.

The current released version of The Cat's Eye Technologies Platform is
version **0.5**.  It can be built with Funicular version 0.6 and uses
shelf version 0.7 as its "packaging system". Its source can be found
at the tag `0.5` in the repository, for example
[on Github here](https://github.com/catseye/The-Platform/tree/0.5).

**If you want to download a pre-built disk image of The Platform**,
it is available on the Internet Archive here:

*   [The Cat's Eye Technologies Platform 0.5 (Internet Archive)][]

You can also download it via this torrent:

*   [The-Cats-Eye-Technologies-Platform-0.5.torrent][]

**If you already have a copy of the pre-built disk image**,
and you want to know how to use it, see this document:

*   [USAGE.md](USAGE.md)

**If you wish to build a disk image of The Platform from source files**,
or if you simply want to know more about its internals, read on.

[The Cat's Eye Technologies Platform 0.5 (Internet Archive)]: https://archive.org/details/the-cats-eye-technologies-platform-0.5
[The-Cats-Eye-Technologies-Platform-0.5.torrent]: https://raw.githubusercontent.com/catseye/The-Platform/master/torrent/The-Cats-Eye-Technologies-Platform-0.5.torrent

[NetBSD]: https://netbsd.org/
[shelf]: https://github.com/catseye/shelf/
[Funicular]: https://github.com/catseye/Funicular/
[Cat's Eye Technologies]: https://catseye.tc/

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

*   [CONTENTS](CONTENTS.md) — what's included?
*   [BUILDING](BUILDING.md) — how to build The Platform from parts
*   [USAGE](USAGE.md) — how to use a built copy of The Platform
*   [HISTORY](HISTORY.md) — log of major changes to The Platform over time
*   [TODO](TODO.md) — notes for further development
