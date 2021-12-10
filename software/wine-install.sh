#!/bin/sh

echo  "#[multilib]"
echo  "#Include = /etc/pacman.d/mirrorlist"
read -rsn1 -p "dont forget open nano edit and delete this //Press Enter  "

sudo nano /etc/pacman.conf
echo  "install starting..."
sudo pacman -Syyu

sudo pacman -S lutris wine winetricks wine-mono vkd3d lib32-vkd3d
yay -S dxvk-bin heroic-games-launcher-bin



#lutris settings
#https://forum.endeavouros.com/t/linux-gaming-guide/7339#heading--linux-gaming-lutris-game-config
