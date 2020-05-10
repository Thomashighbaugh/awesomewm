#!/usr/bin/env bash
#####################################################################
########    Awesome Window Manager AutoStart Script    ##############
#####################################################################
## A script run each time awesome starts or restarts.
# Other start up features accomplished with xprofile


function run {
   if (command -v $1 && ! pgrep $1); then

     $@&
   fi
}


## Hitting Left Super == L Super + L Control + Escape (for rofi)
run xcape -e 'Super_L=Super_L|Control_L|Escape'

run feh --bg-fill ~/.backgrounds/vice.png
## Compositor
run picom
