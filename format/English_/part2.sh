#!/bin/bash



################################################################################################################
read -rsn1 -p "######NETWORK MANAGER #############################################" variable; echo
pacman -S networkmanager
systemctl enable NetworkManager.service
echo -n "enabled network manager  "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######COMPUTER NAME ##############################################" variable; echo
echo "this is your computer name "
read -p 'Enter Computer Name : ' computer_name
echo "$computer_name" >> /etc/hostname
read -rsn1 -p "$computer_name nice name bro  //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "######Root ŞİFRESİ##############################################" variable; echo
read -rsn1 -p "You type root password, when login you will enter root and password, of course you know that .//Press Enter" variable; echo
passwd root
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######SYSTEM LANGUAGE ############################################" variable; echo
#---------------------------------------------------------------#
read -rsn1 -p "unutma part2.sh : ingilizce dili = en_US.UTF-8 //Press Enter" variable; echo
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf 
echo "Your language is OK!  //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######LOCAL TIME #################################################" variable; echo
read -rsn1 -p "Turkey Time Zone  //Press Enter" variable; echo
timedatectl set-timezone Europe/Istanbul 
timedatectl set-local-rtc 1
read -rsn1 -p "$timezone Completed! //Press Enter" variable; echo
locale-gen en_US.UTF-8
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################





################################################################################################################
read -rsn1 -p "#Last Settings####################################################" variable; echo
mkinitcpio -p linux
read -rsn1 -p "mkinitcpio Completed! //Press Enter" variable; echo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo -n "grub-install ve grub-mkconfig "
read -rsn1 -p "//Press Enter" variable; echo
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "
echo "restart your computer, you need to do git clone again "
echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################