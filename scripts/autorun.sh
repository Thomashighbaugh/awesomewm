#!/bin/env bash

# Commands to run at Awesome Startup, specific to AwesomeWM (which is why they aren't in .xinitrc)

picom -b --experimental-backends --dbus &

xcape -e "Super_L=Super_L|Control_L|Escape" &