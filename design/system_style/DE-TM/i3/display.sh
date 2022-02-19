xrandr --newmode "CUSTOM" 107.75  1280 1368 1496 1712  1012 1015 1025 1050 -hsync +vsync
xrandr --addmode VGA-1 "CUSTOM"
xrandr --output VGA-1 --mode "CUSTOM"
nitrogen --restore