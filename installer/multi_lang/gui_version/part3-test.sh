#!/bin/bash

if (whiptail --title "this is part3" --yesno "this is how you use your arch Linux and thats it dont forget feedback" 8 78)
    then

userName = $(whiptail --inputbox "Enter your UserName" 10 30 3>&1 1>&2 2>&3)
            echo "$userName" >> /etc/hostname
            useradd -m -G wheel -s /bin/bash $userName
            passwd $userName


echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
read -rsn1 -p "do not forget it //Press Enter" variable; echo
sleep 3

nano /etc/sudoers
read -rsn1 -p "SUDO User creation Done!     //Press Enter" variable; echo

##################################################################
whiptail \
    --title "computer Sound" \
    --msgbox "this is alsa and pulseaudio" 8 78

echo "pacman -S alsa alsa-utils alsa-plugins"
sleep 3
pacman -S alsa alsa-utils alsa-plugins

read -rsn1 -p "alsa Completed!    //Press Enter" variable; echo

echo "pacman -S pulseaudio pavucontrol"
sleep 3
pacman -S pulseaudio pavucontrol
echo "pulseaudio Completed!   " variable; echo
##################################################################
whiptail \
    --title "computer Xorg" \
    --msgbox "this is Xorg BRUH" 8 78
echo "pacman -S xorg xorg-server xorg-xinit xorg-apps"
sleep 3
pacman -S xorg xorg-server xorg-xinit xorg-apps
##################################################################
whiptail \
    --title "computer Lighthdm" \
    --msgbox "there is only LightDM" 8 78
echo "sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter"
sleep 3
sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter

echo "systemctl enable lightdm.service"
sleep 3
systemctl enable lightdm.service

echo "LightDM Completed!    "
##################################################################
whiptail \
    --title "computer xterm" \
    --msgbox "there is only xterm" 8 78
echo "pacman -S xterm"
sleep 3
pacman -S xterm

##################################################################
#!/bin/bash 
function advancedMenu() {
    ADVSEL=$(whiptail --title "Advanced Menu" --fb --menu "Choose an option" 20 60 8  \
        "1" "Qtile" \
        "2" "Plasma" \
        "3" "Xfce"\
        "4" "Gnome"\
        "5" "Cinnamon"\
        "6" "Mate"\
        "7" "Budgie" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            whiptail --title "qtile" --msgbox "You chose option qtile" 8 45
            sudo pacman -S qtile
        ;;
        2)
            whiptail --title "Plasma" --msgbox "You chose option Plasma" 8 45
            sudo pacman -S plasma kdeplasma-addons
        ;;
        3)
            whiptail --title "Xfce" --msgbox "You chose option  Xfce" 8 78
            sudo pacman -S xfce4 xfce4-goodies
        ;;

        4)
             whiptail --title "Gnome" --msgbox "You chose option Gnome" 8 45
             sudo pacman -S gnome gnome-extra       
        ;;

        5)
            whiptail --title "Cinnamon" --msgbox "You chose option Cinnamon" 8 45
            sudo pacman -S cinnamon nemo-fileroller
        ;;

        6)
            whiptail --title "Mate" --msgbox "You chose option Mate" 8 45
            sudo pacman -S mate mate-extra
        ;;

        7)
            whiptail --title "Budgie" --msgbox "You chose option Budgie" 8 45
            sudo pacman -S budgie-desktop
        ;;

    esac
}
advancedMenu

whiptail \
    --title "computer restart now bye" \
    --msgbox "this is the end bye bro thanks for using my installer ;)" 8 78
reboot


    else
        echo "Fu.. YOU!"
fi

