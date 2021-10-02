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
    Key([mod, "control"], "h", lazy.layout.grow_left(),        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),       desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),          desc="Grow window up"),
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
#-:-------------------------------------------------------------------------:-#
]
#####################################################################################################################



#####################################################################################################################
groups = [Group(i) for i in "1234"]


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
    #layout.Columns(margin=8, border_width=6, border_focus="#3b0633", border_normal="#3b062b"),
    layout.MonadTall(margin=8, border_width=6, border_focus="#3b0633", border_normal="#3b062b"),
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
colors = [["#3c096c", "#3c096c"], # 0: first and last 
          ["#5a189a", "#5a189a"], # 1: panel background : widget.WindowName
##############################################################
          ["#4e03a8", "#4e03a8"], # 2: panel background : widget.Systray
##############################################################
          ["#d7fcf9", "#d7fcf9"], # 3: TEXT color
##############################################################
          ["#7B0E6E", "#7B0E6E"], # 4: this_screen_border : widget.GroupBox
          ["#ff00a7", "#ff00a7"], # 5: this_current_screen_border : widget.GroupBox
          ["#edf6f9", "#edf6f9"], # 6: active : widget.GroupBox
          ["#7209b7", "#7209b7"], # 7: inactive : widget.GroupBox
##############################################################
          ["#240046", "#240046"], # 8: highlight_color : widget.Sep
##############################################################
          ["#31064c", "#31064c"], # 9: highlight_color : : widget.GroupBox
##############################################################
          ["#150221", "#150221"], # 10:panel background : widget.GroupBox
          ["#d7fcf9", "#d7fcf9"], # 11: Prompt text color
          ["#9400ff", "#9400ff"]  # 12: Prompt background color
##############################################################          
#####################################################################################################################
        ] # 7:
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
#####################################################################################################################
screens = [
    Screen(


        top=bar.Bar(
            
            [

                
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################
#background color = 0
           widget.TextBox(" Gnu/ArchLinux ", foreground = colors[3], background = colors[0], mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("xfce4-appfinder")},),
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
            widget.CurrentLayout(
                       foreground = colors[3],
                       background = colors[0],
                       padding = 0,
                       scale = 0.7
                                    ),
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################
#background color = 10
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
                       foreground = colors[2],
                       background = colors[10]
                                ),
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################            
#background color = 6           
            widget.Prompt(
                       prompt = prompt,
                       font = "sans",
                       padding = 10,
                       foreground = colors[11],
                       background = colors[12]
                            ),

#####################################################################################################################            
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################            
            widget.WindowName(
                       foreground = colors[3],
                       background = colors[1],
                       padding = 0
                                ),
#####################################################################################################################            
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################            
            widget.Chord(
                    chords_colors={
                        'launch': ("#420a57", "#690348"), # #ff0000 , #ffffff
                    },
                    name_transform=lambda name: name.upper(),
                            ),
                #widget.TextBox("default config", name="default"),
#background color = 2 "Systray show system background program"
            widget.Systray(
                       background = colors[2],
                       padding = 5
                             ),
#####################################################################################################################            
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################                   
#background color = 0          
            
            widget.Volume(foreground = colors[3],background = colors[0],),

            widget.Clock(
                       foreground = colors[3],
                       background = colors[0],
                       format = "%A, %B %d - %H:%M "
                            ),
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################
            widget.QuickExit(
                       foreground = colors[3],
                       background = colors[0],
                       padding = 0,
                       scale = 0.7
                                 ),
#####################################################################################################################
##:----------------------------------------------------------------------------------------------------------------:##
            widget.Sep(
                        linewidth = 1,
                        padding = 10,
                        foreground = colors[8],
                        background = colors[8]
                        ),
##:----------------------------------------------------------------------------------------------------------------:##
#####################################################################################################################            
            ],

###################### top bar settings#### #########################################################################
            31,
            margin=[25, 15, 5, 11],
                       ),
#####################################################################################################################



###################### Window Size Settings #########################################################################
        bottom=bar.Gap(5),
        left=bar.Gap(18),
        right=bar.Gap(18),
#####################################################################################################################
        
        ),

]



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