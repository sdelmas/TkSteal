#
# Copyright (c) 1993 by Sven Delmas
# All rights reserved.
# See the file COPYRIGHT for the copyright notes.

global tkEmacs_priv
set tkEmacs_priv(debug) 0

# this proc is taken from the beta code of the toolbox
 proc tkSteal_getarg {opts arg var} {
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

# this proc is taken from the beta code of the toolbox
 proc tkSteal_parseargs {cmdline descr args} {
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
      set descr [lreplace $descr $ind $ind \
        [lreplace [lindex $descr $ind] 4 4 $value]]
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

global tkEmacs_ARGUMENTS
set tkEmacs_ARGUMENTS {
{-background          background          Background          #d9d9d9       #d9d9d9}
{-borderwidth         borderWidth         BorderWidth         0             0}
{-cursor              cursor              Cursor              xterm         xterm}
{-debug               debug               Debug               0             1}
{-exportselection     exportSelection     ExportSelection     1             1}
{-font                font                Font                *-Courier-Medium-R-Normal-*-120-* *-Courier-Medium-R-Normal-*-120-*}
{-foreground          foreground          Foreground          black         black}
{-highlightbackground highlightBackground HighlightBackground #d9d9d9 #d9d9d9}
{-highlightcolor      highlightColor      HighlightColor      black         black}
{-highlightthickness  highlightThickness  HighlightThickness  2 2}
{-insertbackground    insertBackground    Foreground          black         black}
{-insertborderwidth   insertBorderWidth   BorderWidth         0             0}
{-insertofftime       insertOffTime       OffTime             300           300}
{-insertontime        insertOnTime        OnTime              600           600}
{-insertwidth         insertWidth         InsertWidth         2             2}
{-padx                padX                Pad                 1             1}
{-pady                padY                Pad                 1             1}
{-relief              relief              Relief              flat          flat}
{-selectbackground    selectBackground    Foreground          #c3c3c3       #c3c3c3}
{-selectborderwidth   selectBorderwidth   Borderwidth         1             1}
{-selectforeground    selectForeground    Background          black         black}
{-setgrid             setGrid             SetGrid             1             1}
{-state               state               State               normal        normal}
{-takefocus           takeFocus           TakeFocus           0             0}
{-wrap                wrap                Wrap                char          char}
{-xscrollcommand      xScrollCommand      ScrollCommand       {}            {}}
{-yscrollcommand      yScrollCommand      ScrollCommand       {}            {}}

{-command             command             Command             {TkEmacs}     {TkEmacs}}
{-endsource           endSource           EndSource           {}            {}}
{-errorcallback       errorCallback       ErrorCallback       {}            {}}
{-file                file                File                {}            {}}
{-height              height              Height              300           300}
{-lispfile            lispFile            LispFile            {tkemacs.el}  {tkemacs.el}}
{-name                name                Name                {TKEMACS*}    {TKEMACS*}}
{-pollinterval        pollInterval        PollInterval        {}            {}}
{-port                port                Port                0             0}
{-reparent            reparent            Reparent            1             1}
{-startupsource       startupSource       StartupSource       {}            {}}
{-timeout             timeout             Timeout             10000         10000}
{-useadvise           useAdvise           UseAdvise           0             0}
{-width               width               Width               550           550}}

proc tkEmacs {pathName args} {
  # CBInfo: autoload

  global tk_library
  global tkEmacs_priv
  global tkEmacs_ARGUMENTS

  # initialize the data
  set tkEmacs_priv($pathName,initialized) 0
  set tkEmacs_priv($pathName,emacsAvailable) 0
  set tkEmacs_priv($pathName,windowId) ""
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
  global dp_version use_dp
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
  tkSteal_getarg $tkEmacs_priv($pathName,config) \
    -port port
  set tkEmacs_priv(debug) $debug

  if {"$command" == "" ||
      (![auto_execok [lindex $command 0]] &&
       ![file executable [lindex $command 0]])} {
    error "tkEmacs: no valid emacs command specified \"$command\""
  }

  # create file handle procedures
  set newBody [info body tkEmacs_accept]
  regsub -all WIDGET_NAME $newBody $pathName newBody
  eval "proc tkEmacs_accept_$pathName \{args\} \{$newBody\}"
  set newBody [info body tkEmacs_read]
  regsub -all WIDGET_NAME $newBody $pathName newBody
  eval "proc tkEmacs_read_$pathName \{args\} \{$newBody\}"

  # establish connection
  catch "socket" result
  if {1 || [string match "invalid command name*" $result]} {
    set use_dp 1
    catch "dp_filehandler" result
    if {![string match "wrong*" $result]} {
      error "tkEmacs: the tcl-dp package is not available"
    } {
      if {[catch "dp_connect -server $port" result]} {
        error $result
      }
      set server [lindex $result 0]
      set port [lindex $result 1]
    }
  } {
    set use_dp 0
    set server localhost
    if {![string compare "0" $port]} {
      set port 2957
    }
    set tkEmacs_priv($pathName,server) [socket -server tkEmacs_accept_$pathName $port]
  }
  if {$tkEmacs_priv(debug)} {
    puts stdout "$pathName: Server: $server"
    puts stdout "$pathName: Port: $port"
  }

  if {$use_dp} {
    if {[catch "dp_filehandler $server r tkEmacs_accept_$pathName" result]} {
      error $result
    }
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
  global use_dp
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
    if {$use_dp} {
      catch "dp_filehandler $tkEmacs_priv($pathName,handle)"
    } {
      catch "fileevent $tkEmacs_priv($pathName,handle) \"\""
    }
    if {[info exists $tkEmacs_priv($pathName,handle)]} {
      catch "close $tkEmacs_priv($pathName,handle)"
    }
  }
  return ""
}

 proc tkEmacs_command {pathName minorCommand args} {
  global use_dp
  global tkEmacs_priv

  set sendType ""
  set sendCommand ""
  set waitFor 1
  case $minorCommand {
    {bbox} {
    }
    {cget} {
      set resourceIndex [lsearch $tkEmacs_priv($pathName,config) $args*]
      if {$resourceIndex != -1} {
        set element [lindex $tkEmacs_priv($pathName,config) $resourceIndex]
        return [lindex $element 4]
      } {
        error "unknown resource: $args"
      }
    }
    {compare} {
      if {[llength $args] != 3} {
        error "wrong # of args: should be \"$pathName compare index1 op index2\""
      }
      set sendType "CMD: "
      set sendCommand "(tk-compare-index \"[lindex $args 0]\" \"[lindex $args 1]\" \"[lindex $args 2]\")"
    }
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
    {dlineinfo} {
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
    {search} {
    }
    {see} {
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
        if {$use_dp} {
          catch "dp_filehandler $tkEmacs_priv($pathName,handle)"
        } {
          catch "fileevent $tkEmacs_priv($pathName,handle) \"\""
        }
        if {[info exists $tkEmacs_priv($pathName,handle)]} {
          catch "close $tkEmacs_priv($pathName,handle)"
        }
      } {
        tkEmacs_stop $pathName
      }
    }
    {tag} {
    }
    {window} {
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

 proc tkEmacs_accept {args} {
  global dp_version use_dp
  global tkEmacs_priv

  if {$use_dp} {
    set condition [lindex $args 0]
    set fileId [lindex $args 1]
  } {
    set fileId [lindex $args 0]
  }
  if {$tkEmacs_priv(debug)} {
    puts stdout "WIDGET_NAME: Accept at: $fileId"
  }
  # accept the connection
  if {$use_dp} {
    if {[catch "dp_accept $fileId" result]} {
      error $result
    }
    set tkEmacs_priv(WIDGET_NAME,handle) [lindex $result 0]
    if {[catch "dp_filehandler $tkEmacs_priv(WIDGET_NAME,handle) r tkEmacs_read_WIDGET_NAME" result]} {
      error $result
    }
    update idletask
    catch "dp_filehandler $fileId"
    if {[info exists $fileId]} {
      catch "close $fileId"
    }
  } {
    set tkEmacs_priv(WIDGET_NAME,handle) [lindex $fileId 0]
    if {[catch "fileevent $tkEmacs_priv(WIDGET_NAME,handle) readable \{tkEmacs_read_WIDGET_NAME $fileId\}" result]} {
      error $result
    }
    update idletask
    if {[info exists $tkEmacs_priv(WIDGET_NAME,server)]} {
      catch "close $tkEmacs_priv(WIDGET_NAME,server)"
    }
  }
  set tkEmacs_priv(WIDGET_NAME,initialized) 1
  return ""
}

 proc tkEmacs_read {args} {
  global use_dp

  if {$use_dp} {
    set condition [lindex $args 0]
    set fileId [lindex $args 1]
  } {
    set fileId [lindex $args 0]
  }
  tkEmacs_read_data WIDGET_NAME $fileId
}

 proc tkEmacs_read_data {pathName fileId} {
  global use_dp
  global tkEmacs_priv

  # read first line
  set readData ""
  set tkEmacs_priv($pathName,result) ""
  if {[catch "gets $fileId" readData]} {
    if {$use_dp} {
      catch "dp_filehandler $fileId"
    } {
      catch "fileevent $fileId"
    }
    if {[info exists $fileId]} {
      catch "close $fileId"
    }
    return ""
  }
  if {"$readData" == ""} {
    if {[eof $fileId]} {
      if {$use_dp} {
        catch "dp_filehandler $fileId"
      } {
        catch "fileevent $fileId"
      }
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
      } elseif {[string match "RET: *" $readData] && $currentType == 0 &&
                "$result" == ""} {
        # the first RET: token
        set currentType 2
        set result [string range $readData 5 end]
      } elseif {[string match "CMW: *" $readData] && $currentType == 0 &&
                "$result" == ""} {
        # the first CMW: token
        set currentType 3
        set result [string range $readData 5 end]
      } elseif {[string match "ERR: *" $readData]} {
        # an error message
        tkSteal_getarg $tkEmacs_priv($pathName,config) \
          -errorcallback errorcallback
        if {"$errorcallback" != ""} {
          catch "$errorcallback $pathName \{$readData\}"
        }
        set result ""
        set tkEmacs_priv($pathName,wait) 0
        return
      } elseif {[string match "END*" $readData] && $currentType != 0} {
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
          } elseif {$currentType == 2} {
            if {$tkEmacs_priv(debug)} {
              puts stderr "$pathName: Return: $result"
            }
            set tkEmacs_priv($pathName,result) $result
            set tkEmacs_priv($pathName,wait) 0
          } elseif {$currentType == 3} {
            if {$tkEmacs_priv(debug)} {
              puts stderr "$pathName: Eval_W: $result"
            }
            if {[catch "$result" res]} {
              tkSteal_getarg $tkEmacs_priv($pathName,config) \
                -errorcallback errorcallback
              if {"$errorcallback" != ""} {
                catch "$errorcallback $pathName \{$res\}"
              }
            }
            tkEmacs_command $pathName send "(setq tk-wait-end-tcl-procedure 0)"
          } {
            set tkEmacs_priv($pathName,result) ""
            set tkEmacs_priv($pathName,wait) 0
          }
        }
        return
      } elseif {[string match "RST:*" $readData]} {
        set tkEmacs_priv($pathName,result) ""
        set tkEmacs_priv($pathName,wait) 0
        return
      } {
        # data that is appended to the already read message
        append result "\n[string range $readData 5 end]"
      }
    }
    # next message line
    if {[catch "gets $fileId" readData]} {
      if {$use_dp} {
        catch "dp_filehandler $fileId"
      } {
        catch "fileevent $fileId"
      }
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

# eof

