#!/bin/bash

# Define the "Safe List" (Apps that won't be killed)
# We keep Hyprland, Waybar, the portal (for screen sharing/files), and the pipewire (audio)
SAFE_LIST="hyprland|waybar|swww|swaybg|pipewire|wireplumber|dbus|systemd|dbus-daemon|ucl|kitty|konsole"

# Get a list of all processes owned by YOU
# Filter out the SAFE_LIST
# Kill the rest
ps -u $(whoami) -o comm= | grep -vE "($SAFE_LIST|bash|ps|grep|sshd)" | xargs -r kill -9

notify-send "System Cleaned" "All background apps have been terminated."
