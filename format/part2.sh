#!/bin/bash



################################################################################################################
read -rsn1 -p "######NETWORKMANAGER#############################################" variable; echo
pacman -S networkmanager
systemctl enable NetworkManager.service
echo -n "enable networkmanager "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######COMPUTER NAME##############################################" variable; echo
echo "this is your computer name"
read -p 'Enter Computer Name: ' computer_name
echo "$computer_name" >> /etc/hostname
read -rsn1 -p "$computer_name nice name bro //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######ROOT PASSWORD##############################################" variable; echo
read -rsn1 -p "You write the root password, you will enter root and password when logging in, of course you know that. //Press Enter" variable; echo
passwd root
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######SYSTEM LANGUAGE############################################" variable; echo
#---------------------------------------------------------------#
#: Turkish Language = tr_TR.UTF-8 
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf 
echo "Your Language is OK! //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######LOCAL TİME#################################################" variable; echo
read -rsn1 -p "if you not live in turkey edit this file  //Press Enter" variable; echo
timedatectl set-timezone Europe/Istanbul
read -rsn1 -p "$timezone ok! //Press Enter" variable; echo
locale-gen en_US.UTF-8
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "#END SETTİNGS####################################################" variable; echo
mkinitcpio -p linux
read -rsn1 -p "mkinitcpio !OK //Press Enter" variable; echo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo -n "grub-install and grub-mkconfig "
read -rsn1 -p "//Press Enter" variable; echo
echo "enter this command first 1: exit 2: umount /mnt/boot and umount /mnt"
echo "dont forget edit part3.sh but reboot your computer you need git clone again sorry bro"
echo "Arch Linux install finish but you need software bro  next part3.sh"
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################