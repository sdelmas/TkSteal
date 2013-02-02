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
button .cmds.ls -text ls -command {
  .f keyclick l
  .f keyclick s
  .f keyclick Return
}
button .cmds.ps -text ps -command {
  .f sendstring "ps<Return>"
}
button .cmds.test1 -text test1 -command {
  .f sendstring "aBcDe" 2
}
button .cmds.test2 -text test2 -command {
  .f sendstring "abcedfghijklmnopqrtsuvwxyz"
}
button .cmds.test3 -text test3 -command {
  .f sendstring "<Press-Shift>abcedfghijklmnopqrtsuvwxyz<Release-Shift>ab"
}
button .cmds.test4 -text test4 -command {
  .f sendstring "<greater><less><less<><less"
}
button .cmds.test5 -text test5 -command {
  .f sendstring "<space><Shift><exclam><Shift><quotedbl><numbersign><Shift><dollar><Shift><percent><Shift><ampersand><Shift><quoteright><Shift><parenleft><Shift><parenright><Shift><asterisk><plus><comma><minus><period><Shift><slash><Shift><colon><Shift><semicolon><less><Shift><equal><greater><Shift><question><Shift><at><bracketleft><backslash><bracketright><asciicircum><Shift><underscore><quoteleft><Shift><braceleft><Shift><bar><Shift><braceright><Shift><asciitilde><Control>a"
}
button .cmds.test6 -text test6 -command {
  .f sendstring {ABab^~!"@$%&/()=?`'+*\[]{}#|,;.:-_> <<>	<<
}
}
button .cmds.test7 -text test7 -command {
  .f sendstring "ghost\t\n"
}
button .cmds.test8 -text test8 -command {
  set child [xaccess xwinchilds -windowid [lindex [.f config -windowid] 4]]
  set subchild [xaccess xwinchilds -windowid $child]
  xaccess eventmotion -windowid $subchild -x 2 -y 2
  xaccess eventbuttonpress -windowid $subchild -button 2
}
button .cmds.test9 -text test9 -command {
  set child [xaccess xwinchilds -windowid [lindex [.f config -windowid] 4]]
  xaccess eventmotion -windowid $child -x 20 -y 20
  xaccess eventbuttonpress -windowid $child -button 1
  xaccess eventmotion -windowid $child -x 100 -y 100
  xaccess eventbuttonrelease -windowid $child -button 1
}
button .cmds.id -text id -command {
  puts stdout [lindex [.f conf -windowid] 4]
  puts stdout 0x[format %x [lindex [.f conf -windowid] 4]]
}
button .q -text Quit -command {.f sendstring "<Control>a<Control>kexit<Return>"; exit 0}
pack .cmds.ls -side left
pack .cmds.ps -side left
pack .cmds.test1 -side left
pack .cmds.test2 -side left
pack .cmds.test3 -side left
pack .cmds.test4 -side left
pack .cmds.test5 -side left
pack .cmds.test6 -side left
pack .cmds.test7 -side left
pack .cmds.test8 -side left
pack .cmds.test9 -side left
pack .cmds.id -side left 
pack .cmds -side top -fill both
pack .q -side top

tkSteal .f -command {xterm -iconic #+10000+10000 -T TkStealXTerm -n TkStealXTerm -w 0 -xrm "xterm*allowSendEvents:true" -xrm "xterm*foreground:red" -geometry 100x30+10000+10000} -name {TkStealXTerm} -width 80 -height 25
pack .f -side top -fill both -expand 1

wm maxsize . 1000 1000

# eof

