#!/bin/bash
# Apps we DON'T want to kill
KEEP="hyprland|waybar|kitty|konsole|pipewire|wireplumber|dbus|systemd|bash"

# Find all processes, filter out the 'KEEP' list, and kill the rest
ps -u $(whoami) -o pid=,comm= | grep -vE "($KEEP|ps|grep)" | awk '{print $1}' | xargs -r kill -9

notify-send "System Cleaned" "Background processes terminated."
