#!/bin/bash 
function advancedMenu() {
    ADVSEL=$(whiptail --title "Advanced Menu" --fb --menu "Choose an option" 15 60 4 \
        "1" "Turkish" \
        "2" "English" \
        "3" "Don't select This" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            whiptail --title "Option 1" --msgbox "You chose option 1. Exit status $?" 8 45
        ;;
        2)
            whiptail --title "Option 2" --msgbox "You chose option 2. Exit status $?" 8 45
        ;;
        3)
            whiptail --title "Don't select This" --msgbox " #1 Option 1 | #2 Option 2 | #3 Don't select This 
            3>&1 1>&2 2>&3 is this joke ?" 8 78
        ;;
    esac
}
advancedMenu