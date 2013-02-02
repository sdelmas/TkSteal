#!steal-wish -f
# Program: tkemacs
# Copyright: Sven Delmas
#


# procedure to show window .
proc ShowWindow. {args} {

  # Window manager configurations
  wm positionfrom . user
  wm sizefrom . program
  wm maxsize . 1152 900
  wm minsize . 0 0
  wm protocol . WM_DELETE_WINDOW {EmacsQuit}
  wm title . {tkemacs.tcl}


  # build widget .frame0
  frame .frame0 \
    -background {#dcdcdc} \
    -borderwidth {2} \
    -relief {raised}

  # build widget .frame0.menubutton14
  menubutton .frame0.menubutton14 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton14.m} \
    -text {Help} \
    -underline {0}

  # build widget .frame0.menubutton14.m
  menu .frame0.menubutton14.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton14.m add cascade \
    -accelerator {C-h i d} \
    -label {Info} \
    -menu {.frame0.menubutton14.m.m} \
    -underline {0}
  .frame0.menubutton14.m add command \
    -accelerator {C-h i d} \
    -command {SendToEmacs {(info)}
SendToEmacs {(Info-directory)}
} \
    -label {Info directory} \
    -underline {0}
  .frame0.menubutton14.m add command \
    -accelerator {C-h i 2} \
    -command {SendToEmacs {(info)}
SendToEmacs {(Info-directory)}
SendToEmacs {(Info-menu "Emacs")}
} \
    -label {Info Emacs} \
    -underline {5}
  .frame0.menubutton14.m add separator
  .frame0.menubutton14.m add command \
    -accelerator {C-h t} \
    -command {SendToEmacs {(help-with-tutorial)}} \
    -label {Tutorial} \
    -underline {0}
  .frame0.menubutton14.m add separator
  .frame0.menubutton14.m add command \
    -accelerator {C-h a} \
    -command {SendToEmacs {(call-interactively 'command-apropos)}} \
    -label {Apropos command} \
    -underline {0}
  .frame0.menubutton14.m add command \
    -accelerator {C-h c} \
    -command {SendToEmacs {(call-interactively 'describe-key-briefly)}} \
    -label {Describe key briefly} \
    -underline {3}
  .frame0.menubutton14.m add command \
    -accelerator {C-h k} \
    -command {SendToEmacs {(call-interactively 'describe-key)}} \
    -label {Describe key} \
    -underline {9}
  .frame0.menubutton14.m add command \
    -accelerator {C-h w} \
    -command {SendToEmacs {(call-interactively 'where-is)}} \
    -label {Where is command} \
    -underline {0}
  .frame0.menubutton14.m add command \
    -accelerator {C-h m} \
    -command {SendToEmacs {(call-interactively 'describe-mode)}} \
    -label {Describe mode} \
    -underline {9}
  .frame0.menubutton14.m add command \
    -accelerator {C-h v} \
    -command {SendToEmacs {(call-interactively 'describe-variable)}} \
    -label {Describe variable} \
    -underline {9}
  .frame0.menubutton14.m add separator
  .frame0.menubutton14.m add command \
    -accelerator {C-h C-c} \
    -command {SendToEmacs {(call-interactively 'describe-copying)}} \
    -label {License} \
    -underline {0}

  # build widget .frame0.menubutton14.m.m
  menu .frame0.menubutton14.m.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton14.m.m add command \
    -command {SendToEmacs {(info)}} \
    -label {Previous entry} \
    -underline {0}
  .frame0.menubutton14.m.m add separator
  .frame0.menubutton14.m.m add command \
    -command {SendToEmacs {(info)}
SendToEmacs {(Info-directory)}
SendToEmacs {(Info-menu "GCC")}} \
    -label {GCC} \
    -underline {1}
  .frame0.menubutton14.m.m add command \
    -command {SendToEmacs {(info)}
SendToEmacs {(Info-directory)}
SendToEmacs {(Info-menu "GDB")}} \
    -label {GDB} \
    -underline {1}

  # build widget .frame0.menubutton13
  menubutton .frame0.menubutton13 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton13.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton13.m
  menu .frame0.menubutton13.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton12
  menubutton .frame0.menubutton12 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton12.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton12.m
  menu .frame0.menubutton12.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton11
  menubutton .frame0.menubutton11 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton11.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton11.m
  menu .frame0.menubutton11.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton10
  menubutton .frame0.menubutton10 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton10.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton10.m
  menu .frame0.menubutton10.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton09
  menubutton .frame0.menubutton09 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton09.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton09.m
  menu .frame0.menubutton09.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton08
  menubutton .frame0.menubutton08 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton08.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton08.m
  menu .frame0.menubutton08.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton07
  menubutton .frame0.menubutton07 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton07.m} \
    -text {} \
    -underline {0}

  # build widget .frame0.menubutton07.m
  menu .frame0.menubutton07.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton06
  menubutton .frame0.menubutton06 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -cursor {arrow} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton06.m} \
    -text {Configure} \
    -underline {1}

  # build widget .frame0.menubutton06.m
  menu .frame0.menubutton06.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton06.m add cascade \
    -label {Resources} \
    -menu {.frame0.menubutton06.m.m0} \
    -underline {0}
#  .frame0.menubutton06.m add cascade \
    -label {Menus} \
    -menu {.frame0.menubutton06.m.m1} \
    -underline {0}
  .frame0.menubutton06.m add cascade \
    -label {Other} \
    -menu {.frame0.menubutton06.m.m3} \
    -underline {0}
  .frame0.menubutton06.m add command \
    -command {MenuBarConf .frame0} \
    -label {Menubar menus}
  .frame0.menubutton06.m add command \
    -command {EmacsSaveOptions} \
    -label {Save} \
    -underline {0}

  # build widget .frame0.menubutton06.m.m3
  menu .frame0.menubutton06.m.m3 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton06.m.m3 add checkbutton \
    -command {global emacsDebug; .frame.text debug $emacsDebug} \
    -label {Debugging} \
    -variable {emacsDebug} \
    -underline {0}
  .frame0.menubutton06.m.m3 add checkbutton \
    -command {global emacsUseAdvise
.frame.text config -useadvise $emacsUseAdvise} \
    -label {Update scrollbars from emacs} \
    -variable {emacsUseAdvise} \
    -underline {0}

  # build widget .frame0.menubutton06.m.m1
  menu .frame0.menubutton06.m.m1 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton06.m.m1 add command \
    -command {MenuBarConf .frame0} \
    -label {Menubar menus}
#  .frame0.menubutton06.m.m1 add command \
    -command {MenuBarConf .frame0.menubutton05.m} \
    -label {Mode specific menus}

  # build widget .frame0.menubutton06.m.m0
  menu .frame0.menubutton06.m.m0 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsActBackground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsActBackground $emacsResult
  set alertBox(activeBackground) $emacsResult
  set colorBox(activeBackground) $emacsResult
  set fontBox(activeBackground) $emacsResult
  set fsBox(activeBackground) $emacsResult
  set menuBar(activeBackground) $emacsResult
  set readBox(activeBackground) $emacsResult
  set textBox(activeBackground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Active background}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsActForeground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsActForeground $emacsResult
  set alertBox(activeForeground) $emacsResult
  set colorBox(activeForeground) $emacsResult
  set fontBox(activeForeground) $emacsResult
  set fsBox(activeForeground) $emacsResult
  set menuBar(activeForeground) $emacsResult
  set readBox(activeForeground) $emacsResult
  set textBox(activeForeground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Active foreground}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsBackground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsBackground $emacsResult
  set alertBox(background) $emacsResult
  set colorBox(background) $emacsResult
  set fontBox(background) $emacsResult
  set fsBox(background) $emacsResult
  set menuBar(background) $emacsResult
  set readBox(background) $emacsResult
  set textBox(background) $emacsResult
  set alertBox(scrollBackground) $emacsResult
  set colorBox(scrollBackground) $emacsResult
  set fontBox(scrollBackground) $emacsResult
  set fsBox(scrollBackground) $emacsResult
  set menuBar(scrollBackground) $emacsResult
  set readBox(scrollBackground) $emacsResult
  set textBox(scrollBackground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Background}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsForeground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsForeground $emacsResult
  set alertBox(foreground) $emacsResult
  set colorBox(foreground) $emacsResult
  set fontBox(foreground) $emacsResult
  set fsBox(foreground) $emacsResult
  set menuBar(foreground) $emacsResult
  set readBox(foreground) $emacsResult
  set textBox(foreground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Foreground}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsFont
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [FontBox $menuBar(fontFile)]
if {"$emacsResult" != ""} {
  set emacsFont $emacsResult
  set alertBox(font) $emacsResult
  set colorBox(font) $emacsResult
  set fontBox(font) $emacsResult
  set fsBox(font) $emacsResult
  set menuBar(font) $emacsResult
  set readBox(font) $emacsResult
  set textBox(font) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Font}
  .frame0.menubutton06.m.m0 add command \
    -command {global menuBar
global emacsEmacsFont
set emacsResult [FontBox $menuBar(fontFile) "Emacs font"]
if {"$emacsResult" != ""} {
  set emacsEmacsFont $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Emacs font}
  .frame0.menubutton06.m.m0 add command \
    -command {global menuBar
global emacsEmacsCursor
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsEmacsCursor $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Emacs insert background}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsScrollActForeground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsScrollActForeground $emacsResult
  set alertBox(scrollActiveForeground) $emacsResult
  set colorBox(scrollActiveForeground) $emacsResult
  set fontBox(scrollActiveForeground) $emacsResult
  set fsBox(scrollActiveForeground) $emacsResult
  set menuBar(scrollActiveForeground) $emacsResult
  set readBox(scrollActiveForeground) $emacsResult
  set textBox(scrollActiveForeground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Scrollbar active foreground}
  .frame0.menubutton06.m.m0 add command \
    -command {global emacsScrollForeground
global alertBox
global colorBox
global fontBox
global fsBox
global menuBar
global readBox
global textBox
set emacsResult [ColorBox $menuBar(colorFile)]
if {"$emacsResult" != ""} {
  set emacsScrollForeground $emacsResult
  set alertBox(scrollForeground) $emacsResult
  set colorBox(scrollForeground) $emacsResult
  set fontBox(scrollForeground) $emacsResult
  set fsBox(scrollForeground) $emacsResult
  set menuBar(scrollForeground) $emacsResult
  set readBox(scrollForeground) $emacsResult
  set textBox(scrollForeground) $emacsResult
  EmacsSetWidgetResources .
}} \
    -label {Scrollbar foreground}

  # build widget .frame0.menubutton05
  menubutton .frame0.menubutton05 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton05.m} \
    -text {Modes} \
    -underline {0}

  # build widget .frame0.menubutton05.m
  menu .frame0.menubutton05.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -postcommand {EmacsSetModeMenu .frame0.menubutton05.m}
#  .frame0.menubutton05.m add cascade \
    -command {SendToEmacs (fundamental-mode)} \
    -label {<Current>} \
    -menu {.frame0.menubutton05.m.current}
#  .frame0.menubutton05.m add separator
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (fundamental-mode)} \
    -label {Fundamental} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (c-mode)} \
    -label {C} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (emacs-lisp-mode)} \
    -label {Emacs lisp} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (latex-mode)} \
    -label {LaTeX} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (lisp-interaction-mode)} \
    -label {Lisp interaction} \
    -underline {5}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (nroff-mode)} \
    -label {Nroff} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (outline-mode)} \
    -label {Outline} \
    -underline {0}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (picture-mode)} \
    -label {Picture} \
    -underline {4}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (tex-mode)} \
    -label {Tex} \
    -underline {2}
  .frame0.menubutton05.m add command \
    -command {SendToEmacs (text-mode)} \
    -label {Text} \
    -underline {0}

  # build widget .frame0.menubutton05.m.emacs-default
  menu .frame0.menubutton05.m.emacs-default \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton05.m.emacs-default add command \
    -accelerator {C-x u} \
    -command {SendToEmacs {(undo)}} \
    -label {Undo}

  # build widget .frame0.menubutton05.m.c
  menu .frame0.menubutton05.m.c \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton05.m.c add command \
    -command {SendToEmacs {(find-tag "")}} \
    -label {Find tag under pointer}
  .frame0.menubutton05.m.c add command \
    -accelerator {M-.} \
    -command {SendToEmacs {(call-interactively 'find-tag)}} \
    -label {Find tag}
  .frame0.menubutton05.m.c add command \
    -accelerator {C-x `} \
    -command {SendToEmacs {(next-error)}} \
    -label {Next error}
  .frame0.menubutton05.m.c add separator
  .frame0.menubutton05.m.c add command \
    -accelerator {C-M-q} \
    -command {SendToEmacs {(indent-sexp)}} \
    -label {Indent expression}
  .frame0.menubutton05.m.c add command \
    -accelerator {C-M-\ } \
    -command {SendToEmacs {(indent-region)}} \
    -label {Indent region}

  # build widget .frame0.menubutton04
  menubutton .frame0.menubutton04 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton04.m} \
    -text {Windows} \
    -underline {0}

  # build widget .frame0.menubutton04.m
  menu .frame0.menubutton04.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton04.m add command \
    -accelerator {C-x 2} \
    -command {SendToEmacs {(split-window-vertically)}} \
    -label {Split Window Vertically} \
    -underline {13}
  .frame0.menubutton04.m add command \
    -accelerator {C-x 5} \
    -command {SendToEmacs {(split-window-horizontally)}} \
    -label {Split Window Horizontally} \
    -underline {13}
  .frame0.menubutton04.m add command \
    -accelerator {C-x 0} \
    -command {SendToEmacs {(delete-window)}} \
    -label {Delete window} \
    -underline {0}
  .frame0.menubutton04.m add command \
    -accelerator {C-x 1} \
    -command {SendToEmacs {(delete-other-windows)}} \
    -label {Delete other windows} \
    -underline {0}
  .frame0.menubutton04.m add separator
  .frame0.menubutton04.m add cascade \
    -label {Shrink window} \
    -menu {.frame0.menubutton04.m.m1} \
    -underline {1}
  .frame0.menubutton04.m add cascade \
    -accelerator {C-x ^} \
    -label {Enlarge window} \
    -menu {.frame0.menubutton04.m.m2} \
    -underline {1}

  # build widget .frame0.menubutton04.m.m2
  menu .frame0.menubutton04.m.m2 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 1)}} \
    -label {1} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 2)}} \
    -label {2} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 3)}} \
    -label {3} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 4)}} \
    -label {4} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 6)}} \
    -label {6} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 9)}} \
    -label {9} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 13)}} \
    -label {13} \
    -underline {0}
  .frame0.menubutton04.m.m2 add command \
    -command {SendToEmacs {(enlarge-window 20)}} \
    -label {20} \
    -underline {0}

  # build widget .frame0.menubutton04.m.m1
  menu .frame0.menubutton04.m.m1 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 1)}} \
    -label {1} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 2)}} \
    -label {2} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 3)}} \
    -label {3} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 4)}} \
    -label {4} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 6)}} \
    -label {6} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 9)}} \
    -label {9} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 13)}} \
    -label {13} \
    -underline {0}
  .frame0.menubutton04.m.m1 add command \
    -command {SendToEmacs {(shrink-window 20)}} \
    -label {20} \
    -underline {0}

  # build widget .frame0.menubutton04.m.m
  menu .frame0.menubutton04.m.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}

  # build widget .frame0.menubutton03
  menubutton .frame0.menubutton03 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton03.m} \
    -text {Buffers} \
    -underline {0}

  # build widget .frame0.menubutton03.m
  menu .frame0.menubutton03.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -postcommand {EmacsBuildBuffList .frame0.menubutton03.m}
  .frame0.menubutton03.m add command \
    -label {nothing}

  # build widget .frame0.menubutton02
  menubutton .frame0.menubutton02 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton02.m} \
    -text {Commands} \
    -underline {0}

  # build widget .frame0.menubutton02.m
  menu .frame0.menubutton02.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs {(redraw-display)}} \
    -label {Redisplay} \
    -underline {0}
  .frame0.menubutton02.m add separator
  .frame0.menubutton02.m add command \
    -accelerator {C-x m} \
    -command {SendToEmacs (mail)} \
    -label {Send mail} \
    -underline {5}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs (rmail)} \
    -label {Read mail} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs (gnus)} \
    -label {Read news} \
    -underline {5}
  .frame0.menubutton02.m add command \
    -command {set emacsResult [FSBox {Select directoryname:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(dired \"$emacsResult\")"
}} \
    -label {Dired...} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {set emacsResult [FSBox {Select filename for debugging:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(gdb \"$emacsResult\")"
}} \
    -label {GDB...} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs (shell)} \
    -label {Shell} \
    -underline {0}
  .frame0.menubutton02.m add separator
  .frame0.menubutton02.m add command \
    -command {SendToEmacs {(call-interactively 'search-forward)}} \
    -label {Search}
  .frame0.menubutton02.m add command \
    -accelerator {M-.} \
    -command {SendToEmacs {(call-interactively 'find-tag)}} \
    -label {Find tag} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs {(call-interactively 'compile)}} \
    -label {Compile} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs (eval-current-buffer)} \
    -label {Eval buffer} \
    -underline {0}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs (ispell-buffer)} \
    -label {Ispell buffer} \
    -underline {4}
  .frame0.menubutton02.m add command \
    -command {SendToEmacs {(call-interactively 'query-replace)}} \
    -label {Query replace} \
    -underline {0}
  .frame0.menubutton02.m add separator
  .frame0.menubutton02.m add command \
    -accelerator {C-g} \
    -command {SendToEmacs {(message "Press C-g to abort.")(sit-for 3)}} \
    -label {Abort} \
    -underline {0}

  # build widget .frame0.menubutton01
  menubutton .frame0.menubutton01 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton01.m} \
    -text {Edit} \
    -underline {0}

  # build widget .frame0.menubutton01.m
  menu .frame0.menubutton01.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton01.m add command \
    -accelerator {C-x u} \
    -command {SendToEmacs {(undo)}} \
    -label {Undo} \
    -underline {0}
  .frame0.menubutton01.m add separator
  .frame0.menubutton01.m add command \
    -accelerator {C-w} \
    -command {SendToEmacs {(call-interactively 'kill-region)}} \
    -label {Cut} \
    -underline {1}
  .frame0.menubutton01.m add command \
    -accelerator {M-w} \
    -command {SendToEmacs {(call-interactively 'copy-region-as-kill)}} \
    -label {Copy} \
    -underline {0}
  .frame0.menubutton01.m add command \
    -accelerator {C-y} \
    -command {SendToEmacs {(yank)}} \
    -label {Paste} \
    -underline {0}
  .frame0.menubutton01.m add separator
  .frame0.menubutton01.m add command \
    -accelerator {C-SPC} \
    -command {SendToEmacs {(call-interactively 'set-mark-command)}} \
    -label {Set mark} \
    -underline {0}
  .frame0.menubutton01.m add command \
    -accelerator {C-x C-x} \
    -command {SendToEmacs {(exchange-point-and-mark)}} \
    -label {Exchange point and mark} \
    -underline {0}
  .frame0.menubutton01.m add command \
    -accelerator {C-u C-SPC} \
    -command {SendToEmacs {(set-mark-command '(4))}} \
    -label {Previous mark} \
    -underline {9}

  # build widget .frame0.menubutton00
  menubutton .frame0.menubutton00 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -menu {.frame0.menubutton00.m} \
    -text {File} \
    -underline {0}

  # build widget .frame0.menubutton00.m
  menu .frame0.menubutton00.m \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black}
  .frame0.menubutton00.m add command \
    -accelerator {C-x C-f} \
    -command {set emacsResult [FSBox {Select file to load:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(find-file \"$emacsResult\")"
}} \
    -label {Open...} \
    -underline {0}
  .frame0.menubutton00.m add command \
    -accelerator {C-x 4 f} \
    -command {set emacsResult [FSBox {Select file to load:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(find-file-other-window \"$emacsResult\")"
}} \
    -label {In other window...} \
    -underline {0}
  .frame0.menubutton00.m add command \
    -accelerator {C-x i} \
    -command {set emacsResult [FSBox {Select file to load:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(insert-file \"$emacsResult\")"
}} \
    -label {Insert...} \
    -underline {0}
  .frame0.menubutton00.m add command \
    -command {set emacsResult [FSBox {Select lisp file to load:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(load-file \"$emacsResult\")"
}} \
    -label {Load file (lisp)...} \
    -underline {5}
  .frame0.menubutton00.m add separator
  .frame0.menubutton00.m add command \
    -accelerator {C-x C-s} \
    -command {SendToEmacs (save-buffer)} \
    -label {Save} \
    -underline {0}
  .frame0.menubutton00.m add command \
    -accelerator {C-x s} \
    -command {SendToEmacs {(call-interactively 'save-some-buffers)}} \
    -label {Save some} \
    -underline {7}
  .frame0.menubutton00.m add command \
    -accelerator {C-x C-w} \
    -command {set emacsResult [FSBox {Select filename for saving:}]
if {"$emacsResult" != ""} {
  SendToEmacs "(write-file \"$emacsResult\")"
}} \
    -label {Save as...} \
    -underline {5}
  .frame0.menubutton00.m add separator
  .frame0.menubutton00.m add command \
    -command {ReadBox} \
    -label {Enter TCL code...} \
    -underline {6}
  .frame0.menubutton00.m add separator
  .frame0.menubutton00.m add command \
    -accelerator {C-x C-c} \
    -command {
EmacsQuit} \
    -label {Quit} \
    -underline {0}

  # build widget .frame0.button01
  button .frame0.button01 \
    -activebackground {white} \
    -activeforeground {black} \
    -background {#dcdcdc} \
    -command {SendToEmacs {(undo)}} \
    -font {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1} \
    -foreground {black} \
    -text {Undo}

  # pack widget .frame0
  pack .frame0.menubutton00 -side left
  pack .frame0.menubutton01 -side left
  pack .frame0.menubutton02 -side left
  pack .frame0.menubutton03 -side left
  pack .frame0.menubutton04 -side left
  pack .frame0.menubutton05 -side left
  pack .frame0.menubutton06 -side left
  pack .frame0.button01 -side left
  pack .frame0.menubutton14 -side right

  # build widget .frame
  frame .frame \
    -background {#dcdcdc} \
    -relief {raised}

  # build widget .frame.scrollbar5
  scrollbar .frame.scrollbar5 \
    -activebackground {GhostWhite} \
    -troughcolor {#dcdcdc} \
    -command {.frame.text xview} \
    -background {gray} \
    -orient {horizontal} \
    -relief {raised} \
    -highlightthickness 0

  # build widget .frame.scrollbar1
  scrollbar .frame.scrollbar1 \
    -activebackground {GhostWhite} \
    -troughcolor {#dcdcdc} \
    -command {.frame.text yview} \
    -background {gray} \
    -relief {raised} \
    -highlightthickness 0

  # build widget .frame.text
  if {[catch "tkEmacs .frame.text -command TkEmacs -lispfile tkemacs.el -name \"TKEMACS*\" " result]} {
    if {"[info procs CBTB_error]" != ""} {
      CBTB_error "Unknown widget type: tkEmacs\n$result"
      return
    } {
      puts stderr "Unknown widget type: tkEmacs\n$result"
      catch "destroy ."
      catch "exit 0"
    }
  }
  .frame.text config \
    -background {#dcdcdc} \
    -borderwidth {2} \
    -insertbackground {blue} \
    -relief {raised} \
    -xscrollcommand {.frame.scrollbar5 set} \
    -yscrollcommand {.frame.scrollbar1 set} \
    -errorcallback {EmacsError} \
    -width 300 \
    -height 200 \
    -pollinterval {60} \
    -useadvise {1}
  # bindings
  bind .frame.text <Configure> {
    if {"$tkEmacs_priv(%W,windowId)" != "" &&
        $tkEmacs_priv(%W,windowId) != 0 &&
        $tkEmacs_priv(%W,emacsAvailable) != 0} {
      catch "xaccess eventconfigure         -windowid $tkEmacs_priv(%W,windowId)         -borderwidth 0         -x 0         -y 0         -width [winfo width %W]         -height [winfo height %W]"
    }}
  bind .frame.text <Destroy> {
    tkEmacs_stop %W}
  bind .frame.text <Expose> {
    if {"$tkEmacs_priv(%W,windowId)" != "" &&
        $tkEmacs_priv(%W,windowId) != 0 &&
        $tkEmacs_priv(%W,emacsAvailable) != 0} {
      catch "xaccess eventexpose         -windowid $tkEmacs_priv(%W,windowId)"
    }}
  bind .frame.text <Map> {
    tkEmacs_start %W -command TkEmacs -lispfile tkemacs.el}

  # pack widget .frame
  pack .frame.scrollbar1 -side left -fill y
  pack .frame.text -side top -expand 1 -fill both
  pack .frame.scrollbar5 -side top -fill x

  # pack widget .
  pack .frame0 -side top -fill x
  pack .frame -side top -expand 1 -fill both

  tk_menuBar .frame0 .frame0.menubutton14 .frame0.menubutton13 .frame0.menubutton12 .frame0.menubutton11 .frame0.menubutton10 .frame0.menubutton09 .frame0.menubutton08 .frame0.menubutton07 .frame0.menubutton06 .frame0.menubutton05 .frame0.menubutton04 .frame0.menubutton03 .frame0.menubutton02 .frame0.menubutton01 .frame0.menubutton00

  if {"[info commands CBTB_commServerCommand]" != ""} {
    CBTB_commServerCommand "CBTB widgettreebind ."
  }
}


# Procedure: .frame.text
proc .frame.text { args} {
return [eval tkEmacs_command .frame.text $args]
}


# Procedure: AlertBox
proc AlertBox { {alertBoxMessage "Alert message"} {alertBoxCommand ""} {alertBoxGeometry "350x150"} {alertBoxTitle "Alert box"} args} {
##########
# Procedure: AlertBox
# Description: show alert box
# Arguments: {alertBoxMessage} - the text to display
#            {alertBoxCommand} - the command to call after ok
#            {alertBoxGeometry} - the geometry for the window
#            {alertBoxTitle} - the title for the window
#            {args} - labels of buttons
# Returns: The number of the selected button, ot nothing
# Sideeffects: none
# Notes: there exist also functions called:
#          AlertBoxFile - to open and read a file automatically
#          AlertBoxFd - to read from an already opened filedescriptor
##########
#
# global alertBox(activeBackground) - active background color
# global alertBox(activeForeground) - active foreground color
# global alertBox(after) - destroy alert box after n seconds
# global alertBox(anchor) - anchor for message box
# global alertBox(background) - background color
# global alertBox(font) - message font
# global alertBox(foreground) - foreground color
# global alertBox(justify) - justify for message box
# global alertBox(toplevelName) - the toplevel name

  global alertBox

  # show alert box
  if {[llength $args] > 0} {
    eval AlertBoxInternal "\{$alertBoxMessage\}" "\{$alertBoxCommand\}" "\{$alertBoxGeometry\}" "\{$alertBoxTitle\}" $args
  } {
    AlertBoxInternal $alertBoxMessage $alertBoxCommand $alertBoxGeometry $alertBoxTitle
  }

  if {[llength $args] > 0} {
    # wait for the box to be destroyed
    update idletask
    grab $alertBox(toplevelName)
    tkwait window $alertBox(toplevelName)

    return $alertBox(button)
  }
}


# Procedure: AlertBoxInternal
proc AlertBoxInternal { alertBoxMessage alertBoxCommand alertBoxGeometry alertBoxTitle args} {
  global alertBox

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  if {"$alertBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$alertBox(activeBackground)\" "
  }
  if {"$alertBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$alertBox(activeForeground)\" "
  }
  if {"$alertBox(background)" != ""} {
    append tmpButtonOpt "-background \"$alertBox(background)\" "
    append tmpFrameOpt "-background \"$alertBox(background)\" "
    append tmpMessageOpt "-background \"$alertBox(background)\" "
  }
  if {"$alertBox(font)" != ""} {
    append tmpButtonOpt "-font \"$alertBox(font)\" "
    append tmpMessageOpt "-font \"$alertBox(font)\" "
  }
  if {"$alertBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$alertBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$alertBox(foreground)\" "
  }

  # start build of toplevel
  if {"[info commands CBSavedDestroy]" != ""} {
    catch {CBSavedDestroy $alertBox(toplevelName)}
  } {
    catch {destroy $alertBox(toplevelName)}
  }
  toplevel $alertBox(toplevelName)     -borderwidth 0
  catch "$alertBox(toplevelName) config $tmpFrameOpt"
  if {[catch "wm geometry $alertBox(toplevelName) $alertBoxGeometry"]} {
    wm geometry $alertBox(toplevelName) 350x150
  }
  wm title $alertBox(toplevelName) $alertBoxTitle
  wm maxsize $alertBox(toplevelName) 1000 1000
  wm minsize $alertBox(toplevelName) 100 100
  # end build of toplevel

  message $alertBox(toplevelName).message1     -anchor "$alertBox(anchor)"     -justify "$alertBox(justify)"     -relief raised     -text "$alertBoxMessage"
  catch "$alertBox(toplevelName).message1 config $tmpMessageOpt"

  set cbTmpWidth     [string range $alertBoxGeometry 0 [expr [string first x $alertBoxGeometry]-1]]
  if {"$cbTmpWidth" != ""} {
    # set message size
    catch "$alertBox(toplevelName).message1 configure       -width [expr $cbTmpWidth-10]"
  } {
    $alertBox(toplevelName).message1 configure       -aspect 1500
  }

  frame $alertBox(toplevelName).frame1     -borderwidth 0     -relief raised
  catch "$alertBox(toplevelName).frame1 config $tmpFrameOpt"

  set alertBoxCounter 0
  set buttonNum [llength $args]
  if {$buttonNum > 0} {
    while {$alertBoxCounter < $buttonNum} {
      button $alertBox(toplevelName).frame1.button$alertBoxCounter         -text "[lindex $args $alertBoxCounter]"         -command "
          global alertBox
          set alertBox(button) $alertBoxCounter
          if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
            catch {CBSavedDestroy $alertBox(toplevelName)}
          } {
            catch {destroy $alertBox(toplevelName)}
          }"
      catch "$alertBox(toplevelName).frame1.button$alertBoxCounter config $tmpButtonOpt"

      pack $alertBox(toplevelName).frame1.button$alertBoxCounter -side left -fill x -expand 1

      incr alertBoxCounter
    }
  } {
    button $alertBox(toplevelName).frame1.button0       -text "OK"       -command "
        global alertBox
        set alertBox(button) 0
        if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
          catch {CBSavedDestroy $alertBox(toplevelName)}
        } {
          catch {destroy $alertBox(toplevelName)}
        }
        $alertBoxCommand"
    catch "$alertBox(toplevelName).frame1.button0 config $tmpButtonOpt"

    pack $alertBox(toplevelName).frame1.button0 -side left -fill x -expand 1
  }

  # packing
  pack $alertBox(toplevelName).frame1 -side bottom -fill both
  pack $alertBox(toplevelName).message1 -side top -fill both -expand 1

  if {$alertBox(after) != 0} {
    after [expr $alertBox(after)*1000]       "catch \"$alertBox(toplevelName).frame1.button0 invoke\""
  }
}


# Procedure: Alias
if {"[info procs Alias]" == ""} {
proc Alias { args} {
##########
# Procedure: Alias
# Description: establish an alias for a procedure
# Arguments: args - no argument means that a list of all aliases
#                   is returned. Otherwise the first parameter is
#                   the alias name, and the second parameter is
#                   the procedure that is aliased.
# Returns: nothing, the command that is bound to the alias or a
#          list of all aliases - command pairs. 
# Sideeffects: internalAliasList is updated, and the alias
#              proc is inserted
##########
  global internalAliasList

  if {[llength $args] == 0} {
    return $internalAliasList
  } {
    if {[llength $args] == 1} {
      set cbTmpIndex [lsearch $internalAliasList "[lindex $args 0] *"]
      if {$cbTmpIndex != -1} {
        return [lindex [lindex $internalAliasList $cbTmpIndex] 1]
      }
    } {
      if {[llength $args] == 2} {
        eval "proc [lindex $args 0] {args} {
return \[eval \"[lindex $args 1] \$args\"\]}"
        set cbTmpIndex [lsearch $internalAliasList "[lindex $args 0] *"]
        if {$cbTmpIndex != -1} {
          set internalAliasList [lreplace $internalAliasList $cbTmpIndex $cbTmpIndex "[lindex $args 0] [lindex $args 1]"]
        } {
          lappend internalAliasList "[lindex $args 0] [lindex $args 1]"
        }
      } {
        error "Alias: wrong number or args: $args"
      }
    }
  }
}
}


# Procedure: ColorBox
proc ColorBox { {colorBoxFileColor "/usr/local/lib/CIMBuilder/cb/Colors"} {colorBoxMessage "Color"} {colorBoxEntryW ""} {colorBoxTargetW ""}} {
##########
# Procedure: ColorBox
# Description: select a color
# Arguments: {colorBoxFileColor} - the color file with all colornames
#            {colorBoxMessage} - a message to display
#            {colorBoxEntryW} - the widget name for the resulting color name
#            {colorBoxTargetW} - the widget we configure
# Returns: colorname, or nothing
# Sideeffects: none
##########
# 
# global colorBox(activeBackground) - active background color
# global colorBox(activeForeground) - active foreground color
# global colorBox(background) - background color
# global colorBox(font) - text font
# global colorBox(foreground) - foreground color
# global colorBox(palette) - a palette of colors
# global colorBox(scrollActiveForeground) - scrollbar active background color
# global colorBox(scrollBackground) - scrollbar background color
# global colorBox(scrollForeground) - scrollbar foreground color
# global colorBox(scrollSide) - side where scrollbar is located

  global colorBox

  set colorBox(colorName) ""
  set colorBox(paletteNr) 0

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScaleOpt ""
  set tmpScrollOpt ""
  if {"$colorBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$colorBox(activeBackground)\" "
  }
  if {"$colorBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$colorBox(activeForeground)\" "
  }
  if {"$colorBox(background)" != ""} {
    append tmpButtonOpt "-background \"$colorBox(background)\" "
    append tmpFrameOpt "-background \"$colorBox(background)\" "
    append tmpMessageOpt "-background \"$colorBox(background)\" "
    append tmpScaleOpt "-background \"$colorBox(background)\" "
  }
  if {"$colorBox(font)" != ""} {
    append tmpButtonOpt "-font \"$colorBox(font)\" "
    append tmpMessageOpt "-font \"$colorBox(font)\" "
  }
  if {"$colorBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$colorBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$colorBox(foreground)\" "
    append tmpScaleOpt "-foreground \"$colorBox(foreground)\" "
  }
  if {"$colorBox(scrollActiveForeground)" != ""} {
    append tmpScaleOpt "-activebackground \"$colorBox(scrollActiveForeground)\" "
    append tmpScrollOpt "-activebackground \"$colorBox(scrollActiveForeground)\" "
  }
  if {"$colorBox(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$colorBox(scrollBackground)\" "
  }
  if {"$colorBox(scrollForeground)" != ""} {
    append tmpScaleOpt "-sliderforeground \"$colorBox(scrollForeground)\" "
    append tmpScrollOpt "-background \"$colorBox(scrollForeground)\" "
  }

  # get color file name
  if {!([file exists $colorBoxFileColor] &&
        [file readable $colorBoxFileColor])} {
    set colorBoxFileColor ""
  }
  if {"$colorBoxFileColor" == ""} {
    global env
    if {[info exists env(CB_COLOR_FILE)]} {
      if {[file exists $env(CB_COLOR_FILE)] &&
          [file readable $env(CB_COLOR_FILE)]} {
        set colorBoxFileColor $env(CB_COLOR_FILE)
      }
    }
  }
  if {"$colorBoxMessage" == ""} {
    set colorBoxMessage "Color"
  }

  # save the the current widget color
  if {"$colorBoxTargetW" != ""} {
    if {[catch "$colorBoxTargetW config -[string tolower $colorBoxMessage]" result]} {
      set colorBoxSavedColor ""
    } {
      set colorBoxSavedColor [lindex $result 4]
    }
  } {
    set colorBoxSavedColor ""
  }

  # look if there is already a color window
  if {"[info commands .colorBox]" == ""} {
    # build widget structure

    # start build of toplevel
    if {"[info commands CBSavedDestroy]" != ""} {
      catch {CBSavedDestroy .colorBox}
    } {
      catch {destroy .colorBox}
    }
    toplevel .colorBox       -borderwidth 0
    catch ".colorBox config $tmpFrameOpt"
    wm title .colorBox {Color box}
    wm maxsize .colorBox 1000 1000
    wm minsize .colorBox 100 120
    wm geometry .colorBox 400x270
    # end build of toplevel

    set colorBox(oldWidget) $colorBoxEntryW

    frame .colorBox.frame1       -borderwidth 0       -relief raised
    catch ".colorBox.frame1 config $tmpFrameOpt"
 
    button .colorBox.frame1.ok       -text "OK"
    catch ".colorBox.frame1.ok config $tmpButtonOpt"

    button .colorBox.frame1.cancel       -text "Cancel"
    catch ".colorBox.frame1.cancel config $tmpButtonOpt"

    frame .colorBox.frame2       -borderwidth 0       -relief raised
    catch ".colorBox.frame2 config $tmpFrameOpt"
 
    radiobutton .colorBox.frame2.rgb       -command "ColorBoxShowSlides $colorBoxMessage \"$colorBoxTargetW\""       -text "RGB"       -variable colorBox(type) -value rgb
    catch ".colorBox.frame2.rgb config $tmpButtonOpt"

    radiobutton .colorBox.frame2.hsv       -command "ColorBoxShowSlides $colorBoxMessage \"$colorBoxTargetW\""       -text "HSV"       -variable colorBox(type) -value hsv
    catch ".colorBox.frame2.hsv config $tmpButtonOpt"

    radiobutton .colorBox.frame2.list       -command "ColorBoxShowSlides $colorBoxMessage \"$colorBoxTargetW\""       -text "List"       -variable colorBox(type) -value list
    catch ".colorBox.frame2.list config $tmpButtonOpt"

    frame .colorBox.palette       -borderwidth 0       -relief raised
    catch ".colorBox.palette config $tmpFrameOpt"
 
    set counter 0
    foreach element $colorBox(palette) {
      button .colorBox.palette.palette$counter         -command "ColorBoxSetPalette $colorBoxMessage \"$colorBoxTargetW\" $counter"                -width 3
      catch ".colorBox.palette.palette$counter config         -activebackground \"$element\"         -background \"$element\""

      pack .colorBox.palette.palette$counter -side left -fill both -expand 1
      incr counter
    }

    scale .colorBox.red       -background "red"       -from 0       -label "Red"       -orient horizontal       -relief raised       -sliderlength 15       -to 255       -width 8
    catch ".colorBox.red config $tmpScaleOpt"

    scale .colorBox.green       -background "green"       -from 0       -label "Green"       -orient horizontal       -relief raised       -sliderlength 15       -to 255       -width 8
    catch ".colorBox.green config $tmpScaleOpt"

    scale .colorBox.blue       -background "blue"       -from 0       -label "Blue"       -orient horizontal       -relief raised       -sliderlength 15       -to 255       -width 8
    catch ".colorBox.blue config $tmpScaleOpt"

    scale .colorBox.h       -from 0       -label "Hue"       -orient horizontal       -relief raised       -sliderlength 15       -to 1000       -width 8
    catch ".colorBox.h config $tmpScaleOpt"

   scale .colorBox.s      -from 0      -label "Saturation * 100"      -orient horizontal      -relief raised      -sliderlength 15      -to 1000      -width 8
    catch ".colorBox.s config $tmpScaleOpt"

    scale .colorBox.v       -from 0       -label "Value"       -orient horizontal       -relief raised       -sliderlength 15       -to 1000       -width 8
    catch ".colorBox.v config $tmpScaleOpt"

    label .colorBox.demo       -relief raised       -text "This text shows the results :-)"
    catch ".colorBox.demo config $tmpMessageOpt"

    frame .colorBox.current       -borderwidth 0       -relief raised
    catch ".colorBox.current config $tmpFrameOpt"

    label .colorBox.current.labelcurrent       -relief raised
    catch ".colorBox.current.labelcurrent config $tmpMessageOpt"

    entry .colorBox.current.current       -relief raised
    catch ".colorBox.current.current config $tmpMessageOpt"

    frame .colorBox.colors       -borderwidth 0       -relief raised
    catch ".colorBox.colors config $tmpFrameOpt"

    scrollbar .colorBox.colors.vscroll       -relief raised       -command ".colorBox.colors.colors yview"
    catch ".colorBox.colors.vscroll config $tmpScrollOpt"

    scrollbar .colorBox.colors.hscroll       -orient horiz       -relief raised       -command ".colorBox.colors.colors xview"
    catch ".colorBox.colors.hscroll config $tmpScrollOpt"

    listbox .colorBox.colors.colors       -exportselection false       -relief raised       -xscrollcommand ".colorBox.colors.hscroll set"       -yscrollcommand ".colorBox.colors.vscroll set"
    catch ".colorBox.colors.colors config $tmpMessageOpt"

    # read color file
    if {"$colorBoxFileColor" != ""} {
      if {[catch "open $colorBoxFileColor r" colorInFile]} {
        set colorBoxFileColor ""
        if {"[info commands AlertBox]" != ""} {
          AlertBox $colorInFile
        } {
          puts stderr $colorInFile
        }
      } {
        set colorReadList [read $colorInFile]
        close $colorInFile
        foreach colorLine [split $colorReadList "\n"] {
          if {"[string trim $colorLine]" != ""} {
            set colorNewLine [lrange $colorLine 3 end]
            append colorNewLine " " [format #%02x [lindex $colorLine 0]]
            append colorNewLine [format %02x [lindex $colorLine 1]]
            append colorNewLine [format %02x [lindex $colorLine 2]]
            .colorBox.colors.colors insert end $colorNewLine
          }
        }
      }
    }

    # bindings
    bind .colorBox.colors.colors <ButtonPress-1> "
      ColorBoxSelectColor %W $colorBoxMessage \"$colorBoxTargetW\" %y"
    bind .colorBox.colors.colors <Button1-Motion> "
      ColorBoxSelectColor %W $colorBoxMessage \"$colorBoxTargetW\" %y"
    bind .colorBox.colors.colors <Shift-ButtonPress-1> "
      ColorBoxSelectColor %W $colorBoxMessage \"$colorBoxTargetW\" %y"
    bind .colorBox.colors.colors <Shift-Button1-Motion> "
      ColorBoxSelectColor %W $colorBoxMessage \"$colorBoxTargetW\" %y"
  } {
    if {"[winfo class $colorBox(oldWidget)]" == "Text"} {
      catch "$colorBox(oldWidget) delete 1.0 end"
      catch "$colorBox(oldWidget) insert 1.0 [.colorBox.current.current get]"
    } {
      if {"[winfo class $colorBox(oldWidget)]" == "Entry"} {
        catch "$colorBox(oldWidget) delete 0 end"
        catch "$colorBox(oldWidget) insert 0 [.colorBox.current.current get]"
      }
    }

    set colorBox(oldWidget) $colorBoxEntryW
  }
   
  .colorBox.frame1.ok config     -command "
      global colorBox
      set colorBox(colorName) \[.colorBox.current.current get\]
      if {\"$colorBoxEntryW\" != \"\"} {
        if {\"\[winfo class $colorBoxEntryW\]\" == \"Text\"} {
          catch \"$colorBoxEntryW delete 1.0 end\"
          catch \"$colorBoxEntryW insert 1.0 \\\"\$colorBox(colorName)\\\"\"
        } {
          if {\"\[winfo class $colorBoxEntryW\]\" == \"Entry\"} {
            catch \"$colorBoxEntryW delete 0 end\"
            catch \"$colorBoxEntryW insert 0 \\\"\$colorBox(colorName)\\\"\"
          }
        }
      }
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .colorBox}
      } {
        catch {destroy .colorBox}
      }"

  .colorBox.frame1.cancel config     -command "
      global colorBox
      set colorBox(colorName) {}
      if {\"$colorBoxTargetW\" != \"\"} {
        catch \"$colorBoxTargetW config -\[string tolower $colorBoxMessage\] $colorBoxSavedColor\"
      }
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .colorBox}
      } {
        catch {destroy .colorBox}
      }"

  .colorBox.red config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.green config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.blue config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.h config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.s config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.v config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""

  .colorBox.current.labelcurrent config     -text "$colorBoxMessage:"

  # bindings
  bind .colorBox.current.current <Return> "
    ColorBoxSetPaletteList \[.colorBox.current.current get\]
    ColorBoxSetColor $colorBoxMessage \"$colorBoxTargetW\" text \[.colorBox.current.current get\]"

  bind .colorBox.colors.colors <Double-1> "
    ColorBoxSelectColor %W $colorBoxMessage \"$colorBoxTargetW\" %y
    global colorBox
    set colorBox(colorName) \[.colorBox.current.current get\]
    if {\"$colorBoxEntryW\" != \"\"} {
      if {\"\[winfo class $colorBoxEntryW\]\" == \"Text\"} {
        catch \"$colorBoxEntryW delete 1.0 end\"
        catch \"$colorBoxEntryW insert 1.0 \\\"\$colorBox(colorName)\\\"\"
      } {
        if {\"\[winfo class $colorBoxEntryW\]\" == \"Entry\"} {
          catch \"$colorBoxEntryW delete 0 end\"
          catch \"$colorBoxEntryW insert 0 \\\"\$colorBox(colorName)\\\"\"
        }
      }
    }
    if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
      catch {CBSavedDestroy .colorBox}
    } {
      catch {destroy .colorBox}
    }
    break"

  # set up current value
  .colorBox.current.current delete 0 end
  if {"$colorBoxEntryW" != ""} {
    if {"[winfo class $colorBoxEntryW]" == "Text"} {
      .colorBox.current.current insert 0 [$colorBoxEntryW get 1.0 end]
    } {
      if {"[winfo class $colorBoxEntryW]" == "Entry"} {
        .colorBox.current.current insert 0 [$colorBoxEntryW get]
      }
    }
  }
  if {"[.colorBox.current.current get]" != ""} {
    ColorBoxSetColor $colorBoxMessage $colorBoxTargetW text [.colorBox.current.current get]
  }
    
  # packing
  pack .colorBox.frame1.ok -side left -fill both -expand 1
  pack .colorBox.frame1.cancel -side left -fill both -expand 1
  pack .colorBox.frame2.rgb -side left -fill both -expand 1
  pack .colorBox.frame2.hsv -side left -fill both -expand 1
  pack .colorBox.frame2.list -side left -fill both -expand 1
  pack .colorBox.current.labelcurrent -side left
  pack .colorBox.current.current -side left -fill both -expand 1
  pack .colorBox.colors.vscroll -side $colorBox(scrollSide) -fill y
  pack .colorBox.colors.hscroll -side bottom -fill x
  pack .colorBox.colors.colors -side left -fill both -expand 1

  ColorBoxShowSlides $colorBoxMessage $colorBoxTargetW

  catch "wm deiconify .colorBox"

  if {"$colorBoxEntryW" == ""} {
    # wait for the box to be destroyed
    update idletask
    grab .colorBox
    tkwait window .colorBox

    return $colorBox(colorName)
  }
}


# Procedure: ColorBoxHSVToRGB
proc ColorBoxHSVToRGB { colorBoxHue colorBoxSat colorBoxValue} {
# The HSV <-> RGB converting routines are from the
# tcolor demo that is part of the demo site of Tk.

  set colorBoxV [format %.0f [expr 65535.0*$colorBoxValue]]
  if {$colorBoxSat == 0} {
    return "$colorBoxV $colorBoxV $colorBoxV"
  } else {
    set colorBoxHue [expr $colorBoxHue*6.0]
    if {$colorBoxHue >= 6.0} {
      set colorBoxHue 0.0
    }
    scan $colorBoxHue. %d i
    set colorBoxF [expr $colorBoxHue-$i]
    set colorBoxP [format %.0f [expr {65535.0*$colorBoxValue*(1 - $colorBoxSat)}]]
    set colorBoxQ [format %.0f [expr {65535.0*$colorBoxValue*(1 - ($colorBoxSat*$colorBoxF))}]]
    set colorBoxT [format %.0f [expr {65535.0*$colorBoxValue*(1 - ($colorBoxSat*(1 - $colorBoxF)))}]]
    case $i       0 {return "$colorBoxV $colorBoxT $colorBoxP"}       1 {return "$colorBoxQ $colorBoxV $colorBoxP"}       2 {return "$colorBoxP $colorBoxV $colorBoxT"}       3 {return "$colorBoxP $colorBoxQ $colorBoxV"}       4 {return "$colorBoxT $colorBoxP $colorBoxV"}       5 {return "$colorBoxV $colorBoxP $colorBoxQ"}
    error "i value $i is out of range"
  }
}


# Procedure: ColorBoxRGBToHSV
proc ColorBoxRGBToHSV { colorBoxRed colorBoxGreen colorBoxBlue} {
# The HSV <-> RGB converting routines are from the
# tcolor demo that is part of the demo site of Tk.

  if {$colorBoxRed > $colorBoxGreen} {
    set colorBoxMax $colorBoxRed.0
    set colorBoxMin $colorBoxGreen.0
  } else {
    set colorBoxMax $colorBoxGreen.0
    set colorBoxMin $colorBoxRed.0
  }
  if {$colorBoxBlue > $colorBoxMax} {
    set colorBoxMax $colorBoxBlue.0
  } else {
    if {$colorBoxBlue < $colorBoxMin} {
      set colorBoxMin $colorBoxBlue.0
    }
  }
  set range [expr $colorBoxMax-$colorBoxMin]
  if {$colorBoxMax == 0} {
    set colorBoxSat 0
  } else {
    set colorBoxSat [expr {($colorBoxMax-$colorBoxMin)/$colorBoxMax}]
  }
  if {$colorBoxSat == 0} {
    set colorBoxHue 0
  } else {
    set colorBoxRC [expr {($colorBoxMax - $colorBoxRed)/$range}]
    set colorBoxGC [expr {($colorBoxMax - $colorBoxGreen)/$range}]
    set colorBoxBC [expr {($colorBoxMax - $colorBoxBlue)/$range}]
    if {$colorBoxRed == $colorBoxMax} {
      set colorBoxHue [expr {.166667*($colorBoxBC - $colorBoxGC)}]
    } else {
      if {$colorBoxGreen == $colorBoxMax} {
        set colorBoxHue [expr {.166667*(2 + $colorBoxRC - $colorBoxBC)}]
      } else {
        set colorBoxHue [expr {.166667*(4 + $colorBoxGC - $colorBoxRC)}]
      }
    }
  }
  return [list $colorBoxHue $colorBoxSat [expr {$colorBoxMax/65535}]]
}


# Procedure: ColorBoxSelectColor
proc ColorBoxSelectColor { colorW colorBoxMessage colorBoxTargetW colorY} {

  set colorNearest [$colorW nearest $colorY]
  if {$colorNearest >= 0} {
    $colorW select clear 0 end
    $colorW select set $colorNearest
    set colorTmpValue [$colorW get $colorNearest]
    set colorCurrentColor [lrange $colorTmpValue 0           [expr [llength $colorTmpValue]-2]]
    set colorCurrentValue [lrange $colorTmpValue           [expr [llength $colorTmpValue]-1] end]

    scan [string range $colorCurrentValue 1 2] "%x" colorBoxValue
    .colorBox.red set $colorBoxValue
    scan [string range $colorCurrentValue 3 4] "%x" colorBoxValue
    .colorBox.green set $colorBoxValue
    scan [string range $colorCurrentValue 5 6] "%x" colorBoxValue
    .colorBox.blue set $colorBoxValue

    .colorBox.current.current delete 0 end
    .colorBox.current.current insert 0 $colorCurrentColor
    ColorBoxSetColor $colorBoxMessage $colorBoxTargetW list $colorCurrentColor
    ColorBoxSetPaletteList $colorCurrentColor
  }
}


# Procedure: ColorBoxSetColor
proc ColorBoxSetColor { colorBoxMessage colorBoxTargetW colorBoxType colorBoxValue} {
  global colorBox

  .colorBox.red config     -command "NoFunction"
  .colorBox.green config     -command "NoFunction"
  .colorBox.blue config     -command "NoFunction"
  .colorBox.h config     -command "NoFunction"
  .colorBox.s config     -command "NoFunction"
  .colorBox.v config     -command "NoFunction"

  set colorBoxSetColor ""
  if {"$colorBoxValue" != ""} {
    if {"$colorBoxType" != "text"} {
      .colorBox.current.current delete 0 end
      .colorBox.current.current insert 0 $colorBoxValue
    }
    if {[string match "*oreground*" $colorBoxMessage]} {
      catch ".colorBox.demo config -foreground $colorBoxValue"
    } {
      catch ".colorBox.demo config -background $colorBoxValue"
    }
    if {"$colorBoxTargetW" != ""} {
      catch "$colorBoxTargetW config -[string tolower $colorBoxMessage]         $colorBoxValue"
    }
  }
  case $colorBoxType in {
    {text palette} {
      if {[string match "*oreground*" $colorBoxMessage]} {
        set red [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -foreground] 4]] 0]/256]
        set green [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -foreground] 4]] 1]/256]
        set blue [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -foreground] 4]] 2]/256]
      } {
        set red [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -background] 4]] 0]/256]
        set green [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -background] 4]] 1]/256]
        set blue [expr [lindex [winfo rgb .colorBox.demo [lindex [.colorBox.demo config -background] 4]] 2]/256]
      }
      if {"$colorBox(type)" == "rgb"} {
        .colorBox.red set $red
        .colorBox.green set $green
        .colorBox.blue set $blue
      } {
        if {"$colorBox(type)" == "hsv"} {
          set colorBoxHSV [ColorBoxRGBToHSV [expr $red*256] [expr $green*256] [expr $blue*256]]
          .colorBox.h set [format %.0f [expr [lindex $colorBoxHSV 0]*1000.0]]
          .colorBox.s set [format %.0f [expr [lindex $colorBoxHSV 1]*1000.0]]
          .colorBox.v set [format %.0f [expr [lindex $colorBoxHSV 2]*1000.0]]
        }
      }
    }
  }
  .colorBox.red config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""
  .colorBox.green config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""
  .colorBox.blue config     -command "ColorBoxSetRGBColor $colorBoxMessage \"$colorBoxTargetW\""
  .colorBox.h config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""
  .colorBox.s config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""
  .colorBox.v config     -command "ColorBoxSetHSVColor $colorBoxMessage \"$colorBoxTargetW\""
}


# Procedure: ColorBoxSetHSVColor
proc ColorBoxSetHSVColor { colorBoxMessage colorBoxTargetW colorBoxValue} {
  global colorBox

  set colorBoxRGB [ColorBoxHSVToRGB [expr [.colorBox.h get]/1000.0] [expr [.colorBox.s get]/1000.0] [expr [.colorBox.v get]/1000.0]]
  ColorBoxSetColor $colorBoxMessage $colorBoxTargetW hsv     [format #%04x%04x%04x [lindex $colorBoxRGB 0] [lindex $colorBoxRGB 1] [lindex $colorBoxRGB 2]]
  ColorBoxSetPaletteList [format #%04x%04x%04x [lindex $colorBoxRGB 0] [lindex $colorBoxRGB 1] [lindex $colorBoxRGB 2]]
}


# Procedure: ColorBoxSetPalette
proc ColorBoxSetPalette { colorBoxMessage colorBoxTargetW colorBoxElement} {
  global colorBox

  set colorBox(paletteNr) $colorBoxElement
  ColorBoxSetColor $colorBoxMessage $colorBoxTargetW palette     [lindex [.colorBox.palette.palette$colorBoxElement config -background] 4]
}


# Procedure: ColorBoxSetPaletteList
proc ColorBoxSetPaletteList { colorBoxValue} {
  global colorBox

  catch ".colorBox.palette.palette$colorBox(paletteNr) config       -activebackground $colorBoxValue"
  catch ".colorBox.palette.palette$colorBox(paletteNr) config       -background $colorBoxValue"
  set colorBox(palette)     [lreplace $colorBox(palette) $colorBox(paletteNr) $colorBox(paletteNr)       $colorBoxValue]
}


# Procedure: ColorBoxSetRGBColor
proc ColorBoxSetRGBColor { colorBoxMessage colorBoxTargetW colorBoxValue} {
  global colorBox

  ColorBoxSetColor $colorBoxMessage $colorBoxTargetW rgb     [format #%02x%02x%02x [.colorBox.red get]       [.colorBox.green get] [.colorBox.blue get]]
  ColorBoxSetPaletteList [format #%02x%02x%02x [.colorBox.red get]     [.colorBox.green get] [.colorBox.blue get]]
}


# Procedure: ColorBoxShowSlides
proc ColorBoxShowSlides { colorBoxMessage colorBoxTargetW} {
  global colorBox

  catch "pack forget .colorBox.frame1"
  catch "pack forget .colorBox.frame2"
  catch "pack forget .colorBox.current"
  catch "pack forget .colorBox.palette"
  catch "pack forget .colorBox.demo"
  catch "pack forget .colorBox.h"
  catch "pack forget .colorBox.s"
  catch "pack forget .colorBox.v"
  catch "pack forget .colorBox.red"
  catch "pack forget .colorBox.green"
  catch "pack forget .colorBox.blue"
  catch "pack forget .colorBox.colors"
  case $colorBox(type) in {
    {rgb} {
      pack .colorBox.frame1 -side bottom -fill x
      pack .colorBox.frame2 -side bottom -fill x
      pack .colorBox.current -side bottom -fill x
      pack .colorBox.palette -side bottom -fill x
      pack .colorBox.red -side top -fill x
      pack .colorBox.green -side top -fill x
      pack .colorBox.blue -side top -fill x
      pack .colorBox.demo -side bottom -fill both -expand 1
    }
    {hsv} {
      pack .colorBox.frame1 -side bottom -fill x
      pack .colorBox.frame2 -side bottom -fill x
      pack .colorBox.current -side bottom -fill x
      pack .colorBox.palette -side bottom -fill x
      pack .colorBox.h -side top -fill x
      pack .colorBox.s -side top -fill x
      pack .colorBox.v -side top -fill x
      pack .colorBox.demo -side bottom -fill both -expand 1
    }
    {list} {
      pack .colorBox.frame1 -side bottom -fill x
      pack .colorBox.frame2 -side bottom -fill x
      pack .colorBox.current -side bottom -fill x
      pack .colorBox.palette -side bottom -fill x
      pack .colorBox.demo -side bottom -fill x
      pack .colorBox.colors -side top -fill both -expand 1
    }
  }
  if {[string match "*oreground*" $colorBoxMessage]} {
    ColorBoxSetColor $colorBoxMessage $colorBoxTargetW text       [lindex [.colorBox.demo config -foreground] 4]
  } {
    ColorBoxSetColor $colorBoxMessage $colorBoxTargetW text       [lindex [.colorBox.demo config -background] 4]
  }
}


# Procedure: EmacsBuildBuffList
proc EmacsBuildBuffList { emacsW} {
  global emacsBuffList

  set buffList ""
  set tmpBuffList [string trim [.frame.text send "(mapcar 'buffer-name (buffer-list))"] ()]
  foreach counter $tmpBuffList {
    if {[string index $counter 0] != " "} {
      append buffList "\{$counter\} "
    }
  }
  set buffList [lsort $buffList]
  if {"$buffList" == "$emacsBuffList"} {
    return
  }
  set emacsBuffList $buffList

  if {"[info commands $emacsW]" != ""} {
    $emacsW delete 0 last
  } {
    menu $emacsW
  }

  set counter 0
  foreach buffName $buffList {
    $emacsW add cascade      -label "$buffName"      -menu "$emacsW.$counter"

    menu $emacsW.$counter
    $emacsW.$counter add command      -accelerator {C-x b}      -label "Switch to buffer"      -command "
        SendToEmacs \{(switch-to-buffer \"$buffName\")\}"
    $emacsW.$counter add command      -accelerator {C-x 4 b}      -label "Switch to buffer other window"      -command "
        SendToEmacs \{(switch-to-buffer-other-window \"$buffName\")\}"
    $emacsW.$counter add command      -label "Bury buffer"      -command "
        SendToEmacs \{(bury-buffer)\}"
    $emacsW.$counter add separator
    $emacsW.$counter add command      -accelerator {C-x k}      -command "SendToEmacs \{(kill-buffer \"$buffName\")\}"      -label {Kill buffer}      -underline {0}
    incr counter
  }
  EmacsSetWidgetResources $emacsW
  update idletask
}


# Procedure: EmacsError
proc EmacsError { emacsW emacsMessage} {
  global emacsErrorMessage
  
  append emacsErrorMessage "$emacsMessage\n"
  TextBox $emacsErrorMessage "" 400x300
}


# Procedure: EmacsQuit
proc EmacsQuit {} {

  if {"[info commands ClientShutdown]" != ""} {
    wm iconify .
    wm withdraw .
  } {
    tkEmacs_evalString .frame.text "(progn (tk-advise-destroy-widget-on-exit)
                 (save-buffers-kill-emacs))" "CMD: " 0
  }
}


# Procedure: EmacsSaveOptions
proc EmacsSaveOptions {} {
  global emacsActBackground
  global emacsActForeground
  global emacsBackground
  global emacsForeground
  global emacsFont
  global emacsEmacsFont
  global emacsEmacsCursor
  global emacsPollInterval
  global emacsScrollActForeground
  global emacsScrollForeground
  global emacsUseAdvise

  if {![catch "open ~/.cbemacs-o.tcl w" outFile]} {
    puts $outFile "global emacsActBackground"
    puts $outFile "set emacsActBackground $emacsActBackground"
    puts $outFile "global emacsActForeground"
    puts $outFile "set emacsActForeground $emacsActForeground"
    puts $outFile "global emacsBackground"
    puts $outFile "set emacsBackground $emacsBackground"
    puts $outFile "global emacsForeground"
    puts $outFile "set emacsForeground $emacsForeground"
    puts $outFile "global emacsFont"
    puts $outFile "set emacsFont $emacsFont"
    puts $outFile "global emacsEmacsFont"
    puts $outFile "set emacsEmacsFont $emacsEmacsFont"
    puts $outFile "global emacsEmacsCursor"
    puts $outFile "set emacsEmacsCursor $emacsEmacsCursor"
    puts $outFile "global emacsPollInterval"
    puts $outFile "set emacsPollInterval \{$emacsPollInterval\}"
    puts $outFile "global emacsScrollActForeground"
    puts $outFile "set emacsScrollActForeground $emacsScrollActForeground"
    puts $outFile "global emacsScrollForeground"
    puts $outFile "set emacsScrollForeground $emacsScrollForeground"
    puts $outFile "global emacsUseAdvise"
    puts $outFile "set emacsUseAdvise $emacsUseAdvise"
    close $outFile
  } {
    puts stderr "could not open options file ~/.cbemacs-o.tcl"
  }
}


# Procedure: EmacsSetModeMenu
proc EmacsSetModeMenu { emacsW} {

  set emacsMode [.frame.text send mode-name]
  set menuName ""
  foreach counter [split $emacsMode] {
    append menuName [string tolower [string trim $counter]]
  }
  if {"$menuName" == "" || "[info commands $emacsW.$menuName]" == ""} {
    set menuName "emacs-default"
    if {"[info commands $emacsW.$menuName]" == ""} {
      set menuName ""
    }
  }

  set counter 0
  set lastIndex [$emacsW index last]
  if {"$lastIndex" != "none"} {
    if {"[$emacsW type $counter]" == "command"} {
      if {[string match "<*>" "[lindex [$emacsW entryconf $counter -label] 4]"]} {
        $emacsW entryconf $counter -label "<$emacsMode>"
        if {"$menuName" != ""} {
          $emacsW entryconf $counter -state normal
          $emacsW entryconf $counter -menu "$emacsW.$menuName"
        } {
          $emacsW entryconf $counter -state disabled
        }
      }
    }
  }
}


# Procedure: EmacsSetWidgetResources
proc EmacsSetWidgetResources { emacsW} {
  global emacsActBackground
  global emacsActForeground
  global emacsBackground
  global emacsForeground
  global emacsFont
  global emacsEmacsFont
  global emacsEmacsCursor
  global emacsScrollActForeground
  global emacsScrollForeground

  if {"[info commands $emacsW]" == "" &&
      "$emacsW" != "."} {
    return
  }
  set emacsOptions ""
  case [winfo class $emacsW] in {
    {Button CheckButton RadioButton Menubutton Menu} {
      if {"$emacsActBackground" != ""} {
        append emacsOptions " -activebackground $emacsActBackground"
      }
      if {"$emacsActForeground" != ""} {
        append emacsOptions " -activeforeground $emacsActForeground"
      }
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
      if {"$emacsForeground" != ""} {
        append emacsOptions " -foreground $emacsForeground"
      }
      if {"$emacsFont" != ""} {
        append emacsOptions " -font $emacsFont"
      }
    }
    {Listbox} {
      if {"$emacsActBackground" != ""} {
        append emacsOptions " -selectbackground $emacsActBackground"
      }
      if {"$emacsActForeground" != ""} {
        append emacsOptions " -selectforeground $emacsActForeground"
      }
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
      if {"$emacsForeground" != ""} {
        append emacsOptions " -foreground $emacsForeground"
      }
      if {"$emacsFont" != ""} {
        append emacsOptions " -font $emacsFont"
      }
    }
    {Frame Toplevel} {
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
    }
    {Label Message Text Entry} {
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
      if {"$emacsForeground" != ""} {
        append emacsOptions " -foreground $emacsForeground"
      }
      if {"$emacsFont" != ""} {
        append emacsOptions " -font $emacsFont"
      }
      if {[string compare Entry [winfo class $emacsW]] == 0} {
        if {"$emacsEmacsCursor" != ""} {
          append emacsOptions " -cursorbackground $emacsEmacsCursor"
        }
      }
    }
    {Scrollbar} {
      if {"$emacsScrollActForeground" != ""} {
        append emacsOptions " -activebackground $emacsScrollActForeground"
      }
      if {"$emacsBackground" != ""} {
        append emacsOptions " -troughcolor $emacsBackground"
      }
      if {"$emacsScrollForeground" != ""} {
        append emacsOptions " -background $emacsScrollForeground"
      }
    }
    {Scale} {
      if {"$emacsScrollActForeground" != ""} {
        append emacsOptions " -activeforeground $emacsScrollActForeground"
      }
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
      if {"$emacsScrollForeground" != ""} {
        append emacsOptions " -foreground $emacsScrollForeground"
      }
    }
    {TkEmacs Text} {
      if {"$emacsBackground" != ""} {
        append emacsOptions " -background $emacsBackground"
      }
      if {"$emacsForeground" != ""} {
        append emacsOptions " -foreground $emacsForeground"
      }
      if {"$emacsEmacsFont" != ""} {
        append emacsOptions " -font $emacsEmacsFont"
      }
      if {"$emacsEmacsCursor" != ""} {
        append emacsOptions " -insertbackground $emacsEmacsCursor"
      }
    }
  }
  if {"$emacsOptions" != ""} {
    catch "$emacsW config $emacsOptions"
  }
  foreach counter [winfo children $emacsW] {
    EmacsSetWidgetResources $counter
  }
}


# Procedure: EmacsUpdateResources
proc EmacsUpdateResources {} {

  foreach counter [lsort [winfo children .frame0]] {
    pack forget $counter
  }
  set emacsButtonList ""
  foreach counter [lsort [winfo children .frame0]] {
    if {"[string trim [lindex [$counter config -text] 4]]" != ""} {
      if {"[winfo class $counter]" == "Menubutton"} {
        set emacsButtonList "$emacsButtonList $counter"
      }
      if {"$counter" == ".frame0.menubutton14"} {
        pack .frame0.button01 -side left
        pack $counter -side right
      } {
        pack $counter -side left
      }
      if {"[lindex [$counter config -text] 4]" == "Buffers"} {
        if {"[lindex [$counter config -menu] 4]" != ""} {
          [lindex [$counter config -menu] 4] config             -postcommand "EmacsBuildBuffList [lindex [$counter config -menu] 4]"
        }
      } {
        if {"[lindex [$counter config -text] 4]" == "Modes"} {
          if {"[lindex [$counter config -menu] 4]" != ""} {
            [lindex [$counter config -menu] 4] config               -postcommand "EmacsSetModeMenu [lindex [$counter config -menu] 4]"
          }
        }
      }
    } {
      pack forget $counter
    }
  }
  eval "tk_menuBar .frame0 $emacsButtonList"
  EmacsSetWidgetResources .
}


# Procedure: FSBox
proc FSBox { {fsBoxMessage "Select file:"} {fsBoxFileName ""} {fsBoxActionOk ""} {fsBoxActionCancel ""}} {
##########
# Procedure: FSBox
# Description: show file selector box
# Arguments: fsBoxMessage - the text to display
#            fsBoxFileName - a file name that should be selected
#            fsBoxActionOk - the action that should be performed on ok
#            fsBoxActionCancel - the action that should be performed on cancel
# Returns: the filename that was selected, or nothing
# Sideeffects: none
##########
# 
# global fsBox(activeBackground) - active background color
# global fsBox(activeForeground) - active foreground color
# global fsBox(background) - background color
# global fsBox(font) - text font
# global fsBox(foreground) - foreground color
# global fsBox(extensions) - scan directory for extensions
# global fsBox(scrollActiveForeground) - scrollbar active background color
# global fsBox(scrollBackground) - scrollbar background color
# global fsBox(scrollForeground) - scrollbar foreground color
# global fsBox(scrollSide) - side where scrollbar is located

  global fsBox

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScaleOpt ""
  set tmpScrollOpt ""
  if {"$fsBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$fsBox(activeBackground)\" "
  }
  if {"$fsBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$fsBox(activeForeground)\" "
  }
  if {"$fsBox(background)" != ""} {
    append tmpButtonOpt "-background \"$fsBox(background)\" "
    append tmpFrameOpt "-background \"$fsBox(background)\" "
    append tmpMessageOpt "-background \"$fsBox(background)\" "
  }
  if {"$fsBox(font)" != ""} {
    append tmpButtonOpt "-font \"$fsBox(font)\" "
    append tmpMessageOpt "-font \"$fsBox(font)\" "
  }
  if {"$fsBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$fsBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$fsBox(foreground)\" "
  }
  if {"$fsBox(scrollActiveForeground)" != ""} {
    append tmpScrollOpt "-activebackground \"$fsBox(scrollActiveForeground)\" "
  }
  if {"$fsBox(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$fsBox(scrollBackground)\" "
  }
  if {"$fsBox(scrollForeground)" != ""} {
    append tmpScrollOpt "-background \"$fsBox(scrollForeground)\" "
  }

  if {[file exists [file tail $fsBoxFileName]] &&
      [IsAFile [file tail $fsBoxFileName]]} {
    set fsBox(name) [file tail $fsBoxFileName]
  } {
    set fsBox(name) ""
  }
  if {[file exists $fsBoxFileName] && [IsADir $fsBoxFileName]} {
    set fsBox(path) $fsBoxFileName
  } {
    if {"[file rootname $fsBoxFileName]" != "."} {
      set fsBox(path) [file rootname $fsBoxFileName]
    }
  }
  if {$fsBox(showPixmap)} {
    set fsBox(path) [string trimleft $fsBox(path) @]
  }
  if {"$fsBox(path)" != "" && [file exists $fsBox(path)] &&
      [IsADir $fsBox(path)]} {
    set fsBox(internalPath) $fsBox(path)
  } {
    if {"$fsBox(internalPath)" == "" ||
        ![file exists $fsBox(internalPath)]} {
      set fsBox(internalPath) [pwd]
    }
  }
  # build widget structure

  # start build of toplevel
  if {"[info commands CBSavedDestroy]" != ""} {
    catch {CBSavedDestroy .fsBox}
  } {
    catch {destroy .fsBox}
  }
  toplevel .fsBox     -borderwidth 0
  catch ".fsBox config $tmpFrameOpt"
  wm geometry .fsBox 350x300 
  wm title .fsBox {File select box}
  wm maxsize .fsBox 1000 1000
  wm minsize .fsBox 100 100
  # end build of toplevel

  label .fsBox.message1     -anchor c     -relief raised     -text "$fsBoxMessage"
  catch ".fsBox.message1 config $tmpMessageOpt"

  frame .fsBox.frame1     -borderwidth 0     -relief raised
  catch ".fsBox.frame1 config $tmpFrameOpt"

  button .fsBox.frame1.ok     -text "OK"     -command "
      global fsBox
      set fsBox(name) \[.fsBox.file.file get\]
      if {$fsBox(showPixmap)} {
        set fsBox(path) @\[.fsBox.path.path get\]
      } {
        set fsBox(path) \[.fsBox.path.path get\]
      }
      set fsBox(internalPath) \[.fsBox.path.path get\]
      $fsBoxActionOk
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .fsBox}
      } {
        catch {destroy .fsBox}
      }"
  catch ".fsBox.frame1.ok config $tmpButtonOpt"

  button .fsBox.frame1.rescan     -text "Rescan"     -command {
      global fsBox
      FSBoxFSShow [.fsBox.path.path get]         [.fsBox.pattern.pattern get] $fsBox(all)}
  catch ".fsBox.frame1.rescan config $tmpButtonOpt"

  button .fsBox.frame1.cancel     -text "Cancel"     -command "
      global fsBox
      set fsBox(name) {}
      set fsBox(path) {}
      $fsBoxActionCancel
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .fsBox}
      } {
        catch {destroy .fsBox}
      }"
  catch ".fsBox.frame1.cancel config $tmpButtonOpt"

  if {$fsBox(showPixmap)} {
    frame .fsBox.frame2       -borderwidth 0       -relief raised
    catch ".fsBox.frame2 config $tmpFrameOpt"

    scrollbar .fsBox.frame2.scrollbar3       -command {.fsBox.frame2.canvas2 xview}       -orient {horizontal}       -relief {raised}
    catch ".fsBox.frame2.scrollbar3 config $tmpScrollOpt"

    scrollbar .fsBox.frame2.scrollbar1       -command {.fsBox.frame2.canvas2 yview}       -relief {raised}
    catch ".fsBox.frame2.scrollbar1 config $tmpScrollOpt"

    canvas .fsBox.frame2.canvas2       -confine {true}       -relief {raised}       -scrollregion {0c 0c 20c 20c}       -width {100}       -xscrollcommand {.fsBox.frame2.scrollbar3 set}       -yscrollcommand {.fsBox.frame2.scrollbar1 set}
    catch ".fsBox.frame2.canvas2 config $tmpFrameOpt"

    .fsBox.frame2.canvas2 addtag currentBitmap withtag [.fsBox.frame2.canvas2 create bitmap 5 5 -anchor nw]
  }

  frame .fsBox.path     -borderwidth 0     -relief raised
  catch ".fsBox.path config $tmpFrameOpt"

  frame .fsBox.path.paths     -borderwidth 2     -relief raised
  catch ".fsBox.path.paths config $tmpFrameOpt"

  menubutton .fsBox.path.paths.paths     -borderwidth 0     -menu ".fsBox.path.paths.paths.menu"     -relief flat     -text "Pathname:"
  catch ".fsBox.path.paths.paths config $tmpButtonOpt"

  menu .fsBox.path.paths.paths.menu
  catch ".fsBox.path.paths.paths.menu config $tmpButtonOpt"

  .fsBox.path.paths.paths.menu add command      -label "[string trimright $fsBox(internalPath) {/@}]"      -command "
       global fsBox
       FSBoxFSShow \[.fsBox.path.path get\]          \[.fsBox.pattern.pattern get\] \$fsBox(all)
       .fsBox.path.path delete 0 end
       .fsBox.path.path insert 0 [string trimright $fsBox(internalPath) {/@}]"

  entry .fsBox.path.path     -relief raised
  catch ".fsBox.path.path config $tmpMessageOpt"

  if {![IsADir $fsBox(internalPath)]} {
    set $fsBox(internalPath) [pwd]
  }
  .fsBox.path.path insert 0 $fsBox(internalPath)

  frame .fsBox.pattern     -borderwidth 0     -relief raised
  catch ".fsBox.pattern config $tmpFrameOpt"

  frame .fsBox.pattern.patterns     -borderwidth 2     -relief raised
  catch ".fsBox.pattern.patterns config $tmpFrameOpt"

  menubutton .fsBox.pattern.patterns.patterns     -borderwidth 0     -menu ".fsBox.pattern.patterns.patterns.menu"     -relief flat     -text "Selection pattern:"
  catch ".fsBox.pattern.patterns.patterns config $tmpButtonOpt"

  menu .fsBox.pattern.patterns.patterns.menu
  catch ".fsBox.pattern.patterns.patterns.menu config $tmpButtonOpt"

  .fsBox.pattern.patterns.patterns.menu add checkbutton     -label "Scan extensions"     -variable fsBoxExtensions     -command {
      global fsBox
      FSBoxFSShow [.fsBox.path.path get]         [.fsBox.pattern.pattern get] $fsBox(all)}

  entry .fsBox.pattern.pattern     -relief raised
  catch ".fsBox.pattern.pattern config $tmpMessageOpt"

  .fsBox.pattern.pattern insert 0 $fsBox(pattern)
  
  frame .fsBox.files     -borderwidth 0     -relief raised
  catch ".fsBox.files config $tmpFrameOpt"

  scrollbar .fsBox.files.vscroll     -relief raised     -command ".fsBox.files.files yview"
  catch ".fsBox.files.vscroll config $tmpScrollOpt"

  scrollbar .fsBox.files.hscroll     -orient horiz     -relief raised     -command ".fsBox.files.files xview"
  catch ".fsBox.files.hscroll config $tmpScrollOpt"

  listbox .fsBox.files.files     -exportselection false     -relief raised     -xscrollcommand ".fsBox.files.hscroll set"     -yscrollcommand ".fsBox.files.vscroll set"
  catch ".fsBox.files.files config $tmpMessageOpt"

  frame .fsBox.file     -borderwidth 0     -relief raised
  catch ".fsBox.file config $tmpFrameOpt"

  label .fsBox.file.labelfile     -relief raised     -text "Filename:"
  catch ".fsBox.file.labelfile config $tmpMessageOpt"

  entry .fsBox.file.file     -relief raised
  catch ".fsBox.file.file config $tmpMessageOpt"

  .fsBox.file.file delete 0 end
  .fsBox.file.file insert 0 $fsBox(name)
  
  checkbutton .fsBox.pattern.all     -offvalue 0     -onvalue 1     -text "Show all files"     -variable fsBox(all)     -command {
      global fsBox
      FSBoxFSShow [.fsBox.path.path get]         [.fsBox.pattern.pattern get] $fsBox(all)}
  catch ".fsBox.pattern.all config $tmpButtonOpt"

  FSBoxFSShow $fsBox(internalPath) $fsBox(pattern) $fsBox(all)

  # bindings
  bind .fsBox.files.files <Double-Button-1> "
    FSBoxFSFileSelectDouble %W $fsBox(showPixmap) \{$fsBoxActionOk\} %y
    break"
  bind .fsBox.files.files <ButtonPress-1> "
    FSBoxFSFileSelect %W $fsBox(showPixmap) %y"
  bind .fsBox.files.files <Button1-Motion> "
    FSBoxFSFileSelect %W $fsBox(showPixmap) %y"
  bind .fsBox.files.files <Shift-Button1-Motion> "
    FSBoxFSFileSelect %W $fsBox(showPixmap) %y"
  bind .fsBox.files.files <Shift-ButtonPress-1> "
    FSBoxFSFileSelect %W $fsBox(showPixmap) %y"

  bind .fsBox.path.path <Tab> {
    FSBoxFSNameComplete path}
  bind .fsBox.path.path <Return> {
    global fsBox
    FSBoxFSShow [.fsBox.path.path get]       [.fsBox.pattern.pattern get] $fsBox(all)
    FSBoxFSInsertPath
    .fsBox.file.file icursor end
    focus .fsBox.file.file}
  catch "bind .fsBox.path.path <Up> {}"
  bind .fsBox.path.path <Down> {
    .fsBox.file.file icursor end
    focus .fsBox.file.file}

  bind .fsBox.file.file <Tab> {
    FSBoxFSNameComplete file}
  bind .fsBox.file.file <Return> "
    global fsBox
    set fsBox(name) \[.fsBox.file.file get\]
    if {$fsBox(showPixmap)} {
      set fsBox(path) @\[.fsBox.path.path get\]
    } {
      set fsBox(path) \[.fsBox.path.path get\]
    }
    set fsBox(internalPath) \[.fsBox.path.path get\]
    $fsBoxActionOk
    if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
      catch {CBSavedDestroy .fsBox}
    } {
      catch {destroy .fsBox}
    }"
  bind .fsBox.file.file <Up> {
    .fsBox.path.path icursor end
    focus .fsBox.path.path}
  bind .fsBox.file.file <Down> {
    .fsBox.pattern.pattern icursor end
    focus .fsBox.pattern.pattern}

  bind .fsBox.pattern.pattern <Return> {
    global fsBox
    FSBoxFSShow [.fsBox.path.path get]       [.fsBox.pattern.pattern get] $fsBox(all)}
  bind .fsBox.pattern.pattern <Up> {
    .fsBox.file.file icursor end
    focus .fsBox.file.file}
  catch "bind .fsBox.pattern.pattern <Down> {}"

  # packing
  pack .fsBox.files.vscroll -side $fsBox(scrollSide) -fill y
  pack .fsBox.files.hscroll -side bottom -fill x
  pack .fsBox.files.files -side left -fill both -expand 1
  pack .fsBox.file.labelfile -side left
  pack .fsBox.file.file -side left -fill both -expand 1
  pack .fsBox.frame1.ok -side left -fill both -expand 1
  pack .fsBox.frame1.rescan -side left -fill both -expand 1
  pack .fsBox.frame1.cancel -side left -fill both -expand 1
  pack .fsBox.path.paths.paths -side left
  pack .fsBox.pattern.patterns.patterns -side left
  pack .fsBox.path.paths -side left
  pack .fsBox.path.path -side left -fill both -expand 1
  pack .fsBox.pattern.patterns -side left
  pack .fsBox.pattern.all -side right -fill both
  pack .fsBox.pattern.pattern -side left -fill both -expand 1
  if {$fsBox(showPixmap)} {
    pack .fsBox.frame2.scrollbar1 -side left -fill y
    pack .fsBox.frame2.canvas2 -side top -fill both -expand 1
    pack .fsBox.frame2.scrollbar3 -side top -fill x

    pack .fsBox.message1 -side top -fill both
    pack .fsBox.frame1 -side bottom -fill both
    pack .fsBox.pattern -side bottom -fill both
    pack .fsBox.file -side bottom -fill both
    pack .fsBox.path -side bottom -fill both
    pack .fsBox.frame2 -side right -fill both
    pack .fsBox.files -side left -fill both -expand 1
  } {
    pack .fsBox.message1 -side top -fill both
    pack .fsBox.frame1 -side bottom -fill both
    pack .fsBox.pattern -side bottom -fill both
    pack .fsBox.file -side bottom -fill both
    pack .fsBox.path -side bottom -fill both
    pack .fsBox.files -side left -fill both -expand 1
  }

  if {"$fsBoxActionOk" == "" && "$fsBoxActionCancel" == ""} {
    # wait for the box to be destroyed
    update idletask
    grab .fsBox
    tkwait window .fsBox

    if {"[string trim $fsBox(path)]" != "" ||
        "[string trim $fsBox(name)]" != ""} {
      if {"[string trimleft [string trim $fsBox(name)] /]" == ""} {
        return [string trimright [string trim $fsBox(path)] /]
      } {
        return [string trimright [string trim $fsBox(path)] /]/[string trimleft [string trim $fsBox(name)] /]
      }
    }
  }
}


# Procedure: FSBoxBindSelectOne
proc FSBoxBindSelectOne { fsBoxW fsBoxY} {

  set fsBoxNearest [$fsBoxW nearest $fsBoxY]
  if {$fsBoxNearest >= 0} {
    $fsBoxW select clear 0 end
    $fsBoxW select set $fsBoxNearest
  }
}


# Procedure: FSBoxFSFileSelect
proc FSBoxFSFileSelect { fsBoxW fsBoxShowPixmap fsBoxY} {
  global fsBox

  FSBoxBindSelectOne $fsBoxW $fsBoxY
  set fsBoxNearest [$fsBoxW nearest $fsBoxY]
  if {$fsBoxNearest >= 0} {
    set fsBoxTmpEntry [$fsBoxW get $fsBoxNearest]
    if {"[string index $fsBoxTmpEntry           [expr [string length $fsBoxTmpEntry]-1]]" == "/" ||
        "[string index $fsBoxTmpEntry           [expr [string length $fsBoxTmpEntry]-1]]" == "@"} {
      set fsBoxFileName [string range $fsBoxTmpEntry 0             [expr [string length $fsBoxTmpEntry]-2]]
      if {![IsADir [string trimright $fsBox(internalPath)/$fsBoxFileName @]] &&
          ![IsASymlink [string trimright $fsBox(internalPath)/$fsBoxFileName @]]} {
        set fsBoxFileName $fsBoxTmpEntry
      }
    } {
      if {"[string index $fsBoxTmpEntry             [expr [string length $fsBoxTmpEntry]-1]]" == "*"} {
        set fsBoxFileName [string range $fsBoxTmpEntry 0           [expr [string length $fsBoxTmpEntry]-2]]
        if {![file executable $fsBox(internalPath)/$fsBoxFileName]} {
          set fsBoxFileName $fsBoxTmpEntry
        }
      } {
        set fsBoxFileName $fsBoxTmpEntry
      }
    }
    if {![IsADir [string trimright $fsBox(internalPath)/$fsBoxFileName @]]} {
      set fsBox(name) $fsBoxFileName
      .fsBox.file.file delete 0 end
      .fsBox.file.file insert 0 $fsBox(name)
      if {$fsBoxShowPixmap} {
        catch ".fsBox.frame2.canvas2 itemconfigure currentBitmap -bitmap \"@$fsBox(internalPath)/$fsBox(name)\""
      }
    }
  }
}


# Procedure: FSBoxFSFileSelectDouble
proc FSBoxFSFileSelectDouble { fsBoxW fsBoxShowPixmap fsBoxAction fsBoxY} {
  global fsBox

  FSBoxBindSelectOne $fsBoxW $fsBoxY
  set fsBoxNearest [$fsBoxW nearest $fsBoxY]
  if {$fsBoxNearest >= 0} {
    set fsBoxTmpEntry [$fsBoxW get $fsBoxNearest]
    if {"$fsBoxTmpEntry" == "../"} {
      set fsBoxTmpEntry [string trimright [string trim $fsBox(internalPath)] "@/"]
      if {"$fsBoxTmpEntry" == ""} {
        return
      }
      FSBoxFSShow [file dirname $fsBoxTmpEntry]         [.fsBox.pattern.pattern get] $fsBox(all)
      .fsBox.path.path delete 0 end
      .fsBox.path.path insert 0 $fsBox(internalPath)
    } {
      if {"[string index $fsBoxTmpEntry             [expr [string length $fsBoxTmpEntry]-1]]" == "/" ||
          "[string index $fsBoxTmpEntry             [expr [string length $fsBoxTmpEntry]-1]]" == "@"} {
        set fsBoxFileName [string range $fsBoxTmpEntry 0               [expr [string length $fsBoxTmpEntry]-2]]
        if {![IsADir [string trimright $fsBox(internalPath)/$fsBoxFileName @]] &&
            ![IsASymlink [string trimright $fsBox(internalPath)/$fsBoxFileName @]]} {
          set fsBoxFileName $fsBoxTmpEntry
        }
      } {
        if {"[string index $fsBoxTmpEntry               [expr [string length $fsBoxTmpEntry]-1]]" == "*"} {
          set fsBoxFileName [string range $fsBoxTmpEntry 0                 [expr [string length $fsBoxTmpEntry]-2]]
          if {![file executable $fsBox(internalPath)/$fsBoxFileName]} {
            set fsBoxFileName $fsBoxTmpEntry
          }
        } {
          set fsBoxFileName $fsBoxTmpEntry
        }
      }
      if {[IsADir [string trimright $fsBox(internalPath)/$fsBoxFileName @]]} {
        set fsBox(internalPath) "[string trimright $fsBox(internalPath) {/@}]/$fsBoxFileName"
        FSBoxFSShow $fsBox(internalPath)           [.fsBox.pattern.pattern get] $fsBox(all)
        .fsBox.path.path delete 0 end
        .fsBox.path.path insert 0 $fsBox(internalPath)
      } {
        set fsBox(name) $fsBoxFileName
        if {$fsBoxShowPixmap} {
          set fsBox(path) @$fsBox(internalPath)
        } {
          set fsBox(path) $fsBox(internalPath)
        }
        if {"$fsBoxAction" != ""} {
          eval "global fsBox; $fsBoxAction"
        }
        if {"[info commands CBSavedDestroy]" != ""} {
          catch {CBSavedDestroy .fsBox}
        } {
          catch {destroy .fsBox}
        }
      }
    }
  }
}


# Procedure: FSBoxFSInsertPath
proc FSBoxFSInsertPath {} {
  global fsBox

  set fsBoxLast [.fsBox.path.paths.paths.menu index last]
  set fsBoxNewEntry [string trimright [.fsBox.path.path get] "/@"]
  for {set fsBoxCounter 0} {$fsBoxCounter <= $fsBoxLast} {incr fsBoxCounter 1} {
    if {"$fsBoxNewEntry" ==           "[lindex [.fsBox.path.paths.paths.menu entryconfigure                     $fsBoxCounter -label] 4]"} {
      return
    }
  }
  if {$fsBoxLast < 9} {
    .fsBox.path.paths.paths.menu add command       -label "$fsBoxNewEntry"       -command "
        global fsBox
        FSBoxFSShow $fsBoxNewEntry           \[.fsBox.pattern.pattern get\] \$fsBox(all)
        .fsBox.path.path delete 0 end
        .fsBox.path.path insert 0 $fsBoxNewEntry"
  } {
    for {set fsBoxCounter 0} {$fsBoxCounter < $fsBoxLast} {incr fsBoxCounter 1} {
      .fsBox.path.paths.paths.menu entryconfigure         $fsBoxCounter -label           [lindex [.fsBox.path.paths.paths.menu entryconfigure             [expr $fsBoxCounter+1] -label] 4]
      .fsBox.path.paths.paths.menu entryconfigure $fsBoxCounter         -command "
          global fsBox
          FSBoxFSShow [lindex [.fsBox.path.paths.paths.menu entryconfigure             [expr $fsBoxCounter+1] -label] 4]             \[.fsBox.pattern.pattern get\] \$fsBox(all)
          .fsBox.path.path delete 0 end
          .fsBox.path.path insert 0 [lindex             [.fsBox.path.paths.paths.menu entryconfigure               [expr $fsBoxCounter+1] -label] 4]"
    }
    .fsBox.path.paths.paths.menu entryconfigure $fsBoxLast       -label "$fsBoxNewEntry"
    .fsBox.path.paths.paths.menu entryconfigure $fsBoxCounter       -command "
        global fsBox
        FSBoxFSShow \[.fsBox.path.path get\]           \[.fsBox.pattern.pattern get\] \$fsBox(all)
        .fsBox.path.path delete 0 end
        .fsBox.path.path insert 0 $fsBoxNewEntry"
  }
}


# Procedure: FSBoxFSNameComplete
proc FSBoxFSNameComplete { fsBoxType} {
  global fsBox

  set fsBoxNewFile ""
  if {"$fsBoxType" == "path"} {
    set fsBoxDirName [file dirname [.fsBox.path.path get]]
    set fsBoxFileName [file tail [.fsBox.path.path get]]
  } {
    set fsBoxDirName [file dirname [.fsBox.path.path get]/]
    set fsBoxFileName [file tail [.fsBox.file.file get]]
  }

  set fsBoxNewFile ""
  if {[IsADir [string trimright $fsBoxDirName @]]} {
    catch "glob -nocomplain $fsBoxDirName/${fsBoxFileName}*" fsBoxResult
    foreach fsBoxCounter $fsBoxResult {
      if {"$fsBoxNewFile" == ""} {
        set fsBoxNewFile [file tail $fsBoxCounter]
      } {
        if {"[string index [file tail $fsBoxCounter] 0]" !=
            "[string index $fsBoxNewFile 0]"} {
          set fsBoxNewFile ""
          break
        }
        set fsBoxCounter1 0
        set fsBoxTmpFile1 $fsBoxNewFile
        set fsBoxTmpFile2 [file tail $fsBoxCounter]
        set fsBoxLength1 [string length $fsBoxTmpFile1]
        set fsBoxLength2 [string length $fsBoxTmpFile2]
        set fsBoxNewFile ""
        if {$fsBoxLength1 > $fsBoxLength2} {
          set fsBoxLength1 $fsBoxLength2
        }
        while {$fsBoxCounter1 < $fsBoxLength1} {
          if {"[string index $fsBoxTmpFile1 $fsBoxCounter1]" ==                 "[string index $fsBoxTmpFile2 $fsBoxCounter1]"} {
            append fsBoxNewFile [string index $fsBoxTmpFile1 $fsBoxCounter1]
          } {
            break
          }
          incr fsBoxCounter1 1
        }
      }
    }
  }
  if {"$fsBoxNewFile" != ""} {
    if {[IsADir [string trimright $fsBoxDirName/$fsBoxNewFile @]] ||
        ![IsAFile [string trimright $fsBoxDirName/$fsBoxNewFile @]]} {
      if {[IsADir [string trimright $fsBoxDirName/$fsBoxNewFile @]]} {
        if {"$fsBoxDirName" == "/"} {
          .fsBox.path.path delete 0 end
          .fsBox.path.path insert 0 "/[string trimright [string trim $fsBoxNewFile /] @]/"
        } {
          .fsBox.path.path delete 0 end
          .fsBox.path.path insert 0 "[string trimright $fsBoxDirName /]/[string trimright [string trim $fsBoxNewFile /] @]/"
        }
        FSBoxFSShow [.fsBox.path.path get]           [.fsBox.pattern.pattern get] $fsBox(all)
        FSBoxFSInsertPath
      } {
        .fsBox.path.path delete 0 end
        .fsBox.path.path insert 0 "[string trimright $fsBoxDirName /]/[string trimright [string trim $fsBoxNewFile /] @]"
      }
    } {
      .fsBox.path.path delete 0 end
      .fsBox.path.path insert 0 "[string trimright $fsBoxDirName {@/}]/"
      .fsBox.file.file delete 0 end
      .fsBox.file.file insert 0 $fsBoxNewFile
      .fsBox.file.file icursor end
      focus .fsBox.file.file
    }
  }
}


# Procedure: FSBoxFSShow
proc FSBoxFSShow { fsBoxPath fsBoxPattern fsBoxAll} {
  global fsBox

  set tmpButtonOpt ""
  if {"$fsBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$fsBox(activeBackground)\" "
  }
  if {"$fsBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$fsBox(activeForeground)\" "
  }
  if {"$fsBox(background)" != ""} {
    append tmpButtonOpt "-background \"$fsBox(background)\" "
  }
  if {"$fsBox(font)" != ""} {
    append tmpButtonOpt "-font \"$fsBox(font)\" "
  }
  if {"$fsBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$fsBox(foreground)\" "
  }

  set fsBox(pattern) $fsBoxPattern
  if {[file exists $fsBoxPath] && [file readable $fsBoxPath] &&
      [IsADir $fsBoxPath]} {
    set fsBox(internalPath) $fsBoxPath
  } {
    if {[file exists $fsBoxPath] && [file readable $fsBoxPath] &&
        [IsAFile $fsBoxPath]} {
      set fsBox(internalPath) [file dirname $fsBoxPath]
      .fsBox.file.file delete 0 end
      .fsBox.file.file insert 0 [file tail $fsBoxPath]
      set fsBoxPath $fsBox(internalPath)
    } {
      while {"$fsBoxPath" != "" && "$fsBoxPath" != "/" &&
             ![file isdirectory $fsBoxPath]} {
        set fsBox(internalPath) [file dirname $fsBoxPath]
         set fsBoxPath $fsBox(internalPath)
      }
    }
  }
  if {"$fsBoxPath" == ""} {
    set fsBoxPath "/"
    set fsBox(internalPath) "/"
  }
  .fsBox.path.path delete 0 end
  .fsBox.path.path insert 0 $fsBox(internalPath)

  if {[.fsBox.files.files size] > 0} {
    .fsBox.files.files delete 0 end
  }
  if {$fsBoxAll} {
    if {[catch "exec ls -F -a $fsBoxPath" fsBoxResult]} {
      puts stderr $fsBoxResult
    }
  } {
    if {[catch "exec ls -F $fsBoxPath" fsBoxResult]} {
      puts stderr $fsBoxResult
    }
  }
  set fsBoxElementList [lsort $fsBoxResult]

  foreach fsBoxCounter [winfo children .fsBox.pattern.patterns.patterns] {
    if {[string length [info commands CBSavedDestroy]] > 0} {
      catch {CBSavedDestroy $fsBoxCounter}
    } {
      catch {destroy $fsBoxCounter}
    }
  }
  menu .fsBox.pattern.patterns.patterns.menu
  catch ".fsBox.pattern.patterns.patterns.menu config $tmpButtonOpt"

  if {$fsBox(extensions)} {
    .fsBox.pattern.patterns.patterns.menu add command       -label "*"       -command {
        global fsBox
        set fsBox(pattern) "*"
        .fsBox.pattern.pattern delete 0 end
        .fsBox.pattern.pattern insert 0 $fsBox(pattern)
        FSBoxFSShow [.fsBox.path.path get] $fsBox(pattern)           $fsBox(all)}
  }

  if {"$fsBoxPath" != "/"} {
    .fsBox.files.files insert end "../"
  }
  foreach fsBoxCounter $fsBoxElementList {
    if {[string match $fsBoxPattern $fsBoxCounter] ||
        [IsADir [string trimright $fsBoxPath/$fsBoxCounter "/@"]]} {
      if {"$fsBoxCounter" != "../" &&
          "$fsBoxCounter" != "./"} {
        .fsBox.files.files insert end $fsBoxCounter
      }
    }

    if {$fsBox(extensions)} {
      catch "file rootname $fsBoxCounter" fsBoxRootName
      catch "file extension $fsBoxCounter" fsBoxExtension
      set fsBoxExtension [string trimright $fsBoxExtension "/*@"]
      if {"$fsBoxExtension" != "" && "$fsBoxRootName" != ""} {
        set fsBoxInsert 1
        set fsBoxLast [.fsBox.pattern.patterns.patterns.menu index last]
        for {set fsBoxCounter1 0} {$fsBoxCounter1 <= $fsBoxLast} {incr fsBoxCounter1 1} {
          if {"*$fsBoxExtension" ==                 "[lindex [.fsBox.pattern.patterns.patterns.menu entryconfigure                         $fsBoxCounter1 -label] 4]"} {
            set fsBoxInsert 0
          }
        }
	if {$fsBoxInsert} {
          .fsBox.pattern.patterns.patterns.menu add command             -label "*$fsBoxExtension"             -command "
              global fsBox
              set fsBox(pattern) \"*$fsBoxExtension\"
              .fsBox.pattern.pattern delete 0 end
              .fsBox.pattern.pattern insert 0 \$fsBox(pattern)
              FSBoxFSShow \[.fsBox.path.path get\] \$fsBox(pattern)                 \$fsBox(all)"
        }
      }
    }
  }
  if {$fsBox(extensions)} {
    .fsBox.pattern.patterns.patterns.menu add separator
  }
  if {$fsBox(extensions) || 
      "[.fsBox.pattern.patterns.patterns.menu index last]" == "none"} {
    .fsBox.pattern.patterns.patterns.menu add checkbutton       -label "Scan extensions"       -variable "fsBox(extensions)"       -command {
        global fsBox
        FSBoxFSShow [.fsBox.path.path get]           [.fsBox.pattern.pattern get] $fsBox(all)}
  }
}


# Procedure: FontBox
proc FontBox { {fontBoxFileFont "/usr/local/lib/CIMBuilder/cb/Fonts"} {fontBoxMessage "Font"} {fontBoxEntryW ""} {fontBoxTargetW ""}} {
##########
# Procedure: FontBox
# Description: select a font
# Arguments: {fontBoxFileFont} - the font file with all fontnames
#            {fontBoxMessage} - a message to display
#            {fontBoxEntryW} - the widget name for the resulting font name
#            {fontBoxTargetW} - the widget we configure
# Returns: fontname, or nothing
# Sideeffects: none
##########
# 
# global fontBox(activeBackground) - active background color
# global fontBox(activeForeground) - active foreground color
# global fontBox(background) - background color
# global fontBox(font) - text font
# global fontBox(foreground) - foreground color
# global fontBox(scrollActiveForeground) - scrollbar active background color
# global fontBox(scrollBackground) - scrollbar background color
# global fontBox(scrollForeground) - scrollbar foreground color
# global fontBox(scrollSide) - side where scrollbar is located

  global fontBox

  set fontBox(fontName) ""
  set fontBox(fontFamily) *
  set fontBox(fontPixels) *
  set fontBox(fontSlant) *
  set fontBox(fontSWidth) *
  set fontBox(fontWeight) *

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScrollOpt ""
  if {"$fontBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$fontBox(activeBackground)\" "
  }
  if {"$fontBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$fontBox(activeForeground)\" "
  }
  if {"$fontBox(background)" != ""} {
    append tmpButtonOpt "-background \"$fontBox(background)\" "
    append tmpFrameOpt "-background \"$fontBox(background)\" "
    append tmpMessageOpt "-background \"$fontBox(background)\" "
  }
  if {"$fontBox(font)" != ""} {
    append tmpButtonOpt "-font \"$fontBox(font)\" "
    append tmpMessageOpt "-font \"$fontBox(font)\" "
  }
  if {"$fontBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$fontBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$fontBox(foreground)\" "
  }
  if {"$fontBox(scrollActiveForeground)" != ""} {
    append tmpScrollOpt "-activebackground \"$fontBox(scrollActiveForeground)\" "
  }
  if {"$fontBox(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$fontBox(scrollBackground)\" "
  }
  if {"$fontBox(scrollForeground)" != ""} {
    append tmpScrollOpt "-background \"$fontBox(scrollForeground)\" "
  }

  set fontBoxTmpFileFont $fontBoxFileFont 
  # get font file name
  if {!([file exists $fontBoxFileFont] &&
        [file readable $fontBoxFileFont])} {
    set fontBoxFileFont ""
  }
  if {"$fontBoxFileFont" == ""} {
    global env
    if {[info exists env(CB_FONT_FILE)]} {
      if {[file exists $env(CB_FONT_FILE)] &&
          [file readable $env(CB_FONT_FILE)]} {
        set fontBoxFileFont $env(CB_FONT_FILE)
      }
    }
  }
  if {"$fontBoxMessage" == ""} {
    set fontBoxMessage "Font"
  }

  # save the the current widget color
  if {"$fontBoxTargetW" != ""} {
    if {[catch "$fontBoxTargetW config -font" result]} {
      set fontBoxSavedFont ""
    } {
      set fontBoxSavedFont [lindex $result 4]
    }
  } {
    set fontBoxSavedFont ""
  }

  # look if there is already a font window
  if {"[info commands .fontBox]" == ""} {
    # build widget structure

    # start build of toplevel
    if {"[info commands CBSavedDestroy]" != ""} {
      catch {CBSavedDestroy .fontBox}
    } {
      catch {destroy .fontBox}
    }
    toplevel .fontBox       -borderwidth 0
    catch ".fontBox config $tmpFrameOpt"
    wm geometry .fontBox 600x300
    wm title .fontBox {Font box}
    wm maxsize .fontBox 1000 1000
    wm minsize .fontBox 100 100
    # end build of toplevel

    set fontBox(oldWidget) $fontBoxEntryW

    frame .fontBox.frame1       -borderwidth 0       -relief raised
    catch ".fontBox.frame1 config $tmpFrameOpt"

    frame .fontBox.frame2       -borderwidth 2       -relief raised
    catch ".fontBox.frame2 config $tmpFrameOpt"

    button .fontBox.frame1.ok       -text "OK"
    catch ".fontBox.frame1.ok config $tmpButtonOpt"

    button .fontBox.frame1.rescan       -text "Rescan fonts"       -command "
        if {\"$fontBoxTmpFileFont\" != \"\"} {
          catch \"exec xlsfonts > $fontBoxTmpFileFont\"
          if {\[.fontBox.fonts.fonts size\] > 0} {
            .fontBox.fonts.fonts delete 0 end
          }
          if {\[catch \"open $fontBoxTmpFileFont r\" fontInFile\]} {
            if {\"\[info commands AlertBox\]\" != \"\"} {
              AlertBox \"\$fontInFile\"
            } {
              puts stderr \"\$fontInFile\"
            }
          } {
            set fontReadList \[read \$fontInFile\]
            close \$fontInFile
            foreach fontLine \[split \$fontReadList \"\\n\"\] {
              if {\"\[string trim \$fontLine\]\" != \"\"} {
                .fontBox.fonts.fonts insert end \$fontLine
              }
            }
          }
        }"
    catch ".fontBox.frame1.rescan config $tmpButtonOpt"

    button .fontBox.frame1.cancel       -text "Cancel"
    catch ".fontBox.frame1.cancel config $tmpButtonOpt"

    label .fontBox.demo       -relief raised       -text "This text shows the results :-)"
    catch ".fontBox.demo config $tmpMessageOpt"

    frame .fontBox.current       -borderwidth 0       -relief raised
    catch ".fontBox.current config $tmpFrameOpt"

    label .fontBox.current.labelcurrent       -relief raised
    catch ".fontBox.current.labelcurrent config $tmpMessageOpt"

    entry .fontBox.current.current       -relief raised
    catch ".fontBox.current.current config $tmpMessageOpt"

    frame .fontBox.fonts       -borderwidth 0       -relief raised
    catch ".fontBox.fonts config $tmpFrameOpt"

    scrollbar .fontBox.fonts.vscroll       -relief raised       -command ".fontBox.fonts.fonts yview"
    catch ".fontBox.fonts.vscroll config $tmpScrollOpt"

    scrollbar .fontBox.fonts.hscroll       -orient horiz       -relief raised       -command ".fontBox.fonts.fonts xview"
    catch ".fontBox.fonts.hscroll config $tmpScrollOpt"

    listbox .fontBox.fonts.fonts       -exportselection false       -relief raised       -xscrollcommand ".fontBox.fonts.hscroll set"       -yscrollcommand ".fontBox.fonts.vscroll set"
    catch ".fontBox.fonts.fonts config $tmpMessageOpt"

    # family menu
    menubutton .fontBox.frame2.family       -text "Family"       -menu ".fontBox.frame2.family.m"
    catch ".fontBox.frame2.family config $tmpButtonOpt"

    menu .fontBox.frame2.family.m
    catch ".fontBox.frame2.family.m config $tmpButtonOpt"

    .fontBox.frame2.family.m add radiobutton       -label "*"       -value "*"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "charter"       -value "charter"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "courier"       -value "courier"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "fixed"       -value "fixed"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "helvetica"       -value "helvetica"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "lucida"       -value "lucida"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "terminal"       -value "terminal"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"
    .fontBox.frame2.family.m add radiobutton       -label "times"       -value "times"       -variable fontBox(fontFamily)       -command "FontBoxComposeFont"

    # weight menu
    menubutton .fontBox.frame2.weight       -text "Weight"       -menu ".fontBox.frame2.weight.m"
    catch ".fontBox.frame2.weight config $tmpButtonOpt"

    menu .fontBox.frame2.weight.m
    catch ".fontBox.frame2.weight.m config $tmpButtonOpt"

    .fontBox.frame2.weight.m add radiobutton       -label "*"       -value "*"       -variable fontBox(fontWeight)       -command "FontBoxComposeFont"
    .fontBox.frame2.weight.m add radiobutton       -label "bold"       -value "bold"       -variable fontBox(fontWeight)       -command "FontBoxComposeFont"
    .fontBox.frame2.weight.m add radiobutton       -label "demibold"       -value "demibold"       -variable fontBox(fontWeight)       -command "FontBoxComposeFont"
    .fontBox.frame2.weight.m add radiobutton       -label "medium"       -value "medium"       -variable fontBox(fontWeight)       -command "FontBoxComposeFont"

    # Slant menu
    menubutton .fontBox.frame2.slant       -text "Slant"       -menu ".fontBox.frame2.slant.m"
    catch ".fontBox.frame2.slant config $tmpButtonOpt"

    menu .fontBox.frame2.slant.m
    catch ".fontBox.frame2.slant.m config $tmpButtonOpt"

    .fontBox.frame2.slant.m add radiobutton       -label "*"       -value "*"       -variable fontBox(fontSlant)       -command "FontBoxComposeFont"
    .fontBox.frame2.slant.m add radiobutton       -label "i"       -value "i"       -variable fontBox(fontSlant)       -command "FontBoxComposeFont"
    .fontBox.frame2.slant.m add radiobutton       -label "o"       -value "o"       -variable fontBox(fontSlant)       -command "FontBoxComposeFont"
    .fontBox.frame2.slant.m add radiobutton       -label "r"       -value "r"       -variable fontBox(fontSlant)       -command "FontBoxComposeFont"

    # Set width menu
    menubutton .fontBox.frame2.swidth       -text "Set width"       -menu ".fontBox.frame2.swidth.m"
    catch ".fontBox.frame2.swidth config $tmpButtonOpt"

    menu .fontBox.frame2.swidth.m
    catch ".fontBox.frame2.swidth.m config $tmpButtonOpt"

    .fontBox.frame2.swidth.m add radiobutton       -label "*"       -value "*"       -variable fontBox(fontSWidth)       -command "FontBoxComposeFont"
    .fontBox.frame2.swidth.m add radiobutton       -label "normal"       -value "normal"       -variable fontBox(fontSWidth)       -command "FontBoxComposeFont"
    .fontBox.frame2.swidth.m add radiobutton       -label "semicondensed"       -value "semicondensed"       -variable fontBox(fontSWidth)       -command "FontBoxComposeFont"

    # pixels menu
    menubutton .fontBox.frame2.pixels       -text "Pixels"       -menu ".fontBox.frame2.pixels.m"
    catch ".fontBox.frame2.pixels config $tmpButtonOpt"

    menu .fontBox.frame2.pixels.m
    catch ".fontBox.frame2.pixels.m config $tmpButtonOpt"

    .fontBox.frame2.pixels.m add radiobutton       -label "*"       -value "*"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "6 pixels"       -value "6"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "8 pixels"       -value "8"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "10 pixels"       -value "10"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "12 pixels"       -value "12"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "13 pixels"       -value "13"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "14 pixels"       -value "14"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "16 pixels"       -value "16"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "18 pixels"       -value "18"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "24 pixels"       -value "24"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "28 pixels"       -value "28"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"
    .fontBox.frame2.pixels.m add radiobutton       -label "30 pixels"       -value "30"       -variable fontBox(fontPixels)       -command "FontBoxComposeFont"

    # read font file
    if {"$fontBoxFileFont" != ""} {
      if {[catch "open $fontBoxFileFont r" fontInFile]} {
        set fontBoxFileFont ""
        if {"[info commands AlertBox]" != ""} {
          AlertBox "$fontInFile"
        } {
          puts stderr "$fontInFile"
        }
      } {
        set fontReadList [read $fontInFile]
        close $fontInFile
        foreach fontLine [split $fontReadList "\n"] {
          if {"[string trim $fontLine]" != ""} {
            .fontBox.fonts.fonts insert end $fontLine
          }
        }
      }
    }
  } {
    if {"[winfo class $fontBox(oldWidget)]" == "Text"} {
      catch "$fontBox(oldWidget) delete 1.0 end"
      catch "$fontBox(oldWidget) insert 1.0 [.fontBox.current.current get]"
    } {
      if {"[winfo class $fontBox(oldWidget)]" == "Entry"} {
        catch "$fontBox(oldWidget) delete 0 end"
        catch "$fontBox(oldWidget) insert 0 [.fontBox.current.current get]"
      }
    }

    set fontBox(oldWidget) $fontBoxEntryW
  }

  .fontBox.frame1.ok config     -command "
      global fontBox
      set fontBox(fontName) \[.fontBox.current.current get\]
      if {\"$fontBoxEntryW\" != \"\"} {
        if {\"\[winfo class $fontBoxEntryW\]\" == \"Text\"} {
          catch \"$fontBoxEntryW delete 1.0 end\"
          catch \"$fontBoxEntryW insert 1.0 \\\"\$fontBox(fontName)\\\"\"
        } {
          if {\"\[winfo class $fontBoxEntryW\]\" == \"Entry\"} {
            catch \"$fontBoxEntryW delete 0 end\"
            catch \"$fontBoxEntryW insert 0 \\\"\$fontBox(fontName)\\\"\"
          }
        }
      }
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .fontBox}
      } {
        catch {destroy .fontBox}
      }"

  .fontBox.frame1.cancel config     -command "
      global fontBox
      set fontBox(fontName) {}
      if {\"$fontBoxTargetW\" != \"\"} {
        catch \"$fontBoxTargetW config -font $fontBoxSavedFont\"
      }
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .fontBox}
      } {
        catch {destroy .fontBox}
      }"

  .fontBox.current.labelcurrent config     -text "$fontBoxMessage:"

  # bindings
  bind .fontBox.current.current <Return> "
    FontBoxSetFont \"$fontBoxTargetW\""

  bind .fontBox.fonts.fonts <Double-1> "
    FontBoxSelectFont %W \"$fontBoxTargetW\" %y
    global fontBox
    set fontBox(fontName) \[.fontBox.current.current get\]
    if {\"$fontBoxEntryW\" != \"\"} {
      if {\"\[winfo class $fontBoxEntryW\]\" == \"Text\"} {
        catch \"$fontBoxEntryW delete 1.0 end\"
        catch \"$fontBoxEntryW insert 1.0 \\\"\$fontBox(fontName)\\\"\"
      } {
        if {\"\[winfo class $fontBoxEntryW\]\" == \"Entry\"} {
          catch \"$fontBoxEntryW delete 0 end\"
          catch \"$fontBoxEntryW insert 0 \\\"\$fontBox(fontName)\\\"\"
        }
      }
    }
    if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
      catch {CBSavedDestroy .fontBox}
    } {
      catch {destroy .fontBox}
    }
    break"
  bind .fontBox.fonts.fonts <ButtonPress-1> "
    FontBoxSelectFont %W \"$fontBoxTargetW\" %y"
  bind .fontBox.fonts.fonts <Button1-Motion> "
    FontBoxSelectFont %W \"$fontBoxTargetW\" %y"
  bind .fontBox.fonts.fonts <Shift-ButtonPress-1> "
    FontBoxSelectFont %W \"$fontBoxTargetW\" %y"
  bind .fontBox.fonts.fonts <Shift-Button1-Motion> "
    FontBoxSelectFont %W \"$fontBoxTargetW\" %y"

  # set up current value
  .fontBox.current.current delete 0 end
  if {"$fontBoxEntryW" != ""} {
    if {"[winfo class $fontBoxEntryW]" == "Text"} {
      .fontBox.current.current insert 0 [$fontBoxEntryW get 1.0 end]
    } {
      if {"[winfo class $fontBoxEntryW]" == "Entry"} {
        .fontBox.current.current insert 0 [$fontBoxEntryW get]
      }
    }
  }

  # packing
  pack .fontBox.frame1.ok -side left -fill both -expand 1
  pack .fontBox.frame1.rescan -side left -fill both -expand 1
  pack .fontBox.frame1.cancel -side left -fill both -expand 1
  pack .fontBox.frame2.family -side left
  pack .fontBox.frame2.weight -side left
  pack .fontBox.frame2.slant -side left
  pack .fontBox.frame2.swidth -side left
  pack .fontBox.frame2.pixels -side left
  pack .fontBox.current.labelcurrent -side left
  pack .fontBox.current.current -side left -fill both -expand 1
  pack .fontBox.fonts.vscroll -side $fontBox(scrollSide) -fill y
  pack .fontBox.fonts.hscroll -side bottom -fill x
  pack .fontBox.fonts.fonts -side left -fill both -expand 1

  if {"$fontBoxFileFont" != ""} {
    pack .fontBox.frame1 -side bottom -fill x
    pack .fontBox.current -side bottom -fill x
    pack .fontBox.demo -side bottom -fill x
    pack .fontBox.frame2 -side top -fill both
    pack .fontBox.fonts -side left -fill both -expand 1
  } {
    wm geometry .fontBox 400x90
    pack .fontBox.frame1 -side bottom -fill x
    pack .fontBox.current -side bottom -fill x
    pack .fontBox.frame2 -side top -fill both
    pack .fontBox.demo -side bottom -fill both -expand 1
  }
  catch "wm deiconify .fontBox"

  if {"$fontBoxEntryW" == ""} {
    # wait for the box to be destroyed
    update idletask
    grab .fontBox
    tkwait window .fontBox

    return $fontBox(fontName)
  }
}


# Procedure: FontBoxComposeFont
proc FontBoxComposeFont {} {
  global fontBox
  
  if {"$fontBox(fontFamily)" != "*"} {
    append fontNewFont * $fontBox(fontFamily)
  } {
    append fontNewFont *
  }
  if {"$fontBox(fontWeight)" != "*"} {
    append fontNewFont - $fontBox(fontWeight)
  } {
    append fontNewFont - *
  }
  if {"$fontBox(fontSlant)" != "*"} {
    append fontNewFont - $fontBox(fontSlant)
  } {
    append fontNewFont - *
  }
  if {"$fontBox(fontSWidth)" != "*"} {
    append fontNewFont - $fontBox(fontSWidth)
  } {
    append fontNewFont - *
  }
  append fontNewFont - *
  if {"$fontBox(fontPixels)" != "*"} {
    append fontNewFont - $fontBox(fontPixels)
  } {
    append fontNewFont -
  }
  append fontNewFont *

  .fontBox.current.current delete 0 end
  .fontBox.current.current insert 0 $fontNewFont
  catch ".fontBox.demo config     -font $fontNewFont"
}


# Procedure: FontBoxSelectFont
proc FontBoxSelectFont { fontBoxW fontBoxTargetW fontBoxY} {

  set fontBoxNearest [$fontBoxW nearest $fontBoxY]
  if {$fontBoxNearest >= 0} {
    $fontBoxW select clear 0 end
    $fontBoxW select set $fontBoxNearest
    .fontBox.current.current delete 0 end
    .fontBox.current.current insert 0 [$fontBoxW get $fontBoxNearest]
    FontBoxSetFont "$fontBoxTargetW"
  }
}


# Procedure: FontBoxSetFont
proc FontBoxSetFont { fontBoxTargetW} {

  if {"[.fontBox.current.current get]" != ""} {
    catch ".fontBox.demo config -font       [.fontBox.current.current get]"
    if {"$fontBoxTargetW" != ""} {
      catch "$fontBoxTargetW config -font         [.fontBox.current.current get]"
    }
  }
}


# Procedure: GetSelection
if {"[info procs GetSelection]" == ""} {
proc GetSelection {} {
##########
# Procedure: GetSelection
# Description: get current selection
# Arguments: none
# Returns: none
# Sideeffects: none
##########

  # the save way
  set cbSelection ""
  catch "selection get" cbSelection
  if {"$cbSelection" == "selection doesn't exist or form \"STRING\" not defined"} {
    return ""
  } {
    return $cbSelection
  }
}
}


# Procedure: IsADir
proc IsADir { pathName} {
##########
# Procedure: IsADir
# Description: check if name is a directory (including symbolic links)
# Arguments: pathName - the path to check
# Returns: 1 if its a directory, otherwise 0
# Sideeffects: none
##########

  if {[file isdirectory $pathName]} {
    return 1
  } {
    catch "file type $pathName" fileType
    if {"$fileType" == "link"} {
      if {[catch "file readlink $pathName" linkName]} {
        return 0
      }
      catch "file type $linkName" fileType
      while {"$fileType" == "link"} {
        if {[catch "file readlink $linkName" linkName]} {
          return 0
        }
        catch "file type $linkName" fileType
      }
      return [file isdirectory $linkName]
    }
  }
  return 0
}


# Procedure: IsAFile
proc IsAFile { fileName} {
##########
# Procedure: IsAFile
# Description: check if filename is a file (including symbolic links)
# Arguments: fileName - the filename to check
# Returns: 1 if its a file, otherwise 0
# Sideeffects: none
##########

  if {[file isfile $fileName]} {
    return 1
  } {
    catch "file type $fileName" fileType
    if {"$fileType" == "link"} {
      if {[catch "file readlink $fileName" linkName]} {
        return 0
      }
      catch "file type $linkName" fileType
      while {"$fileType" == "link"} {
        if {[catch "file readlink $linkName" linkName]} {
          return 0
        }
        catch "file type $linkName" fileType
      }
      return [file isfile $linkName]
    }
  }
  return 0
}


# Procedure: IsASymlink
proc IsASymlink { fileName} {
##########
# Procedure: IsASymlink
# Description: check if filename is a symbolic link
# Arguments: fileName - the path/filename to check
# Returns: none
# Sideeffects: none
##########

  catch "file type $fileName" fileType
  if {"$fileType" == "link"} {
    return 1
  }
  return 0
}


# Procedure: MenuBarConf
proc MenuBarConf { menuBarConfig} {
##########
# Procedure: MenuBarConf
# Description: configure the menubuttons and menus of
#              the given pathname
# Arguments: menuBarConfig - the widget pathname we configure
# Returns: none
# Sideeffects: none
##########
# 
# global menuBar(activeBackground) - active background color
# global menuBar(activeForeground) - active foreground color
# global menuBar(background) - background color
# global menuBar(font) - text font
# global menuBar(foreground) - foreground color
# global menuBar(scrollActiveForeground) - scrollbar active background color
# global menuBar(scrollBackground) - scrollbar background color
# global menuBar(scrollForeground) - scrollbar foreground color
# global menuBar(scrollSide) - side where scrollbar is located

  global menuBar

  if {![info exists menuBar(initialized)]} {
    return
  }
  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScaleOpt ""
  set tmpScrollOpt ""
  if {"$menuBar(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$menuBar(activeBackground)\" "
  }
  if {"$menuBar(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$menuBar(activeForeground)\" "
  }
  if {"$menuBar(background)" != ""} {
    append tmpButtonOpt "-background \"$menuBar(background)\" "
    append tmpFrameOpt "-background \"$menuBar(background)\" "
    append tmpMessageOpt "-background \"$menuBar(background)\" "
    append tmpScaleOpt "-background \"$menuBar(background)\" "
  }
  if {"$menuBar(font)" != ""} {
    append tmpButtonOpt "-font \"$menuBar(font)\" "
    append tmpMessageOpt "-font \"$menuBar(font)\" "
  }
  if {"$menuBar(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$menuBar(foreground)\" "
    append tmpMessageOpt "-foreground \"$menuBar(foreground)\" "
    append tmpScaleOpt "-foreground \"$menuBar(foreground)\" "
  }
  if {"$menuBar(scrollActiveForeground)" != ""} {
    append tmpScaleOpt "-activeforeground \"$menuBar(scrollActiveForeground)\" "
    append tmpScrollOpt "-activebackground \"$menuBar(scrollActiveForeground)\" "
  }
  if {"$menuBar(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$menuBar(scrollBackground)\" "
  }
  if {"$menuBar(scrollForeground)" != ""} {
    append tmpScaleOpt "-sliderforeground \"$menuBar(scrollForeground)\" "
    append tmpScrollOpt "-background \"$menuBar(scrollForeground)\" "
  }

  # start build of toplevel
  if {"[info commands CBSavedDestroy]" != ""} {
    catch {CBSavedDestroy .menuBar}
  } {
    catch {destroy .menuBar}
  }
  toplevel .menuBar     -borderwidth 0
  catch ".menuBar config $tmpFrameOpt"
  wm geometry .menuBar 530x400
  wm title .menuBar {Menu configuration}
  wm maxsize .menuBar 1000 1000
  wm minsize .menuBar 100 100
  # end build of toplevel

  frame .menuBar.frame1     -borderwidth 0     -relief raised
  catch ".menuBar.frame1 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame2     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame2.frame4     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame2.frame5     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame5 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame2.frame6     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame6 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame2.frame8     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame8 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame7     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame7 config $tmpFrameOpt"
 
  frame .menuBar.frame1.frame3     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame3 config $tmpFrameOpt"
 
  scrollbar .menuBar.frame1.frame2.frame5.vscroll     -relief raised     -command ".menuBar.frame1.frame2.frame5.buttons yview"
  catch ".menuBar.frame1.frame2.frame5.vscroll config $tmpScrollOpt"

  scrollbar .menuBar.frame1.frame2.frame5.hscroll     -orient horiz     -relief raised     -command ".menuBar.frame1.frame2.frame5.buttons xview"
  catch ".menuBar.frame1.frame2.frame5.hscroll config $tmpScrollOpt"

  listbox .menuBar.frame1.frame2.frame5.buttons     -exportselection false     -relief raised     -xscrollcommand ".menuBar.frame1.frame2.frame5.hscroll set"     -yscrollcommand ".menuBar.frame1.frame2.frame5.vscroll set"
  catch ".menuBar.frame1.frame2.frame5.buttons config $tmpMessageOpt"

  scrollbar .menuBar.frame1.frame2.frame6.vscroll     -relief raised     -command ".menuBar.frame1.frame2.frame6.menus yview"
  catch ".menuBar.frame1.frame2.frame6.vscroll config $tmpScrollOpt"

  scrollbar .menuBar.frame1.frame2.frame6.hscroll     -orient horiz     -relief raised     -command ".menuBar.frame1.frame2.frame6.menus xview"
  catch ".menuBar.frame1.frame2.frame6.hscroll config $tmpScrollOpt"

  listbox .menuBar.frame1.frame2.frame6.menus     -exportselection false     -relief raised     -xscrollcommand ".menuBar.frame1.frame2.frame6.hscroll set"     -yscrollcommand ".menuBar.frame1.frame2.frame6.vscroll set"
  catch ".menuBar.frame1.frame2.frame6.menus config $tmpMessageOpt"

  scrollbar .menuBar.frame1.frame2.frame8.vscroll     -relief raised     -command ".menuBar.frame1.frame2.frame8.menu yview"
  catch ".menuBar.frame1.frame2.frame8.vscroll config $tmpScrollOpt"

  scrollbar .menuBar.frame1.frame2.frame8.hscroll     -orient horiz     -relief raised     -command ".menuBar.frame1.frame2.frame8.menu xview"
  catch ".menuBar.frame1.frame2.frame8.hscroll config $tmpScrollOpt"

  listbox .menuBar.frame1.frame2.frame8.menu     -exportselection false     -relief raised     -xscrollcommand ".menuBar.frame1.frame2.frame8.hscroll set"     -yscrollcommand ".menuBar.frame1.frame2.frame8.vscroll set"
  catch ".menuBar.frame1.frame2.frame8.menu config $tmpMessageOpt"

  scale .menuBar.frame1.frame2.frame8.mover     -orient vertical     -width 8     -relief raised     -sliderlength 15     -from 0     -command "MenuBarReposition"
  catch ".menuBar.frame1.frame2.frame8.mover config $tmpScaleOpt"

  button .menuBar.frame1.frame7.insert     -text "Append"     -command "MenuBarInsert \"$menuBarConfig\""
  catch ".menuBar.frame1.frame7.insert config $tmpButtonOpt"

  button .menuBar.frame1.frame7.modify     -text "Modify"     -command "MenuBarModify \"$menuBarConfig\""
  catch ".menuBar.frame1.frame7.modify config $tmpButtonOpt"

  button .menuBar.frame1.frame7.modifymenu     -text "Modify menu"     -command {
      set curSelected [.menuBar.frame1.frame2.frame6.menus curselection]
      if {$curSelected >= 0} {
        place forget .menuBar.frame1.frame2.frame5
        place forget .menuBar.frame1.frame2.frame6
        place .menuBar.frame1.frame2.frame8           -in .menuBar.frame1.frame2           -relx 0.5           -rely 0           -relheight 1.0           -relwidth 0.5
        pack forget .menuBar.frame1.frame7.modifymenu
        pack .menuBar.frame1.frame7.insert -side left -fill both -expand 1
        pack .menuBar.frame1.frame7.modify -side left -fill both -expand 1
        pack .menuBar.frame1.frame7.modifyback -side left -fill both -expand 1
        pack .menuBar.frame1.frame7.delete -side left -fill both -expand 1
        update idletask
        MenuBarSetItems command
        MenuBarReadMenu           [.menuBar.frame1.frame2.frame6.menus get $curSelected]
        case [lindex [.menuBar.frame1.frame2.frame4.items.message1 config -text] 4] in {
          {Cascadebutton} {
            .menuBar.frame1.frame2.frame4.items.items.m invoke 0
          }
          {Checkbutton} {
            .menuBar.frame1.frame2.frame4.items.items.m invoke 1
          }
          {Radiobutton} {
            .menuBar.frame1.frame2.frame4.items.items.m invoke 3
          }
          {Separator} {
            .menuBar.frame1.frame2.frame4.items.items.m invoke 4
          }
          {default} {
            .menuBar.frame1.frame2.frame4.items.items.m invoke 2
          }
        }
        MenuBarSetItem
      }}
  catch ".menuBar.frame1.frame7.modifymenu config $tmpButtonOpt"

  button .menuBar.frame1.frame7.modifyback     -text "Back to main"     -command {
      place forget .menuBar.frame1.frame2.frame8
      if {[.menuBar.frame1.frame2.frame5.buttons size] > 0} {
        place .menuBar.frame1.frame2.frame5           -in .menuBar.frame1.frame2           -relx 0.5           -rely 0           -relheight 0.5           -relwidth 0.5
        place .menuBar.frame1.frame2.frame6           -in .menuBar.frame1.frame2           -relx 0.5           -rely 0.5           -relheight 0.5           -relwidth 0.5
      } {
        place .menuBar.frame1.frame2.frame6           -in .menuBar.frame1.frame2           -relx 0.5           -rely 0           -relheight 1           -relwidth 0.5
      }
      update idletask
      pack forget .menuBar.frame1.frame7.modifyback
      pack .menuBar.frame1.frame7.insert -side left -fill both -expand 1
      pack .menuBar.frame1.frame7.modify -side left -fill both -expand 1
      pack .menuBar.frame1.frame7.modifymenu -side left -fill both -expand 1
      pack .menuBar.frame1.frame7.delete -side left -fill both -expand 1
      MenuBarSetItem}
  catch ".menuBar.frame1.frame7.modifyback config $tmpButtonOpt"

  button .menuBar.frame1.frame7.delete     -text "Remove"     -command "
      if {\[.menuBar.frame1.frame2.frame6.menus size\] > 0} {
        MenuBarDelete \"$menuBarConfig\"
      }"
  catch ".menuBar.frame1.frame7.delete config $tmpButtonOpt"

  button .menuBar.frame1.frame3.ok     -text "OK"     -command "
      if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
        catch {CBSavedDestroy .menuBar}
      } {
        catch {destroy .menuBar}
      }"
  catch ".menuBar.frame1.frame3.ok config $tmpButtonOpt"

  button .menuBar.frame1.frame3.save     -text "Save"     -command "MenuBarSave \"$menuBarConfig\""
  catch ".menuBar.frame1.frame3.save config $tmpButtonOpt"

  frame .menuBar.frame1.frame2.frame4.items     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.items config $tmpFrameOpt"
 
  menubutton .menuBar.frame1.frame2.frame4.items.items     -text "Menu entry:"     -menu ".menuBar.frame1.frame2.frame4.items.items.m"
  catch ".menuBar.frame1.frame2.frame4.items.items config $tmpButtonOpt"

  menu .menuBar.frame1.frame2.frame4.items.items.m
  catch ".menuBar.frame1.frame2.frame4.items.items.m config $tmpButtonOpt"

  .menuBar.frame1.frame2.frame4.items.items.m     add radiobutton       -label "Cascadebutton"       -variable menuBar(menuType)       -value "<cascade> "       -command "MenuBarSetItems cascade"
  .menuBar.frame1.frame2.frame4.items.items.m     add radiobutton       -label "Checkbutton"       -variable menuBar(menuType)       -value "<checkbutton> "       -command "MenuBarSetItems check"
  .menuBar.frame1.frame2.frame4.items.items.m     add radiobutton       -label "Commandbutton"       -variable menuBar(menuType)       -value "<command> "       -command "MenuBarSetItems command"
  .menuBar.frame1.frame2.frame4.items.items.m     add radiobutton       -label "Radiobutton"       -variable menuBar(menuType)       -value "<radiobutton> "       -command "MenuBarSetItems radio"
  .menuBar.frame1.frame2.frame4.items.items.m     add radiobutton       -label "Separator"       -variable menuBar(menuType)       -value "<separator> "       -command "MenuBarSetItems separator"
  
  label .menuBar.frame1.frame2.frame4.items.message1     -anchor w     -text "Commandbutton"
  catch ".menuBar.frame1.frame2.frame4.items.message1 config $tmpMessageOpt"
  
  MenuBarEntry accelerator "Accelerator:"
  MenuBarEntry actbg "Active background:"
  MenuBarScale actborder "Active borderwidth:" "pixels" 40
  MenuBarEntry actfg "Active foreground:"
  MenuBarEntry bg "Background:"
  MenuBarEntry bitmap "Bitmap:"
  MenuBarScale border "Borderwidth:" "pixels" 40
  MenuBarEntry font "Font:"
  MenuBarEntry fg "Foreground:"
  MenuBarEntry label "Label:"
  MenuBarEntry menu "Menu:"
  MenuBarEntry name "Menu name:"
  MenuBarEntry offvalue "Offvalue:"
  MenuBarEntry onvalue "Onvalue:"
  MenuBarScaleDouble size "Size:" "Width" "Height" 300 300

  frame .menuBar.frame1.frame2.frame4.state     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.state config $tmpFrameOpt"
 
  label .menuBar.frame1.frame2.frame4.state.message1     -anchor w     -relief raised     -text "State:"
  catch ".menuBar.frame1.frame2.frame4.state.message1 config $tmpMessageOpt"

  radiobutton .menuBar.frame1.frame2.frame4.state.normal     -text "Normal"     -variable menuBar(state) -value normal
  catch ".menuBar.frame1.frame2.frame4.state.normal config $tmpButtonOpt"

  radiobutton .menuBar.frame1.frame2.frame4.state.active     -text "Active"     -variable menuBar(state) -value active
  catch ".menuBar.frame1.frame2.frame4.state.active config $tmpButtonOpt"

  radiobutton .menuBar.frame1.frame2.frame4.state.disabled     -text "Disabled"     -variable menuBar(state) -value disabled
  catch ".menuBar.frame1.frame2.frame4.state.disabled config $tmpButtonOpt"

  pack .menuBar.frame1.frame2.frame4.state.message1 -side left
  pack .menuBar.frame1.frame2.frame4.state.normal -side left -fill x -expand 1
  pack .menuBar.frame1.frame2.frame4.state.active -side left -fill x -expand 1
  pack .menuBar.frame1.frame2.frame4.state.disabled -side left -fill x -expand 1

  MenuBarEntry textvar "Text variable:"

  MenuBarScale underline "Underline:" "" 40
  .menuBar.frame1.frame2.frame4.underline.underline config     -from -1

  MenuBarEntry value "Value:"
  MenuBarEntry variable "Variable:"

  label .menuBar.frame1.frame2.frame4.message1     -anchor c     -relief raised     -text "Command:"
  catch ".menuBar.frame1.frame2.frame4.message1 config $tmpMessageOpt"
  
  frame .menuBar.frame1.frame2.frame4.command     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.command config $tmpFrameOpt"

  text .menuBar.frame1.frame2.frame4.command.command     -relief raised     -wrap none     -borderwidth 2     -yscrollcommand ".menuBar.frame1.frame2.frame4.command.vscroll set"
  catch ".menuBar.frame1.frame2.frame4.command.command config $tmpMessageOpt"

  scrollbar .menuBar.frame1.frame2.frame4.command.vscroll     -relief raised     -command ".menuBar.frame1.frame2.frame4.command.command yview"
  catch ".menuBar.frame1.frame2.frame4.command.vscroll config $tmpScrollOpt"

  pack .menuBar.frame1.frame2.frame4.command.vscroll -side left -fill y
  pack .menuBar.frame1.frame2.frame4.command.command -side left -fill both -expand 1

  # bindings
  bind .menuBar.frame1.frame2.frame5.buttons <ButtonPress-1> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame5.buttons <Button1-Motion> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame5.buttons <Shift-ButtonPress-1> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame5.buttons <Shift-Button1-Motion> {
   MenuBarSelect1 %W %y}

  bind .menuBar.frame1.frame2.frame6.menus <ButtonPress-1> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame6.menus <Button1-Motion> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame6.menus <Shift-ButtonPress-1> {
   MenuBarSelect1 %W %y}
  bind .menuBar.frame1.frame2.frame6.menus <Shift-Button1-Motion> {
   MenuBarSelect1 %W %y}

  bind .menuBar.frame1.frame2.frame8.menu <ButtonPress-1> {
   MenuBarSelect2 %W %y}
  bind .menuBar.frame1.frame2.frame8.menu <Button1-Motion> {
   MenuBarSelect2 %W %y}
  bind .menuBar.frame1.frame2.frame8.menu <Shift-ButtonPress-1> {
   MenuBarSelect2 %W %y}
  bind .menuBar.frame1.frame2.frame8.menu <Shift-Button1-Motion> {
   MenuBarSelect2 %W %y}

  bind .menuBar.frame1.frame2.frame4.actbg.actbg <Double-ButtonPress-3> {
   global menuBar
   if {"[info commands ColorBox]" != ""} {
     set menuBarResult [ColorBox $menuBar(colorFile) "Active background:"]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.actbg.actbg delete 0 end
       .menuBar.frame1.frame2.frame4.actbg.actbg insert end $menuBarResult
     }
   }
   break}

  bind .menuBar.frame1.frame2.frame4.actfg.actfg <Double-ButtonPress-3> {
   global menuBar
   if {"[info commands ColorBox]" != ""} {
     set menuBarResult [ColorBox $menuBar(colorFile) "Active foreground:"]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.actfg.actfg delete 0 end
       .menuBar.frame1.frame2.frame4.actfg.actfg insert end $menuBarResult
     }
   }
   break}

  bind .menuBar.frame1.frame2.frame4.bg.bg <Double-ButtonPress-3> {
   global menuBar
   if {"[info commands ColorBox]" != ""} {
     set menuBarResult [ColorBox $menuBar(colorFile) "Background:"]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.bg.bg delete 0 end
       .menuBar.frame1.frame2.frame4.bg.bg insert end $menuBarResult
     }
   }
   break}

  bind .menuBar.frame1.frame2.frame4.bitmap.bitmap <Double-ButtonPress-3> {
   if {"[info commands FSBox]" != ""} {
     set menuBarResult [FSBox]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.bitmap.bitmap delete 0 end
       .menuBar.frame1.frame2.frame4.bitmap.bitmap insert end $menuBarResult
     }
   }
   break}

  bind .menuBar.frame1.frame2.frame4.font.font <Double-ButtonPress-3> {
   global menuBar
   if {"[info commands FontBox]" != ""} {
     set menuBarResult [FontBox $menuBar(fontFile)]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.font.font delete 0 end
       .menuBar.frame1.frame2.frame4.font.font insert end $menuBarResult
     }
   }
   break}

  bind .menuBar.frame1.frame2.frame4.fg.fg <Double-ButtonPress-3> {
   global menuBar
   if {"[info commands ColorBox]" != ""} {
     set menuBarResult [ColorBox $menuBar(colorFile) "Foreground:"]
     if {"$menuBarResult" != ""} {
       .menuBar.frame1.frame2.frame4.fg.fg delete 0 end
       .menuBar.frame1.frame2.frame4.fg.fg insert end $menuBarResult
     }
   }
   break}

  MenuBarReadMenus $menuBarConfig

  # packing
  pack .menuBar.frame1.frame7.insert -side left -fill both -expand 1
  pack .menuBar.frame1.frame7.modify -side left -fill both -expand 1
  pack .menuBar.frame1.frame7.modifymenu -side left -fill both -expand 1
  pack .menuBar.frame1.frame7.delete -side left -fill both -expand 1
  pack .menuBar.frame1.frame3.ok -side left -fill both -expand 1
  pack .menuBar.frame1.frame3.save -side left -fill both -expand 1
  pack .menuBar.frame1.frame2.frame4.items.items -side left -fill both
  pack .menuBar.frame1.frame2.frame4.items.message1 -side left -fill both -expand 1
  pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
  pack .menuBar.frame1.frame2.frame4.actfg -side top -fill x
  pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
  pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
  pack .menuBar.frame1.frame2.frame4.border -side top -fill x
  pack .menuBar.frame1.frame2.frame4.font -side top -fill x
  pack .menuBar.frame1.frame2.frame4.fg -side top -fill x
  pack .menuBar.frame1.frame2.frame4.label -side top -fill x
  pack .menuBar.frame1.frame2.frame4.menu -side top -fill x
  pack .menuBar.frame1.frame2.frame4.size -side top -fill x
  pack .menuBar.frame1.frame2.frame4.textvar -side top -fill x
  pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
  pack .menuBar.frame1.frame2.frame5.vscroll -side $menuBar(scrollSide) -fill y
  pack .menuBar.frame1.frame2.frame5.hscroll -side bottom -fill x
  pack .menuBar.frame1.frame2.frame5.buttons -side left -fill both -expand 1
  pack .menuBar.frame1.frame2.frame6.vscroll -side $menuBar(scrollSide) -fill y
  pack .menuBar.frame1.frame2.frame6.hscroll -side bottom -fill x
  pack .menuBar.frame1.frame2.frame6.menus -side left -fill both -expand 1
  pack .menuBar.frame1.frame2.frame8.mover -side right -fill y
  pack .menuBar.frame1.frame2.frame8.vscroll -side $menuBar(scrollSide) -fill y
  pack .menuBar.frame1.frame2.frame8.hscroll -side bottom -fill x
  pack .menuBar.frame1.frame2.frame8.menu -side left -fill both -expand 1

  place .menuBar.frame1.frame2.frame4     -in .menuBar.frame1.frame2     -relx 0     -rely 0     -relheight 1.0     -relwidth 0.5

  if {[.menuBar.frame1.frame2.frame5.buttons size] > 0} {
    .menuBar.frame1.frame7.insert config       -state disabled
    .menuBar.frame1.frame7.modifymenu config       -state disabled
    .menuBar.frame1.frame7.delete config       -state disabled

    place .menuBar.frame1.frame2.frame5       -in .menuBar.frame1.frame2       -relx 0.5       -rely 0       -relheight 0.5       -relwidth 0.5

    place .menuBar.frame1.frame2.frame6       -in .menuBar.frame1.frame2       -relx 0.5       -rely 0.5       -relheight 0.5       -relwidth 0.5
    MenuBarSetItems menubutton
  } {
    .menuBar.frame1.frame7.insert config       -state normal
    .menuBar.frame1.frame7.modifymenu config       -state normal
    .menuBar.frame1.frame7.delete config       -state normal

    place .menuBar.frame1.frame2.frame6       -in .menuBar.frame1.frame2       -relx 0.5       -rely 0       -relheight 1       -relwidth 0.5
    MenuBarSetItems menu
  }

  pack .menuBar.frame1.frame3 -side bottom -fill x
  pack .menuBar.frame1.frame7 -side bottom -fill x
  pack .menuBar.frame1.frame2 -side top -fill both -expand 1
  pack .menuBar.frame1 -side top -fill both -expand 1

  update idletask
  MenuBarSetItem
}


# Procedure: MenuBarDelete
proc MenuBarDelete { menuBarConfig} {

  set curSelected     [.menuBar.frame1.frame2.frame6.menus curselection]
  if {[winfo ismapped .menuBar.frame1.frame2.frame6] && $curSelected >= 0} {
    if {"[info commands CBSavedDestroy]" != ""} {
      catch "CBSavedDestroy [.menuBar.frame1.frame2.frame6.menus get $curSelected]"
    } {
      catch "destroy [.menuBar.frame1.frame2.frame6.menus get $curSelected]"
    }
    MenuBarReadMenus $menuBarConfig
  } {
    set curSelected       [.menuBar.frame1.frame2.frame8.menu curselection]
    if {[winfo ismapped .menuBar.frame1.frame2.frame8] && $curSelected >= 0} {
      [.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]] delete $curSelected
      MenuBarReadMenu         [.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]]
    }
  }
}


# Procedure: MenuBarEntry
proc MenuBarEntry { menuBarName menuBarLabel} {
  global menuBar

  set tmpFrameOpt ""
  set tmpMessageOpt ""
  if {"$menuBar(background)" != ""} {
    append tmpFrameOpt "-background \"$menuBar(background)\" "
    append tmpMessageOpt "-background \"$menuBar(background)\" "
  }
  if {"$menuBar(font)" != ""} {
    append tmpMessageOpt "-font \"$menuBar(font)\" "
  }
  if {"$menuBar(foreground)" != ""} {
    append tmpMessageOpt "-foreground \"$menuBar(foreground)\" "
  }

  # build widgets
  frame .menuBar.frame1.frame2.frame4.$menuBarName     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName config $tmpFrameOpt"

  label .menuBar.frame1.frame2.frame4.$menuBarName.label$menuBarName     -relief raised     -text "$menuBarLabel"
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.label$menuBarName config $tmpMessageOpt"

  entry .menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName config $tmpMessageOpt"

  # packing of the subwidgets
  pack .menuBar.frame1.frame2.frame4.$menuBarName.label$menuBarName -side left -fill y
  pack .menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName -side left -fill both -expand 1
}


# Procedure: MenuBarEntryType
proc MenuBarEntryType { menuBarW menuBarPosition} {

  return [$menuBarW type $menuBarPosition]
}


# Procedure: MenuBarInit
proc MenuBarInit { menuBarUserFile menuBarFile} {
##########
# Procedure: MenuBarInit
# Description: initialize the configuration of menubuttons and menus
# Arguments: menuBarUserFile - the user specific loadfile
#            menuBarFile - the default loadfile
# Returns: none
# Sideeffects: none
##########

  global menuBar

  set menuBar(initialized) 1
  set menuBar(file) $menuBarFile
  set menuBar(userFile) $menuBarUserFile
  if {[file exists $menuBar(userFile)]} {
    if {[catch "source \"$menuBar(userFile)\"" menuBarResult]} {
      puts stderr $menuBarResult
    }
  } {
    if {[file exists $menuBar(file)]} {
      if {[catch "source \"$menuBar(file)\"" menuBarResult]} {
        puts stderr $menuBarResult
      }
    }
  }
}


# Procedure: MenuBarInsert
proc MenuBarInsert { menuBarConfig} {
  global menuBar

  if {[winfo ismapped .menuBar.frame1.frame2.frame6]} {
    if {"[.menuBar.frame1.frame2.frame4.name.name get]" != ""} {
      if {"[info commands CBSavedDestroy]" != ""} {
        catch "CBSavedDestroy [.menuBar.frame1.frame2.frame4.name.name get]"
      } {
        catch "destroy [.menuBar.frame1.frame2.frame4.name.name get]"
      }
      if {"[info commands [.menuBar.frame1.frame2.frame4.menu.menu get]]" == ""} {
        if {[catch "menu [.menuBar.frame1.frame2.frame4.menu.menu get]" menuBarResult]} {
          puts stderr $menuBarResult
        } {
          .menuBar.frame1.frame2.frame6.menus insert end             "[.menuBar.frame1.frame2.frame4.name.name get]"
          .menuBar.frame1.frame2.frame6.menus select clear 0 end
          .menuBar.frame1.frame2.frame6.menus select set [.menuBar.frame1.frame2.frame6.menus size]
          MenuBarModify $menuBarConfig
          MenuBarReadMenus $menuBarConfig
        }
      }
    }
  } {
    set currType       [string trim [string trim $menuBar(menuType)] "<>"]
    if {"$currType" == "tearoff"} {
      return
    }
    if {[winfo ismapped .menuBar.frame1.frame2.frame8]} {
      if {[catch "[.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]] add $currType" menuBarResult]} {
        puts stderr $menuBarResult
      } {
        .menuBar.frame1.frame2.frame8.menu insert end           "$menuBar(menuType) [.menuBar.frame1.frame2.frame4.name.name get]"
        .menuBar.frame1.frame2.frame8.menu select clear 0 end
        .menuBar.frame1.frame2.frame8.menu select set [.menuBar.frame1.frame2.frame8.menu size]
        MenuBarModify $menuBarConfig
        MenuBarReadMenu           [.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]]
      }
    }
  }
}


# Procedure: MenuBarInsertMenus
proc MenuBarInsertMenus { menuBarW} {

  if {"[winfo class $menuBarW]" == "Menu"} {
    .menuBar.frame1.frame2.frame6.menus insert end $menuBarW
  }

  set last [$menuBarW index last]
  if {"$last" == "none"} {
    set last -1
  }
  for {set counter 0} {$counter <= $last} {incr counter 1} {
    if {"[MenuBarEntryType $menuBarW $counter]" == "cascade"} {
      if {"[lindex [$menuBarW entryconfig $counter -menu] 4]" != ""} {
        if {"[info commands [lindex [$menuBarW entryconfig $counter -menu] 4]]" == ""} {
          $menuBarW entryconfig $counter -menu ""
        }
      }
    }
  }
  foreach counter [lsort [winfo children $menuBarW]] {
    if {"[winfo class $counter]" == "Menu"} {
      MenuBarInsertMenus $counter
    }
  }
}


# Procedure: MenuBarModify
proc MenuBarModify { menuBarConfig} {
  global menuBar

  set curSelected     [.menuBar.frame1.frame2.frame5.buttons curselection]
  if {[winfo ismapped .menuBar.frame1.frame2.frame5] && $curSelected >= 0} {
    set menuBarList .menuBar.frame1.frame2.frame5.buttons
    set menuBarW [$menuBarList get $curSelected]
    # insert values
    set optionString "config"
    if {"[.menuBar.frame1.frame2.frame4.actbg.actbg get]" != ""} {
      append optionString         " -activebackground \{[.menuBar.frame1.frame2.frame4.actbg.actbg get]\}"
    }
    if {"[.menuBar.frame1.frame2.frame4.actfg.actfg get]" != ""} {
      append optionString         " -activeforeground \{[.menuBar.frame1.frame2.frame4.actfg.actfg get]\}"
    }
    if {"[.menuBar.frame1.frame2.frame4.bg.bg get]" != ""} {
      append optionString         " -background \{[.menuBar.frame1.frame2.frame4.bg.bg get]\}"
    }
    if {"[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]" != ""} {
      if {"[string index [.menuBar.frame1.frame2.frame4.bitmap.bitmap get] 0]" == "@"} {
        append optionString           " -bitmap \{[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]\}"
      } {
        append optionString           " -bitmap \{@[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]\}"
      }
    } {
      append optionString         " -bitmap \{\}"
    }
    append optionString       " -borderwidth [.menuBar.frame1.frame2.frame4.border.border get]"
    if {"[.menuBar.frame1.frame2.frame4.font.font get]" != ""} {
      append optionString         " -font \{[.menuBar.frame1.frame2.frame4.font.font get]\}"
    }
    if {"[.menuBar.frame1.frame2.frame4.fg.fg get]" != ""} {
      append optionString         " -foreground \{[.menuBar.frame1.frame2.frame4.fg.fg get]\}"
    }
    append optionString       " -menu \{[.menuBar.frame1.frame2.frame4.menu.menu get]\}"
    append optionString       " -text \{[.menuBar.frame1.frame2.frame4.label.label get]\}"
    append optionString       " -textvariable \{[.menuBar.frame1.frame2.frame4.textvar.textvar get]\}"
    append optionString       " -underline \{[.menuBar.frame1.frame2.frame4.underline.underline get]\}"
    if {[.menuBar.frame1.frame2.frame4.size.size1.size1 get] > 0 &&
	[.menuBar.frame1.frame2.frame4.size.size2.size2 get] > 0} {
      append optionString         " -width \{[.menuBar.frame1.frame2.frame4.size.size1.size1 get]\}"
      append optionString         " -height \{[.menuBar.frame1.frame2.frame4.size.size2.size2 get]\}"
    }
    if {[catch "$menuBarW $optionString" menuBarResult]} {
      puts stderr $menuBarResult
    }

    if {"[info commands [.menuBar.frame1.frame2.frame4.menu.menu get]]" == ""} {
      if {[catch "menu [.menuBar.frame1.frame2.frame4.menu.menu get]" menuBarResult]} {
        puts stderr $menuBarResult
      } {
        .menuBar.frame1.frame2.frame6.menus insert end           "[.menuBar.frame1.frame2.frame4.name.name get]"
        .menuBar.frame1.frame2.frame6.menus select clear 0 end
        .menuBar.frame1.frame2.frame6.menus select set [.menuBar.frame1.frame2.frame6.menus size]
        MenuBarModify $menuBarConfig
        MenuBarReadMenus $menuBarConfig
      }
    }
  } {
    set curSelected       [.menuBar.frame1.frame2.frame6.menus curselection]
    if {[winfo ismapped .menuBar.frame1.frame2.frame6] && $curSelected >= 0} {
      set menuBarList .menuBar.frame1.frame2.frame6.menus
      set menuBarW [$menuBarList get $curSelected]
      # insert values
      set optionString "config"
      if {"[.menuBar.frame1.frame2.frame4.actbg.actbg get]" != ""} {
        append optionString           " -activebackground \{[.menuBar.frame1.frame2.frame4.actbg.actbg get]\}"
      }
      append optionString         " -activeborderwidth \{[.menuBar.frame1.frame2.frame4.actborder.actborder get]\}"
      if {"[.menuBar.frame1.frame2.frame4.actfg.actfg get]" != ""} {
        append optionString           " -activeforeground \{[.menuBar.frame1.frame2.frame4.actfg.actfg get]\}"
      }
      if {"[.menuBar.frame1.frame2.frame4.bg.bg get]" != ""} {
        append optionString           " -background \{[.menuBar.frame1.frame2.frame4.bg.bg get]\}"
      }
      append optionString         " -borderwidth \{[.menuBar.frame1.frame2.frame4.border.border get]\}"
      if {"[.menuBar.frame1.frame2.frame4.font.font get]" != ""} {
        append optionString           " -font \{[.menuBar.frame1.frame2.frame4.font.font get]\}"
      }
      if {"[.menuBar.frame1.frame2.frame4.fg.fg get]" != ""} {
        append optionString           " -foreground \{[.menuBar.frame1.frame2.frame4.fg.fg get]\}"
      }
      if {[catch "$menuBarW $optionString" menuBarResult]} {
        puts stderr $menuBarResult
      }
    } {
      set curSelected         [.menuBar.frame1.frame2.frame8.menu curselection]
      if {[winfo ismapped .menuBar.frame1.frame2.frame8] &&
          $curSelected >= 0} {
        set menuBarList .menuBar.frame1.frame2.frame6.menus
        set menuBarW           [$menuBarList get [.menuBar.frame1.frame2.frame6.menus curselection]]
        # insert values
        if {![string match <separator* [.menuBar.frame1.frame2.frame8.menu get $curSelected]] &&
            ![string match <tearoff* [.menuBar.frame1.frame2.frame8.menu get $curSelected]]} {
          set optionString "entryconfig $curSelected"
          if {"[.menuBar.frame1.frame2.frame4.actbg.actbg get]" != ""} {
            append optionString               " -activebackground \{[.menuBar.frame1.frame2.frame4.actbg.actbg get]\}"
          }
          append optionString             " -accelerator \{[.menuBar.frame1.frame2.frame4.accelerator.accelerator get]\}"
          if {"[.menuBar.frame1.frame2.frame4.bg.bg get]" != ""} {
            append optionString               " -background \{[.menuBar.frame1.frame2.frame4.bg.bg get]\}"
          }
          if {"[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]" != ""} {
            if {"[string index [.menuBar.frame1.frame2.frame4.bitmap.bitmap get] 0]" == "@"} {
              append optionString                 " -bitmap \{[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]\}"
            } {
              append optionString                 " -bitmap \{@[.menuBar.frame1.frame2.frame4.bitmap.bitmap get]\}"
            }
          } {
            append optionString               " -bitmap \{\}"
          }
          append optionString             " -command \{[.menuBar.frame1.frame2.frame4.command.command get 1.0 end]\}"
          if {"[.menuBar.frame1.frame2.frame4.font.font get]" != ""} {
            append optionString               " -font \{[.menuBar.frame1.frame2.frame4.font.font get]\}"
          }
          append optionString             " -label \{[.menuBar.frame1.frame2.frame4.label.label get]\}"
          append optionString             " -state \{$menuBar(state)\}"
          append optionString             " -underline \{[.menuBar.frame1.frame2.frame4.underline.underline get]\}"
          case [.menuBar.frame1.frame2.frame8.menu get $curSelected] in {
            {<cascade*} {
              append optionString                 " -menu \{[.menuBar.frame1.frame2.frame4.menu.menu get]\}"
            }
            {<radiobutton*} {
              append optionString                 " -value \{[.menuBar.frame1.frame2.frame4.value.value get]\}"
              if {"[.menuBar.frame1.frame2.frame4.variable.variable get]" != ""} {
                append optionString                   " -variable \{[.menuBar.frame1.frame2.frame4.variable.variable get]\}"
              }
            }
            {<checkbutton*} {
              append optionString                 " -offvalue \{[.menuBar.frame1.frame2.frame4.offvalue.offvalue get]\}"
              append optionString                 " -onvalue \{[.menuBar.frame1.frame2.frame4.onvalue.onvalue get]\}"
              if {"[.menuBar.frame1.frame2.frame4.variable.variable get]" != ""} {
                append optionString                   " -variable \{[.menuBar.frame1.frame2.frame4.variable.variable get]\}"
              }
            }
          }
          if {[catch "$menuBarW $optionString" menuBarResult]} {
            puts stderr $menuBarResult
          }
        }
      }
    }
  }
}


# Procedure: MenuBarReadMenu
proc MenuBarReadMenu { menuBarW} {

  if {[.menuBar.frame1.frame2.frame8.menu size] > 0} {
    .menuBar.frame1.frame2.frame8.menu delete 0 end
  }
  set last [$menuBarW index last]
  if {"$last" == "none"} {
    set last -1
  }
  for {set counter 0} {$counter <= $last} {incr counter 1} {
    if {"[MenuBarEntryType $menuBarW $counter]" == "separator" ||
        "[MenuBarEntryType $menuBarW $counter]" == "tearoff"} {
      .menuBar.frame1.frame2.frame8.menu insert end         "<[MenuBarEntryType $menuBarW $counter]>"
    } {
      .menuBar.frame1.frame2.frame8.menu insert end         "<[MenuBarEntryType $menuBarW $counter]> [lindex [$menuBarW entryconfigure $counter -label] 4]"
    }
  }

  if {[.menuBar.frame1.frame2.frame8.menu size] > 0} {
    .menuBar.frame1.frame2.frame8.menu select clear 0 end
    .menuBar.frame1.frame2.frame8.menu select set 0
    MenuBarSetItem
    .menuBar.frame1.frame2.frame8.mover configure         -to [.menuBar.frame1.frame2.frame8.menu size]
  } {
    .menuBar.frame1.frame2.frame8.mover configure         -to 1
  }
}


# Procedure: MenuBarReadMenus
proc MenuBarReadMenus { menuBarConfig} {

  if {[.menuBar.frame1.frame2.frame5.buttons size] > 0} {
    .menuBar.frame1.frame2.frame5.buttons delete 0 end
  }
  if {[.menuBar.frame1.frame2.frame6.menus size] > 0} {
    .menuBar.frame1.frame2.frame6.menus delete 0 end
  }
  if {![catch "winfo children $menuBarConfig" menuBarResult]} {
    foreach menuBarChild [lsort [split $menuBarResult]] {
      if {"[winfo class $menuBarChild]" == "Menubutton"} {
        if {"[lindex [$menuBarChild config -menu] 4]" != ""} {
          if {"[info commands [lindex [$menuBarChild config -menu] 4]]" == ""} {
            $menuBarChild config -menu ""
          }
        }
        .menuBar.frame1.frame2.frame5.buttons insert end $menuBarChild
        foreach menuBarMenuChild [lsort [winfo children $menuBarChild]] {
          MenuBarInsertMenus $menuBarMenuChild
        }
      }
      if {"[winfo class $menuBarChild]" == "Menu"} {
        MenuBarInsertMenus $menuBarChild
      }
    }
  }
  if {[.menuBar.frame1.frame2.frame5.buttons size] > 0} {
    .menuBar.frame1.frame2.frame5.buttons select clear 0 end
    .menuBar.frame1.frame2.frame5.buttons select set 0
    MenuBarSetItem
  } {
    .menuBar.frame1.frame2.frame6.menus select clear 0 end
    .menuBar.frame1.frame2.frame6.menus select set 0
    MenuBarSetItem
  }
}


# Procedure: MenuBarReposition
proc MenuBarReposition { menuBarPos} {

  set curSelected     [.menuBar.frame1.frame2.frame8.menu curselection]
  set menuBarW     [.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]]
  if {$curSelected >= 0} {
    set menuBarLast [$menuBarW index last]
    if {"$menuBarLast" == "none"} {
      set menuBarLast -1
    }
    set counter 0
    set newMenu ""
    set currentItem ""
    if {"[MenuBarEntryType $menuBarW $curSelected]" != "tearoff"} {
      set currentItem "[MenuBarEntryType $menuBarW $curSelected] "
      foreach optCounter [$menuBarW entryconfig $curSelected] {
        if {[llength $optCounter] == 5} {
          if {"[lindex $optCounter 3]" != "[lindex $optCounter 4]"} {
            append currentItem " [lindex $optCounter 0] \{[lindex $optCounter 4]\}"
          }
        }
      }
    }
    set counter 0
    while {$counter <= $menuBarLast} {
      if {"[MenuBarEntryType $menuBarW $counter]" == "tearoff"} {
        incr counter
        continue
      }
      if {$menuBarPos > $curSelected &&
          $counter == [expr $menuBarPos+1] &&
          "$currentItem" != ""} {
        lappend newMenu $currentItem
      }
      if {$menuBarPos <= $curSelected &&
          $counter == $menuBarPos} {
        lappend newMenu $currentItem
      }
      if {$counter == $curSelected} {
        incr counter
        continue
      }
      set newItem "[MenuBarEntryType $menuBarW $counter] "
      foreach optCounter [$menuBarW entryconfig $counter] {
        if {[llength $optCounter] == 5} {
          if {"[lindex $optCounter 3]" != "[lindex $optCounter 4]"} {
            append newItem " [lindex $optCounter 0] \{[lindex $optCounter 4]\}"
          }
        }
      }
      lappend newMenu $newItem
      incr counter
    }
    if {$menuBarPos > $curSelected} {
      lappend newMenu $currentItem
    }
    $menuBarW delete 0 last
    set counter 0
    while {$counter <= $menuBarLast} {
      if {"[lindex $newMenu $counter]" != ""} {
        if {[catch "$menuBarW add [lindex $newMenu $counter]" menuBarRes]} {
          puts stderr $menuBarRes
        }
      }
      incr counter
    }
    MenuBarReadMenu $menuBarW
    .menuBar.frame1.frame2.frame8.menu select clear 0 end
    .menuBar.frame1.frame2.frame8.menu select set $menuBarPos
    MenuBarSetItem
  }
}


# Procedure: MenuBarSave
proc MenuBarSave { menuBarConfig} {
  global menuBar

  if {![catch "open $menuBar(userFile) w" outFile]} {
    foreach widgets [winfo children $menuBarConfig] {
      if {"[winfo class $widgets]" == "Menu"} {
        MenuBarSaveMenu $outFile $widgets
      }
      if {"[winfo class $widgets]" == "Menubutton"} {
        puts $outFile "$widgets config" nonewline
        foreach optCounter [$widgets config] {
          if {[llength $optCounter] == 5} {
            if {"[lindex $optCounter 3]" != "[lindex $optCounter 4]"} {
              puts $outFile " \\\n  [lindex $optCounter 0] \{[lindex $optCounter 4]\}" nonewline
            }
          }
        }
        puts $outFile ""
        puts $outFile ""
        foreach children [winfo children $widgets] {
          if {"[winfo class $children]" == "Menu"} {
            MenuBarSaveMenu $outFile $children
          }
        }
      }
    }
    puts $outFile "# eof"
    close $outFile
  } {
    puts stderr $outFile
  }
}


# Procedure: MenuBarSaveMenu
proc MenuBarSaveMenu { outFile menuBarW} {

  puts $outFile "if {\"\[info commands CBSavedDestroy\]\" != \"\"} {"
  puts $outFile "  catch \"CBSavedDestroy $menuBarW\""
  puts $outFile "} {"
  puts $outFile "  catch \"destroy $menuBarW\""
  puts $outFile "}"
  puts $outFile "menu $menuBarW" nonewline
  foreach optCounter [$menuBarW config] {
    if {[llength $optCounter] == 5} {
      if {"[lindex $optCounter 3]" != "[lindex $optCounter 4]"} {
        puts $outFile " \\\n  [lindex $optCounter 0] \{[lindex $optCounter 4]\}" nonewline
      }
    }
  }
  puts $outFile ""

  set menuLast [$menuBarW index last]
  if {"$menuLast" == "none"} {
    set menuLast -1
  }
  set counter 0
  while {$counter <= $menuLast} {
    puts $outFile "$menuBarW add [MenuBarEntryType $menuBarW $counter] " nonewline
    foreach optCounter [$menuBarW entryconfig $counter] {
      if {[llength $optCounter] == 5} {
        if {"[lindex $optCounter 3]" != "[lindex $optCounter 4]"} {
          puts $outFile " \\\n  [lindex $optCounter 0] \{[lindex $optCounter 4]\}" nonewline
        }
      }
    }
    puts $outFile ""
    incr counter
  }
  puts $outFile ""
  puts $outFile ""

  foreach children [winfo children $menuBarW] {
    if {"[winfo class $children]" == "Menu"} {
      MenuBarSaveMenu $outFile $children
    }
  }
}


# Procedure: MenuBarScale
proc MenuBarScale { menuBarName menuBarLabel1 menuBarLabel2 menuBarTo} {
  global menuBar

  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScaleOpt ""
  if {"$menuBar(background)" != ""} {
    append tmpFrameOpt "-background \"$menuBar(background)\" "
    append tmpMessageOpt "-background \"$menuBar(background)\" "
    append tmpScaleOpt "-background \"$menuBar(background)\" "
  }
  if {"$menuBar(font)" != ""} {
    append tmpMessageOpt "-font \"$menuBar(font)\" "
  }
  if {"$menuBar(foreground)" != ""} {
    append tmpMessageOpt "-foreground \"$menuBar(foreground)\" "
    append tmpScaleOpt "-foreground \"$menuBar(foreground)\" "
  }
  if {"$menuBar(scrollActiveForeground)" != ""} {
    append tmpScaleOpt "-activeforeground \"$menuBar(scrollActiveForeground)\" "
  }
  if {"$menuBar(scrollForeground)" != ""} {
    append tmpScaleOpt "-sliderforeground \"$menuBar(scrollForeground)\" "
  }

  # build widgets
  frame .menuBar.frame1.frame2.frame4.$menuBarName     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName config $tmpFrameOpt"

  label .menuBar.frame1.frame2.frame4.$menuBarName.message1     -relief raised     -text "$menuBarLabel1"
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.message1 config $tmpMessageOpt"

  scale .menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName     -from 0     -label "$menuBarLabel2"     -orient horizontal     -relief raised     -sliderlength 15     -to $menuBarTo     -width 8
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName config $tmpScaleOpt"

  # packing of the subwidgets
  pack .menuBar.frame1.frame2.frame4.$menuBarName.message1 -side left -fill y
  pack .menuBar.frame1.frame2.frame4.$menuBarName.$menuBarName -side left -fill x -expand 1
}


# Procedure: MenuBarScaleDouble
proc MenuBarScaleDouble { menuBarName menuBarLabel1 menuBarLabel2 menuBarLabel3 menuBarTo1 menuBarTo2} {
  global menuBar

  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScaleOpt ""
  if {"$menuBar(background)" != ""} {
    append tmpFrameOpt "-background \"$menuBar(background)\" "
    append tmpMessageOpt "-background \"$menuBar(background)\" "
    append tmpScaleOpt "-background \"$menuBar(background)\" "
  }
  if {"$menuBar(font)" != ""} {
    append tmpMessageOpt "-font \"$menuBar(font)\" "
  }
  if {"$menuBar(foreground)" != ""} {
    append tmpMessageOpt "-foreground \"$menuBar(foreground)\" "
    append tmpScaleOpt "-foreground \"$menuBar(foreground)\" "
  }
  if {"$menuBar(scrollActiveForeground)" != ""} {
    append tmpScaleOpt "-activeforeground \"$menuBar(scrollActiveForeground)\" "
  }
  if {"$menuBar(scrollForeground)" != ""} {
    append tmpScaleOpt "-sliderforeground \"$menuBar(scrollForeground)\" "
  }

  # build widgets
  frame .menuBar.frame1.frame2.frame4.$menuBarName     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName config $tmpFrameOpt"

  frame .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1 config $tmpFrameOpt"

  frame .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2     -borderwidth 0     -relief raised
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2 config $tmpFrameOpt"

  label .menuBar.frame1.frame2.frame4.$menuBarName.message1     -relief raised     -text "$menuBarLabel1"
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.message1 config $tmpMessageOpt"

  scale .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1.${menuBarName}1     -from 0     -label "$menuBarLabel2"     -orient horizontal     -relief raised     -sliderlength 15     -to $menuBarTo1     -width 8
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1.${menuBarName}1 config $tmpScaleOpt"

  scale .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2.${menuBarName}2     -from 0     -label "$menuBarLabel3"     -orient horizontal     -relief raised     -sliderlength 15     -to $menuBarTo2     -width 8
  catch ".menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2.${menuBarName}2 config $tmpScaleOpt"

  # packing of the subwidgets
  pack .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1.${menuBarName}1 -side left -fill x -expand 1
  pack .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2.${menuBarName}2 -side left -fill x -expand 1
  pack .menuBar.frame1.frame2.frame4.$menuBarName.message1 -side left -fill y
  pack .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}1 -side left -fill x -expand 1
  pack .menuBar.frame1.frame2.frame4.$menuBarName.${menuBarName}2 -side left -fill x -expand 1
}


# Procedure: MenuBarSelect1
proc MenuBarSelect1 { menuBarW menuBarY} {

  .menuBar.frame1.frame2.frame5.buttons select clear 0 end
  .menuBar.frame1.frame2.frame6.menus select clear 0 end

  set menuBarNearest [$menuBarW nearest $menuBarY]
  if {$menuBarNearest >= 0} {
    $menuBarW select clear 0 end
    $menuBarW select set $menuBarNearest
    MenuBarSetItem
    if {"$menuBarW" == ".menuBar.frame1.frame2.frame5.buttons"} {
      .menuBar.frame1.frame7.insert config         -state disabled
      .menuBar.frame1.frame7.modifymenu config         -state disabled
      .menuBar.frame1.frame7.delete config         -state disabled
    } {
      .menuBar.frame1.frame7.insert config         -state normal
      .menuBar.frame1.frame7.modifymenu config         -state normal
      .menuBar.frame1.frame7.delete config         -state normal
    }
  }
}


# Procedure: MenuBarSelect2
proc MenuBarSelect2 { menuBarW menuBarY} {

  set menuBarNearest [$menuBarW nearest $menuBarY]
  if {$menuBarNearest >= 0} {
    $menuBarW select clear 0 end
    $menuBarW select set $menuBarNearest
    MenuBarSetItem
  }
}


# Procedure: MenuBarSetItem
proc MenuBarSetItem {} {
  global menuBar

  set menuBarList ""
  set curSelected     [.menuBar.frame1.frame2.frame5.buttons curselection]
  if {[winfo ismapped .menuBar.frame1.frame2.frame5] && $curSelected >= 0} {
    set menuBarList .menuBar.frame1.frame2.frame5.buttons
    MenuBarSetItems menubutton
    set menuBarW [$menuBarList get $curSelected]
    # insert values
    .menuBar.frame1.frame2.frame4.actbg.actbg       insert 0 [lindex [$menuBarW config -activebackground] 4]
    .menuBar.frame1.frame2.frame4.actfg.actfg       insert 0 [lindex [$menuBarW config -activeforeground] 4]
    .menuBar.frame1.frame2.frame4.bg.bg       insert 0 [lindex [$menuBarW config -background] 4]
    .menuBar.frame1.frame2.frame4.bitmap.bitmap       insert 0 [lindex [$menuBarW config -bitmap] 4]
    if {"[lindex [$menuBarW config -borderwidth] 4]" != ""} {
      .menuBar.frame1.frame2.frame4.border.border         set [lindex [$menuBarW config -borderwidth] 4]
    }
    .menuBar.frame1.frame2.frame4.font.font       insert 0 [lindex [$menuBarW config -font] 4]
    .menuBar.frame1.frame2.frame4.fg.fg       insert 0 [lindex [$menuBarW config -foreground] 4]
    if {"[lindex [$menuBarW config -height] 4]" != ""} {
      .menuBar.frame1.frame2.frame4.size.size2.size2         set [lindex [$menuBarW config -height] 4]
    }
    .menuBar.frame1.frame2.frame4.label.label       insert 0 [lindex [$menuBarW config -text] 4]
    if {"[lindex [$menuBarW config -menu] 4]" != ""} {
      .menuBar.frame1.frame2.frame4.menu.menu         delete 0 end
    }
    .menuBar.frame1.frame2.frame4.menu.menu       insert 0 [lindex [$menuBarW config -menu] 4]
    .menuBar.frame1.frame2.frame4.textvar.textvar       insert 0 [lindex [$menuBarW config -textvariable] 4]
    if {"[lindex [$menuBarW config -underline] 4]" != ""} {
      .menuBar.frame1.frame2.frame4.underline.underline         set [lindex [$menuBarW config -underline] 4]
    }
    if {"[lindex [$menuBarW config -width] 4]" != ""} {
      .menuBar.frame1.frame2.frame4.size.size1.size1         set [lindex [$menuBarW config -width] 4]
    }
  } {
    set curSelected       [.menuBar.frame1.frame2.frame6.menus curselection]
    if {[winfo ismapped .menuBar.frame1.frame2.frame6] && $curSelected >= 0} {
      set menuBarList .menuBar.frame1.frame2.frame6.menus
      MenuBarSetItems menu
      set menuBarW [$menuBarList get $curSelected]
      # insert values
      .menuBar.frame1.frame2.frame4.name.name         insert 0 [.menuBar.frame1.frame2.frame6.menus get $curSelected]
      .menuBar.frame1.frame2.frame4.actbg.actbg         insert 0 [lindex [$menuBarW config -activebackground] 4]
      if {"[lindex [$menuBarW config -activeborderwidth] 4]" != ""} {
        .menuBar.frame1.frame2.frame4.actborder.actborder           set [lindex [$menuBarW config -activeborderwidth] 4]
      }
      .menuBar.frame1.frame2.frame4.actfg.actfg         insert 0 [lindex [$menuBarW config -activeforeground] 4]
      .menuBar.frame1.frame2.frame4.bg.bg         insert 0 [lindex [$menuBarW config -background] 4]
      if {"[lindex [$menuBarW config -borderwidth] 4]" != ""} {
        .menuBar.frame1.frame2.frame4.border.border           set [lindex [$menuBarW config -borderwidth] 4]
      }
      .menuBar.frame1.frame2.frame4.font.font         insert 0 [lindex [$menuBarW config -font] 4]
      .menuBar.frame1.frame2.frame4.fg.fg         insert 0 [lindex [$menuBarW config -foreground] 4]
    } {
      set curSelected         [.menuBar.frame1.frame2.frame8.menu curselection]
      if {[winfo ismapped .menuBar.frame1.frame2.frame8] &&
          $curSelected >= 0} {
        set menuBarList .menuBar.frame1.frame2.frame8.menu
        case [.menuBar.frame1.frame2.frame8.menu get $curSelected] in {
          {<cascade*} {
            set menuBar(menuType) "<cascade> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 0 -state active
            MenuBarSetItems cascade
          }
          {<check*} {
            set menuBar(menuType) "<checkbutton> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 1 -state active
            MenuBarSetItems check
          }
          {<radio*} {
            set menuBar(menuType) "<radiobutton> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 3 -state active
            MenuBarSetItems radio
          }
          {<separator*} {
            set menuBar(menuType) "<separator> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 4 -state active
            MenuBarSetItems separator
          }
          {<tearoff*} {
            set menuBar(menuType) "<tearoff> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 4 -state active
            MenuBarSetItems tearoff
          }
          {default} {
            set menuBar(menuType) "<command> "
            .menuBar.frame1.frame2.frame4.items.items.m               entryconfigure 2 -state active
            MenuBarSetItems command
          }
        }
        # insert values
        if {![string match <separator* [.menuBar.frame1.frame2.frame8.menu get $curSelected]] &&
            ![string match <tearoff* [.menuBar.frame1.frame2.frame8.menu get $curSelected]]} {
          set menuBarW [.menuBar.frame1.frame2.frame6.menus get [.menuBar.frame1.frame2.frame6.menus curselection]]
          .menuBar.frame1.frame2.frame4.accelerator.accelerator             insert 0 [lindex [$menuBarW entryconfig $curSelected -accelerator] 4]
          .menuBar.frame1.frame2.frame4.actbg.actbg             insert 0 [lindex [$menuBarW entryconfig $curSelected -activebackground] 4]
          .menuBar.frame1.frame2.frame4.bg.bg             insert 0 [lindex [$menuBarW entryconfig $curSelected -background] 4]
          .menuBar.frame1.frame2.frame4.bitmap.bitmap             insert 0 [lindex [$menuBarW entryconfig $curSelected -bitmap] 4]
          .menuBar.frame1.frame2.frame4.command.command delete 1.0 end
          .menuBar.frame1.frame2.frame4.command.command insert 1.0             [lindex [$menuBarW entryconfig $curSelected -command] 4]
          .menuBar.frame1.frame2.frame4.font.font             insert 0 [lindex [$menuBarW entryconfig $curSelected -font] 4]
          .menuBar.frame1.frame2.frame4.label.label             insert 0 [lindex [$menuBarW entryconfig $curSelected -label] 4]
          set menuBar(state)             [lindex [$menuBarW entryconfig $curSelected -state] 4]
          case $menuBar(state) in {
            {active} {
              .menuBar.frame1.frame2.frame4.state.active select
            }
            {disabled} {
              .menuBar.frame1.frame2.frame4.state.disabled select
            }
            {default} {
              .menuBar.frame1.frame2.frame4.state.normal select
            }
          }
          if {"[lindex [$menuBarW entryconfig $curSelected -underline] 4]" != ""} {
            .menuBar.frame1.frame2.frame4.underline.underline               set [lindex [$menuBarW entryconfig $curSelected -underline] 4]
          }
          case [.menuBar.frame1.frame2.frame8.menu get $curSelected] in {
            {<cascade*} {
              if {"[lindex [$menuBarW entryconfig $curSelected -menu] 4]" != ""} {
                .menuBar.frame1.frame2.frame4.menu.menu                   delete 0 end
              }
              .menuBar.frame1.frame2.frame4.menu.menu                 insert 0 [lindex [$menuBarW entryconfig $curSelected -menu] 4]
            }
            {<radiobutton*} {
              .menuBar.frame1.frame2.frame4.value.value                 insert 0 [lindex [$menuBarW entryconfig $curSelected -value] 4]
              .menuBar.frame1.frame2.frame4.variable.variable                 insert 0 [lindex [$menuBarW entryconfig $curSelected -variable] 4]
            }
            {<checkbutton*} {
              .menuBar.frame1.frame2.frame4.offvalue.offvalue                 insert 0 [lindex [$menuBarW entryconfig $curSelected -offvalue] 4]
              .menuBar.frame1.frame2.frame4.onvalue.onvalue                 insert 0 [lindex [$menuBarW entryconfig $curSelected -onvalue] 4]
              .menuBar.frame1.frame2.frame4.variable.variable                 insert 0 [lindex [$menuBarW entryconfig $curSelected -variable] 4]
            }
          }
        }
      }
    }
  }
}


# Procedure: MenuBarSetItems
proc MenuBarSetItems { menuBarType} {

  # remove widgets
  pack forget .menuBar.frame1.frame2.frame4.items
  pack forget .menuBar.frame1.frame2.frame4.accelerator
  pack forget .menuBar.frame1.frame2.frame4.actbg
  pack forget .menuBar.frame1.frame2.frame4.actborder
  pack forget .menuBar.frame1.frame2.frame4.actfg
  pack forget .menuBar.frame1.frame2.frame4.bg
  pack forget .menuBar.frame1.frame2.frame4.bitmap
  pack forget .menuBar.frame1.frame2.frame4.border
  pack forget .menuBar.frame1.frame2.frame4.message1
  pack forget .menuBar.frame1.frame2.frame4.command
  pack forget .menuBar.frame1.frame2.frame4.font
  pack forget .menuBar.frame1.frame2.frame4.fg
  pack forget .menuBar.frame1.frame2.frame4.label
  pack forget .menuBar.frame1.frame2.frame4.menu
  pack forget .menuBar.frame1.frame2.frame4.name
  pack forget .menuBar.frame1.frame2.frame4.offvalue
  pack forget .menuBar.frame1.frame2.frame4.onvalue
  pack forget .menuBar.frame1.frame2.frame4.size
  pack forget .menuBar.frame1.frame2.frame4.state
  pack forget .menuBar.frame1.frame2.frame4.textvar
  pack forget .menuBar.frame1.frame2.frame4.underline
  pack forget .menuBar.frame1.frame2.frame4.value
  pack forget .menuBar.frame1.frame2.frame4.variable

  # clear entry fields
  .menuBar.frame1.frame2.frame4.accelerator.accelerator     delete 0 end
  .menuBar.frame1.frame2.frame4.actbg.actbg     delete 0 end
  .menuBar.frame1.frame2.frame4.actborder.actborder     set 0
  .menuBar.frame1.frame2.frame4.actfg.actfg     delete 0 end
  .menuBar.frame1.frame2.frame4.bg.bg     delete 0 end
  .menuBar.frame1.frame2.frame4.bitmap.bitmap     delete 0 end
  .menuBar.frame1.frame2.frame4.border.border     set 0
  .menuBar.frame1.frame2.frame4.command.command     delete 1.0 end
  .menuBar.frame1.frame2.frame4.font.font     delete 0 end
  .menuBar.frame1.frame2.frame4.fg.fg     delete 0 end
  .menuBar.frame1.frame2.frame4.size.size2.size2     set 0
  .menuBar.frame1.frame2.frame4.label.label     delete 0 end
  .menuBar.frame1.frame2.frame4.menu.menu     delete 0 end
  .menuBar.frame1.frame2.frame4.name.name     delete 0 end
  .menuBar.frame1.frame2.frame4.offvalue.offvalue     delete 0 end
  .menuBar.frame1.frame2.frame4.onvalue.onvalue     delete 0 end
  .menuBar.frame1.frame2.frame4.state.normal     select
  .menuBar.frame1.frame2.frame4.textvar.textvar     delete 0 end
  .menuBar.frame1.frame2.frame4.underline.underline     set -1
  .menuBar.frame1.frame2.frame4.value.value     delete 0 end
  .menuBar.frame1.frame2.frame4.variable.variable     delete 0 end
  .menuBar.frame1.frame2.frame4.size.size1.size1     set 0

  case $menuBarType in {
    {menubutton} {
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actfg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
      pack .menuBar.frame1.frame2.frame4.border -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.fg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.label -side top -fill x
      pack .menuBar.frame1.frame2.frame4.menu -side top -fill x
      pack .menuBar.frame1.frame2.frame4.size -side top -fill x
      pack .menuBar.frame1.frame2.frame4.textvar -side top -fill x
      pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
    }
    {menu} {
      pack .menuBar.frame1.frame2.frame4.name -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actborder -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actfg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.border -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.fg -side top -fill x
    }
    {cascade} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Cascadebutton

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
      pack .menuBar.frame1.frame2.frame4.label -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.accelerator -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.menu {top fill}
      pack .menuBar.frame1.frame2.frame4.state -side top -fill x
      pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
      pack .menuBar.frame1.frame2.frame4.message1 -side top -fill x
      pack .menuBar.frame1.frame2.frame4.command -side top -fill both
    }
    {check} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Checkbutton

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
      pack .menuBar.frame1.frame2.frame4.label -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.accelerator -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.offvalue -side top -fill x
      pack .menuBar.frame1.frame2.frame4.onvalue -side top -fill x
      pack .menuBar.frame1.frame2.frame4.state -side top -fill x
      pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
      pack .menuBar.frame1.frame2.frame4.variable -side top -fill x
      pack .menuBar.frame1.frame2.frame4.message1 -side top -fill x
      pack .menuBar.frame1.frame2.frame4.command -side top -fill both
    }
    {radio} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Radiobutton

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
      pack .menuBar.frame1.frame2.frame4.label -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.accelerator -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.state -side top -fill x
      pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
      pack .menuBar.frame1.frame2.frame4.value -side top -fill x
      pack .menuBar.frame1.frame2.frame4.variable -side top -fill x
      pack .menuBar.frame1.frame2.frame4.message1 -side top -fill x
      pack .menuBar.frame1.frame2.frame4.command -side top -fill both
    }
    {separator} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Separator

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
    }
    {tearoff} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Tearoff

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
    }
    {default} {
      .menuBar.frame1.frame2.frame4.items.message1 configure         -text Commandbutton

      pack .menuBar.frame1.frame2.frame4.items -side top -fill x
      pack .menuBar.frame1.frame2.frame4.label -side top -fill x
      pack .menuBar.frame1.frame2.frame4.actbg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.accelerator -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bg -side top -fill x
      pack .menuBar.frame1.frame2.frame4.bitmap -side top -fill x
      pack .menuBar.frame1.frame2.frame4.font -side top -fill x
      pack .menuBar.frame1.frame2.frame4.state -side top -fill x
      pack .menuBar.frame1.frame2.frame4.underline -side top -fill x
      pack .menuBar.frame1.frame2.frame4.message1 -side top -fill x
      pack .menuBar.frame1.frame2.frame4.command -side top -fill both
    }
  }
}


# Procedure: MenuPopupAdd
if {"[info procs MenuPopupAdd]" == ""} {
proc MenuPopupAdd { cbW cbButton cbMenu {cbModifier ""} {cbCanvasTag ""}} {
# the popup menu handling is from (I already gave up with popup handling :-):
#
# Copyright 1991,1992 by James Noble.
# Everyone is granted permission to copy, modify and redistribute.
# This notice must be preserved on all copies or derivates.
#
##########
# Procedure: MenuPopupAdd
# Description: attach a popup menu to widget
# Arguments: cbW - the widget
#            cbButton - the button we use
#            cbMenu - the menu to attach
#            {cbModifier} - a optional modifier
#            {cbCanvasTag} - a canvas tagOrId
# Returns: none
# Sideeffects: none
##########
  global tk_popupPriv

  set tk_popupPriv($cbMenu,focus) ""
  set tk_popupPriv($cbMenu,grab) ""
  if {"$cbModifier" != ""} {
    set press "$cbModifier-"
    set motion "$cbModifier-"
    set release "Any-"
  } {
    set press ""
    set motion ""
    set release ""
  }

  bind $cbMenu "<${motion}B${cbButton}-Motion>"     "MenuPopupMotion $cbMenu %W %X %Y"
  bind $cbMenu "<${release}ButtonRelease-${cbButton}>"     "MenuPopupRelease $cbMenu %W"
  if {"$cbCanvasTag" == ""} {
    bind $cbW "<${press}ButtonPress-${cbButton}>"       "MenuPopupPost $cbMenu %X %Y"
    bind $cbW "<${release}ButtonRelease-${cbButton}>"       "MenuPopupRelease $cbMenu %W"
  } {
    $cbW bind $cbCanvasTag "<${press}ButtonPress-${cbButton}>"       "MenuPopupPost $cbMenu %X %Y"
    $cbW bind $cbCanvasTag "<${release}ButtonRelease-${cbButton}>"       "MenuPopupRelease $cbMenu %W"
  }
}
}


# Procedure: MenuPopupHandle
if {"[info procs MenuPopupHandle]" == ""} {
proc MenuPopupHandle { cbMenu cbW cbX cbY} {

 if {"[info commands $cbMenu]" != "" && [winfo ismapped $cbMenu]} {
   set cbPopMinX [winfo rootx $cbMenu]
   set cbPopMaxX [expr "$cbPopMinX+[winfo width $cbMenu]"]
   if {($cbX >= $cbPopMinX) &&  ($cbX <= $cbPopMaxX)} {
     $cbMenu activate @[expr "$cbY - [winfo rooty $cbMenu]"]
   } {
     $cbMenu activate none}
   }
}
}


# Procedure: MenuPopupMotion
if {"[info procs MenuPopupMotion]" == ""} {
proc MenuPopupMotion { cbMenu cbW cbX cbY} {
##########
# Procedure: MenuPopupMotion
# Description: handle the popup menu motion
# Arguments: cbMenu - the topmost menu
#            cbW - the menu
#            cbX - the root x coordinate
#            cbY - the root x coordinate
# Returns: none
# Sideeffects: none
##########
  global tk_popupPriv

  if {"[info commands $cbW]" != "" && [winfo ismapped $cbW] &&
      "[winfo class $cbW]" == "Menu" &&
      [info exists tk_popupPriv($cbMenu,focus)] &&
      "$tk_popupPriv($cbMenu,focus)" != "" &&
      [info exists tk_popupPriv($cbMenu,grab)] &&
      "$tk_popupPriv($cbMenu,grab)" != ""} {
    set cbPopMinX [winfo rootx $cbW]
    set cbPopMaxX [expr $cbPopMinX+[winfo width $cbW]]
    if {$cbX >= $cbPopMinX && $cbX <= $cbPopMaxX} {
      $cbW activate @[expr $cbY-[winfo rooty $cbW]]
      if {![catch "$cbW entryconfig @[expr $cbY-[winfo rooty $cbW]] -menu" result]} {
        if {"[lindex $result 4]" != ""} {
          foreach binding [bind $cbMenu] {
            bind [lindex $result 4] $binding [bind $cbMenu $binding]
          }
        }
      }
    } {
      $cbW activate none
    }
  }
}
}


# Procedure: MenuPopupPost
if {"[info procs MenuPopupPost]" == ""} {
proc MenuPopupPost { cbMenu cbX cbY} {
##########
# Procedure: MenuPopupPost
# Description: post the popup menu
# Arguments: cbMenu - the menu
#            cbX - the root x coordinate
#            cbY - the root x coordinate
# Returns: none
# Sideeffects: none
##########
  global tk_popupPriv

  if {"[info commands $cbMenu]" != ""} {
    if {![info exists tk_popupPriv($cbMenu,focus)]} {
      set tk_popupPriv($cbMenu,focus) [focus]
    } {
      if {"$tk_popupPriv($cbMenu,focus)" == ""} {
        set tk_popupPriv($cbMenu,focus) [focus]
      }
    }
    set tk_popupPriv($cbMenu,grab) $cbMenu

    catch "$cbMenu activate none"
    catch "$cbMenu post $cbX $cbY"
    catch "focus $cbMenu"
    catch "grab -global $cbMenu"
  }
}
}


# Procedure: MenuPopupRelease
if {"[info procs MenuPopupRelease]" == ""} {
proc MenuPopupRelease { cbMenu cbW} {
##########
# Procedure: MenuPopupRelease
# Description: remove the popup menu
# Arguments: cbMenu - the topmost menu widget
#            cbW - the menu widget
# Returns: none
# Sideeffects: none
##########
  global tk_popupPriv

  if {"[info commands $cbW]" != "" && [winfo ismapped $cbW] &&
      "[winfo class $cbW]" == "Menu" &&
      [info exists tk_popupPriv($cbMenu,focus)] &&
      "$tk_popupPriv($cbMenu,focus)" != "" &&
      [info exists tk_popupPriv($cbMenu,grab)] &&
      "$tk_popupPriv($cbMenu,grab)" != ""} {
    catch "grab release $tk_popupPriv($cbMenu,grab)"
    catch "focus $tk_popupPriv($cbMenu,focus)"
    set tk_popupPriv($cbMenu,focus) ""
    set tk_popupPriv($cbMenu,grab) ""
    if {"[$cbW index active]" != "none"} {
      $cbW invoke active; catch "$cbMenu unpost"
    }
  }
  catch "$cbMenu unpost"
}
}


# Procedure: NoFunction
if {"[info procs NoFunction]" == ""} {
proc NoFunction { args} {
##########
# Procedure: NoFunction
# Description: do nothing (especially with scales and scrollbars)
# Arguments: args - a number of ignored parameters
# Returns: none
# Sideeffects: none
##########
}
}


# Procedure: ReadBox
proc ReadBox {} {
##########
# Procedure: ReadBox
# Description: show a box where tcl code can be entered and
#              evaluated
# Arguments: none
# Returns: none
# Sideeffects: may be everything...
##########
#
# global readBox(activeBackground) - active background color
# global readBox(activeForeground) - active foreground color
# global readBox(background) - background color
# global readBox(font) - text font
# global readBox(foreground) - foreground color
# global readBox(scrollActiveForeground) - scrollbar active background color
# global readBox(scrollBackground) - scrollbar background color
# global readBox(scrollForeground) - scrollbar foreground color
# global readBox(scrollSide) - side where scrollbar is located

  global readBox

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScrollOpt ""
  if {"$readBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$readBox(activeBackground)\" "
  }
  if {"$readBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$readBox(activeForeground)\" "
  }
  if {"$readBox(background)" != ""} {
    append tmpButtonOpt "-background \"$readBox(background)\" "
    append tmpFrameOpt "-background \"$readBox(background)\" "
    append tmpMessageOpt "-background \"$readBox(background)\" "
  }
  if {"$readBox(font)" != ""} {
    append tmpButtonOpt "-font \"$readBox(font)\" "
    append tmpMessageOpt "-font \"$readBox(font)\" "
  }
  if {"$readBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$readBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$readBox(foreground)\" "
  }
  if {"$readBox(scrollActiveForeground)" != ""} {
    append tmpScrollOpt "-activebackground \"$readBox(scrollActiveForeground)\" "
  }
  if {"$readBox(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$readBox(scrollBackground)\" "
  }
  if {"$readBox(scrollForeground)" != ""} {
    append tmpScrollOpt "-background \"$readBox(scrollForeground)\" "
  }

  # build widget structure

  # start build of toplevel
  if {"[info commands CBSavedDestroy]" != ""} {
    catch {CBSavedDestroy .readBox}
  } {
    catch {destroy .readBox}
  }
  toplevel .readBox     -borderwidth 0
  catch ".readBox config $tmpFrameOpt"
  wm geometry .readBox 420x300
  wm title .readBox {Read TCL commands}
  wm maxsize .readBox 1000 1000
  wm minsize .readBox 100 100
  # end build of toplevel

  button .readBox.ok     -text "OK"     -command {
      if {"[info commands CBSavedDestroy]" != ""} {
        catch {CBSavedDestroy .readBox}
      } {
        catch {destroy .readBox}
      }}
  catch ".readBox.ok config $tmpButtonOpt"

  frame .readBox.frame1     -borderwidth 0     -relief raised
  catch ".readBox.frame1 config $tmpFrameOpt"
 
  button .readBox.frame1.send     -text "Send"     -command {
      if {[catch "[string trim [.readBox.text1.text1 get 1.0 end]]" result]} {
        if {"[info commands AlertBox]" != ""} {
          AlertBox "$result"
        } {
          puts stderr "$result"
        }
      }
      flush stderr
      flush stdout}
  catch ".readBox.frame1.send config $tmpButtonOpt"

  button .readBox.frame1.sendAndClear     -text "Send + Clear"     -command {
      if {[catch "[string trim [.readBox.text1.text1 get 1.0 end]]" result]} {
        if {"[info commands AlertBox]" != ""} {
          AlertBox "$result"
        } {
          puts stderr "$result"
        }
      }
      flush stderr
      flush stdout
      .readBox.text1.text1 delete 1.0 end}
  catch ".readBox.frame1.sendAndClear config $tmpButtonOpt"

  button .readBox.frame1.clear     -text "Clear"     -command {.readBox.text1.text1 delete 1.0 end}
  catch ".readBox.frame1.clear config $tmpButtonOpt"

  frame .readBox.text1     -borderwidth 0     -relief raised
  catch ".readBox.text1 config $tmpFrameOpt"
 
  scrollbar .readBox.text1.scrollbar1     -command {.readBox.text1.text1 yview}     -relief "raised"
  catch ".readBox.text1.scrollbar1 config $tmpScrollOpt"

  text .readBox.text1.text1     -borderwidth "2"     -exportselection "true"     -insertbackground "blue"     -relief "raised"     -yscrollcommand ".readBox.text1.scrollbar1 set"
  catch ".readBox.text1.text1 config $tmpMessageOpt"

  # packing
  pack .readBox.frame1.send -side left -fill both -expand 1
  pack .readBox.frame1.sendAndClear -side left -fill both -expand 1
  pack .readBox.frame1.clear -side left -fill both -expand 1
  pack .readBox.text1.scrollbar1 -side $readBox(scrollSide) -fill y
  pack .readBox.text1.text1 -side top -fill both -expand 1
  pack .readBox.ok -side bottom -fill both
  pack .readBox.frame1 -side bottom -fill both
  pack .readBox.text1 -side bottom -fill both -expand 1
}


# Procedure: SN
if {"[info procs SN]" == ""} {
proc SN { {cbName ""}} {
##########
# Procedure: SN
# Description: map a symbolic name to the widget path
# Arguments: cbName
# Returns: the symbolic name
# Sideeffects: none
##########

  SymbolicName $cbName
}
}


# Procedure: SendToEmacs
proc SendToEmacs { emacsLisp} {

  if {"$emacsLisp" == ""} {
    return
  }
  if {[catch ".frame.text send \{$emacsLisp\}" emacsResult]} {
    EmacsError .frame.text $emacsResult
  }
}


# Procedure: SymbolicName
if {"[info procs SymbolicName]" == ""} {
proc SymbolicName { {cbName ""}} {
##########
# Procedure: SymbolicName
# Description: map a symbolic name to the widget path
# Arguments: cbName
# Returns: the symbolic name
# Sideeffects: none
##########

  global symbolicName

  if {"$cbName" != ""} {
    set cbArrayName ""
    append cbArrayName symbolicName ( $cbName )
    if {![catch "set \"$cbArrayName\"" cbValue]} {
      return $cbValue
    } {
      if {"[info commands CBProcError]" != ""} {
        CBProcError "Unknown symbolic name:\n$cbName"
      } {
        puts stderr "CB error: unknown symbolic name:\n$cbName"
      }
    }
  }
  return ""
}
}


# Procedure: TextBox
proc TextBox { {textBoxMessage "Text message"} {textBoxCommand ""} {textBoxGeometry "350x150"} {textBoxTitle "Text box"} args} {
##########
# Procedure: TextBox
# Description: show text box
# Arguments: {textBoxMessage} - the text to display
#            {textBoxCommand} - the command to call after ok
#            {textBoxGeometry} - the geometry for the window
#            {textBoxTitle} - the title for the window
#            {args} - labels of buttons
# Returns: The number of the selected button, or nothing
# Sideeffects: none
# Notes: there exist also functions called:
#          TextBoxFile - to open and read a file automatically
#          TextBoxFd - to read from an already opened filedescriptor
##########
#
# global textBox(activeBackground) - active background color
# global textBox(activeForeground) - active foreground color
# global textBox(background) - background color
# global textBox(font) - text font
# global textBox(foreground) - foreground color
# global textBox(scrollActiveForeground) - scrollbar active background color
# global textBox(scrollBackground) - scrollbar background color
# global textBox(scrollForeground) - scrollbar foreground color
# global textBox(scrollSide) - side where scrollbar is located

  global textBox

  # show text box
  if {[llength $args] > 0} {
    eval TextBoxInternal "\{$textBoxMessage\}" "\{$textBoxCommand\}" "\{$textBoxGeometry\}" "\{$textBoxTitle\}" $args
  } {
    TextBoxInternal $textBoxMessage $textBoxCommand $textBoxGeometry $textBoxTitle
  }

  if {[llength $args] > 0} {
    # wait for the box to be destroyed
    update idletask
    grab $textBox(toplevelName)
    tkwait window $textBox(toplevelName)

    return $textBox(button)
  }
}


# Procedure: TextBoxInternal
proc TextBoxInternal { textBoxMessage textBoxCommand textBoxGeometry textBoxTitle args} {
  global textBox

  set tmpButtonOpt ""
  set tmpFrameOpt ""
  set tmpMessageOpt ""
  set tmpScrollOpt ""
  if {"$textBox(activeBackground)" != ""} {
    append tmpButtonOpt "-activebackground \"$textBox(activeBackground)\" "
  }
  if {"$textBox(activeForeground)" != ""} {
    append tmpButtonOpt "-activeforeground \"$textBox(activeForeground)\" "
  }
  if {"$textBox(background)" != ""} {
    append tmpButtonOpt "-background \"$textBox(background)\" "
    append tmpFrameOpt "-background \"$textBox(background)\" "
    append tmpMessageOpt "-background \"$textBox(background)\" "
  }
  if {"$textBox(font)" != ""} {
    append tmpButtonOpt "-font \"$textBox(font)\" "
    append tmpMessageOpt "-font \"$textBox(font)\" "
  }
  if {"$textBox(foreground)" != ""} {
    append tmpButtonOpt "-foreground \"$textBox(foreground)\" "
    append tmpMessageOpt "-foreground \"$textBox(foreground)\" "
  }
  if {"$textBox(scrollActiveForeground)" != ""} {
    append tmpScrollOpt "-activebackground \"$textBox(scrollActiveForeground)\" "
  }
  if {"$textBox(scrollBackground)" != ""} {
    append tmpScrollOpt "-troughcolor \"$textBox(scrollBackground)\" "
  }
  if {"$textBox(scrollForeground)" != ""} {
    append tmpScrollOpt "-background \"$textBox(scrollForeground)\" "
  }

  # start build of toplevel
  if {"[info commands CBSavedDestroy]" != ""} {
    catch {CBSavedDestroy $textBox(toplevelName)}
  } {
    catch {destroy $textBox(toplevelName)}
  }
  toplevel $textBox(toplevelName)     -borderwidth 0
  catch "$textBox(toplevelName) config $tmpFrameOpt"
  if {[catch "wm geometry $textBox(toplevelName) $textBoxGeometry"]} {
    wm geometry $textBox(toplevelName) 350x150
  }
  wm title $textBox(toplevelName) $textBoxTitle
  wm maxsize $textBox(toplevelName) 1000 1000
  wm minsize $textBox(toplevelName) 100 100
  # end build of toplevel

  frame $textBox(toplevelName).frame0     -borderwidth 0     -relief raised
  catch "$textBox(toplevelName).frame0 config $tmpFrameOpt"

  text $textBox(toplevelName).frame0.text1     -relief raised     -wrap none     -borderwidth 2     -yscrollcommand "$textBox(toplevelName).frame0.vscroll set"
  catch "$textBox(toplevelName).frame0.text1 config $tmpMessageOpt"

  scrollbar $textBox(toplevelName).frame0.vscroll     -relief raised     -command "$textBox(toplevelName).frame0.text1 yview"
  catch "$textBox(toplevelName).frame0.vscroll config $tmpScrollOpt"

  frame $textBox(toplevelName).frame1     -borderwidth 0     -relief raised
  catch "$textBox(toplevelName).frame1 config $tmpFrameOpt"

  set textBoxCounter 0
  set buttonNum [llength $args]

  if {$buttonNum > 0} {
    while {$textBoxCounter < $buttonNum} {
      button $textBox(toplevelName).frame1.button$textBoxCounter         -text "[lindex $args $textBoxCounter]"         -command "
          global textBox
          set textBox(button) $textBoxCounter
          set textBox(contents) \[$textBox(toplevelName).frame0.text1 get 1.0 end\]
          if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
            catch {CBSavedDestroy $textBox(toplevelName)}
          } {
            catch {destroy $textBox(toplevelName)}
          }"
      catch "$textBox(toplevelName).frame1.button$textBoxCounter config $tmpButtonOpt"

      pack $textBox(toplevelName).frame1.button$textBoxCounter -side left -fill x -expand 1

      incr textBoxCounter
    }
  } {
    button $textBox(toplevelName).frame1.button0       -text "OK"       -command "
        global textBox
        set textBox(button) 0
        set textBox(contents) \[$textBox(toplevelName).frame0.text1 get 1.0 end\]
        if {\"\[info commands CBSavedDestroy\]\" != \"\"} {
          catch {CBSavedDestroy $textBox(toplevelName)}
        } {
          catch {destroy $textBox(toplevelName)}
        }
        $textBoxCommand"
    catch "$textBox(toplevelName).frame1.button0 config $tmpButtonOpt"

    pack $textBox(toplevelName).frame1.button0 -side left -fill x -expand 1
  }

  $textBox(toplevelName).frame0.text1 insert end "$textBoxMessage"

  $textBox(toplevelName).frame0.text1 config     -state $textBox(state)

  # packing
  pack $textBox(toplevelName).frame0.vscroll -side $textBox(scrollSide) -fill y
  pack $textBox(toplevelName).frame0.text1 -side left -fill both -expand 1
  pack $textBox(toplevelName).frame1 -side bottom -fill both
  pack $textBox(toplevelName).frame0 -side top -fill both -expand 1
}


# Procedure: Unalias
if {"[info procs Unalias]" == ""} {
proc Unalias { aliasName} {
##########
# Procedure: Unalias
# Description: remove an alias for a procedure
# Arguments: aliasName - the alias name to remove
# Returns: none
# Sideeffects: internalAliasList is updated, and the alias
#              proc is removed
##########
  global internalAliasList

  set cbIndex [lsearch $internalAliasList "$aliasName *"]
  if {$cbIndex != -1} {
    rename $aliasName ""
    set internalAliasList [lreplace $internalAliasList $cbIndex $cbIndex]
  }
}
}


# Procedure: tkSteal_getarg
proc tkSteal_getarg { opts arg var} {
  set ind [lsearch $opts [concat $arg *]]
  if {$ind==-1} {
    error "ARG ERROR: application tried to find nonexistend arg \"$arg\"!"
  }
  # The variable named var will contain the value.
  upvar 1 $var varr
  set varr [lindex [lindex $opts $ind] 4]
  if {"[lindex [lindex $opts $ind] 3]" ==
      "[lindex [lindex $opts $ind] 4]"} {
    return 0
  } {
    return 1
  }
}


# Procedure: tkSteal_parseargs
proc tkSteal_parseargs { cmdline descr args} {
  if {$args!=""} {upvar 1 [lindex $args 0] changed}
  set changed {}
  for {set i 0} {$i<[llength $cmdline]} {incr i} {
    set name [lindex $cmdline $i]
    while {[llength $name]>0} {
      if {[llength $name]==1} {
        set value [lindex $cmdline [expr $i+1]]
        incr i
      } else {
        set value [lindex $name 1]
        set name [lindex $name 0]
      }
      # Find option
      set ind [lsearch $descr [concat $name *]]
      if {$ind==-1} {
        set ind [lsearch $descr $name]
        if {$ind==-1} {
          error "unknown option \"$name\""
        }
      }
      lappend changed $name
      # Enter value
      set descr [lreplace $descr $ind $ind         [lreplace [lindex $descr $ind] 4 4 $value]]
      set name [lreplace $name 0 1]
    }
  }
  # New optlist
  set new {}
  foreach item $descr {
    if {[llength $item]<=5} {
      lappend new $item
    } else {
      # XXX Maybe should demand the default to be in ready format...
      # So the exec. time might be a LITTLE faster.
      #
      # Eval the type getting actions.
      set act [lindex $item 5]
      regsub -all "%\(value\)" $act [lindex $item 3] act
      set item [lreplace $item 3 3 [eval $act]]
      set act [lindex $item 5]
      regsub -all "%\(value\)" $act [lindex $item 4] act
      lappend new [lreplace $item 4 4 [eval $act]]
    }
  }
  return $new
}


proc tkEmacs {pathName args} {
  global tk_library
  global tkEmacs_priv
  global tkEmacs_ARGUMENTS

  # initialize the data
  set tkEmacs_priv($pathName,initialized) 0
  set tkEmacs_priv($pathName,emacsAvailable) 0
  set tkEmacs_priv($pathName,windowId) 0
  set tkEmacs_priv($pathName,pid) 0
  set tkEmacs_priv($pathName,handle) ""
  set tkEmacs_priv($pathName,config) \
    [tkSteal_parseargs $args $tkEmacs_ARGUMENTS]
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -reparent reparent

  # create parent widget
  if {$reparent} {
    frame $pathName -borderwidth 0 -class TkEmacs
    rename $pathName $pathName-internal
  }
  proc $pathName args "
return \[eval tkEmacs_command $pathName \$args\]"

  if {$reparent} {
    frame $pathName.cbl -borderwidth 0 -width 1 -height 1
    rename $pathName.cbl $pathName-cblinternal
    pack $pathName.cbl -side top -fill both -expand 1
  }
  proc $pathName.cbl args "
return \[eval tkEmacs_command $pathName \$args\]"

  if {$reparent} {
    # check if interpreter can access X
    catch "xaccess" result
    if {![string match "wrong # args*" $result]} {
      error "tkEmacs: the command xaccess is not available"
    }
  }

  if {$reparent} {
    bind $pathName <Map> "
      tkEmacs_start %W $args"
    bind $pathName <Destroy> {
      tkEmacs_stop %W}
    bind $pathName <Expose> {
      if {"$tkEmacs_priv(%W,windowId)" != "" &&
          $tkEmacs_priv(%W,windowId) != 0 &&
          $tkEmacs_priv(%W,emacsAvailable) != 0} {
        catch "xaccess eventexpose \
          -windowid $tkEmacs_priv(%W,windowId)"
      }}
    bind $pathName <Configure> {
      if {"$tkEmacs_priv(%W,windowId)" != "" &&
          $tkEmacs_priv(%W,windowId) != 0 &&
          $tkEmacs_priv(%W,emacsAvailable) != 0} {
        catch "xaccess eventconfigure \
          -windowid $tkEmacs_priv(%W,windowId) \
          -borderwidth 0 \
          -x 0 \
          -y 0 \
          -width [winfo width %W] \
          -height [winfo height %W]"
      }}
  } {
    eval tkEmacs_start $pathName $args
  }
}

 proc tkEmacs_start {pathName args} {
  global dp_version
  global tkEmacs_priv

  if {$tkEmacs_priv($pathName,initialized) || "$pathName" == ""} {
    return
  }

  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -useadvise useadvise
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -background background
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -borderwidth borderwidth
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -command command
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -lispfile lispfile
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -startupsource startupsource
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -background background
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -insertbackground insertbackground
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -foreground foreground
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -font font
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -relief relief
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -selectbackground selectbackground
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -selectforeground selectforeground
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -debug debug
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -width width
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -height height
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -reparent reparent
  set tkEmacs_priv(debug) $debug

  if {"$command" == "" ||
      (![auto_execok [lindex $command 0]] &&
       ![file executable [lindex $command 0]])} {
    error "tkEmacs: no valid emacs command specified \"$command\""
  }

  # create file handle procedures
  set newBody [info body tkEmacs_accept]
  regsub -all WIDGET_NAME $newBody $pathName newBody
  eval "proc tkEmacs_accept_$pathName \{condition fileId\} \{$newBody\}"
  set newBody [info body tkEmacs_read]
  regsub -all WIDGET_NAME $newBody $pathName newBody
  eval "proc tkEmacs_read_$pathName \{condition fileId\} \{$newBody\}"

  # establish connection
  catch "dp_filehandler" result
  if {![string match "wrong*" $result]} {
    error "tkEmacs: the tcl-dp package is not available"
  } {
    if {[catch "dp_connect -server 0" result]} {
      error $result
    }   
    set server [lindex $result 0]
    set port [lindex $result 1]
  }
  if {$tkEmacs_priv(debug)} {
    puts stdout "$pathName: Server: $server"
    puts stdout "$pathName: Port: $port"
  }

  if {[catch "dp_filehandler $server r tkEmacs_accept_$pathName" result]} {
    error $result
  }

  # run emacs
  set newCommand $command
  if {$tkEmacs_priv(debug)} {
    set geometry 80x20+10+10
  } {
    set geometry 200x100+10000+10000
  }
  if {[llength $newCommand] == 1} {
    if {[string match lemac* [lindex $command 0]]} {
      append newCommand { -title TKEMACS -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port}
    } {
      append newCommand { -rn TKEMACS -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port}
    }
  }
  regsub -all {\$geometry} $newCommand $geometry newCommand
  regsub -all {\$\{geometry\}} $newCommand $geometry newCommand
  regsub -all {\$pathName} $newCommand $pathName newCommand
  regsub -all {\$\{pathName\}} $newCommand $pathName newCommand
  regsub -all {\$port} $newCommand $port newCommand
  regsub -all {\$\{port\}} $newCommand $port newCommand
  regsub -all {\$lispfile} $newCommand $lispfile newCommand
  regsub -all {\$\{lispfile\}} $newCommand $lispfile newCommand
  set tkEmacs_priv($pathName,wait) 1
  if {[catch "eval exec $newCommand &" result]} {
    error $result
  } {
    set tkEmacs_priv($pathName,pid) $result
  }
  tkwait variable tkEmacs_priv($pathName,initialized)
  tkEmacs_wait $pathName

  if {$reparent} {
    $pathName-internal conf -background $background
    $pathName-internal conf -borderwidth $borderwidth
    $pathName-internal conf -relief $relief
    $pathName-cblinternal conf -width $width
    $pathName-cblinternal conf -height $height
    $pathName-cblinternal conf -background $background 
  }

  tkEmacs_evalString $pathName \
    "(tk-set-border-width-to-zero)"
  if {$useadvise && $reparent} {
    tkEmacs_evalString $pathName \
      "(tk-advise-change-view-functions)"
    tkEmacs_evalString $pathName \
      "(tk-activate-view-change-notification)"
  } {
    tkEmacs_evalString $pathName \
      "(tk-unadvise-change-view-functions)"
    tkEmacs_evalString $pathName \
      "(tk-deactivate-view-change-notification)"
  }
  tkEmacs_evalString $pathName \
    "(tk-set-background \"$background\")"
  tkEmacs_evalString $pathName \
    "(tk-set-cursor-background \"$insertbackground\")"
  tkEmacs_evalString $pathName \
    "(tk-set-foreground \"$foreground\")"
  tkEmacs_evalString $pathName \
    "(tk-set-highlight-background \"$selectbackground\")"
  tkEmacs_evalString $pathName \
    "(tk-set-highlight-foreground \"$selectforeground\")"
  tkEmacs_evalString $pathName \
    "(tk-set-font \"$font\")"

  if {"$startupsource" != ""} {
    tkEmacs_evalString $pathName $startupsource
  }

  eval $pathName config $args
}

 proc tkEmacs_stop {pathName} {
  global tkEmacs_priv

  catch "rename $pathName-internal \"\""
  catch "rename $pathName-cblinternal \"\""
  if {$tkEmacs_priv($pathName,pid) != 0} {
    tkSteal_getarg $tkEmacs_priv($pathName,config) -endsource endsource
    if {"$endsource" != ""} {
      tkEmacs_evalString $pathName $endsource
    }
    tkEmacs_evalString $pathName "(tk-kill-emacs)" "CMD: " 0

    # wait some time to allow emacs to finish
    set tkEmacs_priv($pathName,finish) 0
    after 3000 "set tkEmacs_priv($pathName,finish) 1"
    tkwait variable tkEmacs_priv($pathName,finish)

    set tkEmacs_priv($pathName,initialized) 0
    set tkEmacs_priv($pathName,pid) 0
    set tkEmacs_priv($pathName,windowId) 0
    catch "dp_filehandler $tkEmacs_priv($pathName,handle)"
    if {[info exists $tkEmacs_priv($pathName,handle)]} {
      catch "close $tkEmacs_priv($pathName,handle)"
    }
  }
  return ""
}

 proc tkEmacs_command {pathName minorCommand args} {
  global tkEmacs_priv

  set sendType ""
  set sendCommand ""
  set waitFor 1
  case $minorCommand {
    {conf*} {
      if {"$tkEmacs_priv($pathName,windowId)" != "" &&
          $tkEmacs_priv($pathName,windowId) != 0 &&
          !$tkEmacs_priv($pathName,emacsAvailable)} {
        update idletask
        set tkEmacs_priv($pathName,emacsAvailable) 1
        catch "xaccess eventconfigure \
          -windowid $tkEmacs_priv($pathName,windowId) \
          -borderwidth 0 \
          -x 0 \
          -y 0 \
          -width [winfo width $pathName] \
          -height [winfo height $pathName]"
      }
      if {[llength $args] == 0} {
        set result ""
        foreach element $tkEmacs_priv($pathName,config) {
          lappend result [list [lindex $element 0] [lindex $element 1] [lindex $element 2] [lindex $element 3] [lindex $element 4]]
        }
        return $result
      } {
        if {[llength $args] == 1} {
          set resourceIndex [lsearch $tkEmacs_priv($pathName,config) $args*]
          if {$resourceIndex != -1} {
            set element [lindex $tkEmacs_priv($pathName,config) $resourceIndex]
            return [list [lindex $element 0] [lindex $element 1] [lindex $element 2] [lindex $element 3] [lindex $element 4]]
          } {
            error "unknown resource: $args"
          }
        } {
          set tkEmacs_priv($pathName,config) \
            [tkSteal_parseargs $args $tkEmacs_priv($pathName,config)]
          for {set counter 0} {$counter < [llength $args]} {incr counter} {
            case [lindex $args $counter] {
              {-usea*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -useadvise useadvise
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -reparent reparent
                if {$useadvise && $reparent} {
                  tkEmacs_evalString $pathName \
                    "(tk-advise-change-view-functions)"
                  tkEmacs_evalString $pathName \
                    "(tk-activate-view-change-notification)"
                } {
                  tkEmacs_evalString $pathName \
                    "(tk-unadvise-change-view-functions)"
                  tkEmacs_evalString $pathName \
                    "(tk-deactivate-view-change-notification)"
                }
              }
              {-border*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -reparent reparent
                if {$reparent} {
                  tkSteal_getarg $tkEmacs_priv($pathName,config) \
                    -borderwidth borderwidth
                  $pathName-internal conf -borderwidth $borderwidth
                }
              }
              {-back*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -background background
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -reparent reparent
                if {$reparent} {
                  $pathName-internal conf -background $background
                  $pathName-cblinternal conf -background $background
                }
                tkEmacs_evalString $pathName \
                  "(tk-set-background \"$background\")"
              }
              {-cursorco*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -insertbackground insertbackground
                tkEmacs_evalString $pathName \
                  "(tk-set-cursor-color \"$insertbackground\")"
              }
              {-debug} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -debug debug
                set tkEmacs_priv(debug) $debug
              }
              {-file} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -file file
                tkEmacs_evalString $pathName \
                  "(find-file \"$file\")"
              }
              {-font} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -font font
                tkEmacs_evalString $pathName \
                  "(tk-set-font \"$font\")"
              }
              {-fore*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -foreground foreground
                tkEmacs_evalString $pathName \
                  "(tk-set-foreground \"$foreground\")"
              }
              {-heigh*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -height height
                $pathName-cblinternal conf -height $height
              }
              {-insertback*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -insertbackground insertbackground
                tkEmacs_evalString $pathName \
                  "(tk-set-cursor-background \"$insertbackground\")"
              }
              {-reli*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -reparent reparent
                if {$reparent} {
                  tkSteal_getarg $tkEmacs_priv($pathName,config) \
                    -relief relief
                  $pathName-internal conf -relief $relief
                }
              }
              {-selectback*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -selectbackground selectbackground
                tkEmacs_evalString $pathName \
                  "(tk-set-highlight-background \"$selectbackground\")"
              }
              {-selectfore*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -selectforeground selectforeground
                tkEmacs_evalString $pathName \
                  "(tk-set-highlight-foreground \"$selectforeground\")"
              }
              {-widt*} {
                tkSteal_getarg $tkEmacs_priv($pathName,config) \
                  -width width
                $pathName-cblinternal conf -width $width
              }
            }
            incr counter
          }
        }
      }
    }
    {compare} {
      if {[llength $args] != 3} {
        error "wrong # of args: should be \"$pathName compare index1 op index2\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-compare-index \"[lindex $args 0]\" \"[lindex $args 1]\" \"[lindex $args 2]\")"
    }
    {debug} {
      if {[llength $args] > 1} {
        error "wrong # of args: should be \"$pathName debug ?boolean?\""
      }
      if {[llength $args] == 0} {
        return $tkEmacs_priv(debug)
      } {
        set tkEmacs_priv(debug) [lindex $args 0]
      }
    }
    {delete} {
      if {[llength $args] < 1 || [llength $args] > 2} {
        error "wrong # of args: should be \"$pathName delete index1 ?index2?\""
      }
      set sendType "CMD: "
      if {[llength $args] == 1} {
        set sendCommand "(tk-delete-text \"[lindex $args 0]\")"
      } {
        set sendCommand "(tk-delete-text \"[lindex $args 0]\" \"[lindex $args 1]\")"
      }
    }
    {get} {
      if {[llength $args] > 2} {
        error "wrong # of args: should be \"$pathName get ?index1? ?index2?\""
      }
      set sendType "CMD: "
      if {[llength $args] == 0} {
        set sendCommand "(tk-get-buffer-string)"
      } {
        if {[llength $args] == 1} {
          set sendCommand "(tk-get-buffer-string \"[lindex $args 0]\")"
        } {
          set sendCommand "(tk-get-buffer-string \"[lindex $args 0]\" \"[lindex $args 1]\")"
        }
      }
    }
    {index} {
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName index index\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-translate-position \"[lindex $args 0]\")"
    }
    {insert} {
      if {[llength $args] != 2} {
        error "wrong # of args: should be \"$pathName insert index string\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-insert-string \"[lindex $args 0]\" \"[lindex $args 1]\")"
    }
    {mark} {
      if {[llength $args] < 1} {
        error "wrong # of args: should be \"$patchName mark option ?arg arg ...?\""
      }
      if {"[lindex $args 0]" == "set" && "[lindex $args 1]" == "insert"} {
        set sendType "CMD: "
        set sendCommand "(tk-set-cursor \"[lindex $args 2]\")"
      }
    }
    {redisplay} {
      if {[llength $args] != 0} {
        error "wrong # of args: should be \"$pathName redisplay\""
      }
    }
    {reparent} {
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {!$reparent} {
        return
      }
      if {[llength $args] == 1} {
        set tkEmacs_priv($pathName,windowId) [lindex $args 0]
        catch "xaccess eventreparent \
          -windowid $tkEmacs_priv($pathName,windowId) \
          -parentwindowid [format %ld [winfo id $pathName.cbl]]"
      } {
        tkSteal_getarg $tkEmacs_priv($pathName,config) \
          -name name
        if {"$name" == ""} {
          error "to reparent automatically you have to specify -name"
        }
        set timeout 0
        while {$timeout < 1000} {
          set windowids [xaccess xwinchilds -windowid [xaccess xwinroot -widget .]]
          foreach window $windowids {
            if {[string match $name [xaccess xwinname -windowid $window]]} {
              set tkEmacs_priv($pathName,windowId) $window 
              catch "xaccess eventreparent \
                -windowid $tkEmacs_priv($pathName,windowId) \
                -parentwindowid [format %ld [winfo id $pathName.cbl]]"
              return            
            }
            foreach childwindow [xaccess xwinchilds -windowid $window] {
              if {[string match $name [xaccess xwinname -windowid $childwindow]]} {
                set tkEmacs_priv($pathName,windowId) $childwindow
                catch "xaccess eventreparent \
                  -windowid $tkEmacs_priv($pathName,windowId) \
                  -parentwindowid [format %ld [winfo id $pathName.cbl]]"
                return            
              }
              foreach childwindow2 [xaccess xwinchilds -windowid $childwindow] {
                if {[string match $name [xaccess xwinname -windowid $childwindow2]]} {
                  set tkEmacs_priv($pathName,windowId) $childwindow2
                  catch "xaccess eventreparent \
                    -windowid $tkEmacs_priv($pathName,windowId) \
                    -parentwindowid [format %ld [winfo id $pathName.cbl]]"
                  return            
                }
              }
            }
          }
          incr timeout
        }
      }
    }
    {reparent0} {
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {!$reparent} {
        return
      }
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName reparent windowId\""
      }
      set tkEmacs_priv($pathName,windowId) [lindex $args 0]
      catch "xaccess eventreparent \
        -windowid $tkEmacs_priv($pathName,windowId) \
        -parentwindowid [format %ld [winfo id $pathName.cbl]]"
    }
    {reparent1} {
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {!$reparent} {
        return
      }
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName reparent windowId\""
      }
      set tkEmacs_priv($pathName,windowId) \
        [xaccess xwinparent -window [lindex $args 0]]
      catch "xaccess eventreparent \
        -windowid $tkEmacs_priv($pathName,windowId) \
        -parentwindowid [format %ld [winfo id $pathName.cbl]]"
    }
    {reparent2} {
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {!$reparent} {
        return
      }
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName reparent windowId\""
      }
      set tkEmacs_priv($pathName,windowId) \
        [xaccess xwinparent -window [xaccess xwinparent -window [lindex $args 0]]]
      catch "xaccess eventreparent \
        -windowid $tkEmacs_priv($pathName,windowId) \
        -parentwindowid [format %ld [winfo id $pathName.cbl]]"
    }
    {reparent3} {
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {!$reparent} {
        return
      }
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName reparent windowId\""
      }
      set tkEmacs_priv($pathName,windowId) \
        [xaccess xwinparent -window [xaccess xwinparent -window [xaccess xwinparent -window [lindex $args 0]]]]
      catch "xaccess eventreparent \
        -windowid $tkEmacs_priv($pathName,windowId) \
        -parentwindowid [format %ld [winfo id $pathName.cbl]]"
    }
    {reset} {
      if {[llength $args] != 0} {
        error "wrong # of args: should be \"$pathName reset\""
      }
      set type "RST: "
      set waitFor 0
    }
    {scan} {
    }
    {send} {
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName send lisp-command\""
      }
      set sendType "CMD: "
      set sendCommand [lindex $args 0]
    }
    {sendnowait} {
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName send lisp-command\""
      }
      set sendType "CMD: "
      set sendCommand [lindex $args 0]
      set waitFor 0
    }
    {setxscroll} {
      if {[llength $args] != 4} {
        error "wrong # of args: should be \"$pathName setxscroll totalUnits windowUnits firstUnit lastUnit\""
      }
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -xscrollcommand xscrollcommand
      if {"$xscrollcommand" != ""} {
        eval $xscrollcommand $args
      }
    }
    {setyscroll} {
      if {[llength $args] != 4} {
        error "wrong # of args: should be \"$pathName setyscroll totalUnits windowUnits firstUnit lastUnit\""
      }
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -yscrollcommand yscrollcommand
      if {"$yscrollcommand" != ""} {
        eval $yscrollcommand $args
      }
    }
    {stopemacs} {
      if {[llength $args] != 0} {
        error "wrong # of args: should be \"$pathName stopemacs\""
      }
      tkSteal_getarg $tkEmacs_priv($pathName,config) \
        -reparent reparent
      if {$reparent} {
        set tkEmacs_priv($pathName,initialized) 0
        set tkEmacs_priv($pathName,pid) 0
        set tkEmacs_priv($pathName,windowId) 0
        catch "dp_filehandler $tkEmacs_priv($pathName,handle)"
        if {[info exists $tkEmacs_priv($pathName,handle)]} {
          catch "close $tkEmacs_priv($pathName,handle)"
        }
      } {
        tkEmacs_stop $pathName
      }
    }
    {tag} {
    }
    {xview} {
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName xview offset\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-set-x-view [lindex $args 0])"
    }
    {yview} {
      if {[llength $args] != 1} {
        error "wrong # of args: should be \"$pathName yview offset\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-set-y-view [lindex $args 0])"
    }
    {default} {
      error "$pathName: unknown command specified\n$args"
    }
  }

  if {"$sendCommand" != "" && "$sendType" != ""} {
    return [tkEmacs_evalString $pathName $sendCommand $sendType $waitFor]
  }
  return ""
}

 proc tkEmacs_accept {condition fileId} {
  global dp_version
  global tkEmacs_priv

  if {$tkEmacs_priv(debug)} {
    puts stdout "WIDGET_NAME: Accept at: $fileId"
  }
  # accept the connection
  if {[catch "dp_accept $fileId" result]} {
    error $result
  }
  set result [lindex $result 0]
  set tkEmacs_priv(WIDGET_NAME,handle) $result
  if {[catch "dp_filehandler $tkEmacs_priv(WIDGET_NAME,handle) r tkEmacs_read_WIDGET_NAME" result]} {
    error $result
  }
  update idletask
  catch "dp_filehandler $fileId"
  if {[info exists $fileId]} {
    catch "close $fileId"
  }
  set tkEmacs_priv(WIDGET_NAME,initialized) 1
  return ""
}

 proc tkEmacs_read {condition fileId} {
  # read data
  tkEmacs_read_data WIDGET_NAME $fileId
}

 proc tkEmacs_read_data {pathName fileId} {
  global tkEmacs_priv

  # read first line
  set readData ""
  set tkEmacs_priv($pathName,result) ""
  if {[catch "gets $fileId" readData]} {
    catch "dp_filehandler $fileId"
    if {[info exists $fileId]} {
      catch "close $fileId"
    }
    return ""
  }
  if {"$readData" == ""} {
    if {[eof $fileId]} {
      catch "dp_filehandler $fileId"
      if {[info exists $fileId]} {
        catch "close $fileId"
      }
      return ""
    }
  }

  # now read the following lines
  set currentType 0
  set result ""
  while {1} {
    if {"$readData" != ""} {
      if {$tkEmacs_priv(debug)} {
        puts stderr "$pathName: Receive from $fileId: $readData"
      }
      if {[string match "CMD: *" $readData] && $currentType == 0 &&
          "$result" == ""} {
        # the first CMD: token
        set currentType 1
        set result [string range $readData 5 end]
      } {
        if {[string match "RET: *" $readData] && $currentType == 0 &&
            "$result" == ""} {
          # the first RET: token
          set currentType 2
          set result [string range $readData 5 end]
        } {
          if {[string match "ERR: *" $readData]} {
            # an error message
            tkSteal_getarg $tkEmacs_priv($pathName,config) \
              -errorcallback errorcallback
            if {"$errorcallback" != ""} {
              catch "$errorcallback $pathName \{$readData\}"
            }
            set result ""
            set tkEmacs_priv($pathName,wait) 0
            return
          } {
            if {[string match "END*" $readData] && $currentType != 0} {
              # the end of this message
              if {"$result" != ""} {
                if {$currentType == 1} {
                  if {$tkEmacs_priv(debug)} {
                    puts stderr "$pathName: Eval: $result"
                  }
                  if {[catch "$result" res]} {
                    tkSteal_getarg $tkEmacs_priv($pathName,config) \
                      -errorcallback errorcallback
                    if {"$errorcallback" != ""} {
                      catch "$errorcallback $pathName \{$res\}"
                    }
                  }
                } {
                  if {$currentType == 2} {
                    if {$tkEmacs_priv(debug)} {
                      puts stderr "$pathName: Return: $result"
                    }
                    set tkEmacs_priv($pathName,result) $result
                    set tkEmacs_priv($pathName,wait) 0
                  } {
                    set tkEmacs_priv($pathName,result) ""
                    set tkEmacs_priv($pathName,wait) 0
                  }
                }
              }
              return
            } {
              if {[string match "RST:*" $readData]} {
                set tkEmacs_priv($pathName,result) ""
                set tkEmacs_priv($pathName,wait) 0
                return
              } {
                # data that is appended to the already read message
                append result "\n[string range $readData 5 end]"
              }
            }
          }
        }
      }
    }
    # next message line
    if {[catch "gets $fileId" readData]} {
      catch "dp_filehandler $fileId"
      if {[info exists $fileId]} {
        catch "close $fileId"
      }
      return ""
    }
  }
}

 proc tkEmacs_sendData {pathName fileId type data} {
  global tkEmacs_priv

  # write to handle
  if {[string match "RST:*" $type]} {
    puts $fileId "$type"
    set tkEmacs_priv($pathName,wait) 0
  }
  if {"$data" != ""} {
    set sendData ""
    foreach line [split $data "\n"] {
      append sendData "$type$line\n"
    }
    append sendData "END: "
    if {$tkEmacs_priv(debug)} {
      puts stderr "$pathName: Send to $fileId: $sendData"
    }
    catch "puts $fileId \{$sendData\}"
  }
}

 proc tkEmacs_evalString {pathName sendCommand {sendType "CMD: "} {waitFor 1}} {
  global tkEmacs_priv

  if {!$tkEmacs_priv($pathName,initialized) ||
      "$tkEmacs_priv($pathName,handle)" == ""} {
    return
  }
  set tkEmacs_priv($pathName,wait) $waitFor
  if {[catch "tkEmacs_sendData $pathName $tkEmacs_priv($pathName,handle) \
        \"$sendType\" \{$sendCommand\}" result]} {
    tkSteal_getarg $tkEmacs_priv($pathName,config) -errorcallback errorcallback
    if {"$errorcallback" != ""} {
      catch "$errorcallback $pathName \{$result\}"
    }
    tkEmacs_wait $pathName
    error $result
  }
  tkEmacs_wait $pathName
  return $tkEmacs_priv($pathName,result)
}

 proc tkEmacs_wait {pathName} {
  global tkEmacs_priv

  if {$tkEmacs_priv($pathName,wait)} {
    tkSteal_getarg $tkEmacs_priv($pathName,config) -timeout timeout
    after $timeout "set tkEmacs_priv($pathName,wait) 0; set tkEmacs_priv($pathName,result) {}"
    tkwait variable tkEmacs_priv($pathName,wait)
  }
}

# module load procedure
proc CBLocalIncludeModule {{moduleName ""}} {
  global env
  global cbLoadInfo
  global cbLoadPath
  global cbStatus

  foreach p [split $cbLoadPath :] {
    if {[file exists "$p/$moduleName"]} {
      if {![file readable "$p/$moduleName"]} {
        puts stderr "Cannot read $p/$moduleName (permission denied)"
        continue
      }
      if {$cbLoadInfo} {
        puts stdout "Loading $p/$moduleName..."
      }
      source "$p/$moduleName"
      return 1
    }
    # first see if we have a load command
    if {[info exists env(CB_VERSION_SHOW)]} {
      set cbCommand $env(CB_VERSION_SHOW)
      regsub -all {\$cbFileName} $cbCommand $p/$moduleName cbCommand
      if {$cbLoadInfo} {
        puts stdout "Loading $p/$moduleName...($cbCommand)"
      }
      if {[catch "$cbCommand" contents]} {
        continue
      } {
        eval $contents
        return 1
      }
    }
    # are we able to load versions from wish ?
    if {[catch "afbind $p/$moduleName" aso]} {
      # try to use cb version load command
      global cbVersion
      if {[info exists cbVersion(showDefault)]} {
        set cbCommand $cbVersion(showDefault)
      } {
	# our last hope
        set cbCommand "vcat -q $p/$moduleName"
      }
      regsub -all {\$cbFileName} $cbCommand $p/$moduleName cbCommand
      if {$cbLoadInfo} {
        puts stdout "Loading $p/$moduleName...($cbCommand)"
      }
      if {[catch "$cbCommand" contents]} {
        continue
      } {
        eval $contents
        return 1
      }
    } {
      # yes we can load versions directly
      if {[catch "$aso open r" inFile]} {
        puts stderr "Cannot open $p/[$aso attr af_bound] (permission denied)"
        continue
      }
      if {$cbLoadInfo} {
        puts stdout "Loading $p/[$aso attr af_bound]..."
      }
      if {[catch "read \{$inFile\}" contents]} {
        puts stderr "Cannot read $p/[$aso attr af_bound] (permission denied)"
        close $inFile
        continue
      }
      close $inFile
      eval $contents
      return 1
    }
  }
  puts stderr "Cannot load module $moduleName -- check your cb load path"
  puts stderr "Specify a cb load path with the environment variable:"
  puts stderr "  CB_LOAD_PATH (e.g \"export CB_LOAD_PATH=.\")"
  catch "destroy ."
  catch "exit 0"
}

# application parsing procedure
proc CBLocalParseAppDefs {cbAppDefFile} {
  global cbAppDefaults

  # basically from: Michael Moore
  if {[file exists $cbAppDefFile] &&
      [file readable $cbAppDefFile] &&
      "[file type $cbAppDefFile]" == "link"} {
    catch "file type $cbAppDefFile" cbType
    while {"$cbType" == "link"} {
      if {[catch "file readlink $cbAppDefFile" cbAppDefFile]} {
        return
      }
      catch "file type $cbAppDefFile" cbType
    }
  }
  if {!("$cbAppDefFile" != "" &&
        [file exists $cbAppDefFile] &&
        [file readable $cbAppDefFile] &&
        "[file type $cbAppDefFile]" == "file")} {
    return
  }
  if {![catch "open $cbAppDefFile r" cbResult]} {
    set cbAppFileContents [read $cbResult]
    close $cbResult
    foreach line [split $cbAppFileContents "\n"] {
      # backup indicates how far to backup.  It applies to the
      # situation where a resource name ends in . and when it
      # ends in *.  In the second case you want to keep the *
      # in the widget name for pattern matching, but you want
      # to get rid of the . if it is the end of the name. 
      set backup -2  
      set line [string trim $line]
      if {[string index $line 0] == "#" || "$line" == ""} {
        # skip comments and empty lines
        continue
      }
      set list [split $line ":"]
      set resource [string trim [lindex $list 0]]
      set i [string last "." $resource]
      set j [string last "*" $resource]
      if {$j > $i} { 
        set i $j
        set backup -1
      }
      incr i
      set name [string range $resource $i end]
      incr i $backup
      set widname [string range $resource 0 $i]
      set value [string trim [lindex $list 1]]
      if {"$widname" != "" && "$widname" != "*"} {
        # insert the widget and resourcename to the application
        # defaults list.
        if {![info exists cbAppDefaults]} {
          set cbAppDefaults ""
        }
        lappend cbAppDefaults [list $widname [string tolower $name] $value]
      }
    }
  }
}

# application loading procedure
proc CBLocalLoadAppDefs {{cbClasses ""} {cbPriority "startupFile"} {cbAppDefFile ""}} {
  global env

  if {"$cbAppDefFile" == ""} {
    set cbFileList ""
    if {[info exists env(XUSERFILESEARCHPATH)]} {
      append cbFileList [split $env(XUSERFILESEARCHPATH) :]
    }
    if {[info exists env(XAPPLRESDIR)]} {
      append cbFileList [split $env(XAPPLRESDIR) :]
    }
    if {[info exists env(XFILESEARCHPATH)]} {
      append cbFileList [split $env(XFILESEARCHPATH) :]
    }
    append cbFileList " /usr/lib/X11/app-defaults"
    append cbFileList " /usr/X11/lib/X11/app-defaults"

    foreach cbCounter1 $cbClasses {
      foreach cbCounter2 $cbFileList {
        set cbPathName $cbCounter2
        if {[regsub -all "%N" "$cbPathName" "$cbCounter1" cbResult]} {
          set cbPathName $cbResult
        }
        if {[regsub -all "%T" "$cbPathName" "app-defaults" cbResult]} {
          set cbPathName $cbResult
        }
        if {[regsub -all "%S" "$cbPathName" "" cbResult]} {
          set cbPathName $cbResult
        }
        if {[regsub -all "%C" "$cbPathName" "" cbResult]} {
          set cbPathName $cbResult
        }
        if {[file exists $cbPathName] &&
            [file readable $cbPathName] &&
            ("[file type $cbPathName]" == "file" ||
             "[file type $cbPathName]" == "link")} {
          catch "option readfile $cbPathName $cbPriority"
          if {"[info commands CBParseAppDefs]" != ""} {
            CBParseAppDefs $cbPathName
          } {
            if {"[info commands CBLocalParseAppDefs]" != ""} {
              CBLocalParseAppDefs $cbPathName
            }
          }
        } {
          if {[file exists $cbCounter2/$cbCounter1] &&
              [file readable $cbCounter2/$cbCounter1] &&
              ("[file type $cbCounter2/$cbCounter1]" == "file" ||
               "[file type $cbCounter2/$cbCounter1]" == "link")} {
            catch "option readfile $cbCounter2/$cbCounter1 $cbPriority"
            if {"[info commands CBParseAppDefs]" != ""} {
              CBParseAppDefs $cbCounter2/$cbCounter1
            } {
              if {"[info commands CBLocalParseAppDefs]" != ""} {
                CBLocalParseAppDefs $cbCounter2/$cbCounter1
              }
            }
          }
        }
      }
    }
  } {
    # load a specific application defaults file
    if {[file exists $cbAppDefFile] &&
        [file readable $cbAppDefFile] &&
        ("[file type $cbAppDefFile]" == "file" ||
         "[file type $cbAppDefFile]" == "link")} {
      catch "option readfile $cbAppDefFile $cbPriority"
      if {"[info commands CBParseAppDefs]" != ""} {
        CBParseAppDefs $cbAppDefFile
      } {
        if {"[info commands CBLocalParseAppDefs]" != ""} {
          CBLocalParseAppDefs $cbAppDefFile
        }
      }
    }
  }
}

# application setting procedure
proc CBLocalSetAppDefs {{cbWidgetPath "."}} {
  global cbAppDefaults

  if {![info exists cbAppDefaults]} {
    return
  }
  foreach cbCounter $cbAppDefaults {
    if {"$cbCounter" == ""} {
      break
    }
    set widname [lindex $cbCounter 0]
    if {[string match $widname ${cbWidgetPath}] ||
        [string match "${cbWidgetPath}*" $widname]} {
      set name [string tolower [lindex $cbCounter 1]]
      set value [lindex $cbCounter 2]
      # Now lets see how many tcl commands match the name
      # pattern specified.
      set widlist [info command $widname]
      if {"$widlist" != ""} {
        foreach widget $widlist {
          # make sure this command is a widget.
          if {![catch "winfo id $widget"] &&
              [string match "${cbWidgetPath}*" $widget]} {
            catch "$widget configure -$name $value" 
          }
        }
      }
    }
  }
}

# startup source
proc StartupSrc {args} {
  global argc
  global argv
  global env

  wm protocol . WM_DELETE_WINDOW EmacsQuit
  wm withdraw .

  set runAsClient 0
  set tmpStartArgv ""
  for {set counter 0} {$counter < $argc} {incr counter 1} {
    case [string tolower [lindex $argv $counter]] in {
      {-client} {
        set runAsClient 1
      }
      {default} {
        lappend tmpStartArgv [lindex $argv $counter]
      }
    }
  }
  set tmpFileArgv ""
  set tmpLoadFile ""
  set tmpFunction ""
  if {$runAsClient == 1} {
    for {set counter 0} {$counter < [llength $tmpStartArgv]} {incr counter 1} {
      case [string tolower [lindex $tmpStartArgv $counter]] in {
        {-cbloadpath} {
          incr counter
        }
        {-load} {
          incr counter
          lappend tmpLoadFile [lindex $tmpStartArgv $counter]
        }
        {-function} {
          incr counter
          set tmpFunction [lindex $tmpStartArgv $counter]
        }
        {default} {
          set fileName [lindex $tmpStartArgv $counter]
          if {"[file dirname $fileName]" == "."} {
            lappend tmpFileArgv [pwd]/$fileName
          } {
            lappend tmpFileArgv $fileName
          }
        }
      }
    }
    foreach counter $tmpLoadFile {
      set sendCommand "SendToEmacs {(load \"$counter\")}"
      if {[catch "send tkemacs \{$sendCommand\}" result]} {
        set argv $tmpStartArgv
        set argc [llength $tmpStartArgv]
        set runAsClient 0
        break
      }
    }
    foreach counter $tmpFileArgv {
      set sendCommand "SendToEmacs {(find-file \"$counter\")}"
      if {[catch "send tkemacs \{$sendCommand\}" result]} {
        set argv $tmpStartArgv
        set argc [llength $tmpStartArgv]
        set runAsClient 0
        break
      }
    }
    if {"[string trim $tmpFunction]" != ""} {
      set sendCommand "SendToEmacs {$tmpFunction}"
      if {[catch "send tkemacs \{$sendCommand\}" result]} {
        set argv $tmpStartArgv
        set argc [llength $tmpStartArgv]
        set runAsClient 0
        break
      }
    }
  }
  if {$runAsClient == 1} {
    catch "exit 0"
  }
  catch "unset fileName"
  catch "unset runAsClient"
  catch "unset tmpStartArgv"
  catch "unset tmpFileArgv"
  catch "unset tmpLoadFile"
  catch "unset tmpFunction"
}


# end source
proc EndSrc {} {
  global argc
  global argv
  global emacsActBackground
  global emacsActForeground
  global emacsBackground
  global emacsForeground
  global emacsFont
  global emacsScrollActForeground
  global emacsScrollForeground
  global emacsBuffList
  global emacsPollInterval
  global emacsUseAdvise
  global fsBoxFSPath
  global alertBox
  global colorBox
  global fontBox
  global fsBox
  global menuBar
  global readBox
  global textBox

  if {[file exists ~/.cbemacs-o.tcl]} {
    catch "source ~/.cbemacs-o.tcl"
  }

  set alertBox(activeBackground) $emacsActBackground
  set colorBox(activeBackground) $emacsActBackground
  set fontBox(activeBackground) $emacsActBackground
  set fsBox(activeBackground) $emacsActBackground
  set menuBar(activeBackground) $emacsActBackground
  set readBox(activeBackground) $emacsActBackground
  set textBox(activeBackground) $emacsActBackground
  set alertBox(activeForeground) $emacsActForeground
  set colorBox(activeForeground) $emacsActForeground
  set fontBox(activeForeground) $emacsActForeground
  set fsBox(activeForeground) $emacsActForeground
  set menuBar(activeForeground) $emacsActForeground
  set readBox(activeForeground) $emacsActForeground
  set textBox(activeForeground) $emacsActForeground
  set alertBox(background) $emacsBackground
  set colorBox(background) $emacsBackground
  set fontBox(background) $emacsBackground
  set fsBox(background) $emacsBackground
  set menuBar(background) $emacsBackground
  set readBox(background) $emacsBackground
  set textBox(background) $emacsBackground
  set alertBox(scrollBackground) $emacsBackground
  set colorBox(scrollBackground) $emacsBackground
  set fontBox(scrollBackground) $emacsBackground
  set fsBox(scrollBackground) $emacsBackground
  set menuBar(scrollBackground) $emacsBackground
  set readBox(scrollBackground) $emacsBackground
  set textBox(scrollBackground) $emacsBackground
  set alertBox(scrollActiveForeground) $emacsScrollActForeground
  set colorBox(scrollActiveForeground) $emacsScrollActForeground
  set fontBox(scrollActiveForeground) $emacsScrollActForeground
  set fsBox(scrollActiveForeground) $emacsScrollActForeground
  set menuBar(scrollActiveForeground) $emacsScrollActForeground
  set readBox(scrollActiveForeground) $emacsScrollActForeground
  set textBox(scrollActiveForeground) $emacsScrollActForeground
  set alertBox(scrollForeground) $emacsScrollForeground
  set colorBox(scrollForeground) $emacsScrollForeground
  set fontBox(scrollForeground) $emacsScrollForeground
  set fsBox(scrollForeground) $emacsScrollForeground
  set menuBar(scrollForeground) $emacsScrollForeground
  set readBox(scrollForeground) $emacsScrollForeground
  set textBox(scrollForeground) $emacsScrollForeground
  set alertBox(foreground) $emacsForeground
  set colorBox(foreground) $emacsForeground
  set fontBox(foreground) $emacsForeground
  set fsBox(foreground) $emacsForeground
  set menuBar(foreground) $emacsForeground
  set readBox(foreground) $emacsForeground
  set textBox(foreground) $emacsForeground
  set alertBox(font) $emacsFont
  set colorBox(font) $emacsFont
  set fontBox(font) $emacsFont
  set fsBox(font) $emacsFont
  set menuBar(font) $emacsFont
  set readBox(font) $emacsFont
  set textBox(font) $emacsFont

  option add *HighlightThickness 0 userDefault
  option add *Label.padX 2 userDefault
  option add *Label.padY 2 userDefault
  option add *Radiobutton.padX 2 userDefault
  option add *Radiobutton.padY 2 userDefault
  option add *Radiobutton.relief raised userDefault
  option add *Checkbutton.padX 2 userDefault
  option add *Checkbutton.padY 2 userDefault
  option add *Checkbutton.relief raised userDefault

  MenuBarInit ~/.cbemacs-c.tcl /usr/local/lib/tkemacs/tkemacs-c.tcl
  EmacsUpdateResources

  set runAsClient 0
  set tmpArgv ""
  set tmpLoadFile ""
  set tmpFunction ""
  for {set counter 0} {$counter < $argc} {incr counter 1} {
    case [string tolower [lindex $argv $counter]] in {
      {-client} {
        set runAsClient 1
      }
      {-load} {
        incr counter
        lappend tmpLoadFile [lindex $argv $counter]
      }
      {-function} {
        incr counter
        set tmpFunction [lindex $argv $counter]
      }
      {default} {
        lappend tmpArgv [lindex $argv $counter]
      }
    }
  }
  set argv $tmpArgv
  set argc [llength $tmpArgv]
  unset counter
  unset tmpArgv

  if {"[info commands drag&drop]" != ""} {
    drag&drop target .frame handler {file ""}
    drag&drop target .frame handler {dir ""}
    drag&drop target .frame0 handler {file ""}
    drag&drop target .frame0 handler {dir ""}
  }

  wm deiconify .
  update idletask

  if {"TkEmacs" == "[winfo class .frame.text]"} {
    .frame.text send "(tk-advise-destroy-widget-on-exit)"
    .frame.text config -pollinterval $emacsPollInterval
    .frame.text config -useadvise $emacsUseAdvise
  }

  foreach counter $tmpLoadFile {
    if {"TkEmacs" == "[winfo class .frame.text]"} {
      SendToEmacs "(load \"$counter\")"
    }
  }
  foreach counter $argv {
    if {"TkEmacs" == "[winfo class .frame.text]"} {
      SendToEmacs "(find-file \"$counter\")"
    }
  }
  if {"[string trim $tmpFunction]" != ""} {
    if {"TkEmacs" == "[winfo class .frame.text]"} {
      SendToEmacs "($tmpFunction)"
    }
  }

  set fsBoxFSPath [pwd]
  set emacsBuffList ""

  if {"[info commands ClientLogin]" != ""} {
    ClientLogin tkemacs
  }
}

# startup source
StartupSrc

# initialize global variables
global {alertBox}
set {alertBox(activeBackground)} {white}
set {alertBox(activeForeground)} {black}
set {alertBox(after)} {0}
set {alertBox(anchor)} {nw}
set {alertBox(background)} {#dcdcdc}
set {alertBox(button)} {0}
set {alertBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {alertBox(foreground)} {black}
set {alertBox(justify)} {center}
set {alertBox(scrollActiveForeground)} {GhostWhite}
set {alertBox(scrollBackground)} {#dcdcdc}
set {alertBox(scrollForeground)} {gray}
set {alertBox(toplevelName)} {.alertBox}
global {colorBox}
set {colorBox(activeBackground)} {white}
set {colorBox(activeForeground)} {black}
set {colorBox(background)} {#dcdcdc}
set {colorBox(colorName)} {gray}
set {colorBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {colorBox(foreground)} {black}
set {colorBox(oldWidget)} {}
set {colorBox(palette)} {#dcdcdc black gray50 blue red green yellow orange}
set {colorBox(paletteNr)} {0}
set {colorBox(scrollActiveForeground)} {GhostWhite}
set {colorBox(scrollBackground)} {#dcdcdc}
set {colorBox(scrollForeground)} {gray}
set {colorBox(scrollSide)} {left}
set {colorBox(type)} {rgb}
global {connect_info}
set {connect_info(file21)} {1487}
set {connect_info(file22)} {127.0.0.1 1490}
set {connect_info(file4)} {1024}
set {connect_info(file5)} {127.0.0.1 1025}
set {connect_info(file6)} {127.0.0.1 1098}
global {curSelected}
set {curSelected} {0}
global {emacsActBackground}
set {emacsActBackground} {white}
global {emacsActForeground}
set {emacsActForeground} {black}
global {emacsBackground}
set {emacsBackground} {#dcdcdc}
global {emacsBuffList}
set {emacsBuffList} {}
global {emacsCurrentMenu}
set {emacsCurrentMenu} {}
global {emacsDebug}
set {emacsDebug} {0}
global {emacsEmacsCursor}
set {emacsEmacsCursor} {blue}
global {emacsEmacsFont}
set {emacsEmacsFont} {}
global {emacsErrorMessage}
set {emacsErrorMessage} {}
global {emacsFont}
set {emacsFont} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
global {emacsForeground}
set {emacsForeground} {black}
global {emacsPollInterval}
set {emacsPollInterval} {60}
global {emacsResult}
set {emacsResult} {gray}
global {emacsScrollActForeground}
set {emacsScrollActForeground} {GhostWhite}
global {emacsScrollForeground}
set {emacsScrollForeground} {gray}
global {emacsUseAdvise}
set {emacsUseAdvise} {1}
global {fontBox}
set {fontBox(activeBackground)} {white}
set {fontBox(activeForeground)} {black}
set {fontBox(background)} {#dcdcdc}
set {fontBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {fontBox(fontFamily)} {*}
set {fontBox(fontName)} {}
set {fontBox(fontPixels)} {*}
set {fontBox(fontSWidth)} {*}
set {fontBox(fontSlant)} {*}
set {fontBox(fontWeight)} {*}
set {fontBox(foreground)} {black}
set {fontBox(scrollActiveForeground)} {GhostWhite}
set {fontBox(scrollBackground)} {#dcdcdc}
set {fontBox(scrollForeground)} {gray}
set {fontBox(scrollSide)} {left}
global {fsBox}
set {fsBox(activeBackground)} {white}
set {fsBox(activeForeground)} {black}
set {fsBox(all)} {0}
set {fsBox(background)} {#dcdcdc}
set {fsBox(button)} {0}
set {fsBox(extensions)} {0}
set {fsBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {fsBox(foreground)} {black}
set {fsBox(internalPath)} {/home/garfield/development/TkSteal/tkemacs}
set {fsBox(name)} {}
set {fsBox(path)} {/home/garfield/development/TkSteal/tkemacs}
set {fsBox(pattern)} {*}
set {fsBox(scrollActiveForeground)} {GhostWhite}
set {fsBox(scrollBackground)} {#dcdcdc}
set {fsBox(scrollForeground)} {gray}
set {fsBox(scrollSide)} {left}
set {fsBox(showPixmap)} {0}
global {fsBoxFSPath}
set {fsBoxFSPath} {/home/garfield/development/TkSteal/tkemacs}
global {menuBar}
set {menuBar(activeBackground)} {white}
set {menuBar(activeForeground)} {black}
set {menuBar(background)} {#dcdcdc}
set {menuBar(colorFile)} {/usr/local/lib/CIMBuilder/lib/cb/Colors}
set {menuBar(file)} {/usr/local/lib/tkemacs/tkemacs-c.tcl}
set {menuBar(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {menuBar(fontFile)} {/usr/local/lib/CIMBuilder/lib/cb/Fonts}
set {menuBar(foreground)} {black}
set {menuBar(initialized)} {1}
set {menuBar(menuType)} {<command> }
set {menuBar(scrollActiveForeground)} {GhostWhite}
set {menuBar(scrollBackground)} {#dcdcdc}
set {menuBar(scrollForeground)} {gray}
set {menuBar(scrollSide)} {left}
set {menuBar(state)} {normal}
set {menuBar(userFile)} {~/.cbemacs-c.tcl}
global {readBox}
set {readBox(activeBackground)} {white}
set {readBox(activeForeground)} {black}
set {readBox(background)} {#dcdcdc}
set {readBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {readBox(foreground)} {black}
set {readBox(scrollActiveForeground)} {GhostWhite}
set {readBox(scrollBackground)} {#dcdcdc}
set {readBox(scrollForeground)} {gray}
set {readBox(scrollSide)} {left}
global {textBox}
set {textBox(activeBackground)} {white}
set {textBox(activeForeground)} {black}
set {textBox(background)} {#dcdcdc}
set {textBox(button)} {0}
set {textBox(contents)} {}
set {textBox(font)} {-adobe-helvetica-bold-r-normal--12-120-75-75-p-70-iso8859-1}
set {textBox(foreground)} {black}
set {textBox(scrollActiveForeground)} {GhostWhite}
set {textBox(scrollBackground)} {#dcdcdc}
set {textBox(scrollForeground)} {gray}
set {textBox(scrollSide)} {left}
set {textBox(state)} {disabled}
set {textBox(toplevelName)} {.textBox}
global {tkEmacs_ARGUMENTS}
set {tkEmacs_ARGUMENTS} {
{-background        background        Background        #ffe4c4       #ffe4c4}
{-borderwidth       borderWidth       BorderWidth       0             0}
{-cursor            cursor            Cursor            xterm         xterm}
{-debug             debug             Debug             0             0}
{-exportselection   exportSelection   ExportSelection   1             1}
{-font              font              Font              *-Courier-Medium-R-Normal-*-120-* *-Courier-Medium-R-Normal-*-120-*}
{-foreground        foreground        Foreground        black         black}
{-insertbackground  insertBackground  Foreground        black         black}
{-insertborderwidth insertBorderWidth BorderWidth       0             0}
{-insertofftime     insertOffTime     OffTime           300           300}
{-insertontime      insertOnTime      OnTime            600           600}
{-insertwidth       insertWidth       InsertWidth       2             2}
{-padx              padX              Pad               1             1}
{-pady              padY              Pad               1             1}
{-relief            relief            Relief            flat          flat}
{-selectbackground  selectBackground  Foreground        #b2dfee       #b2dfee}
{-selectborderwidth selectBorderwidth Borderwidth       1             1}
{-selectforeground  selectForeground  Background        black         black}
{-setgrid           setGrid           SetGrid           1             1}
{-state             state             State             normal        normal}
{-wrap              wrap              Wrap              char          char}
{-xscrollcommand    xScrollCommand    ScrollCommand     {}            {}}
{-yscrollcommand    yScrollCommand    ScrollCommand     {}            {}}

{-command           command           Command           {TkEmacs}     {TkEmacs}}
{-endsource         endSource         EndSource         {}            {}}
{-errorcallback     errorCallback     ErrorCallback     {}            {}}
{-file              file              File              {}            {}}
{-height            height            Height            300           300}
{-lispfile          lispFile          LispFile          {tkemacs.el}  {tkemacs.el}}
{-name              name              Name              {TKEMACS*}    {TKEMACS*}}
{-pollinterval      pollInterval      PollInterval      {}            {}}
{-reparent          reparent          Reparent          1             1}
{-startupsource     startupSource     StartupSource     {}            {}}
{-timeout           timeout           Timeout           10000         10000}
{-useadvise         useAdvise         UseAdvise         0             0}
{-width             width             Width             550           550}}
global {tkEmacs_priv}
set {tkEmacs_priv(.frame.text,config)} {{-background        background        Ba
ckground        #ffe4c4 #dcdcdc} {-borderwidth       borderWidth       BorderWid
th       0 2} {-cursor            cursor            Cursor            xterm     
    xterm} {-debug             debug             Debug             0            
 0} {-exportselection   exportSelection   ExportSelection   1             1} {-f
ont              font              Font              *-Courier-Medium-R-Normal-*
-120-* *-Courier-Medium-R-Normal-*-120-*} {-foreground        foreground        
Foreground        black black} {-insertbackground  insertBackground  Foreground 
       black blue} {-insertborderwidth insertBorderWidth BorderWidth       0    
         0} {-insertofftime     insertOffTime     OffTime           300           300} {-insertontime      insertOnTime      OnTime            600           600} {-insertwidth       insertWidth       InsertWidth       2             2} {-padx              padX              Pad               1             1} {-pady              padY              Pad               1             1} {-relief            relief            Relief            flat raised} {-selectbackground  selectBackground  Foreground        #b2dfee       #b2dfee} {-selectborderwidth selectBorderwidth Borderwidth       1             1} {-selectforeground  selectForeground  Background        black         black} {-setgrid           setGrid           SetGrid           1             1} {-state             state             State             normal        normal} {-wrap              wrap              Wrap              char          char} {-xscrollcommand    xScrollCommand    ScrollCommand     {} {.frame.scrollbar5 set}} {-yscrollcommand    yScrollCommand    ScrollCommand     {} {.frame.scrollbar1 set}} {-command           command           Command           {TkEmacs} TkEmacs} {-endsource         endSource         EndSource         {}            {}} {-errorcallback     errorCallback     ErrorCallback     {} EmacsError} {-file              file              File              {}            {}} {-height            height            Height            300           300} {-lispfile          lispFile          LispFile          {tkemacs.el} tkemacs.el} {-name              name              Name              {TKEMACS*} TKEMACS*} {-pollinterval      pollInterval      PollInterval      {} 60} {-reparent          reparent          Reparent          1             1} {-startupsource     startupSource     StartupSource     {}            {}} {-timeout           timeout           Timeout           10000         10000} {-useadvise         useAdvise         UseAdvise         0 1} {-width             width             Width             550           550}}
set {tkEmacs_priv(.frame.text,emacsAvailable)} {1}
set {tkEmacs_priv(.frame.text,handle)} {file5}
set {tkEmacs_priv(.frame.text,initialized)} {1}
set {tkEmacs_priv(.frame.text,pid)} {}
set {tkEmacs_priv(.frame.text,result)} {}
set {tkEmacs_priv(.frame.text,sockets)} {2}
set {tkEmacs_priv(.frame.text,wait)} {0}
set {tkEmacs_priv(.frame.text,windowId)} {25165826}
set {tkEmacs_priv(debug)} {0}
set {tkEmacs_priv(prefix)} {}

# please don't modify the following
# variables. They are needed by CIMBuilder.
global {autoLoadList}
set {autoLoadList(alertBox.tcl)} {0}
set {autoLoadList(colorBox.tcl)} {0}
set {autoLoadList(external.tcl)} {0}
set {autoLoadList(fnctns.tcl)} {0}
set {autoLoadList(fontBox.tcl)} {0}
set {autoLoadList(fsBox.tcl)} {0}
set {autoLoadList(interface.tcl)} {0}
set {autoLoadList(main.tcl)} {0}
set {autoLoadList(menuBar.tcl)} {0}
set {autoLoadList(readBox.tcl)} {0}
set {autoLoadList(textBox.tcl)} {0}
global {internalAliasList}
set {internalAliasList} {}
global {moduleList}
set {moduleList(alertBox.tcl)} { AlertBox AlertBoxInternal}
set {moduleList(colorBox.tcl)} { ColorBox ColorBoxHSVToRGB ColorBoxRGBToHSV ColorBoxSelectColor ColorBoxSetColor ColorBoxSetHSVColor ColorBoxSetPalette ColorBoxSetPaletteList ColorBoxSetRGBColor ColorBoxShowSlides}
set {moduleList(external.tcl)} { Alias IsADir IsAFile IsASymlink GetSelection MenuPopupAdd MenuPopupPost MenuPopupHandle MenuPopupMotion MenuPopupRelease NoFunction SN SymbolicName Unalias tkSteal_getarg tkSteal_parseargs tkEmacs tkEmacs_accept tkEmacs_accept_.frame.text tkEmacs_command tkEmacs_evalString tkEmacs_read tkEmacs_read_.frame.text tkEmacs_read_data tkEmacs_sendData tkEmacs_start tkEmacs_stop tkEmacs_updateScrollbars tkEmacs_wait}
set {moduleList(fnctns.tcl)} { EmacsBuildBuffList EmacsError EmacsQuit EmacsSaveOptions EmacsSetModeMenu EmacsSetWidgetResources EmacsUpdateResources SendToEmacs}
set {moduleList(fontBox.tcl)} { FontBox FontBoxComposeFont FontBoxSelectFont FontBoxSetFont}
set {moduleList(fsBox.tcl)} { FSBox FSBoxBindSelectOne FSBoxFSFileSelect FSBoxFSFileSelectDouble FSBoxFSInsertPath FSBoxFSNameComplete FSBoxFSShow}
set {moduleList(interface.tcl)} { .}
set {moduleList(main.tcl)} {}
set {moduleList(menuBar.tcl)} { MenuBarConf MenuBarDelete MenuBarEntry MenuBarEntryType MenuBarInit MenuBarInsert MenuBarInsertMenus MenuBarModify MenuBarReadMenu MenuBarReadMenus MenuBarReposition MenuBarSave MenuBarSaveMenu MenuBarScale MenuBarScaleDouble MenuBarSelect1 MenuBarSelect2 MenuBarSetItem MenuBarSetItems}
set {moduleList(readBox.tcl)} { ReadBox}
set {moduleList(textBox.tcl)} { TextBox TextBoxInternal}
global {preloadList}
set {preloadList(cbInternal)} {}
global {symbolicName}
set {symbolicName(root)} {.}
global {cbWmSetPosition}
set {cbWmSetPosition} {}
global {cbWmSetSize}
set {cbWmSetSize} {}
global {cbAppDefToplevels}
set {cbAppDefToplevels} {}

# display/remove toplevel windows.
ShowWindow.

# parse and apply application defaults.
CBLocalLoadAppDefs Main
CBLocalSetAppDefs

# end source
EndSrc

# eof
#

