#!/bin/bash



#### Main Start Code
whiptail \
    --title "this is part2" \
    --msgbox "dont forget. this part there is 1 sda if you use gnome boxes change it" 8 78



if (whiptail --title "part2 starting" --yesno "Are you ready?" 8 78)
    then
        pacman -S networkmanager
            echo "pacman -S networkmanager"
        systemctl enable NetworkManager.service
            echo "systemctl enable NetworkManager.service"
        echo -n "enabled network manager  "
        read -rsn1 -p "Harddisk Finish "

        computer_name = $(whiptail --inputbox "Enter your name" 10 30 3>&1 1>&2 2>&3)
            echo "$computer_name" >> /etc/hostname
            echo "Computer Name OK!"
            read -rsn1 -p "$computer_name nice name bro  //Press Enter" variable; echo
        rootPass = $(whiptail --inputbox "Enter Root Password" 10 30 3>&1 1>&2 2>&3)
            echo "$rootPass" >> /etc/hostname

    whiptail \
        --title "Let's Choose" \
        --msgbox "Select Your Language" 8 78

##System Language
function advancedMenu() {
    ADVSEL=$(whiptail --title "System Language" --fb --menu "Please enter your System Language" 15 60 4 \
        "1" "Turkish" \
        "2" "English" \
        "3" "Don't Select This" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            whiptail --title "Turkish" --msgbox "You chose option Turkish Exit status $?" 8 45
                echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
                echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
                echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
        ;;
        2)
            whiptail --title "English" --msgbox "You chose option English Exit status $?" 8 45
                echo "LC_ALL=en_US.UTF-8" >> /etc/environment
                echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
                echo "LANG=en_US.UTF-8" > /etc/locale.conf
        ;;
        3)
            whiptail --title "Option 1" --msgbox "BRUH 3>&1 1>&2 2>&3 $?" 8 45
        ;;
    esac
}
advancedMenu        


#System Keynoard Language
function advancedMenu() {
    ADVSEL=$(whiptail --title "Keynoard Language" --fb --menu "Please enter your Keynoard Language" 15 60 4 \
        "1" "Turkish" \
        "2" "English" \
        "3" "Don't Select This" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            whiptail --title "Turkish" --msgbox "You chose option Turkish Exit status $?" 8 45
                echo KEYMAP=trq >> /etc/vconsole.conf 
        ;;
        2)
            whiptail --title "English" --msgbox "You chose option English Exit status $?" 8 45
                echo KEYMAP=us >> /etc/vconsole.conf 
        ;;
        3)
            whiptail --title "Option 1" --msgbox "BRUH 3>&1 1>&2 2>&3 $?" 8 45
        ;;
    esac
}
advancedMenu   
echo "Your language is OK!  //Press Enter" variable; echo



timedatectl list-timezones
read -rsn1 -p "Dont Forget Time Zone"

        timeZone = $(whiptail --inputbox "Enter Time Zone" 10 30 3>&1 1>&2 2>&3)
            echo "$timeZone" >> /etc/hostname
            timedatectl set-timezone $timezone
            timedatectl set-local-rtc 1
            timedatectl status
            read -rsnl -p "if you see your time zone NICE! if you not report please"
            read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo
            locale-gen



    else
        echo "Come ON BRUH!"
fi