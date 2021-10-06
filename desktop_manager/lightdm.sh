read -rsn1 -p "#greeter-session=  --> greeter-session=lightdm-webkit2-greeter" variable; echo
wget git.io/webkit2 -O theme.tar.gz
mkdir glorious
mv theme.tar.gz glorious/
cd glorious
tar zxvf theme.tar.gz
rm theme.tar.gz
cd ..
mv glorious/ /usr/share/lightdm-webkit/themes/
read -rsn1 -p "Enable debug mode for any failure, just right click to log out: debug_mode = true" variable; echo
read -rsn1 -p "Change the name antergos to glorious: webkit_theme = glorious" variable; echo
nano /etc/lightdm/lightdm-webkit2-greeter.conf
nano  /etc/lightdm/lightdm.conf