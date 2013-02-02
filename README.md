The TkSteal extension

Copyright (c) 1995 by Sven Delmas
All rights reserved.
See the file COPYRIGHT for the copyright notes.

Changes:
--------
        - Tk 4.0 adaptions
        - Tk 4.0 (or better the lack of TkPixmap) makes
          it impossible to embed ghostscript, so tkgs
          was removed.
        - Enhanced configuration
	- Added support for retrieving the color under
          the mouse pointer (used by my color selector).
        - Some minor bug fixes


What is TkSteal ?
-----------------
This small extension to Tk allows the embedding of external
programs like emacs and xterm. This widget gives you
COMPLETE access to emacs and xterm, which means that
these programs are completely integrated into your Tk
interface.

To embed emacs, you can use the "tkEmacs" command, and the
command "tkSteal" is a general interface to embed other
applications (like xclock etc.). Take a look at the demos in
the demo.TkSteal directory to see how to work with these
commands. The files "./demo.TkSteal/tkEmacs3.tcl",
"./demo.TkSteal/tkSteal1.tcl" and "./demo.TkSteal/tkSteal2.tcl"
are most interesting.

The file "./demo.TkSteal/windowTree.tcl" is an application
which displays the complete X window tree and allows you to
select windows for mapping, unmapping or reparenting. If you
have problems with reparenting, please play a little with
this program to see which window hierarchy contains the
window that has to be reparented. Please be careful with
this program as you can kill your X server with it.

The file "./demo.TkSteal/xtermwish.sh" is a small demo that
embeds an xterm with the running wish into the wish's
widget hierarchy. This demo requires Tk to be installed, as
you have to install (append) the code in the file
"./demo.TkSteal/wishrc" to the file "~/.wishrc". Once you
have done this, you can activate the wish with
"xtermwish.sh".

In the subdirectory "./tkemacs", you can find an application
that uses the TkEmacs widget. It is an emacs with
scrollbars, menus, fileselector boxes, etc.. The library
file named tkEmacs.tcl is installed to the directory that
is specified with the variable TKEMACS_LIBRARY in the
Makefile.

This distribution contains the code required to build a new
wish. It should not be necessary to change any existing
applications to embed it into the widget. If you want to
use emacs 18.59, please read the installation guide carefully,
as the emacs 18.59 distribution seems to have a bug that must
be fixed first before you can use emacs 18.59 as a Tk widget.


WARNING!
--------
If you use this widget (program), be aware of the fact that
it can cause trouble. It was tested, but as emacs is a
complex system and Tk is a complex system, too, there may
still be some problems.

If you encounter any problems, please let us know. If you
are able to locate the bug, please send problems, bug fixes
and ideas to:

        sven@cimetrix.com

Feel free to modify/adapt the sources and to write new lisp
functions for improved functionality. If you do so, please
let me know, so that I can improve the widget for me and
the other users (if there are any).


