#!/bin/bash
echo "if you see this ## press enter"


################################################################################################################
read -rsn1 -p "###### NETWORK MANAGER #############################################" variable; echo

echo "pacman -S networkmanager"
sleep 3
pacman -S networkmanager

echo "systemctl enable NetworkManager.service"
sleep 3
systemctl enable NetworkManager.service

echo "enabled network manager  "
read -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### COMPUTER NAME ##############################################" variable; echo
echo "this is your computer name "

read -p 'Enter Computer Name : ' computer_name
echo "$computer_name" >> /etc/hostname

read -rsn1 -p "$computer_name nice name bro  //Press Enter" variable; echo
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "###### Root Password ##############################################" variable; echo
read -rsn1 -p "You type root password, when login you will enter root and password, of course you know that .//Press Enter" variable; echo
echo "passwd root"
sleep 3
passwd root
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
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

echo "locale-gen"
sleep 3
locale-gen


read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################










################################################################################################################
read -rsn1 -p "# Last Settings ####################################################" variable; echo
mkinitcpio -p linux-zen
echo "mkinitcpio -p linux"
sleep 3

read -rsn1 -p "mkinitcpio Completed! //Press Enter" variable; echo
grub-install --recheck /dev/sda
echo "grub-install --recheck /dev/sda"
sleep 3

grub-mkconfig -o /boot/grub/grub.cfg
echo "grub-mkconfig -o /boot/grub/grub.cfg"
sleep 3


echo -n "grub-install and grub-mkconfig finish"
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "



echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################