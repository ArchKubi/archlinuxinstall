#!/bin/bash

#example "2021-11-10 14:14:00"
timedatectl set-time "2021-11-16 18:28:00"
sudo su
timedatectl set-local-rtc 0
hwclock --systohc --utc
exit

