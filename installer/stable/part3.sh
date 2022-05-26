#!/bin/bash
echo "if you see this ## press enter"


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


read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "##### CREATE USER AND GIVE SUDO POWER #########################" variable; echo
read -ranl -p "don't use capital letter"
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
echo "if this is not start use this passwd username <-- your user name"
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
read -rsn1 -p "SUDO User creation Done!     FINISH : PRESS ENTER" variable; echo
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
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "########## GRAPHIC DRIVE #########################################" variable; echo
echo "pacman -S xorg xorg-server xorg-xinit xorg-apps"
sleep 3



PS3='Please enter your selection : '


options=("AMD" "nvidia" "ATI" "intel" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("AMD")
        echo "Your Chosen AMD"
            echo "xorg xorg-server xorg-xinit xorg-apps mesa"
            sleep 3
            sudo pacman -S xorg xorg-server xorg-xinit xorg-apps mesa
            break
            ;;

        ("nvidia")
        echo "Your Chosen nvidia"
            echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils"
            sleep 3
            sudo pacman -S xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils
            break
            ;;

        ("ATI")
        echo "Your Chosen ATI"
            echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-ati"
            sleep 3
            sudo pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-ati
            break
            ;;


        ("intel")
        echo "Your Chosen  intel"
            echo "pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-intel"
            sleep 3
            pacman -S xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-intel
            break
            ;;

        ("Quit")
            break
            ;;
    esac
done




echo "xorg Completed!   "
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
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
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
echo "pacman -S xterm"
sleep 3
pacman -S xterm
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######## Gui selection ############################################" variable; echo
echo "Next!"
PS3='Please enter your selection : '


options=("Xfce" "Openbox" "i3" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("Xfce")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S xfce4 xfce4-goodies"
            sleep 3
            sudo pacman -S xfce4 xfce4-goodies
            break
            ;;

        ("Openbox")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S xfce4 xfce4-goodies"
            sleep 3
            sudo pacman -S openbox obconf menumaker 
            break
            ;;

        ("i3")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S i3 i3-gaps i3status i3lock"
            sleep 3
            sudo pacman -S i3 i3status
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
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "########## END BOOT ###############################################" variable; echo
echo "computer restart now bye  "
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
reboot
################################################################################################################


