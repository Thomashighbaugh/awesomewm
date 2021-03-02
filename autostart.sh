#!/bin/sh

function run() {
  if ! pgrep $1; then
    $@ &
  fi
}

################################
# Programms
################################
# transparency
run picom --config ~/.config/picom/picom.conf --experimental-backends
# automounting usb drives
run udiskie
# mouse disappears
run unclutter

run xcape -e \"Super_L=Super_L | Control_L | Escape\" &
################################
# Applets
################################
run blueman-applet

run ./.dropbox-dist/dropboxd &
