#!/usr/local/bin/steal-wish -f

wm maxsize . 1000 1000

frame .f -relief raised -borderwidth 2

button .f.b -text {Quit} -command {exit 0}

button .f.r -text {Rescan long} -command {InfoWidgetTreeRead [xaccess xwinroot -widget .] 10 10}

button .f.rs -text {Rescan short} -command {InfoWidgetTreeRead [xaccess xwinroot -widget .] 10 10 1}

button .f.p -text {Reparent} -command {
  if {"[.f.i get]" != ""} {
    xaccess eventreparent -window [.f.i get] -parentwidget .r
  }}

button .f.c -text {Configure} -command {
  if {"[.f.i get]" != ""} {
    xaccess eventconfigure -window [.f.i get] -width [winfo width .r] -height [winfo height .r] -x 0 -y 0 -borderwidth 0
  }}

button .f.m -text {Map} -command {
  if {"[.f.i get]" != ""} {
    xaccess eventmap -window [.f.i get]
  }}

button .f.u -text {Unmap} -command {
  if {"[.f.i get]" != ""} {
    xaccess eventunmap -window [.f.i get]
  }}

label .f.l -text {Window id:}

entry .f.i

label .m -text "Reparented windows go here:" -relief raised

frame .g -relief raised -borderwidth 2

canvas .g.c -scrollregion {0 0 10c 10c} -xscrollcommand {.g.h set} -yscrollcommand {.g.v set} -confine 1

scrollbar .g.h -command {.g.c xview} -orient horizontal

scrollbar .g.v -command {.g.c yview}

frame .r -relief raised -borderwidth 2 -width 10 -height 100

pack .f.b -side left
pack .f.r -side left
pack .f.rs -side left
pack .f.p -side left
pack .f.c -side left
pack .f.m -side left
pack .f.u -side left
pack .f.l -side left
pack .f.i -side left -fill both -expand 1

pack .g.h -side bottom -fill both
pack .g.v -side right -fill both
pack .g.c -side top -fill both -expand 1

pack .f -side top -fill both
pack .g -side top -fill both -expand 1
pack .m -side top -fill both
pack .r -side top -fill both -expand 1

update
set cbMisc(windowTreeRoot) [xaccess xwinroot -widget .]
set cbMisc(windowTreeY) 10

##########
# Procedure: InfoWidgetTreeRead
# Description: update the widget tree in a canvas
# Arguments: cbWindow - the current window
#            cbX - current X offset
#            cbY - current Y offset
#            short - only display windows with names
# Returns: none
# Sideeffects: none
##########
proc InfoWidgetTreeRead {cbWindow cbX cbY {short 0}} {
  global cbMisc
 
  if {"$cbWindow" == "$cbMisc(windowTreeRoot)"} {
    set cbMisc(windowTreeY) 10
    foreach cbCounter [.g.c find all] {
      .g.c delete $cbCounter
    }
  }
  
  if {!$short || "[string trim [xaccess xwinname -windowid $cbWindow]]" != ""} {
    set item [.g.c create rectangle $cbX $cbMisc(windowTreeY) [expr $cbX+40] [expr $cbMisc(windowTreeY)+40] -fill black -tag $cbWindow]
    .g.c bind $item <Button-1> ".f.i delete 0 end; .f.i insert 0 $cbWindow"

    set itemText [.g.c create text [expr $cbX+50] [expr $cbMisc(windowTreeY)+30] -text "$cbWindow (0x[format %lx $cbWindow]) = [xaccess xwinname -windowid $cbWindow]" -anchor sw -tag $cbWindow]

    if {"$cbWindow" != "$cbMisc(windowTreeRoot)"} {
      set itemLine [.g.c create line $cbX [expr $cbMisc(windowTreeY)+20] [expr $cbX-30] [expr $cbMisc(windowTreeY)+20] [expr $cbX-30] [expr $cbY-10]]
    }

    incr cbMisc(windowTreeY) 50
    set cbY $cbMisc(windowTreeY)
  }

  foreach cbCounter [xaccess xwinchilds -window $cbWindow] {
    InfoWidgetTreeRead $cbCounter [expr $cbX+50] $cbY $short
  }

  if {"$cbWindow" == "$cbMisc(windowTreeRoot)"} {
    set cbBBox [.g.c bbox all]
    .g.c config -scrollregion "0c 0c [expr [lindex $cbBBox 2]+20] [expr [lindex $cbBBox 3]+20]"
  }
}

InfoWidgetTreeRead [xaccess xwinroot -widget .] 10 10 1

# eof
