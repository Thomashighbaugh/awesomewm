#!/bin/bash

function run {
    if ! pgrep "$1" ;
    then
        "$@"&
    fi
}



################################
# Programms
################################
# transparency
run picom -b --experimental-backends --config ~/.config/awesome/external/picom.conf
# run picom  --config ~/.config/picom/picom.conf --experimental-backends
# automounting usb drives
run udiskie
# mouse disappears
run unclutter
# for quicker emacs
# run emacs --bg-daemon
# for nightmode

################################
# Applets
################################

