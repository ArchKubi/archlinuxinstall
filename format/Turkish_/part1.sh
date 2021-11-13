#!/bin/bash




#################################################################
timedatectl set-ntp true
echo "timedatectl "
#################################################################



################################################################################################################
read -rsn1 -p "##### HARDDİSK OLUŞTUR #############################################" variable; echo
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
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "##### EKSTRA AYARLAR #############################################" variable; echo
pacstrap -i /mnt base base-devel linux linux-zen nano linux-firmware
pacstrap /mnt grub os-prober
echo -n "pacstrap finish "
read -rsn1 -p "//Press Enter" variable; echo
genfstab -p /mnt >> /mnt/etc/fstab
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######PART2 COPY FİLE############################################" variable; echo
cp part2.sh /mnt
arch-chroot /mnt
echo"öncelik part1.sh bitti terminale sh part2.sh yaz //Press Enter" variable; echo
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################