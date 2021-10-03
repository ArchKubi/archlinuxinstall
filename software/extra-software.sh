#!/bin/bash

sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore  libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab 
sudo pacman -S xarchiver zip unzip mtpfs gvfs-mtp fakeroot jshon expac git wget htop lxappearance neofetch nitrogen xfce4-terminal qbittorrent simplescreenrecorder
sudo pacman -S variety pavucontrol xfce4-appfinder xfce4-taskmanager thunar rofi scrot vlc ristretto net-tools p7zip unrar gparted conky jdk-openjdk

echo sudo pacman -S amd-ucode or intel-ucode
sudo pacman -S intel-ucode


read -rsn1 -p "install your browser firefox is default //Press Enter" variable; echo
sudo pacman -S firefox
