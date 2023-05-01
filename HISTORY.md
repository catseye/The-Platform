History
-------

This section highlights major changes to The Cat's Eye Technologies Platform
from release to release.

*   **0.5**
    *   Probably the most major change is that most of Cat's Eye
        Technologies' Python projects were upgraded to run under Python 3,
        and the version of Python incorporated into The Platform is now
        Python 3.9.13.  Python 2.x is no longer included.  The unfortunate
        consequence is that the Tamsin interpreter is no longer executable,
        as updating it from Python 2 to 3 is a thorny proposition.
    *   Many upgraded versions, including being based on `shelf` 0.7 and
        being built with Funicular 0.6.
    *   Many new distributions, including Tandem, Vinegar, Fountain, and
        many others.
    *   Infrastructure is now placed in its own shelf (`infra`) apart
        from Cat's Eye Technologies' projects (`catseye`).
    *   To support Feedmark, some Python packages (atomize, Markdown,
        and Beautiful Soup 4) are installed as infrastructure, although
        sadly not in a very shelf-like way.
    *   Added script to update the `catseye.catalog` from Chrysoberyl,
        to facilitate including the most recent distributions.

*   **0.4**
    *   Now based on `shelf` 0.1 instead of toolshelf.  `shelf` is written
        in pure Bourne shell, so Python no longer needs to be built before
        sources can be docked.
    *   Now built with version 0.4 of Funicular, which is also written
        in Bourne shell now, instead of Lua.  (But this has much less
        impact on The Platform than the `shelf` change.)
    *   Incorporates updated versions of Falderal, Quylthulg, SITU-SOL,
        Tamsin, yoob.js, and Funicular.
    *   Several new distributions, including kinoje, Maxixe, Samovar,
        and The Dossier.  And shelf.

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
