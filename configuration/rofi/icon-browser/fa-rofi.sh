#!/bin/bash

options='-markup -theme .config/awesome/configuration/rofi/icon-browser/icon-browser.rasi'

selected=$(\
  curl -s https://raw.githubusercontent.com/wstam88/rofi-fontawesome/master/unicode-list.txt \
    | rofi -dmenu -i -markup-rows \
    ${options}
    -p "Select Icon to Copy It to Your Clipboard")

# exit if nothing is selected
[[ -z $selected ]] && exit

echo -ne $(echo "$selected" |\
  awk -F';' -v RS='>' '
    NR==2{sub("&#x","",$1);print "\\u" $1;exit}'
) |  xclip -selection clipboard

exit 0
