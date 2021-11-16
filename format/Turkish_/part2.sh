#!/bin/bash



################################################################################################################
read -rsn1 -p "######AĞ YÖNETICISI#############################################" variable; echo
pacman -S networkmanager
systemctl enable NetworkManager.service
echo -n "ağ yöneticisini etkinlesti "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######BILGISAYAR ADI##############################################" variable; echo
echo "bu senin bilgisayar adin"
read -p 'Bilgisayar Adini Girin: ' computer_name
echo "$computer_name" >> /etc/hostname
read -rsn1 -p "$computer_name guzel isim karsim //Press Enter" variable; echo
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################



################################################################################################################
read -rsn1 -p "######KÖK/Yetkili SIFRESI##############################################" variable; echo
read -rsn1 -p "Root sifresini yaziyorsunuz, giris yaparken root ve sifreyi gireceksiniz, elbette bunu biliyorsunuz.//Press Enter" variable; echo
passwd root
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################


################################################################################################################
read -rsn1 -p "######SISTEM DILI############################################" variable; echo
read -rsn1 -p "unutma part2.sh : ingilizce dili = en_US.UTF-8 //Press Enter" variable; echo
echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf 
echo "Diliniz Tamam! //Press Enter" variable; echo
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "######YEREL ZAMAN#################################################" variable; echo
read -rsn1 -p "Turkiye Zaman Dilimi  //Press Enter" variable; echo
timedatectl set-timezone Europe/Istanbul
read -rsn1 -p "$timezone tamamlandi! //Press Enter" variable; echo
locale-gen en_US.UTF-8
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################




################################################################################################################
read -rsn1 -p "#SON AYARLAR####################################################" variable; echo
mkinitcpio -p linux
read -rsn1 -p "mkinitcpio tamamlandi! //Press Enter" variable; echo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo -n "grub-install ve grub-mkconfig "
read -rsn1 -p "//Press Enter" variable; echo
echo "önce bu komutu girin 1: exit 2: umount /mnt/boot and umount /mnt"
echo "bilgisayarinizi yeniden baslatin, tekrar git klonuna yapman gerek"
echo "Arch Linux yuklemesi tamamlandi, ancak bir sonraki yazilima ihtiyaciniz var kardesim sirada part3.sh var"
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################