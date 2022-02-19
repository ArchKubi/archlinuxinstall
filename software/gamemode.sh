sudo pacman -S gamemode 

sudo find /usr/ -name libgamemodeauto.so

echo Lutris Values
echo Key = LD_PRELOAD
echo Value = /usr/lib/libgamemodeauto.so

gamemoded -s