#!/bin/bash




################################################################################################################
read -rsn1 -p "##### CREATE USER AND GIVE SUDO POWER #########################" variable; echo
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
passwd $userName

read -rsn1 -p "do not forget it //Press Enter" variable; echo
echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
read -rsn1 -p "User creation Done!    //Press Enter" variable; echo

nano /etc/sudoers
read -rsn1 -p "SUDO User creation Done!     //Press Enter" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######### AUDIO DRIVER ############################################" variable; echo
pacman -S alsa alsa-utils alsa-plugins
read -rsn1 -p "alsa Completed!    //Press Enter" variable; echo

pacman -S pulseaudio pavucontrol
echo "pulseaudio Completed!   " variable; echo
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "########## GRAPHIC DRIVE #########################################" variable; echo
pacman -S xorg xorg-server xorg-xinit xorg-apps
echo "xorg Completed!   "
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "##### Display Manager ################################################" variable; echo
sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter
systemctl enable lightdm.service
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo

echo "LightDM Completed!    "
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
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
        "Mate")
        echo "Your Chosen Environment  Mate"
            sudo pacman -S mate mate-extra
            break
            ;;

        "Cinnamon")
        echo "Your Chosen Environment  Cinnamon"
            sudo pacman -S cinnamon nemo-fileroller
            break
            ;;

        "Gnome")
        echo "Your Chosen Environment  Gnome"
            sudo pacman -S gnome gnome-extra
            break
            ;;


        "Xfce")
        echo "Your Chosen Environment Xfce"
            sudo pacman -S xfce4 xfce4-goodies
            break
            ;;


        "Plasma")
        echo "Your Chosen Environment  Plasma"
            sudo pacman -S plasma kdeplasma-addons
            break
            ;;

        "Budgie")
        echo "Your Chosen Environment  Budgie"
            sudo pacman -S budgie-desktop
            break
            ;;

        "Qtile")
        echo "Your Chosen Environment  Qtile"
            sudo pacman -S qtile
            break
            ;;

            

        "Quit")
            break
            ;;
    esac
done
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "########## END BOOT ###############################################" variable; echo
echo -n "computer restart now bye  "
read -rsn1 -p "//Press Enter" variable; echo
reboot
read -rsn1 -p "######################Finish:/Press Enter#########################" variable; echo
################################################################################################################


