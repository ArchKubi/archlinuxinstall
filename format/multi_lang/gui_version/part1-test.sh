#!/bin/bash



#### Main Start Code
whiptail \
    --title "welcome to MyArchLinux Installer" \
    --msgbox "BTW I Use ArchLinux" 8 78


#### Question Code

if (whiptail --title "Humble Title" --yesno "don't forget I'm not pro if you found problem please feedback thanks are you ready easy install" 8 78)
    then

    ## Warning
    whiptail \
    --title "Warning!" \
    --msgbox "if you use boxes dont forget edit this sda default vda is boxes" 8 78
    ## Warning
    whiptail \
    --title "Warning!" \
    --msgbox "1:/dev/sda1 Swap 2:/dev/sda2 boot 3:/dev/sda3 harddisk there no dualboot don't forget
    and don't forget 1:2:3 or edit this script" 8 78

    ##Harddisk
        mkswap /dev/sda1
            echo "mkswap /dev/sda1"
        mkfs.ext4 /dev/sda2
            echo "mkfs.ext4 /dev/sda2"
        mkfs.ext4 /dev/sda3
            echo "mkfs.ext4 /dev/sda3"

    echo -n "mkswap ve mkfs.ext4 Finish "

        swapon /dev/sda1
            echo "SwapON /dev/sda1"
        mount /dev/sda3 /mnt
            echo "mount /dev/sda3 /mnt"
        mkdir /mnt/boot
            echo "mkdir /mnt/boot"
        mount /dev/sda2 /mnt/boot
            echo "mount /dev/sda2 /mnt/boot"
    read -rsn1 -p "Harddisk Finish "


    ## EXTRA SETTINGS
    whiptail \
    --title "Harddisk Finish" \
    --msgbox "Next EXTRA SETTINGS" 8 78
    
        pacstrap -i /mnt base base-devel linux linux-zen nano linux-firmware
        echo "pacstrap -i /mnt base base-devel linux linux-zen nano linux-firmware"
        pacstrap /mnt grub
        echo "pacstrap /mnt grub"
    read -rsn1 -p "pacstrap finish "

        genfstab -p /mnt >> /mnt/etc/fstab
            echo "genfstab -p /mnt >> /mnt/etc/fstab"

    --title "first part1 is finish" \
    --msgbox " don't forget enter sh part2.sh" 8 78
        cp  part2.sh    /mnt
            echo "copy file part2.sh ----> /mnt"
        arch-chroot /mnt

    else
        echo "too bad f.. loser"
fi

