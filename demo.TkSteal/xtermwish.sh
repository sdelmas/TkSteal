#!/bin/sh -f
exec xterm -w 0 -iconic -geometry 100x100+10000+10000 -xrm "xterm*allowSendEvents:true" -e steal-wish -name wish XTERMWISH

# eof

