#!/bin/bash

#  _______ _______ _______ _______ _______ _______ _______ ______ _______
# |   _   |   |   |_     _|       |     __|_     _|   _   |   __ \_     _|
# |       |   |   | |   | |   -   |__     | |   | |       |      < |   |
# |___|___|_______| |___| |_______|_______| |___| |___|___|___|__| |___|

# Thomas Leon Highbaugh

## This file runs each time that awesome restarts, which xprofile does not. However I have not seen an advantage to xprofile and it runs in other window manager or desktop environment contexts, thus I have come full circle and prefer to have an autostart script with each WM or DE specific to that environment.

function run() {
    if ! pgrep "$1"; then
        "$@" &
    fi
}

################################
# Programms
################################
# transparency
run picom -b --experimental-backends --config ~/.config/awesome/external/picom.conf
## Turn on settings manager (allows gtk styling to work consistently, power manager for my laptop, etc)
run xfsettingsd
## Allows for windows key to bring up rofi menu in single key stroke (vital to workflow for me)
run xcape -e "Super_L=Super_L|Control_L|Escape"

# mouse disappears
run unclutter

# turned on by xprofile as well. Doesn't hurt to have it twice, its just twice as nice
run "/home/tlh/.dropbox-dist/dropboxd"

