History
-------

This section highlights major changes from release to release.

*   **0.4** (in progress)
    
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
    *   Things we have punted on (held back to latest tag, even though
        there are commits after it):
        *   Canvas Feedback
        *   Castile
        *   Maentwrog
        *   Befunge-93
        *   Braktif
        *   SixtyPical
        *   Chrysoberyl — actually, it's stale and needs updating but
            I don't want that to block releasing The Platform 0.4.

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