Requirements:
-------------
        - The Tk-4.0 package (or newer ?).

        - Emacs 18.57 or a later version or Lucid emacs 19.6
          or a later version (other versions should work as well;
          the patch doesn't do anything really fancy). Only
          required if you want to use TkEmacs.

        - The Tcl-DP package from Lawrence A. Rowe, Brian Smith,
          and Steve Yen (this package is not part of the
          distribution). Only required for TkEmacs. The Tcl-DP
          package is available at:
            ftp.aud.alcatel.com


Calling configure:
------------------
When you call ./configure in the temporary TkSteal
build directory (see below, several additional
parameters allow the selection of new packages etc..
Several packages allow the setting of additional 
subparameters. Setting one of these subparameters
means that all default settings for the subparameters
are ignored. So you have to list all required
subparameters by hand. Most parameters are directly
mapped to compiler options, so the configuration can
also be adapted by changing the Makefile directly. The
configuration reads the file "config.init", where the
several default settings are defined. The current
parameters are stored in the file "config.local". This
file can be used by calling ./configure with
-with-config-local.

IMPORTANT!!!!
If you call ./configure with new parameters (compared to
a previous call of ./configure), you should call "make
clean" before you build the new wish.

        -with-blt (default=off)
                This adds the BLT extension to the
                wish. Adding this feature makes it
                necessary to build and install the
                BLT package before you build this
                package. If there is no globally
                installed library, configure looks
                in the directory ../blt for a local
                copy.

        -with-config-local (default=off)
                Call ./configure with the parameters
                of the last ./configure call.

        -with-expect (default=off)
                This adds the expect extension to the
                wish. Adding this feature makes it
                necessary to build and install the
                expect package before you build this
                package. If there is no globally
                installed library, configure looks
                in the directory ../expect for a local
                copy.

        -with-itcl (default=off)
                This adds the itcl extension to the
                wish. Adding this feature makes it
                necessary to build and install the
                itcl package before you build this
                package. If there is no globally
                installed library, configure looks
                in the directory ../itcl for a local
                copy.

        -with-kanji (default=off)
                This allows the building of a Kanji
                wish. You have to provide the already
                patched Tk source tree under the name
                ../tk4.0-jp (or ../tk4.0jp) and the
                patched Tcl source tree under the name
                ../tcl7.4-jp (or ../tcl7.4jp).

        -with-nogcc (default=off)
                This disables the usage of gcc, irrespective
                of the existance of gcc.

        -with-noshlib (default=off)
                Even if the system supports shared
                libraries, don't build them.

        -with-tcldp (default=off)
                This adds the Tcl-DP package to the
                wish. Adding this feature makes it
                necessary to build and install the
                tcl-dp package before you build this
                package. If there is no globally
                installed library, configure looks
                in the directory ../tcl-dp for a local
                copy.

        -with-tclload (default=off)
                This adds the dynamic loading package to
                the wish. Adding this feature makes it
                necessary to build the shells package
                before you build this package. The shells
                package must be located in the same
                directory as the other extension packages
                under the name "shells".

        -with-tclX (default=off)
                This adds the TclX extension to the
                wish. Adding this feature makes it
                necessary to build and install the
                extended Tcl package before you build
                this package. If there is no globally
                installed library, configure looks
                in the directory ../tclX for a local
                copy.

        -with-tix (default=off)
                This adds the Tix extension to the
                wish. Adding this feature makes it
                necessary to build and install the
                Tix package before you build this
                package. If there is no globally
                installed library, configure looks
                in the directory ../tix for a local
                copy.

        -with-tkicon (default=off)
                This adds the TkIcon extension to
                the wish.

        -with-tklibrary=pathName (default=/usr/local/tk...)
                This specifies a new TK_LIBRARY path.
                The new Tk library searches for the
                Tk library files in this directory.

        -with-tkmegawidget (default=off)
                This adds the TkMegaWidget extension to
                the wish. There are several 
                subparameters for this parameter:

                -with-tkmegawidget-des (default=off)
                        adds the DES encryption library
                        to the TkMegaWidget.
                -with-tkmegawidget-localdes (default=off)
                        causes the use of the local des
                        library. Otherwise, a globally 
                        installed des library is used, if
                        there is any.
                -with-tkmegawidget-debug (default=on)
                        adds the debugger code. This
                        means that it is possible to run
                        two separate interpreters where
                        one interpreter is used to debug
                        the second one.

        -with-tkmobal (default=off)
                This adds the TkMobal extension to
                the wish.

        -with-tksteal (default=on)
                This adds the TkSteal extension to
                the wish.

        -with-turndial (default=off)
                This adds the tkTurndial widget to the
                wish. Adding this feature makes it
                necessary to build and install the
                tkTurndial package before you build
                this package. If there is no globally
                installed library, configure looks
                in the directory ../tkTurndial for a
                local copy named "libtkTurndial.a".

        -with-xpm (default=off)
                This adds the Xpm3 library to the link
                command in case Tk was extended with the
                externally available Pixmap support. If
                there is no globally installed library,
                configure looks in the directory ../xpm
                for a local copy.


Building a patched wish:
------------------------
         1) Please take a look into the "Portability"
            section at the bottom first. The installation
            may require a special handling for your system.

         2) Unpack the Tk distribution. Build the Tk
            distribution as described in the Tk README. If
            your system supports shared libraries, and
            you want to use them, you should build the
            Tcl and the Tk distribution with the
            tcltk_shlib package published by Xiaokun Zhu.

         3) Unpack the TkSteal distribution in the same
            directory where you have unpacked the Tk
            distribution.

         4) The resulting directory structure will look
            about like that:

            .../
               |
               +-- tcl7.4
               |
               +-- tk4.0
               |
               +-- TkSteal
               |
               +-- TkMegaWidget
               |
               ....

            Now change into the new TkSteal directory.

         5) Configure the distribution by running ./configure.
            And do all the things you usually do to get a
            working Tk. To select certain additional 
            packages and perform other changes of the new
            wish, you can call ./configure with several
            parameters. Take a look into the configure
            section above for a detailed list. You should
            take care that the TK_LIBRARY path is valid.
            This means that you either use the path from
            a previous Tk installation, or you create the
            new path, and copy all Tk library files to that
            directory.
        
         6) A new libtk will be built, as there are some
            minor problems with certain packages (especially
            with tcl-DP). This libtk is totally compatible with
            the previous libtk (the static and the shared
            version). So, I decided to install the library
            under the same name. If you do not want this,
            change the TK_LIB_NAME in the toplevel Makefile
            (go to 8)).

         7) Build the new wish (to build a new wish with
            a manually adapted Makefile, go to 8)). This
            will copy the required files to the local
            directory. Then these files are patched (the 
            protocol can be found in the files *.patch.out).
            The new local libtk and the required local
            extension libraries are built. Finally the new
            wish is linked. If your system supports shared
            libraries, they will be generated automatically.
            As the position of shared libraries is usually
            very critical, the libraries are automatically 
            installed in the final library directory when
            they are built. This makes it necessary that you 
            have write permission for that directory. To
            build the new wish, type:

                make

            Now go to 9) to continue the installation.

         8) If you want to change the toplevel Makefile
            manually (usually this is not required), first,
            you have to call:

                make prepare

            Adapt the Makefile to your personal needs. Now
            you can build the new wish (don't call "make"
            as you would normally do (see 7)), but call:

                make wish
        
         9) You can now install everything by typing this:

                make install

            This will install the new wish, the new library
            files and the new doc. By default, the library
            files are placed in the TK_LIBRARY directory.
            The original Tk tclIndex file in the directory 
            where the new Tk library files are installed
            (this is usually the Tk library directory... e.g.
            /usr/local/lib/tk4.0) has to be changed. It must
            contain the autoload code for the new Tcl commands
            ("tkEmacs", "tkSteal"). If you do not add the
            autoload code, you have to load the files
            "tkEmacs.tcl", "tkSteal.tcl" or explicitly in your
            code. Please take care to keep the tclIndex file
            up to date when you install other packages. The
            tclIndex file must contain the following lines:

                set auto_index(tkEmacs) "source [set dir]/tkEmacs.tcl"
                set auto_index(tkSteal) "source [set dir]/tkSteal.tcl"

        10) To see what the widgets can do for you, change to
            the directory named ./demo.TkSteal and type
            "../wish/steal-wish -f tkEmacs1.tcl" (do this for
            all tcl files in the directory).

        11) After that, you should test the new installed
            wish. If everything works fine, you can remove
            the temporary build directories.

        12) To prevent problems, please don't use this directory
            structure for totally different configurations. The
            subdirectories may contain newly copied files that
            are not removed automatically when you reconfigure
            the distribution. So you will end up in a totally
            corrupted distribution (especially the libtk directory
            will be corrupted, and will create libtk.a versions
            that cannot work). So, if you decide to reconfigure
            this package, and to drop certain packages from the
            new wish, please delete the current directorytree.
            Use a newly unpacked distribution to prevent trouble.


