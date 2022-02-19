#!/bin/bash
sudo pacman -S obs-studio

mkdir ~/tmp/obs
cd ~/tmp/obs
wget https://github.com/bazukas/obs-linuxbrowser/releases/download/0.6.1/linuxbrowser0.6.1-obs23.0.2-64bit.tgz
mkdir -p $HOME/.config/obs-studio/plugins
tar -zxvf linuxbrowser0.6.1-obs23.0.2-64bit.tgz -C $HOME/.config/obs-studio/plugins/
cd ~/gitlab/myarchinstaller/software/
