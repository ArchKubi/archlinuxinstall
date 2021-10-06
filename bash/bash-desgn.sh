#!/bin/bash


git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
yay -S bc