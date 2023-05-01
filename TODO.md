TODO
====

These are mostly just aspirational.  I don't realistically expect most
of them to happen.

*   The Platform includes git repos, but no git tooling to manipulate
    them with.  Last time I tried, git is written in C++ and difficult
    to build; Dulwich exists, but was not very mature and couldn't
    really support a command-line tool to do the things git does.

*   Restructure The Platform to consist of multiple sub-platforms.

*   py-editdist, perhaps?  For NaNoGenLab.

*   Build HTML files from Chrysoberyl, The Dossier, etc., and let them be
    viewed with Links?  Or include a console Markdown viewer?  It would be
    really cool if Links could browse Markdown files directly, but I'm
    pretty sure it doesn't.

*   External documents linked to from The Dossier aren't included.
    Where it makes sense, it would be good if they could be pulled in.
    Actually, this is an issue with the website too.

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
