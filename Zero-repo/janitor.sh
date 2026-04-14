#!/bin/bash

# --- THE IMMORTAL LIST ---
# Add any app names here that you want to stay alive
KEEP="hyprland|waybar|kitty|konsole|pipewire|wireplumber|dbus|systemd|swww|swaybg"

# Find user processes, exclude the KEEP list, and kill the rest
# We use 'pgrep' to find the PIDs safely
processes=$(ps -u $(whoami) -o comm= | grep -vE "($KEEP|ps|grep|bash|sh|janitor)" | sort -u)

if [ -z "$processes" ]; then
    notify-send "System Clean" "No background zombies found."
    exit 0
fi

echo "Cleaning the following apps:"
echo "$processes"

ps -u $(whoami) -o pid=,comm= | grep -vE "($KEEP|ps|grep|bash|sh|janitor)" | awk '{print $1}' | xargs -r kill -9

notify-send "Cleanup Complete" "Terminated: $(echo $processes | tr '\n' ' ')"
