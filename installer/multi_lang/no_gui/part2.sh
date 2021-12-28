#!/bin/bash



################################################################################################################
read -rsn1 -p "###### NETWORK MANAGER #############################################" variable; echo

echo "pacman -S networkmanager"
sleep 3
pacman -S networkmanager

echo "systemctl enable NetworkManager.service"
sleep 3
systemctl enable NetworkManager.service

echo -n "enabled network manager  "
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### COMPUTER NAME ##############################################" variable; echo
echo "this is your computer name "

read -p 'Enter Computer Name : ' computer_name
echo "$computer_name" >> /etc/hostname

read -rsn1 -p "$computer_name nice name bro  //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### Root Password ##############################################" variable; echo
read -rsn1 -p "You type root password, when login you will enter root and password, of course you know that .//Press Enter" variable; echo
echo "passwd root"
sleep 3
passwd root
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### SYSTEM LANGUAGE ############################################" variable; echo
#---------------------------------------------------------------#
read -rsn1 -p "if you speak another language dont forget edit this --> part2.sh : English Language = en_US.UTF-8 //Press Enter" variable; echo

PS3='Please enter your System Language : '
options=("Turkish" "English")
select opt in "${options[@]}"
do
    case $opt in
        ("Turkish")
        echo "Your Chosen Turkish"
            echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
            echo "LC_ALL=tr_TR.UTF-8 >> /etc/environment"
            echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
            echo "tr_TR.UTF-8 UTF-8 >> /etc/locale.gen"
            echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
            echo "LANG=tr_TR.UTF-8 > /etc/locale.conf"
            sleep 3
            break
            ;;

        ("English")
        echo "Your Chosen English/American"
            echo "LC_ALL=en_US.UTF-8" >> /etc/environment
            echo "LC_ALL=en_US.UTF-8 >> /etc/environment"
            echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
            echo "en_US.UTF-8 UTF-8 >> /etc/locale.gen"
            echo "LANG=en_US.UTF-8" > /etc/locale.conf
            echo "LANG=en_US.UTF-8 > /etc/locale.conf"
            sleep 3
            break
            ;;
    esac
done

#---------------------------------------------------------------#
PS3='Please enter your Keyboard Language : '


options=("Turkish" "English")
select opt in "${options[@]}"
do
    case $opt in
        "Turkish")
        echo "Your Chosen Turkish"
           echo KEYMAP=trq >> /etc/vconsole.conf
           echo "KEYMAP=trq >> /etc/vconsole.conf"
           sleep 3
            break
            ;;

        "English")
        echo "Your Chosen English/American"
          echo KEYMAP=us >> /etc/vconsole.conf
          echo "KEYMAP=us >> /etc/vconsole.conf"
          sleep 3
            break
            ;;
    esac
done




read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### LOCAL TIME #################################################" variable; echo
read -rsn1 -p "Select Time Zone  Europe/Istanbul My zone //Press Enter" variable; echo

echo "timedatectl list-timezones"
sleep 3
timedatectl list-timezones

read -rsn1 -p "Dont Forget Time Zone :----> "
read -p 'Enter Time Zone Name : ' timezone

echo "timedatectl set-timezone $timezone"
sleep 3
timedatectl set-timezone $timezone


echo "timedatectl set-local-rtc 1"
sleep 3
timedatectl set-local-rtc 0
echo "timedatectl set-ntp true"
sleep 3
timedatectl set-ntp true 


echo "timedatectl status"
sleep 3
timedatectl status


read -rsnl -p "if you see your time zone NICE! if you not report please"
read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo

echo "locale-gen"
sleep 3
locale-gen


read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################





################################################################################################################
read -rsn1 -p "# Last Settings ####################################################" variable; echo
mkinitcpio -p linux
echo "mkinitcpio -p linux"
sleep 3

read -rsn1 -p "mkinitcpio Completed! //Press Enter" variable; echo
grub-install --recheck /dev/sda
echo "grub-install --recheck /dev/sda"
sleep 3

grub-mkconfig -o /boot/grub/grub.cfg
echo "grub-mkconfig -o /boot/grub/grub.cfg"
sleep 3


echo -n "grub-install ve grub-mkconfig "
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "
echo "restart your computer, you need to do git clone again sorry"
echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################