Preparing emacs:
----------------
        - Make a symbolic link (or a small shellscript or
          a link/copy of emacs) from your emacs to an
          executable named TkEmacs. This means that you can
          call your favorite emacs by typing TkEmacs. This
          is required to make the selection of the correct
          emacs easier (TkEmacs is the default emacs used by
          the emacs widget).

        - Install all .el files from the TkSteal
          distribution in an emacs lisp directory. The file
          advice.el is part of this distribution for the
          emacs 18.59 users. Please install the file
          advice.el only if you want to run an emacs 18.?? !!!
          Otherwise this file may cause trouble. TkEmacs
          must be able to find these lisp files automatically.

        - The file cl.elc from the standard distribution of
          emacs 18.59 seems to have problems. Please replace
          it with a (local) new byte compiled version. If you
          have problems with compiling cl.el, simply remove
          the compiled version. This way you are using the
          uncompiled version. This has no negative effects.

        - If you run Lucid emacs, you cannot use the default
          executable name TkEmacs for this emacs. You have
          to specify "-command lemacs" as the TkEmacs widget
          option. So if you want to use lemacs with TkEmacs
          (although I don't see why you should :-), you have
          to change the string manually:

                if {[catch "tkEmacs .frame.text -command TkEmacs -lispfile...

          to

                if {[catch "tkEmacs .frame.text -command lemacs -lispfile...

          in the file tkEmacs.tcl.

        - To disable the menubar of the current versions of
          emacs, please add the "correct" code to your startup
          code, or uncomment the "correct" code in the
          tkemacs.el file.


Problems with emacs ?!:
-----------------------
The only major problem is that sometimes, you only get an
empty toplevel, and/or hear a beep. In this case, one of the
following points might help you:

        1) Did you remove cl.elc (emacs 18.59) ?
                - in the shell, you type:
                        emacs
                - in emacs, you type:
                        M-x describe-variable
                        load-path
                - then, you get the current contents of the
                  load path. Now look if you can find cl.elc
                  in one of these directories. If you do,
                  one of the previous directories must
                  contain "cl.el".

        2) Did you install the new wish under the name steal-wish ?
                - in the shell, you type:
                        steal-wish
                - you get a running wish.

        3) Did you install the new wish library files in the
           Tk library directory ?
                - in the shell, you type:
                        steal-wish
                - in wish, you type:
                        tkEmacs .t
                - if that command fails with an:

                          invalid command name "tkEmacs"
                  
                  you have probably forgotten to install the
                  library file, or you have not adapted the
                  tclIndex file in the Tk library directory.

        4) Did you provide a emacs named TKEmacs ?
                - in the shell, you type:
                        TkEmacs
                - you get a running emacs.

        5) Did you install the emacs lisp files where emacs can find
           them ?
                - call emacs from the commandline as follows:
                        emacs -l tkemacs.el
                  there should be no error message (of course :-).

        6) Did you really build an "X" emacs ?
                - probably, you did not uncomment
                  HAVE_X_WINDOWS, so your emacs shows up in
                  the xterm where you started TkEmacs.

        7) Did you really build an emacs with socket support ?
                - probably, you did not define HAVE_SOCKETS,
                  so your emacs does not know the lisp
                  command "open-network-stream". 

        8) Did you apply/install all changes to wish correctly ?
                - in the shell, you type:
                        steal-wish
                - in wish, you type:
                        wm geometry . 500x500
                        tkEmacs .t
                        pack .t -expand 1 -fill both
                - the command returns .t, and the toplevel
                  window contains an emacs.

        9) A non-working wish can be caused by not including
           a communication package into Tk, when building
           the patched wish.

       10) A non-working TkEmacs widget can be caused by a
           not correctly adapted CB_LOAD_PATH or WISH_CMD
           variable in the tkemacs.sh file.

       11) When terminating emacs from inside of emacs it
           can happen that you get the message:

             "Active processes exist; kill them and exit anyway? (yes or no)"

           this is because the function 'save-buffers-kill-emacs' is
           called before the tk-kill-emacs-hook is called. So the
           communication is still open. I see no way to work around
           this problem (without changing the emacs lisp code). Maybe
           someone knows a simple solution ?!

       12) If you get a message about the max-lisp-eval-depth
           you have probably installed the file advice.el for
           a new emacs version (something newer than emacs 18.59).
           Please remove this file.

       13) If your emacs does not show up in the Tk widget after
           some time (either diappears completely, or stays on 
           the main window), you may have to play around with
           the reparenting level. The problem is that the authors
           of emacs and xemacs change the internal window structure
           from time to time, and also one version of emacs can have
           different window structures depending on the way the
           menubar is made. Emacs can return the window id of
           the editor window, but this is not the window that has
           to be reparented. It is the parent or the parent of the
           parent that has to be embedded (depends on the version).
           In the file tk-funcs.el search for the string
           "reparenting". This should bring you to a comment
           followed by a piece of code that starts with 
           "(defconst tk-emacs-type....". Uncomment this code, and
           set the value to something else (just play around with
           the various possible values and see which one is working).

       14) Embedding an xterm window with tkSteal.tcl does not
           work. When you call xterm with the -e parameter to
           run a command in xterm, you have to call xterm with
           the -T option to give xterm the "correct" name.

       15) The current release of Tcl-DP (3.3b1) is not working
           for me. TkEmacs never starts communicating... I don't
           know whether this is a problem with emacs, tcl-dp or
           my code. If somebody can help or knows something about
           problems woth Tcl-DP under Linux please let me know.


