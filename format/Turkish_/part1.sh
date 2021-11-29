#!/bin/bash

#################################################################
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
# bu bir başlangıç yazılımıdır bende başlangıç seviyesi bir kullanıcıyım
#   eğer bir sorun olur ise geri dönüş yapmayı unutma
# türklerden bunu kullanan olur mu sanmam ama neyse
#################################################################


#################################################################
timedatectl set-ntp true
echo "timedatectl "
#################################################################



################################################################################################################
read -rsn1 -p "##### HARDDISK OLUSTUR #############################################" variable; echo
echo "dont forget 1:swap 2:boot 3:harddisk(system) "
cfdisk 
mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
echo -n "mkswap ve mkfs.ext4 bitti "
read -rsn1 -p "//Press Enter" variable; echo
swapon /dev/sda1
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
echo -n "harddisk bitti "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "##### EKSTRA AYARLAR #############################################" variable; echo
pacstrap -i /mnt base base-devel linux linux-zen nano linux-firmware
pacstrap /mnt grub os-prober
echo -n "pacstrap finish "
read -rsn1 -p "//Press Enter" variable; echo
genfstab -p /mnt >> /mnt/etc/fstab
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######PART2 COPY FILE############################################" variable; echo
cp part2.sh /mnt
arch-chroot /mnt
echo"öncelik part1.sh bitti terminale sh part2.sh yaz //Press Enter" variable; echo
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################