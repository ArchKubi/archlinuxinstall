#!/bin/bash

sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora wavpack x264 xvidcore  libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab 
sudo pacman -S xarchiver zip unzip mtpfs gvfs-mtp jshon expac htop lxappearance neofetch nitrogen xfce4-terminal qbittorrent leafpad 
sudo pacman -S variety xfce4-appfinder xfce4-taskmanager thunar rofi scrot vlc ristretto net-tools p7zip unrar gparted conky jdk-openjdk emacs

echo sudo pacman -S amd-ucode or 
sudo pacman -S intel-ucode

sudo pacman -Rdd adwaita-icon-theme

read -rsn1 -p "install your browser firefox is default //Press Enter" variable; echo
sudo pacman -S 

PS3='Please enter your choice: '
options=("Firefox" "Vivaldi" "Opera" "Chromium" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Firefox")
        echo "you chose Firefox"
            sudo pacman -S firefox
            ;;


        "Vivaldi")
        echo "you chose Vivaldi"
            sudo pacman -S vivaldi vivaldi-ffmpeg-codecs
            ;;

        "Opera")
        echo "you chose Opera"
            sudo pacman -S opera opera-ffmpeg-codecs
            ;;


        "Chromium")
        echo "you chose Chromium"
            sudo pacman -S chromium
            ;;

        "Quit")
            break
            ;;
    esac
done
