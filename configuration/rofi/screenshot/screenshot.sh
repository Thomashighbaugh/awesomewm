#!/bin/bash

rofi_command="rofi -theme .config/awesome/configuration/rofi/screenshot/screenshot.rasi"

# Options
screen=""
area=""

# Variable passed to rofi
options="$screen\n$area"

chosen="$(echo -e "$options" | $rofi_command -p '' -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 2; snap full
        ;;
    $area)
       snap area
        ;;
esac


