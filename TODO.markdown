TODO
====

for 0.5
-------

*   better shelf_test, don't abort on a single failed test

Older Notes
-----------

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
