#!/bin/bash
killall waybar 2>/dev/null
# Launch Top Bar
waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css &
# Launch Sidebar
waybar -c ~/.config/waybar/sidebar -s ~/.config/waybar/style.css &
