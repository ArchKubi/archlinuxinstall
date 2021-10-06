#!/bin/bash

sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore  libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab 
sudo pacman -S xarchiver zip unzip mtpfs gvfs-mtp fakeroot jshon expac git wget htop lxappearance neofetch nitrogen xfce4-terminal qbittorrent
sudo pacman -S variety pavucontrol xfce4-appfinder xfce4-taskmanager thunar rofi scrot vlc ristretto net-tools p7zip unrar gparted conky jdk-openjdk

echo sudo pacman -S amd-ucode or 
sudo pacman -S intel-ucode


read -rsn1 -p "install your browser firefox is default //Press Enter" variable; echo
sudo pacman -S 

PS3='Please enter your choice: '
options=("Mate" "Cinnamon" "Gnome" "Xfce" "Plasma" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Firefox")
        echo "you chose Firefox"
            sudo pacman -S firefox
            ;;


        "Cinnamon")
        echo "you chose Cinnamon"
            sudo pacman -S cinnamon nemo-fileroller
            ;;

        "Gnome")
        echo "you chose Gnome"
            sudo pacman -S gnome gnome-extra
            ;;


        "Xfce")
        echo "you chose Xfce"
            sudo pacman -S xfce4 xfce4-goodies
            ;;


        "Plasma")
        echo "you chose Plasma"
            sudo pacman -S plasma kdeplasma-addons
            ;;


        "Qtile")
        echo "you chose Qtile"
            sudo pacman -S qtile
            ;;
        "Quit")
            break
            ;;
    esac
done
