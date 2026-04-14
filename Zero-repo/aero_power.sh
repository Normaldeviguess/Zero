#!/bin/bash
case "$1" in
    lock) hyprlock ;;
    logout) hyprctl dispatch exit ;;
    reset) systemctl reboot ;;
    shutdown) systemctl poweroff ;;
    kill) hyprctl kill ;;
esac
