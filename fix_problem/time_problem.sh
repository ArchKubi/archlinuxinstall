#!/bin/bash

#example "2021-10-05 22:55:00"
timedatectl set-time "yyyy-MM-dd hh:mm:ss"
sudo su
timedatectl set-local-rtc 0
hwclock --systohc --utc
exit

