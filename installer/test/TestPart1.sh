#!/bin/bash

################################################################################################################
#                    -`
#                   .o+`                   ------------------ 
#                  `ooo/                   OS: Arch Linux x86_64 
#                 `+oooo:                  Kernel:  ZEN/Linux
#                `+oooooo:                  
#                -+oooooo+:                Shell: bash
#              `/:-:++oooo+:               
#             `/++++/+++++++:              
#            `/++++++++++++++:
#           `/+++ooooooooooooo/`           
#          ./ooosssso++osssssso+`          
#         .oossssso-````/ossssss+`
#        -osssssso.      :ssssssso.
#       :osssssss/        osssso+++.
#      /ossssssss/        +ssssooo/-
#    `/ossssso+/:-        -:/+osssso+- 
#   `+sso+:-`                 `.-/+oso:
#  `++:.                           `-/+/
#  .`                                 `/
#                                                                
#                                           
# Please do not forget this is just  beginner script yes I'am beginner to
#   if you problem please give a feedback
#
################################################################################################################

echo "if you see this ## press enter"


################################################################################################################
timedatectl set-ntp true
echo "timedatectl set-ntp true"
sleep 1

################################################################################################################



################################################################################################################
read -rsn1 -p "##### CREATING HARD DISK  #############################################" variable; echo
echo "dont forget 1:type-swap 2:boot 3:harddisk not dual boot(system) "
sleep 2
cfdisk 

mkswap /dev/sda1
echo "mkswap /dev/sda1"
sleep 2

mkfs.ext4 /dev/sda2
echo "mkfs.ext4 /dev/sda2"
sleep 2

mkfs.ext4 /dev/sda3
echo "mkfs.ext4 /dev/sda3"
sleep 2

echo -n "mkswap ve mkfs.ext4 Finish "
read -rsn1 -p "//Press Enter" variable; echo

swapon /dev/sda1
echo "SwapON /dev/sda1"
sleep 2

mount /dev/sda3 /mnt
echo "mount /dev/sda3 /mnt"
sleep 2

mkdir /mnt/boot
echo "mkdir /mnt/boot"
sleep 2

mount /dev/sda2 /mnt/boot
echo "mount /dev/sda2 /mnt/boot"
sleep 2

echo "harddisk Finish "
read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "##### EXTRA SETTINGS  #############################################" variable; echo
echo "pacstrap -i /mnt base base-devel linux linux-xanmod linux-zen nano linux-firmware"
sleep 2
pacstrap -i /mnt base base-devel linux-zen nano linux-firmware

echo "pacstrap /mnt grub"
sleep 2
pacstrap /mnt grub
echo "pacstrap finish "


echo "genfstab -p /mnt >> /mnt/etc/fstab"
sleep 2
genfstab -p /mnt >> /mnt/etc/fstab

read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######PART2 COPY FILE############################################" variable; echo
echo "First part1.sh Finish enter terminale sh TestPart2.sh //Press Enter" variable; echo


echo "copy file TestPart2.sh ----> /mnt"
echo "copy file TestPart3.sh ----> /mnt"
sleep 2
cp  TestPart2.sh    /mnt
cp  TestPart3.sh    /mnt

git clone https://gitlab.com/archkubi/myarchinstaller.git
mv myarchinstaller /mnt

echo "arch-chroot /mnt"
sleep 2
arch-chroot /mnt




read -rsn1 -p "######################FINISH : PRESS ENTER#########################" variable; echo
################################################################################################################
