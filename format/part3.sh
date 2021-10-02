#!/bin/bash




################################################################################################################
read -rsn1 -p "##### CREATE USER AND GİVE SUDO POWERRRRRRR#########################" variable; echo
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
passwd $userName

read -rsn1 -p "dont forget this //Press Enter" variable; echo
echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
read -rsn1 -p "dont forget this //Press Enter" variable; echo

nano /etc/sudoers
read -rsn1 -p "create user OK! //Press Enter" variable; echo
################################################################################################################
read -rsn1 -p "#########SOUND DRİVER############################################" variable; echo
pacman -S alsa alsa-utils alsa-plugins
read -rsn1 -p "alsa ok! //Press Enter" variable; echo

pacman -S pulseaudio pavucontrol
echo "pulseaudio ok!" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "##########GRAPHİC DRIVER#########################################" variable; echo
pacman -S xorg-server xorg-apps xorg-xinit
echo "xorg ok!"
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "#####LOGİN_SCREEN################################################" variable; echo
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-webkit2-greeter wget 
systemctl enable lightdm.service

mkdir glorious
mv theme.tar.gz glorious/
cd glorious
tar zxvf theme.tar.gz
rm theme.tar.gz
cd ..
mv glorious/ /usr/share/lightdm-webkit/themes/

read -rsn1 -p "Enable debug mode for any failure, just right click to log out: debug_mode = true" variable; echo
read -rsn1 -p "Change the name antergos to glorious: webkit_theme = glorious" variable; echo
nano /etc/lightdm/lightdm-webkit2-greeter.conf


read -rsn1 -p "#greeter-session=  --> greeter-session=lightdm-webkit2-greeter" variable; echo
nano  /etc/lightdm/lightdm.conf

echo "LightDM ok!"
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "#######::TERMİNAL::##############################################" variable; echo
pacman -S xterm
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "########Gui selection############################################" variable; echo
echo "please dont forget quit"
PS3='Please enter your choice: '
options=("Mate" "Cinnamon" "Gnome" "Xfce" "Plasma" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Mate")
        echo "you chose Mate"
            sudo pacman -S mate mate-extra
            ;;


        "Cinnamon")
        echo "you chose Cinnamon"
            sudo pacman -S cinnamon nemo-fileroller
            ;;

        "Gnome")
        echo "you chose Gnome"
            sudo pacman -S gnome gnome-extra
            ;;


        "Xfce")
        echo "you chose Xfce"
            sudo pacman -S xfce4 xfce4-goodies
            ;;


        "Plasma")
        echo "you chose Plasma"
            sudo pacman -S plasma kdeplasma-addons
            ;;


        "Qtile")
        echo "you chose Qtile"
            sudo pacman -S qtile
            ;;
        "Quit")
            break
            ;;
    esac
done
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "##########END BOOT###############################################" variable; echo
echo -n "computer reboot now bye  "
read -rsn1 -p "dont forget this //Press Enter" variable; echo
cp -r desktop_manager/qtile ~/.config
reboot
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################


