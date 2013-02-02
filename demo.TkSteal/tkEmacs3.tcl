#!/usr/local/bin/steal-wish -f

global auto_path
set libraryPath ""
set searchList ""
lappend searchList "."
lappend searchList ".."
lappend searchList "../library"
foreach dirName $auto_path {
  lappend searchList $dirName
}
foreach dirName $searchList {
  if {[file exists $dirName/tkEmacs.tcl]} {
    set libraryPath $dirName
  } {
    if {[file exists $dirName/TkSteal/tkEmacs.tcl]} {
      set libraryPath $dirName/TkSteal
    } {
      if {[file exists [file dirname $dirName]/TkSteal/tkEmacs.tcl]} {
        set libraryPath [file dirname $dirName]/TkSteal
      }
    }
  }
}
lappend auto_path $libraryPath
source $libraryPath/tkEmacs.tcl

set type ""
if {$argc == 1} {
  set type [lindex $argv 0]
}

button .b -text Buttonclick -command {
  xaccess eventmotion -widget .f -x 50 -y 50
  xaccess eventbuttonpress -windowid $tkEmacs_priv(.f,windowId) -button 1
}

case $type {
  {emacs18} {
    button .q -text Quit -command {exit 0}
    tkEmacs .f -command {emacs-18.59 -i -rn TKEMACS -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port} -name TKEMACS* -xscrollcommand {.s2 set} -yscrollcommand {.s1 set} -useadvise 1
    scrollbar .s1 -command {.f yview}
    scrollbar .s2 -orient horizontal -command {.f xview}
    pack .q -side bottom
    pack .b -side bottom
    pack .s1 -side right -fill both
    pack .s2 -side bottom -fill both
    pack .f -side top -fill both -expand 1
  }
  {emacs19} {
    button .q -text Quit -command {exit 0}
    tkEmacs .f -command {emacs -i -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port} -xscrollcommand {.s2 set} -yscrollcommand {.s1 set} -useadvise 1
    scrollbar .s1 -command {.f yview}
    scrollbar .s2 -orient horizontal -command {.f xview}
    pack .q -side bottom
    pack .b -side bottom
    pack .s1 -side right -fill both
    pack .s2 -side bottom -fill both
    pack .f -side top -fill both -expand 1
  }
  {lemacs} {
    button .q -text Quit -command {exit 0}
    tkEmacs .f -command {lemacs -title TKEMACS -eval (iconify-emacs) -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port} -xscrollcommand {.s2 set} -yscrollcommand {.s1 set} -useadvise 1 -name TKEMACS
    scrollbar .s1 -command {.f yview}
    scrollbar .s2 -orient horizontal -command {.f xview}
    pack .q -side bottom
    pack .b -side bottom
    pack .s1 -side right -fill both
    pack .s2 -side bottom -fill both
    pack .f -side top -fill both -expand 1
  }
  {xemacs} {
    button .q -text Quit -command {exit 0}
    tkEmacs .f -command {xemacs -title TKEMACS -eval (iconify-emacs) -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port} -xscrollcommand {.s2 set} -yscrollcommand {.s1 set} -useadvise 1 -name TKEMACS
    scrollbar .s1 -command {.f yview}
    scrollbar .s2 -orient horizontal -command {.f xview}
    pack .q -side bottom
    pack .b -side bottom
    pack .s1 -side right -fill both
    pack .s2 -side bottom -fill both
    pack .f -side top -fill both -expand 1
  }
  {noreparent} {
    button .q -text Quit -command {.f stopemacs; exit 0}
    tkEmacs .f -reparent 0 -command {TkEmacs -rn TKEMACS -geometry 20x20+10+10 -l $lispfile -tkwidget $pathName.cbl localhost $port} -name TKEMACS*
    pack .q -side bottom
  }
  {default} {
    button .q -text Quit -command {exit 0}
    tkEmacs .f -command {TkEmacs -i -rn TKEMACS -geometry $geometry -l $lispfile -tkwidget $pathName.cbl localhost $port} -name TKEMACS* -xscrollcommand {.s2 set} -yscrollcommand {.s1 set} -useadvise 1
    scrollbar .s1 -command {.f yview}
    scrollbar .s2 -orient horizontal -command {.f xview}
    pack .q -side bottom
    pack .b -side bottom
    pack .s1 -side right -fill both
    pack .s2 -side bottom -fill both
    pack .f -side top -fill both -expand 1
  }
}

wm maxsize . 1000 1000

# eof

