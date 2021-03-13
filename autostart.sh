#!/bin/bash

#  _______ _______ _______ _______ _______ _______ _______ ______ _______
# |   _   |   |   |_     _|       |     __|_     _|   _   |   __ \_     _|
# |       |   |   | |   | |   -   |__     | |   | |       |      < |   |
# |___|___|_______| |___| |_______|_______| |___| |___|___|___|__| |___|

Thomas Leon Highbaugh

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
run xfce4-settings-daemon
run xcape -e "Super_L=Super_L|Control_L|Escape"
run udiskie
# mouse disappears
run unclutter
run ~/.dropbox-dist/dropbox

################################
# Applets
################################
