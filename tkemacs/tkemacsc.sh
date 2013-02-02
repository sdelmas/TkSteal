#!/bin/sh
#
# Program: tkemacs
#
# This file is an automatically created shell script
# for starting the application named: tkemacs.tcl
#
# adapt the following variables to fit your
# local site
#
# WHIS_CMD is the wish interpreter to use
WISH_CMD=steal-wish
#
# CB_LOAD_PATH is the path were the tcl modules
# for this application are located
if test "$CB_LOAD_PATH" = ""; then
  CB_LOAD_PATH=.:/usr/local/lib
else
  CB_LOAD_PATH=$CB_LOAD_PATH:.:/usr/local/lib
fi
#
#
ARGC=$#
COMMANDLINE="-client"
while [ $ARGC -gt 0 ]; do
  C=$1
  shift
  ARGC=`expr $ARGC - 1`
  case $C in
    -cbloadpath)
      if [ $ARGC -gt 0 ]; then
        C=$1
        shift
        ARGC=`expr $ARGC - 1`
        CB_LOAD_PATH=$C:$CB_LOAD_PATH
      else
        echo "tkemacs.tcl: expected path for -cbloadpath"
        exit 2
      fi;;
    *)
      COMMANDLINE=$COMMANDLINE" "$C;;
  esac
done
#
export CB_LOAD_PATH
for p in `echo $CB_LOAD_PATH|awk 'BEGIN{RS=":"}
{print $0}'`; do
  if test -f $p/tkemacs.tcl; then 
    exec $WISH_CMD $p/tkemacs.tcl -name tkemacs $COMMANDLINE 
  fi
done
echo "Could not find: tkemacs.tcl"
# eof

