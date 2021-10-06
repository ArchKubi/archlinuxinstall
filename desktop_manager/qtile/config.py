#chmod +x ~/.config/qtile/display.sh 
#chmod +x ~/.config/qtile/autostart.sh

#cat  ~/.local/share/qtile/qtile.log   #this is eror log

#############################################
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
import os
import subprocess
import socket
from libqtile import qtile
#############################################




#############################################
mod = "mod4"
terminal = guess_terminal("xfce4-terminal")
#############################################



#####################################################################################################################
keys = [

#-:-------------------------------------------------------------------------:-#
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    #Key([mod], "space", lazy.layout.next(),  desc="Move window focus to other window"),
#-:-------------------------------------------------------------------------:-#
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),    desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),  desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),    desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(),        desc="Move window up"),
#-:-------------------------------------------------------------------------:-#
    Key([mod, "control"], "Left", lazy.layout.grow_left(),        desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(),       desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(),        desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(),          desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(),                   desc="Reset all window sizes"),
#-:-------------------------------------------------------------------------:-#
    Key([mod, "shift"], "Return", lazy.spawn("thunar"),        desc="Launch thunar"),
    Key([mod], "Return", lazy.spawn(terminal),                 desc="Launch terminal"),
#-:-------------------------------------------------------------------------:-#
    Key([mod], "Tab", lazy.next_layout(),                      desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(),                        desc="Kill focused window"),
#-:-------------------------------------------------------------------------:-#
    Key([mod, "control"], "r", lazy.restart(),                 desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(),                desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),                           desc="Spawn a command using a prompt widget"),
#-:-------------------------------------------------------------------------:-#
    Key([mod], "a", lazy.spawn("xfce4-appfinder"),             desc="Launch appfinder"),
    Key([mod], "s", lazy.spawn("scrot")),
    Key([mod], "v", lazy.spawn("vscodium")),
    Key([mod], "f", lazy.spawn("chromium")),
    Key([mod, "shift"], "s", lazy.spawn("scrot -s")),
    Key([mod, "shift"], "t", lazy.spawn("xfce4-taskmanager")),
    Key([mod, "shift"], "z", lazy.spawn("lxappearance")),
    Key([mod], "g", lazy.spawn("gitkraken")),
    Key([mod], "l", lazy.spawn("leafpad")),
    Key([mod], "p", lazy.spawn("pavucontrol")),

#-:-------------------------------------------------------------------------:-#
]
#####################################################################################################################



#####################################################################################################################
groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend([
       Key([mod], i.name, lazy.group[i.name].toscreen(),                             
       desc="Switch to group {}".format(i.name)),

       Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),   
       desc="Switch to & move focused window to group {}".format(i.name)),
    ])
#####################################################################################################################





#####################################################################################################################
layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }
#####################################################################################################################




#####################################################################################################################
layouts = [
    layout.Columns(margin=8, border_width=6, border_focus="#910c67", border_normal="#6e0d5b"),
    #layout.MonadTall(margin=8, border_width=6, border_focus="#910c67", border_normal="#6e0d5b"),
    layout.Max(),
]
#####################################################################################################################


#####################################################################################################################
widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=8,
)
extension_defaults = widget_defaults.copy()
#####################################################################################################################



