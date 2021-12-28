#!/bin/bash



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




read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################
