sudo pacman -S --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
sudo cp lightdm.conf  /etc/lightdm/
sudo cp lightdm-webkit2-greeter.conf /etc/lightdm/
sudo cp -r img/ /usr/share/lightdm-webkit/themes/litarvan/
