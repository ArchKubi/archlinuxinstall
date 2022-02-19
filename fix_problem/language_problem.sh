#Gtk-WARNING **: 09:55:44.994: Locale not supported by C library. 
#Using the fallback 'C' locale.

#locale: Cannot set LC_CTYPE to default locale: No such file or directory
#locale: Cannot set LC_MESSAGES to default locale: No such file or directory
#locale: Cannot set LC_COLLATE to default locale: No such file or directory
#!/bin/bash


sudo su
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8
exit


#2:

#nano /etc/default/locale 
#  LANGUAGE=en_US.UTF-8
#  LANG=en_US.UTF-8
#  LC_ALL=en_US.UTF-8



#     sudo locale-gen en_US.UTF-8