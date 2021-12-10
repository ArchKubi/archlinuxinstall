#chmod +x ~/.config/qtile/display.sh 
#chmod +x ~/.config/qtile/autostart.sh

#cat  ~/.local/share/qtile/qtile.log   #this is eror log

#qtile cmd-obj -o cmd -f debug
#qtile cmd-obj -o cmd -f warning



#############################################
from typing import List
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
keys = [#-:-------------------------------------------------------------------------:-#
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    #Key([mod], "space", lazy.layout.next(),  desc="Move window focus to other window"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),    desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),  desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),    desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(),        desc="Move window up"),

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
    Key([mod], "e", lazy.spawn("emacs")),
    Key([mod], "v", lazy.spawn("vscodium")),
    Key([mod], "f", lazy.spawn("firefox")),
    Key([mod, "shift"], "s", lazy.spawn("scrot -s")),
    Key([mod, "shift"], "t", lazy.spawn("xfce4-taskmanager")),
    Key([mod, "shift"], "z", lazy.spawn("lxappearance")),
    Key([mod], "g", lazy.spawn("github-desktop")),
    Key([mod], "l", lazy.spawn("leafpad")),
    Key([mod], "p", lazy.spawn("pavucontrol")),

]#-:-------------------------------------------------------------------------:-#
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
    layout.Columns(margin=8, border_width=6, border_focus="#ffffff", border_normal="#000000"),
    #layout.MonadTall(margin=8, border_width=6, border_focus="#08000d", border_normal="#08000d"),
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
colors = [["#191919", "#191919"], # 0: first and last 
          ["#323232", "#323232"], # 1: 
##############################################################
          ["#113342", "#113342"], # 2: 
##############################################################
          ["#a8a8a8", "#a8a8a8"], # 3: TEXT color
##############################################################
          ["#252525", "#252525"], # 4: this_screen_border : widget.GroupBox : ??????????
          ["#858585", "#858585"], # 5: this_current_screen_border : widget.GroupBox
          ["#ffffff", "#ffffff"], # 6: active : widget.GroupBox
#####################################################################################################################
        ] # 7:
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
#####################################################################################################################




screens = [
    Screen(
        top=bar.Bar(
            [
            
             widget.TextBox(
                     text='{~|',
                     fontsize="20",
                     foreground = colors[6],
                     background = colors[1],
                 ),
            widget.Sep(),

            widget.GroupBox(background = colors[0],),

            widget.Sep(),

            widget.WindowName(background = colors[1],),

            widget.Sep(),

            widget.Systray(background = colors[3],),

            widget.Sep(),

            widget.Clock(format='%Y-%m-%d %a %I:%M %p',background = colors[0],),

            widget.Sep(),

             widget.TextBox(
                     text='|~}',
                     fontsize="20",
                     foreground = colors[6],
                     background = colors[1],
                 ),            
            
            ],
           25,
            margin=[10, 20, 5, 11],
     ),
        bottom=bar.Gap(5),
        left=bar.Gap(18),
        right=bar.Gap(18),
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

