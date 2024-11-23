#!/usr/bin/env bash

# initializing wallpaper daemon
swww init &
#swww img ```\\\\\\\\\\\|||||\\\\\\\\\\\\\''`
swayidle -w \
    timeout 300 'hyprlock' &

nm-applet --indicator &

waybar &

dunst
