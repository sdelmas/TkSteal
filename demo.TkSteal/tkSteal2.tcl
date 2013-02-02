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
  if {[file exists $dirName/tkSteal.tcl]} {
    set libraryPath $dirName
  } {
    if {[file exists $dirName/TkSteal/tkSteal.tcl]} {
      set libraryPath $dirName/TkSteal
    } {
      if {[file exists [file dirname $dirName]/TkSteal/tkSteal.tcl]} {
        set libraryPath [file dirname $dirName]/TkSteal
      }
    }
  }
}
lappend auto_path $libraryPath
source $libraryPath/tkSteal.tcl

button .q -text Quit -command {exit 0}
pack .q -side top

tkSteal .f -command {xclock -iconic -n TkStealXClock -bw 0 -background $background -foreground $foreground -geometry 400x400+10000+10000} -name {TkStealXClock} -width 30 -height 30
pack .f -side top -fill both -expand 1
wm maxsize . 1000 1000
wm geometry . 100x100

# eof

