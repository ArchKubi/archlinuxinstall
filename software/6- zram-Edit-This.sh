sudo pacman -Sy zram-generator

# dont forget edit this
# sudo leafpad /etc/systemd/zram-generator.conf

# [zram0]
# zram-size = ram
# compression-algorithm=lz4

systemctl daemon-reload
systemctl start /dev/zram0

zramctl
