TODO
====

*   make torrent

for 0.5
-------

*   better shelf_test, don't abort on a single failed test

*   restructure The Platform to consist of multiple sub-platforms

*   Update and release the things we punted on for 0.4:
    *   SixtyPical
    *   Chrysoberyl — actually, it's stale and needs updating
    *   Castile
    *   Maentwrog
    *   Befunge-93
    *   Braktif
    *   Canvas Feedback

*   If we have git repos, version git clones after docking them.  To do this
    we either need to mess with Dulwich (sigh) or build git on the guest.
    Somehow.  (also sigh.)
    
    *   Dulwich 0.9.5 ♢

*   PyYaml and Jinja2, for kinoje and Chrysoberyl.  Also, build HTML files
    from Chrysoberyl and let them be viewed with Links?  Also build
    The Dossier this way?  It would be really cool if Links could browse
    Markdown files directly.

*   py-editdist, perhaps?  For NaNoGenLab.

Older Notes
-----------

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
