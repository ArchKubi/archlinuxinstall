#!/bin/bash


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
read -rsn1 -p "##### CREATE USER AND GIVE SUDO POWER #########################" variable; echo
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
passwd $userName


echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
sleep 5
read -rsn1 -p "do not forget it //Press Enter" variable; echo

echo "nano /etc/sudoers"
sleep3
nano /etc/sudoers
read -rsn1 -p "SUDO User creation Done!     //Press Enter" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######### AUDIO DRIVER ############################################" variable; echo
echo "pacman -S alsa alsa-utils alsa-plugins"
sleep 3
pacman -S alsa alsa-utils alsa-plugins

read -rsn1 -p "alsa Completed!    //Press Enter" variable; echo

echo "pacman -S pulseaudio pavucontrol"
sleep 3
pacman -S pulseaudio pavucontrol
echo "pulseaudio Completed!   " variable; echo
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "########## GRAPHIC DRIVE #########################################" variable; echo
echo "pacman -S xorg xorg-server xorg-xinit xorg-apps"
sleep 3
pacman -S xorg xorg-server xorg-xinit xorg-apps

echo "xorg Completed!   "
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "##### Display Manager ################################################" variable; echo
echo "sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter"
sleep 3
sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter

echo "systemctl enable lightdm.service"
sleep 3
systemctl enable lightdm.service

echo "LightDM Completed!    "
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
echo "pacman -S xterm"
sleep 3
pacman -S xterm
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######## Gui selection ############################################" variable; echo
echo "Next!"
PS3='Please enter your selection : '


options=("Mate" "Cinnamon" "Gnome" "Xfce" "Plasma" "Budgie" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("Mate")
        echo "Your Chosen Environment  Mate"
            echo "sudo pacman -S mate mate-extra"
            sleep 3
            sudo pacman -S mate mate-extra
            break
            ;;

        ("Cinnamon")
        echo "Your Chosen Environment  Cinnamon"
            echo "sudo pacman -S cinnamon nemo-fileroller"
            sleep 3
            sudo pacman -S cinnamon nemo-fileroller
            break
            ;;

        ("Gnome")
        echo "Your Chosen Environment  Gnome"
            echo "sudo pacman -S gnome gnome-extra"
            sleep 3
            sudo pacman -S gnome gnome-extra
            break
            ;;


        ("Xfce")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S xfce4 xfce4-goodies"
            sleep 3
            sudo pacman -S xfce4 xfce4-goodies
            break
            ;;


        ("Plasma")
        echo "Your Chosen Environment  Plasma"
            echo "sudo pacman -S plasma kdeplasma-addons"
            sleep 3
            sudo pacman -S plasma kdeplasma-addons
            break
            ;;

        ("Budgie")
        echo "Your Chosen Environment  Budgie"
            echo "sudo pacman -S budgie-desktop"
            sleep 3
            sudo pacman -S budgie-desktop
            break
            ;;

        ("Qtile")
        echo "Your Chosen Environment  Qtile"
            echo "sudo pacman -S qtile"
            sleep 3
            sudo pacman -S qtile
            break
            ;;

            

        ("Quit")
            break
            ;;
    esac
done
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "########## END BOOT ###############################################" variable; echo
echo "computer restart now bye  "
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
reboot
################################################################################################################


