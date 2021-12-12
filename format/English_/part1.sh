#!/bin/bash

################################################################################################################
#                    -`
#                   .o+`                   ------------------ 
#                  `ooo/                   OS: Arch Linux x86_64 
#                 `+oooo:                  Kernel: 5.15.5-zen1-1-zen 
#                `+oooooo:                 Packages: 1250 (pacman) 
#                -+oooooo+:                Shell: bash 5.1.12 
#              `/:-:++oooo+:               DE: qtile 
#             `/++++/+++++++:              WM: LG3D 
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


################################################################################################################
timedatectl set-ntp true
echo "timedatectl "
################################################################################################################



################################################################################################################
read -rsn1 -p "##### CREATING HARD DISK  #############################################" variable; echo
echo "dont forget 1:swap 2:boot 3:harddisk(system) "
cfdisk 

mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

echo -n "mkswap ve mkfs.ext4 Finish "
read -rsn1 -p "//Press Enter" variable; echo

swapon /dev/sda1
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

echo -n "harddisk Finish "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "##### EXTRA SETTINGS  #############################################" variable; echo
pacstrap -i /mnt base base-devel linux linux-zen nano linux-firmware
pacstrap /mnt grub os-prober

echo -n "pacstrap finish "
read -rsn1 -p "//Press Enter" variable; echo

genfstab -p /mnt >> /mnt/etc/fstab
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######PART2 COPY FİLE############################################" variable; echo

cp  part2.sh    /mnt
arch-chroot /mnt

echo"First part1.sh Finish enter terminale sh part2.sh //Press Enter" variable; echo
read -rsn1 -p "######################Finish:/Press-Enter#########################" variable; echo
################################################################################################################