Problems with tkSteal ?
-----------------------
There are several known problems with TkSteal:
	- If you are using -width and -height to set the
          geometry of the tkSteal widget, and get a locked
          server or a X server error about insufficient 
          memory, your embedded application may use a grid
          for its geometry. In this case setting the widget
          geometry to something like 500x400 will result in
          a "real" geometry of something like 5000x5000.
          Just set the geometry to the correct gridded
          value (e.g. for xterm something like "-width 25
          -height 80").

	- If your embedded application is not resized beyond
          a certain size when you resize the tkSteal widget
          you should try to increase the initial size of the
          embedded application (at the applications
          commandline). I don't know why this happens (must
          be some WM thing I do not know).

Compatibility notes:
--------------------
We tried to keep the changes to Tk and emacs as small as
possible (smaller than for the old version of TkEmacs). The
changes to Tk only add a new command to Tk (xaccess(n)). If
you don't use the new command, you will not notice any
changes compared to the standard wish. You no longer have to
apply any changes to emacs or other programs that should be
embedded.

The basic concept of this widget is that the main window of
the embedded application is reparent to a Tk widget. Certain
events passed to the Tk window are passed to the reparented
window (like configure events etc.).

Apart from these mechanisms for passing X11 events, there
are additional features to pass informations (like access to
X properties, TCP connections). 


