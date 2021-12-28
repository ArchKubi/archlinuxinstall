userName = $(whiptail --inputbox "Enter your UserName" 10 30 3>&1 1>&2 2>&3)
            echo "$userName" >> /etc/hostname
            useradd -m -G wheel -s /bin/bash $userName
            passwd $userName