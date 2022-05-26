#!/bin/bash

echo  "#[multilib]"
echo  "#Include = /etc/pacman.d/mirrorlist"
read -rsn1 -p "dont forget open nano edit and delete this //Press Enter  "

sudo nano /etc/pacman.conf
echo  "install starting..."
sudo pacman -Syyu

# : jdk-openjdk
sudo pacman -S zip unzip p7zip  unrar expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss  libdvdread  libdvdnav dvd+rw-tools dvdauthor dvgrab lib32-alsa-lib  lib32-alsa-plugins  lib32-libpulse  lib32-alsa-oss  net-tools  
sudo pacman -S conky picom gparted nitrogen rofi dmenu lxappearance scrot celluloid

sudo pacman -S   cool-retro-term        ranger            cmus
#                   terminal        - file manager  -  music player
sudo pacman -S zathura-pdf-poppler  zathura      ristretto
#                        pdf UWU             -  image wiewer

sudo pacman -S irqbalance #don't forger this
systemctl enable --now irqbalance


PS3='Please enter your choice: '
options=("amd" "intel" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "AMD")
        echo "you chose AMD"
            sudo pacman -S amd-ucode
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

read -rsn1 -p "install your browser QuteBrowser is default //Press Enter" variable; echo

PS3='Please enter your choice: '
options=("QuteBrowser" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "QuteBrowser")
        echo "you choose QuteBrowser"
        sudo pacman -S qutebrowser
	    sudo pacman -S python-adblock
            break
            ;;

        "Quit")
            break
            ;;
    esac
done

sudo pacman -Sy archlinux-keyring
