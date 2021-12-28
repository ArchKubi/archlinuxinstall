#!/bin/bash


################################################################################################################
timedatectl list-timezones
read -rsn1 -p "Dont Forget Time Zone"

        timeZone = $(whiptail --inputbox "Enter Time Zone" 10 30 3>&1 1>&2 2>&3)
            echo "$timeZone" >> /etc/hostname
            timedatectl set-timezone $timezone
            timedatectl set-local-rtc 0
            timedatectl set-ntp true 
            read -rsnl -p "if you see your time zone NICE! if you not report please"
            read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo
            locale-gen
################################################################################################################
