#!/bin/bash




################################################################################################################
read -rsn1 -p "##### KULLANICI OLUSTUR VE SUDO GUCU VER#########################" variable; echo
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
passwd $userName

read -rsn1 -p "bunu unutma //Press Enter" variable; echo
echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
read -rsn1 -p "kullanici olustur Tamamlandi!   //Press Enter" variable; echo

nano /etc/sudoers
read -rsn1 -p "Kullanici olustur Tamamlandi!     //Press Enter" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######### SES SuRuCuSu ############################################" variable; echo
pacman -S alsa alsa-utils alsa-plugins
read -rsn1 -p "alsa Tamamlandi!    //Press Enter" variable; echo

pacman -S pulseaudio pavucontrol
echo "pulseaudio Tamamlandi!    " variable; echo
read -rsn1 -p "######################Bitir:/Enter-Basin#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "########## GRAFIK SuRuCuSu #########################################" variable; echo
pacman -S xorg xorg-server xorg-xinit xorg-apps
echo "xorg Tamamlandi!    "
read -rsn1 -p "######################Bitir:/Enter-Basin#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "##### GIRIS EKRANI ################################################" variable; echo
sudo pacman -S lightdm lightdm-webkit2-greeter wget lightdm-gtk-greeter
systemctl enable lightdm.service
read -rsn1 -p "######################Bitir:/Enter-Basin#########################" variable; echo

echo "LightDM Tamamlandi!    "
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
pacman -S xterm
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######## Gui selection ############################################" variable; echo
PS3='Lutfen seçiminizi girin: '


options=("Mate" "Cinnamon" "Gnome" "Xfce" "Plasma" "Budgie" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Mate")
        echo "Seçtiğin Ortam Mate"
            sudo pacman -S mate mate-extra
            break
            ;;

        "Cinnamon")
        echo "Seçtiğin Ortam Cinnamon"
            sudo pacman -S cinnamon nemo-fileroller
            break
            ;;

        "Gnome")
        echo "Seçtiğin Ortam Gnome"
            sudo pacman -S gnome gnome-extra
            break
            ;;


        "Xfce")
        echo "Seçtiğin Ortam Xfce"
            sudo pacman -S xfce4 xfce4-goodies
            break
            ;;


        "Plasma")
        echo "Seçtiğin Ortam Plasma"
            sudo pacman -S plasma kdeplasma-addons
            break
            ;;

        "Budgie")
        echo "Seçtiğin Ortam Budgie"
            sudo pacman -S budgie-desktop
            break
            ;;

        "Qtile")
        echo "Seçtiğin Ortam Qtile"
            sudo pacman -S qtile
            break
            ;;

            

        "Quit")
            break
            ;;
    esac
done
read -rsn1 -p "######################Bitir:/Enter-Basin#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "########## END BOOT ###############################################" variable; echo
echo -n "bilgisayar simdi yeniden baslat hosçakal  "
read -rsn1 -p "bunu unutma //Press Enter" variable; echo
reboot
read -rsn1 -p "######################Bitir:/Enter-Basin#########################" variable; echo
################################################################################################################


