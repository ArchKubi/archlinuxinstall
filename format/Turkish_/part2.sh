#!/bin/bash



################################################################################################################
read -rsn1 -p "######AĞ YÖNETİCİSİ#############################################" variable; echo
pacman -S networkmanager
systemctl enable NetworkManager.service
echo -n "ağ yöneticisini etkinleşti "
read -rsn1 -p "//Press Enter" variable; echo
read -rsn1 -p "######################Bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######BİLGİSAYAR ADI##############################################" variable; echo
echo "bu senin bilgisayar adın"
read -p 'Bilgisayar Adını Girin: ' computer_name
echo "$computer_name" >> /etc/hostname
read -rsn1 -p "$computer_name üzel isim kardeşim //Press Enter" variable; echo
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######KÖK/Yetkili ŞİFRESİ##############################################" variable; echo
read -rsn1 -p "Root şifresini yazıyorsunuz, giriş yaparken root ve şifreyi gireceksiniz, elbette bunu biliyorsunuz.//Press Enter" variable; echo
passwd root
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######SİSTEM DİLİ############################################" variable; echo
#---------------------------------------------------------------#
read -rsn1 -p "unutma part2.sh : ingilizce dili = en_US.UTF-8 //Press Enter" variable; echo
echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
echo KEYMAP=trq >> /etc/vconsole.conf 
echo "Diliniz Tamam! //Press Enter" variable; echo
read -rsn1 -p "######################tamamlandı:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "######YEREL ZAMAN#################################################" variable; echo
read -rsn1 -p "if you not live in turkey edit this file  //Press Enter" variable; echo
timedatectl set-timezone Europe/Istanbul
read -rsn1 -p "$timezone tamamlandı! //Press Enter" variable; echo
locale-gen en_US.UTF-8
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################
read -rsn1 -p "#SON AYARLAR####################################################" variable; echo
mkinitcpio -p linux
read -rsn1 -p "mkinitcpio tamamlandı! //Press Enter" variable; echo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
echo -n "grub-install ve grub-mkconfig "
read -rsn1 -p "//Press Enter" variable; echo
echo "önce bu komutu girin 1: exit 2: umount /mnt/boot and umount /mnt"
echo "bilgisayarınızı yeniden başlatın, tekrar git klonuna yapman gerek"
echo "Arch Linux yüklemesi tamamlandı, ancak bir sonraki yazılıma ihtiyacınız var kardeşim sırada part3.sh var"
read -rsn1 -p "######################bitti:/Press-Enter#########################" variable; echo
################################################################################################################