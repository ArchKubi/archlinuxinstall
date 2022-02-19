#!/bin/bash


function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

nitrogen --random --set-zoom-fill &
sh ~/.config/qtile/display.sh



#start the conky to learn the shortcuts
conky -c $HOME/.config/qtile/system-overview &
run volumeicon &