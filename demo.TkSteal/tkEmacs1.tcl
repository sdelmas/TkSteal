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

button .ff2 -text {Quit} -command {exit 0}
pack .ff2 -side bottom

wm maxsize . 1000 1000
wm geometry . 800x600
tkEmacs .ff0 -command TkEmacs
label .ff1 -text {There should be no visible emacs!!}
pack .ff1 -side top


