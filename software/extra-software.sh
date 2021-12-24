#!/bin/bash

sudo pacman -S exfat-utils fuse-exfat a52dec faac faad2 jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora wavpack x264 xvidcore  libdvdcss libdvdread libdvdnav  dvd+rw-tools dvdauthor dvgrab 
sudo pacman -S xarchiver zip unzip mtpfs gvfs-mtp jshon expac htop lxappearance neofetch nitrogen cool-retro-term qbittorrent leafpad 
sudo pacman -S scrot vlc ristretto net-tools p7zip unrar gparted jdk-openjdk emacs


PS3='Please enter your choice: '
options=("amd" "intel" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "AMD")
        echo "you chose AMD"
            sudo pacman -S amd-ucode or 
            break
            ;;

        "intel")
        echo "you chose intel"
            sudo pacman -S intel-ucode
            break
            ;;



        "Quit")
            break
            ;;
    esac
done



sudo pacman -Rdd adwaita-icon-theme

read -rsn1 -p "install your browser firefox is default //Press Enter" variable; echo
sudo pacman -S 

PS3='Please enter your choice: '
options=("QuteBrowser" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "QuteBrowser")
        echo "you chose QuteBrowser"
            sudo pacman -S qutebrowser
            break
            ;;

        "Quit")
            break
            ;;
    esac
done
