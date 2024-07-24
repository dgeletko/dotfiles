# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#   ▌      ▜    ▐  ▌     
# ▞▀▌▞▀▌▞▀▖▐ ▞▀▖▜▀ ▌▗▘▞▀▖
# ▌ ▌▚▄▌▛▀ ▐ ▛▀ ▐ ▖▛▚ ▌ ▌
# ▝▀▘▗▄▘▝▀▘ ▘▝▀▘ ▀ ▘ ▘▝▀ 

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook

import os
import subprocess
from pathlib import Path

mod = "mod4"
mod1 = "mod1"
terminal = guess_terminal("kitty")
fm = "pcmanfm"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([mod], "m", lazy.window.toggle_maximize(), desc="Toggle maximize"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod1, "control"], "p", lazy.spawn("systemctl poweroff"), desc="Power off"),
    Key([mod1, "control"], "r", lazy.spawn("systemctl reboot"), desc="Reboot"),
    Key([mod1, "control"], "l", lazy.spawn("light-locker-command --lock"), desc="Lock screen"),
    Key([mod], "r", lazy.spawn("rofi -modi drun -show drun -show-icons"), desc="Open run prompt"),
    Key([mod], "b", lazy.spawn("x-www-browser"), desc="open web browser"),
    Key([mod], "e", lazy.spawn(fm), desc="open file manager"),
    Key([mod], "v", lazy.spawn("virtualbox"), desc="open virtualbox"),
    # Toggle screens
    Key([mod], "o", lazy.next_screen(), desc="Focus next monitor"),
    Key([mod], "s", lazy.display_kb(), desc="Display keybindings"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(border_focus="#5294e2", border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2, margin=4, margin_on_single=0),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(border_focus="#5294e2", margin=4, margin_on_single=0, new_client_position="top"),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="fira code bold",
    fontsize=12,
    padding=2,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.70),
                #widget.GroupBox(this_current_screen_border="#38a89d", block_highlight_text_color="#ff0000", highlight_method="border"),
                widget.GroupBox(this_current_screen_border="#7199ee", highlight_method="border", hide_unused=True),
                widget.Prompt(),
                widget.WindowName(font="fira code", padding=15),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Sep(padding=15),
                #widget.TextBox(text="", fontsize=34),
                #widget.TextBox(text="\u25e2", fontsize=48, margin=0, padding=0, foreground="#11121d"),
                widget.GenPollText(func=lambda: " " + os.uname().release.removesuffix("-generic"), foreground="#d7a65f"),
                #widget.TextBox(text="\u25e4", fontsize=34, padding=0, padding_y=-5, foreground="#353945"),
                #widget.TextBox(text="", fontsize=34),
                widget.Sep(padding=15),
                widget.CPU(format=" {load_percent:>2.1f}%", foreground="#ee6d85"),
                widget.Sep(padding=15),
                widget.Memory(format=" {MemUsed:.0f}{mm} ({MemPercent})%", measure_mem="M", foreground="#7199ee"),
                widget.Sep(padding=15),
                widget.DF(format=" {p} {uf}{m}", partition="/", visible_on_warn=False, foreground="#95c561"),
                widget.Sep(padding=15),
                widget.Battery(format="{char}  {percent:2.0%}", charge_char=" ", discharge_char=" ", foreground="#F6955B"),
                widget.Sep(padding=15),
                widget.CheckUpdates(fmt=" {}", distro="Ubuntu",
                                    no_update_string="0", display_format="{updates}",
                                    custom_command="apt list --upgradable | wc -l",
                                    custom_command_modify=(lambda x: x-1),
                                    colour_have_updates="#a485dd", colour_no_updates="#a485dd"),
                widget.Sep(padding=15),
                widget.Clock(format=" %Y-%m-%d %I:%M", foreground="#38a89d"),
                widget.Sep(padding=15),
                widget.Systray(),
                widget.QuickExit(default_text=" ", countdown_format="{}"),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            #margin = 4,
            #opacity = 0.8,
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(scale=0.70),
                widget.GroupBox(this_current_screen_border="#7199ee", highlight_method="border", hide_unused=True),
                widget.WindowName(font="fira code", padding=15),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            #margin = 4,
            #opacity = 0.8,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        # personal
        Match(wm_class="arandr"),
        Match(wm_class="blueman-manager"),
        Match(wm_class="com.cisco.anyconnect.gui"),
        Match(wm_class="com.cisco.secureclient.gui"),
        Match(wm_class="gpick"),
        Match(wm_class="lxappearance"),
        Match(wm_class="pulseui"),
        Match(wm_class="sxiv"),
        Match(wm_class="VirtualBox"),
        Match(wm_class="VirtualBox Manager"),
        Match(wm_class="VirtualBox Machine"),
        Match(title="Event Tester"), # xev
        Match(title="Sign in to Security Device"), # brave pin entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    script = Path.home() / ".config/qtile/autostart.sh"
    subprocess.run([script])