#####################################################################################################################
colors = [["#910c67", "#910c67"], # 0: first and last 
          ["#6e0d5b", "#6e0d5b"], # 1: 
##############################################################
          ["#2b0223", "#2b0223"], # 2:
##############################################################
          ["#FCA900", "#FCA900"], # 3: TEXT color
##############################################################
          ["#7B0E6E", "#7B0E6E"], # 4: this_screen_border : widget.GroupBox
          ["#ff00a7", "#ff00a7"], # 5: this_current_screen_border : widget.GroupBox
          ["#ffffff", "#ffffff"], # 6: active : widget.GroupBox
          ["#000000", "#000000"], # 7: inactive : widget.GroupBox
##############################################################
          ["#8a1275", "#8a1275"], # 8: highlight_color : widget.Sep
##############################################################
          ["#b31e81", "#b31e81"], # 9: highlight_color : : widget.GroupBox
          ["#5c043e", "#5c043e"], # 10:
##############################################################
          ["#d7fcf9", "#d7fcf9"], # 11: Prompt text color
          ["#bd089f", "#bd089f"], # 12: Prompt background color
##############################################################  
          ["#570648", "#570648"], # 13: ":" background color 
          ["#ff00d2", "#ff00d2"]  # 14: ":" color
#####################################################################################################################
        ] # 7:
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())


