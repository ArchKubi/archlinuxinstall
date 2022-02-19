#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}




picom --config ~/.config/i3/picom.conf &
nitrogen --restore &
sh ~/.config/i3/display.sh  &

#start the conky to learn the shortcuts
(conky -c ~/.config/qtile/system-overview) &
