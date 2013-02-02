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

frame .cmds
pack .cmds -fill both
button .cmds.test1 -text Text -command {
  .f sendstring "aBcDe" 2
}
pack .cmds.test1 -side left
button .cmds.test2 -text Motion -command {
  .f motion 20 20
}
pack .cmds.test2 -side left
button .cmds.test3 -text Button -command {
  .f motion 20 20
  .f buttonclick 1
}
pack .cmds.test3 -side left
button .cmds.q -text Quit -command {exit 0}
pack .cmds.q -side left

tkSteal .f -command {xev -n TkStealXEV -geometry 400x400+10000+10000} -name {TkStealXEV} -width 30 -height 30
pack .f -side top -fill both -expand 1
wm maxsize . 1000 1000
wm geometry . 400x200

# eof

