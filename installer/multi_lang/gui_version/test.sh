            read -p "User Name: " userName
            echo "$userName" >> /etc/hostname
            useradd -m -G wheel -s /bin/bash $userName
            passwd $userName