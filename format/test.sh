#!/bin/bash



echo "select one and quit"
PS3='Please enter your choice: '
options=("Mate" "Cinnamon" "Quit")
select opt1 in "${options[@]}"
do
    case $opt1 in
        "Mate")
        echo "you chose Mate"
            sudo pacman -S xfce4-terminal
            ;;


        "Cinnamon")
        echo "you chose Cinnamon"
            sudo pacman -S konsole
            ;;

        "Quit")
            break
            ;;
    esac
done




