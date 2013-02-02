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

button .q -text Quit -command {.f sendstring ":q!"; after 2000; exit 0}
pack .q -side top

tkSteal .f -command {xterm -iconic #+10000+10000 -T TkStealXTerm -n TkStealXTerm -w 0 -xrm "xterm*allowSendEvents:true" -xrm "xterm*foreground:red" -geometry 100x30+10000+10000 -e vi tkSteal3.tcl} -name {TkStealXTerm} -width 80 -height 25
pack .f -side top -fill both -expand 1

wm maxsize . 1000 1000

# eof

