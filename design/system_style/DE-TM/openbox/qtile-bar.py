from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen


import os
import subprocess
import socket , sys


#####################################################################################################




#####################################################################################################






#####################################################################################################################
colors = [["#7c0e6e", "#910c67"], # 0: background
          ["#64165b", "#64165b"], # 1: spacer
          ["#f41aca", "#f41aca"], # 2:
          ["#FCA900", "#FCA900"], # 3: TEXT color
          ["#46145c", "#46145c"], # 4: block
          ["#6adede", "#6adede"], # 5: colour_have_updates
          ["#652959", "#652959"], # 6: group
          ["#a3438f", "#a3438f"]  # 7: systray
          ]
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
#####################################################################################################################



#####################################################################################################################
screens = [
    Screen(

#wallpaper="~/.config/qtile/img/wallpaper.jpg",
#wallpaper_mode="scale",

top=bar.Bar(
[

    widget.Image(filename = "~/.config/qtile/img/first.png",scale = "False",background = colors[0],),
    widget.Image(filename = "~/.config/qtile/img/ram.png",scale = "False",background = colors[0],),
    widget.TextBox(text=' ',fontsize="20",background = colors[4],),



    widget.Sep(background=colors[0],),
    widget.GroupBox(background = colors[6],active = colors[3], inactive = colors[2],),
    widget.Systray(padding=10,foreground=colors[3],background=colors[7],),  
    widget.CheckUpdates(
        update_interval = 1800,
        distro = "Arch_checkupdates",
        display_format = "Updates: {updates} ",
        foreground = colors[3],
        colour_have_updates = colors[5],
        colour_no_updates = colors[3],
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
        padding = 5,
        background = colors[7]
                       ),
    widget.Sep(background=colors[0],),





    widget.Spacer(background = colors[1],),
    widget.Image(filename = "~/.config/qtile/img/gnu.png",scale = "False",background = colors[0],),
    widget.TextBox(background=colors[0],foreground=colors[3],text="(-Gnu/Linux's My Life-)",),
    widget.Image(filename = "~/.config/qtile/img/gnu.png",scale = "False",background = colors[0],),
    widget.Spacer(background = colors[1],),





    widget.Sep(background=colors[0],),
    widget.Volume(foreground = colors[3],background = colors[0],fmt = 'Volume: {}',padding = 5),
    widget.Sep(background=colors[0],),
    widget.Clock(foreground = colors[3],background = colors[0],format = "%A, %B %d - %H:%M "),
    widget.Sep(background=colors[0],),


    #widget.Notify(fmt="| {}",),
    #widget.Battery(background=colors[0],foreground=colors[3],format="{percent:2.0%}",),
 
    widget.TextBox(text=' ',fontsize="20",background = colors[4],),
    widget.Image(filename = "~/.config/qtile/img/rem.png",scale = "False",background = colors[0],),
    widget.Image(filename = "~/.config/qtile/img/last.png",scale = "False",background = colors[0],), 
],
            35,background="#64165b",
            margin=[10, 10, 10, 10]
            
                       ),






bottom=bar.Bar(
[
    widget.Image(filename = "~/.config/qtile/img/first.png",scale = "False",background = colors[0],),
    widget.Image(filename = "~/.config/qtile/img/ram.png",scale = "False",background = colors[0],),
    widget.TextBox(text=' ',fontsize="20",background = colors[4],),
    widget.Spacer(background = colors[1],),


    widget.Sep(background=colors[0],), 
    widget.ThermalSensor(foreground = colors[3],background = colors[0],threshold = 90,fmt = 'Temp: {}',padding = 5),
    widget.Sep(background=colors[0],),
    widget.CPU (foreground=colors[3],background=colors[0],),
    widget.Sep(background=colors[0],),
    widget.Memory(
        foreground = colors[3],
        background = colors[0],
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
        fmt = 'Ram: {}',padding = 5),
    widget.Sep(background=colors[0],),
    widget.Net(interface = "enp2s0",format = 'Net: {down} ↓↑ {up}',foreground = colors[3],background = colors[0],padding = 5),
    widget.Sep(background=colors[0],),
 
    
    widget.Spacer(background = colors[1],),
    widget.TextBox(text=' ',fontsize="20",background = colors[4],),
    widget.Image(filename = "~/.config/qtile/img/rem.png",scale = "False",background = colors[0],),
    widget.Image(filename = "~/.config/qtile/img/last.png",scale = "False",background = colors[0],),               
],
        35,background="#64165b",
        margin=[10, 10, 10, 10]
        ),
    ),
]
#####################################################################################################################

