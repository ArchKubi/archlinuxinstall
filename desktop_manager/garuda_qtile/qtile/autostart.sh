#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}



#starting utility applications at boot time
lxsession &
run nm-applet &
run pamac-tray &
numlockx on &
blueman-applet &


display.sh &
nitrogen &

#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &


nitrogen --random --set-zoom-fill &
sh ~/.config/qtile/display.sh



#start the conky to learn the shortcuts
(conky -c $HOME/.config/qtile/system-overview) &


#starting user applications at boot time
run volumeicon &
