#!/bin/bash


PS3='Please enter your System Language : '
options=("Turkish" "English" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("Turkish")
        echo "Your Chosen Turkish"
            touch test
            echo KEYMAP=trq >> test
            break
            ;;

        ("English")
        echo "Your Chosen English/American"
            touch test2
            echo KEYMAP=us >> test

        ("Quit")
            break
            ;;
    esac
done