Portability:
------------
General:
        - If the widgets do not work as expected under the
          new wish, maybe you have forgotten to adapt the
          TK_LIBRARY path in the Makefile, or you have not
          created the new TK_LIBRARY path with all Tk
          library files.

        - If you have installed the Tcl/Tk related libraries
          in non standard directories (i.e. directories that
          are not automatically searched by the linker), you
          have to set the environment variable LD_LIBRARY_PATH
          to contain these additional directories.

        - Under MWM, it is not possible to place a window
          (namely the window of the application to be
          embedded) outside the visible area. So please
          don't play around with this temporarily appearing 
          window. It will get reparented quite soon, and
          playing around with it may cause X11 errors.

       -  The current release of Tcl-DP (3.3b1) is not working
          for me. TkEmacs never starts communicating... I don't
          know whether this is a problem with emacs, tcl-dp or
          my code. If somebody can help or knows something about
          problems woth Tcl-DP under Linux please let me know.

	- I started implementing the communication with tkEmacs
          via the new Tcl 7.5 "socket" command. Unfortunately it
          seems like emacs cannot talk to a socket opened with
          the Tcl "socket" command. If someone knows what happens
          there please let me know.

OSF:
        - It seems that the command "sed" (which is used by GNU's
          configure package) accepts no long commandline strings
          (at least not long enough for this configure program).
          The error message you get will look about like this:

                "Too many commands, last: s%@srcdir@%.%g"

          Please install the GNU sed package, and use this "sed"
          command (make sure the new sed is found before the
          original sed).

Extended Tcl:
        - If you build the wish with extended Tcl, you have
          to set the TCL_LIBRARY path to the extended Tcl
          library path before you call the new wish.


Availability:
-------------
The TkSteal distribution file is named TkSteal4.0*.tar.gz
or TkSteal4.0*.tar.Z. The * represents the current version.
TkSteal is available via anonymous ftp at:
        ftp.aud.alcatel.com:        tcl/extensions/
        ftp.ibp.fr:                 pub/tcl/contrib/extensions/
        nic.funet.fi:               pub/languages/tcl/extensions/
        syd.dit.csiro.au:           pub/tk/contrib/extensions/
        ftp.cs.tu-berlin.de:        pub/tcl/contrib/extensions/

To get a copy of it, just type the following:

        ftp ftp.cs.tu-berlin.de
        bin
        cd pub/tcl/contrib/extensions
        get TkSteal4.0*.tar.gz

To get a copy via ftpmail, just send the following mail to:

        mail-server@cs.tu-berlin.de

To get a help message, send the following body:

        send HELP
        end

To retrieve TkSteal, send the following body:

        send pub/tcl/contrib/extensions/TkSteal4.0*.tar.gz
        end


Feedback (Author):
------------------
Sven Delmas
sven@ignoranceisbliss.com
Juergen Nickelsen (Please no feedback!)