#####################################################################################################################
screens = [
    Screen(

#####################################################################################################################
        top=bar.Bar(
[##### Bar Start XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

######################################################################################################################

            #widget.Memory(
            #         foreground = colors[14],
            #         background = colors[1],
            #         mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e htop')},
            #         padding = 5
            #         ),
            ######################################################################################################################
            #widget.CheckUpdates(
            #         update_interval = 1800,
            #         distro = "Arch_checkupdates",
            #         display_format = "{updates} Updates",
            #         foreground = colors[2],
            #         mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')},
            #         background = colors[4]
            #         ),
######################################################################################################################
            #widget.BitcoinTicker(
            #         foreground = colors[2],
            #         background = colors[4],
            #         padding = 5
            #         ),
######################################################################################################################      
            #widget.Notify(foreground = colors[3],background = colors[0],),
######################################################################################################################    
            # widget.BatteryIcon(
            #           padding=0,
            #           scale=0.7,
            #           y_poss=2,
            #           #theme_path=home + "/.config/qtile/icons/battery_icons_horiz",
            #           update_interval = 5,
            #           background = colors[1]),
######################################################################################################################
            #widget.Backlight(
            #        backlight_name="intel_backlight",
            #        background="d79921",
            #        foreground="282828",
            #    ),
######################################################################################################################
            #widget.Notify(),
######################################################################################################################
            #widget.NetGraph(
            #          font="Noto Sans",
            #          fontsize=12,
            #          bandwidth="down",
            #          interface="auto",
            #          fill_color = colors[8],
            #          foreground=colors[2],
            #          background=colors[1],
            #          graph_color = colors[8],
            #          border_color = colors[2],
            #          padding = 0,
            #          border_width = 1,
            #          line_width = 1,
            #          ),
######################################################################################################################
            # widget.Net(
            #           fontsize=12,
            #           #interface="enp2s0", #nmcli device status
            #           foreground=colors[3],
            #           background=colors[0],
            #           padding = 0,
            #           ),
######################################################################################################################

#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='{~|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####Gnu/ArchLinux#####################################################################################################
#background color = 0
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
widget.Image(filename="~/.config/qtile/img/arch.jpeg"),
           widget.TextBox("[Arch-Linux]", foreground = colors[3], background = colors[0], mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("xfce4-appfinder")},),
widget.Image(filename="~/.config/qtile/img/arch.jpeg"),
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),  
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####GroupBox##########################################################################################################
#background color = 10
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.GroupBox(                
                       fontsize = 9,
                       margin_y = 3,
                       margin_x = 0,
                       padding_y = 5,
                       padding_x = 3,
                       borderwidth = 3,
                       active = colors[6],
                       inactive = colors[7],
                       rounded = False,
                       highlight_color = colors[9],
                       highlight_method = "line",
                       this_current_screen_border = colors[5],
                       this_screen_border = colors [4],
                       other_current_screen_border = colors[5],
                       other_screen_border = colors[4],
                       background = colors[0]
                                ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####WindowName########################################################################################################            
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
           widget.TextBox(
                    text='----------------( Life is Gnu/Linux but More GNU )----------------',
                    fontsize="20",
                    foreground = colors[3],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),                 
######################################################################################################################            
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
######################################################################################################################            
            widget.Chord(
                    chords_colors={
                        'launch': ("#420a57", "#690348"), # #ff0000 , #ffffff
                    },
                    name_transform=lambda name: name.upper(),
                            ),
######################################################################################################################
####Clock#############################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
           widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.Clock(
                       foreground = colors[3],
                       background = colors[0],
                       format = "%A, %B %d - %H:%M "
                            ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),     
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####QuickExit#########################################################################################################
           widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.QuickExit(
                       foreground = colors[3],
                       background = colors[0],
                       padding = 0,
                       scale = 0.7
                                 ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),   
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),                  
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
            widget.TextBox(
                    text='|~}',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
],
30),
#####################################################################################################################






################# Bottom Bar ########################################################################################
#####################################################################################################################
        bottom=bar.Bar(
[
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='{~|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####CurrentLayout#####################################################################################################
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),               
            widget.CurrentLayout(
                       foreground = colors[3],
                       background = colors[0],
                       padding = 0,
                       scale = 0.7
                                    ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
######################################################################################################################
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),  
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.PulseVolume(
	            volume_app="pavucontrol",
	            step=5,
	            update_interval=0.15,
                foreground = colors[3],
                background = colors[0],
	        ),
               
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
######################################################################################################################
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),  
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.ThermalSensor(
                      foreground = colors[3],
                      foreground_alert = colors[6],
                      background = colors[0],
                      metric = True,
                      padding = 3,
                      threshold = 80
                      ),

           widget.TextBox(
                    text='|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),


            widget.CPU(
                      foreground = colors[3],
                      background = colors[0],
                      ),

           widget.TextBox(
                    text='|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),


            widget.Memory(
                     font="Noto Sans",
                      #format = '{MemUsed}M/{MemTotal}M',
                      update_interval = 1,
                      fontsize = 12,
                      foreground = colors[3],
                      background = colors[0],
                     ),
               
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####Prompt############################################################################################################            
#background color = 6  
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
           widget.TextBox(
                    text='|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.Prompt(
                       prompt = prompt,
                       font = "sans",
                       padding = 10,
                       foreground = colors[11],
                       background = colors[0]
                            ),
           widget.TextBox(
                    text='|',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
######################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####Gnu/ArchLinux#####################################################################################################
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
           widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.WindowName(
                       foreground = colors[3],
                       background = colors[0],
                       padding = 0
                                ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####Systray show system background program############################################################################
            widget.TextBox(
                    text='(',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.Systray(
                    background = colors[0],
                    padding = 5
                             ),
            widget.TextBox(
                    text=':',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[0],
                    padding=-2,
                ),
            widget.TextBox(
                    text=')',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ), 
######################################################################################################################            
##:----------------------------------------------------------------------------------------------------------------:##
            widget.TextBox(
                    text='-',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
            widget.TextBox(
                    text='|~}',
                    fontsize="35",
                    foreground = colors[14],
                    background = colors[1],
                    padding=-2,
                ),
##:----------------------------------------------------------------------------------------------------------------:##
####Gnu/ArchLinux#####################################################################################################

], 30),
#####################################################################################################################
        left=bar.Gap(1),
        right=bar.Gap(1),
        )
]
############################# Screen Ending XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

#####################################################################################################################
mouse = [
    Drag([mod, "shift"], "Button1", lazy.window.set_position_floating(),   start=lazy.window.get_position()),
    Drag([mod, "shift"], "Button3", lazy.window.set_size_floating(),       start=lazy.window.get_size()),
    Click([mod, "shift"], "Button2", lazy.window.bring_to_front())
]
#####################################################################################################################

#####################################################################################################################
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
#####################################################################################################################

#####################################################################################################################
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])
def start_once1():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/display.sh'])
#####################################################################################################################

#####################################################################################################################
auto_fullscreen = True
focus_on_window_activation = "focus" #smart , focus
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
#####################################################################################################################
