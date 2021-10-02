#!/bin/bash


timedatectl set-time "yyyy-MM-dd hh:mm:ss"
sudo su
timedatectl set-local-rtc 0
hwclock --systohc --utc
exit

